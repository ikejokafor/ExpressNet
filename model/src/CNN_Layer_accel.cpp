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
#ifdef DDR_AXI_MEMORY

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
        for(int i = 0; i < MAX_FAS_REQ; i++)
        {
            if(m_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_total_sys_mem_trans < m_max_sys_mem_trans)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_REQ)
            {
                if(m_req_arr[i].req_pending)
                {
                    wait();
                    m_req_arr[i].ack.notify(SC_ZERO_TIME);
                    m_next_wr_req_id = (i + 1) % MAX_FAS_REQ;
                    m_total_sys_mem_trans++;
                    break;
                }
            }
        }
    }
}


int CNN_Layer_Accel::system_mem_trans(int req_idx, uint32_t mem_trans_size)
{
    int _numCycles = ceil((float)mem_trans_size / (float)BUS_SIZE);
    sc_core::sc_time numCycles(_numCycles * CLK_PRD, sc_core::SC_NS);
    wait(numCycles);
    m_total_sys_mem_trans--;
	m_req_arr[req_idx].ack.notify(SC_ZERO_TIME);
    return 0;
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
    m_req_arr[req_idx].req_pending = true;
    wait(m_req_arr[req_idx].ack);
    m_req_arr[req_idx].req_pending = false;
    sc_core::sc_spawn_options args;
    args.set_sensitivity(&clk);
    int ret;
    sc_core::sc_spawn
    (
        &ret,
        sc_core::sc_bind
        (
            &CNN_Layer_Accel::system_mem_trans,
            this,
            req_idx,
            trans.get_data_length()
        ),
        ("system_mem_trans" + std::to_string(req_idx)).c_str(),
        &args
    );         
    wait(m_req_arr[req_idx].ack);
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
    FPGA_hndl *m_fpga_hndl = m_accelCfg->m_fpga_hndl;
    delete m_accelCfg;
    m_accelCfg = new AccelConfig(NULL);
    m_accelCfg->m_fpga_hndl = m_fpga_hndl;
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
