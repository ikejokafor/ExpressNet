#include "CNN_Layer_Accel.hpp"
using namespace std;
using namespace sc_core;
using namespace sc_dt;
using namespace tlm;
using namespace tlm_utils;


CNN_Layer_Accel::~CNN_Layer_Accel()
{
    for (int i = 0; i < MAX_AWP_PER_FAS; i++)
    {
        delete awp[i];
    }
    for (int i = 0; i < NUM_FAS; i++)
    {
        delete fas[i];
    }
}


void CNN_Layer_Accel::main_process()
{
    string str;
    while (true)
    {
        wait();
#ifdef SIMULATE_MEMORY

#endif
        bool all_complete = true;
        for (int i = 0; i < m_FAS_complt_arr.size(); i++)
        {
            if (!m_FAS_complt_arr[i])
            {
                all_complete = false;
                break;
            }
        }
        if(all_complete)
        {
            if(FAS2AWP_bus.m_trans_fifo.size() > 0
                || AWP2FAS_bus.m_trans_fifo.size() > 0)
            {
                str = "[" + string(name()) + "]: Buffers are not empty\n"
                    "\tFAS2AWP_bus.m_trans_fifo_sz:     " + to_string(FAS2AWP_bus.m_trans_fifo.size()) + "\n"
                    "\tAWP2FAS_bus.m_trans_fifo.sz:     " + to_string(AWP2FAS_bus.m_trans_fifo.size()) + "\n";
                cout << str;
                raise(SIGINT);
            }
            for (int i = 0; i < m_FAS_complt_arr.size(); i++)
            {
                m_FAS_complt_arr[i] = false;
            }
            str = "[" + string(name()) + "]: Processing Complete at " + sc_time_stamp().to_string() + "\n";
            cout << str;
            wait();
            m_complete.notify(SC_ZERO_TIME);
        }
    }
}


int CNN_Layer_Accel::complt_process(int idx)
{
    while(true)
    {
        wait(fas[idx]->m_complete);
        wait();
        m_FAS_complt_arr[idx] = true;
        fas[idx]->m_complete_ack.notify();
    }
}


#ifdef DDR_AXI_MEMORY

#else
void CNN_Layer_Accel::system_mem_arb_process()
{
    while(true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_FAS_WR_REQ; i++)
        {
            if(m_wr_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_curr_sys_mem_bw < m_total_sys_mem_bw)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_WR_REQ)
            {
                if(m_wr_req_arr[i].req_pending)
                {
                    wait();
                    m_wr_req_arr[i].ack.notify_delayed(SC_ZERO_TIME);
                    m_next_wr_req_id = (i + 1) % MAX_FAS_WR_REQ;
                    m_curr_sys_mem_bw += BUS_SIZE;
                    break;
                }
            }
        }
    }
}


int CNN_Layer_Accel::system_mem_trans(int req_idx, uint32_t mem_trans_size)
{
    int _numCycles = ceil((float)mem_trans_size / (float)BUS_WIDTH);
    sc_core::sc_time* numCycles = new sc_core::sc_time(_numCycles * CLK_PRD, sc_core::SC_NS);
    wait(numCycles);
    m_curr_sys_mem_bw -= BUS_SIZE;
	m_rd_req_arr[req_idx].ack.notify_delayed(numCycles);
}
#endif


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
#ifdef DDR_AXI_MEMORY
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    switch(trans.get_command())
    {
        case TLM_READ_COMMAND:
        {
    
            break;
        }
        case TLM_WRITE_COMMAND:
        {
            break;
        }
    }
#else
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    int req_idx = accel_trans->fas_rd_id;
    m_rd_req_arr[req_idx].req_pending = true;
    wait(m_rd_req_arr[req_idx].ack);
    sc_core::sc_spawn_options args;
    args.set_sensitivity(&clk);
    sc_core::sc_spawn
    (
        nullptr,
        sc_core::sc_bind
        (
            &CNN_Layer_Accel::system_mem_trans,
            this,
            req_idx,
            trans.get_data_length()
        ),
        ("system_mem_read" + std::to_string(req_idx)).c_str(),
        &args
    );         
    wait(m_rd_req_arr[req_idx].ack);
#endif
    trans.release();
}


void CNN_Layer_Accel::setMemory(int idx, uint64_t addr, int size)
{
    m_memory[idx].addr = addr;
    m_memory[idx].size = size;
}


mem_ele_t* CNN_Layer_Accel::getMemory(int idx)
{
    mem_ele_t* mem_ele = new mem_ele_t;
    mem_ele->addr = m_memory[idx].addr;
    mem_ele->size = m_memory[idx].size;
    return mem_ele;
}


void CNN_Layer_Accel::start()
{
    // TODO: Properly expand for multiple FAS's
    m_start_time = sc_time_stamp().to_double();
    m_accelCfg->m_buffer = (void*)m_memory[0].addr;
    m_accelCfg->deserialize();
    for(int i = 0; i < NUM_FAS; i++)
    {        
        fas[i]->m_FAS_cfg = m_accelCfg->m_FAS_cfg_arr[i];
        fas[i]->m_inputMap = (fixedPoint_t*)m_memory[1].addr;
        fas[i]->m_filters3x3 = (fixedPoint_t*)m_memory[2].addr;
        fas[i]->m_bias3x3 = (fixedPoint_t*)m_memory[3].addr;
        fas[i]->m_filters1x1 = (fixedPoint_t*)m_memory[4].addr;
        fas[i]->m_bias1x1 = (fixedPoint_t*)m_memory[5].addr;
        fas[i]->m_partMap_fifo = (fixedPoint_t*)m_memory[6].addr;
        fas[i]->m_resdMap_fifo = (fixedPoint_t*)m_memory[7].addr;
        fas[i]->m_prevMap_fifo = (fixedPoint_t*)m_memory[8].addr;
        wait();
        fas[i]->m_start.notify();
        wait(fas[i]->m_start_ack);
        wait();
    }
}


void CNN_Layer_Accel::waitComplete(double& elapsedTime, double& memPower, double& QUAD_time, double& FAS_time)
{
    wait(m_complete.default_event());
    wait();
    elapsedTime = sc_time_stamp().to_double() - m_start_time;
    memPower = calculateMemPower();
    QUAD_time = awp[0]->quad[0]->m_QUAD_time;
    FAS_time = fas[0]->m_FAS_time;
    // OutMaps Maps
    int size = QUAD_DEPTH_SIMD * QUAD_MAX_INPUT_ROWS * QUAD_MAX_INPUT_COLS * sizeof(fixedPoint_t);
    setMemory(9, (uint64_t)fas[0]->m_outBuf_fifo, size);    // FIXME: Hardcoding
    delete m_accelCfg;
    m_accelCfg = new AccelConfig(NULL);
}


double CNN_Layer_Accel::calculateMemPower()
{
    return 0.0f;
}


const char* CNN_Layer_Accel::toHexCharArr(int value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}


const char* CNN_Layer_Accel::toHexCharArr(uint32_t value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}


const char* CNN_Layer_Accel::toHexCharArr(uint64_t value)
{
    stringstream stream;
    stream << hex << value;
    return (string("0x") + stream.str()).c_str();
}
