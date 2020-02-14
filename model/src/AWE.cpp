#include "AWE.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


AWE::~AWE()
{
	for (int i = 0; i < NUM_QUADS_PER_AWE; i++)
	{
		delete quad[i];
	}
}


void AWE::AWE_process()
{
	while (true)
	{
		wait(bus.m_start_trans);
		wait();
		tlm_generic_payload* trans = m_mm.allocate();
		trans->acquire();
		trans->set_address(0);
		accel_trans_t accel_trans;
		accel_trans.quad_id = bus.m_quad_id;
		accel_trans.accel_cmd = bus.m_accel_cmd;
		accel_trans.res_pkt_size = bus.m_res_pkt_size;
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
		init_soc->b_transport(*trans, sc_time());
		trans->release();
		if(bus.m_accel_cmd == ACCL_CMD_JOB_FETCH)
		{
			quad[bus.m_quad_id]->b_pfb_write();
		}
		bus.m_trans_complete.notify();
	}
}



void AWE::b_transport(tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	accel_trans_t* accel_trans;
	accel_trans = (accel_trans_t*)trans.get_data_ptr();
	int quad_id = accel_trans->quad_id;
	tlm_response_status status = TLM_OK_RESPONSE;
	switch (accel_trans->accel_cmd)
	{
		case ACCL_CMD_CFG_WRITE:
		{
			quad[quad_id]->b_cfg_write(trans.get_data_ptr());
			break;
		}
		case ACCL_CMD_PIX_SEQ_CFG_WRITE:
		{
			quad[quad_id]->b_pxSeqCfg_write();
			break;
		}
		case ACCL_CMD_KRL_CFG_WRITE:
		{
			quad[quad_id]->b_krnlCfg_write();
			break;
		}
		case ACCL_CMD_JOB_START:
		{
			if (!quad[quad_id]->b_job_start());
			status = TLM_GENERIC_ERROR_RESPONSE;
			break;
		}
	};
	trans.set_response_status(status);
	trans.release();
}
