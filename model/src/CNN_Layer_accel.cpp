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
#ifdef DDR_AXI_MEM_SIM
    // set req
    init_rd_req = 0x0;
    init_wr_req = 0x0;
    // set id's
    init_rd_req_id = 0x688;    // 0100 0011 0010 0001 0000
    init_wr_req_id = 0x0;
    // set addr
    init_rd_addr = 0x00000000000000000000000000000000;
    init_wr_addr = 0x00000000;
    // set len
    init_rd_len = 0x00000000;
    init_wr_len = 0x00;
    // read is always ready, writing is always valid
    init_rd_data_rdy = 0xF;
    init_wr_data_vld = 0x1;
    // init_wr_data

#endif   
    string str;
    while (true)
    {
        wait();
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


int CNN_Layer_Accel::complt_process(int _idx)
{
    int idx = _idx;
    while(true)
    {
        wait(fas[idx]->m_complete);
        wait();
        m_FAS_complt_arr[idx] = true;
        fas[idx]->m_complete_ack.notify();
    }
}


#ifndef DDR_AXI_MEM_SIM
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
                m_req_arr[i].tally++;
                numReq++;
            }
        }
        // numReq_st = max(numReq_st, numReq);
        // total_sys_mem_trans_st = max(total_sys_mem_trans_st, m_total_sys_mem_trans);
        if(numReq > 0 && m_total_sys_mem_trans < m_max_sys_mem_trans)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_REQ)
            {
                if(m_req_arr[i].req_pending)
                {
                    wait();
                    m_req_arr[i].max_tally = max(m_req_arr[i].max_tally, m_req_arr[i].tally);
                    m_req_arr[i].tally = 0;
                    m_req_arr[i].req_pending = false;
                    m_req_arr[i].ack.notify(SC_ZERO_TIME);
                    m_next_wr_req_id = (i + 1) % MAX_FAS_REQ;
                    m_total_sys_mem_trans++;
                    break;
                }
            }
        }
    }
}
#endif


#ifdef DDR_AXI_MEM_SIM
void CNN_Layer_Accel::b_wait_ce()
{
    while(true)
    {
        wait();
        if(ce->read() == 0x1)
        {
            break;
        }
    }
}
#endif


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    tlm_command cmd = trans.get_command();
    uint64_t address = trans.get_address();
    int req_idx = accel_trans->fas_req_id;
    int FAS_id = accel_trans->FAS_id;
    int length = trans.get_data_length();
    int trans_no = accel_trans->trans_no;
    int cmd_no = (cmd == TLM_READ_COMMAND) ? 0 : 1;
    uint64_t cycles = (uint64_t)(sc_time_stamp().to_double() - m_ref_time) / (uint64_t)10;
    fprintf(fas[FAS_id]->m_fd[req_idx], "%d,%llu,%d,%llu,%d\n", trans_no, cycles, cmd_no, address, length);
    fflush(fas[FAS_id]->m_fd[req_idx]);
#ifdef DDR_AXI_MEM_SIM


#ifdef VERBOSE_DEBUG
    cout << endl << endl;
    string str = (trans.get_command() == TLM_READ_COMMAND) ? "READ" : "WRITE";
    cout << "[CNN_Layer_Accel]: " << str << endl;
    cout << "\t\taddress - " << address << endl;
    cout << "\t\treq_idx - " << req_idx << endl;
    cout << "\t\tlength  - " << length <<  endl;
    cout << endl << endl;
#endif


    if(cmd == TLM_READ_COMMAND)
    {
        b_wait_ce();
        sc_bv<N_INIT_ADDR_WTH> t0; t0.range(INIT_ADDR_WTH, (req_idx * INIT_ADDR_WTH)) = address;
        init_rd_addr.write(t0);
        int ofst = req_idx * INIT_LEN_WTH;
        sc_bv<N_INIT_LEN_WTH> t1; t1.range((INIT_LEN_WTH + ofst) - 1, ofst) = length;
        init_rd_len.write(t1);
        sc_bv<MAX_FAS_RD_REQ> t2; t2.range(1, req_idx) = 0x1;
        init_rd_req.write(t2);
        while(true)
        {
            b_wait_ce();
            if(init_rd_req_ack.read().range(1, req_idx) == 1)
                break;
        }
        t2.range(1, req_idx) = 0;
        init_rd_req.write(t2);
        while(true)
        {
            b_wait_ce();
            if(init_rd_cmpl.read().range(1, req_idx) == 1)
                break;
        }
    }
    else // TLM_WRITE_COMMAND
    {
        b_wait_ce();
        init_wr_addr = address;
        init_wr_len = length;
        init_wr_req = 1;
        while(true)
        {
            b_wait_ce();
            if(init_wr_req_ack.read() == 1)
                break;
        }
        init_wr_req = 0;
        while(true)
        {
            b_wait_ce();
            if(init_wr_cmpl.read() == 1)
                break;
        }   
    }
#else
    m_req_arr[req_idx].req_pending = true;
    wait(m_req_arr[req_idx].ack);
    // int _numCycles = ceil((float)length / (float)BUS_SIZE);
    // sc_core::sc_time numCycles(_numCycles * CLK_PRD, sc_core::SC_NS);
    // wait(numCycles);
    m_total_sys_mem_trans--;
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
    m_ref_time = (fas[0]->m_FAS_cfg->m_first) ? sc_time_stamp().to_double() : m_ref_time;
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
    bool last = fas[0]->m_FAS_cfg->m_last;
    delete m_accelCfg;
    m_accelCfg = new AccelConfig(NULL);
    m_accelCfg->m_fpga_hndl = m_fpga_hndl;
    
    // cout << "max pending simal req: " << numReq_st << endl;
    // cout << "max total_sys_mem_trans:" << total_sys_mem_trans_st << endl;
    // cout << "m_req_arr_0: " << m_req_arr[0].max_tally << endl;
    // cout << "m_req_arr_1: " << m_req_arr[1].max_tally << endl;
    // cout << "m_req_arr_2: " << m_req_arr[2].max_tally << endl;
    // cout << "m_req_arr_3: " << m_req_arr[3].max_tally << endl;
    // cout << "m_req_arr_4: " << m_req_arr[4].max_tally << endl;
    // numReq_st = 0;
    // total_sys_mem_trans_st = 0;
    m_req_arr[0].max_tally = 0;
    m_req_arr[1].max_tally = 0;
    m_req_arr[2].max_tally = 0;
    m_req_arr[3].max_tally = 0;
    m_req_arr[4].max_tally = 0;
    for(int i = 0; i < NUM_FAS; i++)
    {
        if(last) m_ref_time = 0.0f;
    }

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
