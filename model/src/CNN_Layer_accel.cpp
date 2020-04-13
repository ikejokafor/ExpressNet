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
            m_complete.notify();
        }
    }
}


int CNN_Layer_Accel::complt_process(int idx)
{
    while (true)
    {
        wait(fas[idx]->m_complete);
        wait();
        m_FAS_complt_arr[idx] = true;
        fas[idx]->m_complete_ack.notify();
    }
}


void CNN_Layer_Accel::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
{
    trans.acquire();
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
        fas[i]->m_start.notify();
        wait(fas[i]->m_start_ack);
        wait();
    }
}


void CNN_Layer_Accel::waitComplete()
{
    // FIXME: possibility of missing this if complete is triggered same cycle as finished is triggered
    wait(m_complete);
    // FIXME: might need to read back data
    delete m_accelCfg;
    m_memory.clear();
    m_accelCfg = new AccelConfig();
    wait();
}


#ifdef MODEL_TECH
SC_MODULE_EXPORT(CNN_Layer_Accel);
#endif
