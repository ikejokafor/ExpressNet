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
            for (int i = 0; i < m_FAS_complt_arr.size(); i++)
            {
                m_FAS_complt_arr[i] = false;
            }
            str = "Processing Complete at " + sc_time_stamp().to_string() + "\n";
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


void CNN_Layer_Accel::system_mem_read_arb_process()
{
    while (true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_FAS_RD_REQ; i++)
        {
            if(m_rd_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_num_sys_mem_rd_in_prog < MAX_SYS_MEM_RD_TRANS)
        {
            for(int i = m_next_rd_req_id; true; i = (i + 1) % MAX_FAS_RD_REQ)
            {
                if(m_rd_req_arr[i].req_pending)
                {
                    wait();
                    m_rd_req_arr[i].ack.notify();
                    m_next_rd_req_id = (i + 1) % MAX_FAS_RD_REQ;
                    break;
                }
            }
        }
    }
}


void CNN_Layer_Accel::system_mem_write_arb_process()
{
    while (true)
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
        if(numReq > 0 && m_num_sys_mem_wr_in_prog < MAX_SYS_MEM_WR_TRANS)
        {
            for(int i = m_next_wr_req_id; true; i = (i + 1) % MAX_FAS_WR_REQ)
            {
                if(m_wr_req_arr[i].req_pending)
                {
                    wait();
                    m_wr_req_arr[i].ack.notify();
                    m_next_wr_req_id = (i + 1) % MAX_FAS_WR_REQ;
                    break;
                }
            }
        }
    }
}


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
    int num_mem_trans_cycles = (int)ceil((float)(trans.get_data_length() * BITS_PER_PIXEL) / (float)ACCEL_BUS_SIZE);
    int num_stall_cycles = 0;
    std::default_random_engine generator;
    std::bernoulli_distribution distribution(0.5);
    for(int i = 0; i < num_mem_trans_cycles; i++)
    {
        if(distribution(generator)) num_stall_cycles++;
    }
    num_mem_trans_cycles += num_stall_cycles;
    Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
    switch(trans.get_command())
    {
        case TLM_READ_COMMAND:
        {
            int req_idx = accel_trans->fas_rd_id;
            m_rd_req_arr[req_idx].req_pending = true;
            wait(m_rd_req_arr[req_idx].ack);
            m_num_sys_mem_rd_in_prog++;
            wait(num_mem_trans_cycles);
            m_num_sys_mem_rd_in_prog--;
            break;
        }
        case TLM_WRITE_COMMAND:
        {
            int req_idx = accel_trans->fas_wr_id;
            m_wr_req_arr[req_idx].req_pending = true;
            wait(m_wr_req_arr[req_idx].ack);
            m_num_sys_mem_wr_in_prog++;
            wait(num_mem_trans_cycles);
            m_num_sys_mem_wr_in_prog--;
            break;
        }
    }
    trans.release();
}


void CNN_Layer_Accel::setMemory(uint64_t addr)
{
    m_memory.push_back(addr);
}


void CNN_Layer_Accel::start()
{
    m_accelCfg->m_address = m_memory[0];
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


void CNN_Layer_Accel::waitComplete()
{
    wait(m_complete.default_event());
    wait();
    delete m_accelCfg;
    m_accelCfg = new AccelConfig();
    // FIXME: might need to read back data
    m_memory.clear();
}


#ifdef MODEL_TECH
SC_MODULE_EXPORT(CNN_Layer_Accel);
#endif
