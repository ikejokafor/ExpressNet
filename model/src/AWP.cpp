#include "AWP.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


AWP::~AWP()
{
    for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
    {
        delete quad[i];
    }
}


void AWP::bus_arbitrate()
{
    while (true)
    {
        wait();
        int numReq = 0;
        for(int i = 0; i < MAX_AWP_TRANS; i++)
        {
            if(bus.m_req_arr[i].req_pending)
            {
                numReq++;
            }
        }
        if(numReq > 0 && m_num_trans_in_prog < MAX_NETWORK_TRANS)
        {
            for(int i = m_next_req_id; true; i = (i + 1) % MAX_AWP_TRANS)
            {
                if(bus.m_req_arr[i].req_pending)
                {
                    wait();
                    bus.m_req_arr[i].ack.notify();
                    m_next_req_id = (i + 1) % MAX_AWP_TRANS;
                    break;
                }
            }
        }
    }
}


void AWP::send_complete()
{
    sc_time delay;
    while(true)
    {
        wait();
        bool all_complete = true;
        for(int i = 0; i < m_QUADs_cfgd_arr.size(); i++)
        {
            if(m_QUADs_cfgd_arr[i] && !bus.m_QUAD_complt_arr[i])
            {
                all_complete = false;
                break;
            }
        }
        if(all_complete && m_num_QUADs_cfgd > 0)
        {
            m_num_QUADs_cfgd = 0;
            for(int i = 0; i < MAX_AWP_PER_FAS; i++)
            {
                bus.m_QUAD_complt_arr[i] = false;
            }
            Accel_Trans* accel_trans = new Accel_Trans();
            accel_trans->AWP_id = m_AWP_id;
            accel_trans->FAS_id = m_FAS_id;
            accel_trans->accel_cmd = ACCL_CMD_JOB_COMPLETE;
            tlm_generic_payload* trans = nb_createTLMTrans(
                m_mem_mng,
                m_FAS_id,
                TLM_IGNORE_COMMAND,
                (unsigned char*)accel_trans,
                0,
                0,
                nullptr,
                false,
                TLM_INCOMPLETE_RESPONSE
            );
            wait();
            init_soc->b_transport(*trans, delay);
            m_AWP_cfgd = false;
            trans->release();
        }
    }
}


void AWP::b_transport(tlm_generic_payload& trans, sc_time& delay)
{
    trans.acquire();
    Accel_Trans* accel_trans;
    accel_trans = (Accel_Trans*)trans.get_data_ptr();
    int QUAD_id = accel_trans->QUAD_id;
    tlm_response_status status = TLM_OK_RESPONSE;
    switch(accel_trans->accel_cmd)
    {
        case ACCL_CMD_JOB_FETCH:
        {
            quad[QUAD_id]->b_pfb_write();
            break;
        }
        case ACCL_CMD_CFG_WRITE:
        {
            bus.m_FAS_id = accel_trans->FAS_id;
            m_FAS_id = accel_trans->FAS_id;
            m_num_QUADs_cfgd = accel_trans->num_QUADS_cfgd;
            m_QUADs_cfgd_arr[QUAD_id] = true;
            if(!m_AWP_cfgd)
            {
                m_AWP_cfgd = true;
                string str =
                    "[" + string(name()) + "]" + " Configured with.......\n"
                    "\tFAS ID:                        " + to_string(m_FAS_id)         + "\n"
                    "\tNumber of Quads Configured:    " + to_string(m_num_QUADs_cfgd) + "\n";
                cout << str;
            }
            quad[QUAD_id]->b_cfg_write(trans.get_data_ptr());
            break;
        }
        case ACCL_CMD_PIX_SEQ_CFG_WRITE:
        {
            quad[QUAD_id]->b_pxSeqCfg_write();
            break;
        }
        case ACCL_CMD_KRL3x3_CFG_WRITE:
        {
            quad[QUAD_id]->b_krnl3x3Cfg_write();
            break;
        }
        case ACCL_CMD_KRL3x3BIAS_CFG_WRITE:
        {
            quad[QUAD_id]->b_krnl3x3BiasCfg_write();
            break;
        }
        case ACCL_CMD_JOB_START:
        {
            if(!quad[QUAD_id]->b_job_start())
            {
                status = TLM_GENERIC_ERROR_RESPONSE;
            }
            break;
        }
    };
    trans.set_response_status(status);
    trans.release();
}


void AWP::bus_tar_b_transport(tlm_generic_payload& trans, sc_time& delay)
{
    init_soc->b_transport(trans, delay);
}
