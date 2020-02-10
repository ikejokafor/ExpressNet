#include "FAS.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


FAS::~FAS() { }


void FAS::FAS_ctrl_process()
{
	while (true)
	{
		wait();
		switch(m_state)
		{
			case ST_IDLE:
			{
				wait(m_start);
				m_start_ack.notify();
				m_state = ST_CFG_AWP;
				break;
			}
			case ST_CFG_AWP:
			{
				b_cfg_start_AWPs();
				m_state = ST_ACTIVE;
				break;
			}
			case ST_ACTIVE:
			{
				m_state = ST_SEND_COMPLETE;
				break;
			}
			case ST_SEND_COMPLETE:
			{
				bool all_complete = true;
				for(int i = 0; i < m_AWP_complt_list.size(); i++)
				{
					if(m_AWP_list[i] && !m_AWP_complt_list[i])
					{
						all_complete = false;
						break;
					}
				}
				if(all_complete)
				{
					for (int i = 0; i < MAX_AWP_PER_FAS; i++)
					{
						m_AWP_complt_list[i] = false;
					}
					m_complete.notify();
					wait(m_complete_ack);
				}
				break;
			}
		};
	}
}


void FAS::b_cfg_FAS(vector<bool> AWP_list, vector<vector<bool>> cfg_QUAD_list, vector<int> num_QUAD_cfgd)
{
	wait(clk_if.posedge_event());
	m_AWP_list = AWP_list;
	m_cfg_QUAD_list = cfg_QUAD_list;
	m_num_QUAD_cfgd = num_QUAD_cfgd;
}


void FAS::b_cfg_start_AWPs()
{
	sc_time delay;
	for (int i = 0; i < MAX_AWP_PER_FAS; i++)
	{
		if (!m_AWP_list[i])
			continue;
		for (int j = 0; j < NUM_QUADS_PER_AWP; j++)
		{
			wait();
			if (!m_cfg_QUAD_list[i][j])
				continue;
			int idx = index2D(NUM_QUADS_PER_AWP, i, j);
			// Accelerator Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			m_accel_trans_arr[idx].num_QUADS_cfgd = m_num_QUAD_cfgd[i];
			m_trans = m_mm.allocate();
			m_trans->acquire();
			m_trans->set_address(i);
			m_trans->set_command(TLM_IGNORE_COMMAND);
			m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			m_trans->set_data_length(0);
			m_trans->set_streaming_width(0);
			m_trans->set_byte_enable_ptr(0);
			m_trans->set_dmi_allowed(false);
			m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			init_soc->b_transport(*m_trans, delay);
			m_trans->release();
			// Pixel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			m_trans = m_mm.allocate();
			m_trans->acquire();
			m_trans->set_address(i);
			m_trans->set_command(TLM_IGNORE_COMMAND);
			m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			m_trans->set_data_length(0);
			m_trans->set_streaming_width(0);
			m_trans->set_byte_enable_ptr(0);
			m_trans->set_dmi_allowed(false);
			m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			init_soc->b_transport(*m_trans, delay);
			m_trans->release();
			// Kernel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			m_trans = m_mm.allocate();
			m_trans->acquire();
			m_trans->set_address(i);
			m_trans->set_command(TLM_IGNORE_COMMAND);
			m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			m_trans->set_data_length(0);
			m_trans->set_streaming_width(0);
			m_trans->set_byte_enable_ptr(0);
			m_trans->set_dmi_allowed(false);
			m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			init_soc->b_transport(*m_trans, delay);
			m_trans->release();
			// Job Start
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_JOB_START;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			m_trans = m_mm.allocate();
			m_trans->acquire();
			m_trans->set_address(i);
			m_trans->set_command(TLM_IGNORE_COMMAND);
			m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			m_trans->set_data_length(0);
			m_trans->set_streaming_width(0);
			m_trans->set_byte_enable_ptr(0);
			m_trans->set_dmi_allowed(false);
			m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			init_soc->b_transport(*m_trans, delay);
			m_trans->release();
		}
	}
}


void FAS::b_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	accel_trans_t* accel_trans;
	accel_trans = (accel_trans_t*)trans.get_data_ptr();
	int awp_id = accel_trans->AWP_id;
	tlm_response_status status = TLM_OK_RESPONSE;
	switch(accel_trans->accel_cmd)
	{
		case ACCL_CMD_JOB_FETCH:
		{
			break;
		}
		case ACCL_CMD_RESULT_WRITE:
		{
			break;
		}
		case ACCL_CMD_JOB_COMPLETE:
		{
			m_AWP_complt_list[awp_id] = true;
			break;
		}
	}
	trans.release();
}