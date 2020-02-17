#include "AWP.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


AWP::~AWP()
{
	for (int i = 0; i < NUM_QUADS_PER_AWP; i++)
	{
		delete quad[i];
	}
}


void AWP::AWP_process()
{
	sc_time delay;
	while (true)
	{
		wait(bus.m_start_trans);
		wait();
		accel_trans_t accel_trans;
		accel_trans.QUAD_id = bus.m_quad_id;
		accel_trans.accel_cmd = bus.m_accel_cmd;
		accel_trans.AWP_id = m_AWP_id;
		accel_trans.res_pkt_size = bus.m_res_pkt_size;
		tlm_generic_payload* trans = m_mm.allocate();
		trans->acquire();
		trans->set_address(bus.m_FAS_id);
		trans->set_data_ptr(reinterpret_cast<unsigned char*>(&accel_trans));
		trans->set_data_length(0);
		trans->set_streaming_width(0);
		trans->set_byte_enable_ptr(0);
		trans->set_dmi_allowed(false);
		trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		tlm_command tlm_cmd;
		switch (bus.m_accel_cmd)
		{
			case ACCL_CMD_JOB_FETCH:
			{
				tlm_cmd = TLM_READ_COMMAND;
				break;
			}
			case ACCL_CMD_RESULT_WRITE:
			{
				tlm_cmd = TLM_WRITE_COMMAND;
				break;
			}
			case ACCL_CMD_JOB_COMPLETE:
			{
				tlm_cmd = TLM_IGNORE_COMMAND;
				break;
			}
		}
		trans->set_command(tlm_cmd);
		init_soc->b_transport(*trans, delay);
		trans->release();
		if(bus.m_accel_cmd == ACCL_CMD_JOB_FETCH)
		{
			quad[bus.m_quad_id]->b_pfb_write();
		}
		bus.m_trans_complete.notify();
	}
}



void AWP::b_transport(tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	accel_trans_t* accel_trans;
	accel_trans = (accel_trans_t*)trans.get_data_ptr();
	int QUAD_id = accel_trans->QUAD_id;
	tlm_response_status status = TLM_OK_RESPONSE;
	switch(accel_trans->accel_cmd)
	{
		case ACCL_CMD_JOB_FETCH:
		{
			break;
		}
		case ACCL_CMD_CFG_WRITE:
		{
			bus.m_num_QUADs_cfgd = accel_trans->num_QUADS_cfgd;
			quad[QUAD_id]->b_cfg_write(trans.get_data_ptr());
			break;
		}
		case ACCL_CMD_PIX_SEQ_CFG_WRITE:
		{
			quad[QUAD_id]->b_pxSeqCfg_write();
			break;
		}
		case ACCL_CMD_KRL_CFG_WRITE:
		{
			quad[QUAD_id]->b_krnlCfg_write();
			break;
		}
		case ACCL_CMD_JOB_START:
		{
			if (!quad[QUAD_id]->b_job_start());
			status = TLM_GENERIC_ERROR_RESPONSE;
			break;
		}
	};
	trans.set_response_status(status);
	trans.release();
}