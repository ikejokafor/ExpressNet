#include "FAS.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


FAS::~FAS() { }


void FAS::ctrl_process()
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
				m_state = ST_CFG_START_AWP;
				break;
			}
			case ST_CFG_START_AWP:
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
				for(int i = 0; i < m_AWP_complt_arr.size(); i++)
				{
					if(m_AWP_arr[i] && !m_AWP_complt_arr[i])
					{
						all_complete = false;
						break;
					}
				}
				if(all_complete)
				{
					for (int i = 0; i < MAX_AWP_PER_FAS; i++)
					{
						m_AWP_complt_arr[i] = false;
					}
					m_complete.notify();
					wait(m_complete_ack);
					m_state = ST_IDLE;
				}
				break;
			}
		};
	}
}


void FAS::F_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait();
		/*
		if (m_state == ST_ACTIVE && !m_first_iter_cfg)
		{
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(0);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(nullptr);
			trans->set_data_length(IM_NUM_FETCH_PIX * PIXEL_SIZE);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			sys_mem_init_soc->b_transport(*trans, delay);
			trans->release();
			for (int i = 0; i < (IM_NUM_FETCH_PIX); i += PM_FIFO_WR_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_RD_WIDTH; j++)
				{
					m_inMap_fifo.nb_write(int());
				}
				wait();
			}
		}
		*/
	}
}


void FAS::A_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	int dummyVal;
	while(true)
	{
		wait();
		/*
		if(m_state == ST_ACTIVE && !m_first_iter_cfg && m_conv_out_fmt0_cfg)
		{
			// pop input map, pop partial map
			for (int i = 0; i < m_partMap_fifo.size(); i += PM_FIFO_RD_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_RD_WIDTH; j++)
				{
					m_partMap_fifo.nb_read(dummyVal);
					m_inMap_fifo.nb_read(dummyVal);
				}
				wait();
			}
			// accum
			wait();
			// store to buffer
			m_wr_outBuf.notify();
		}
		else if (m_state == ST_ACTIVE && m_first_iter_cfg && !m_conv_out_fmt0_cfg)
		{
			// pop input map, pop partial map
			for(int i = 0 ; i < m_partMap_fifo.size() ; i += PM_FIFO_RD_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_RD_WIDTH; j++)
				{
					m_partMap_fifo.nb_read(dummyVal);
					m_inMap_fifo.nb_read(dummyVal);
				}
				wait();
			}
			// add input and partial map, pop 1x1 kernel
			m_krnl_1x1_fifo.nb_read(dummyVal);
			wait();	
			// multiply sum with 1x1
			wait();
			// store to buffer
			m_wr_outBuf.notify();
		}
		else if (m_state == ST_ACTIVE && !m_first_iter_cfg && !m_conv_out_fmt0_cfg)
		{
			// pop input map
			for(int i = 0 ; i < m_partMap_fifo.size() ; i += PM_FIFO_RD_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_RD_WIDTH; j++)
				{
					m_inMap_fifo.nb_read(dummyVal);
				}
				wait();
			}
			// pop partial map, multiply input map with 1x1
			for (int i = 0; i < m_partMap_fifo.size(); i += PM_FIFO_RD_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_RD_WIDTH; j++)
				{
					m_partMap_fifo.nb_read(dummyVal);
				}
				wait();
			}
			m_krnl_1x1_fifo.nb_read(dummyVal);
			wait();
			// add input and partial map
			wait();
			// store to buffer
			m_wr_outBuf.notify();
		}
		*/
	}
}


void FAS::outBuf_wr_process()
{
	while(true)
	{
		wait(m_wr_outBuf);
		wait();
		for (int i = 0; i < IM_FIFO_RD_WIDTH; i += OB_FIFO_WR_WIDTH)
		{
			for (int j = 0; j < OB_FIFO_WR_WIDTH; j++)
			{
				m_outBuf_fifo.nb_write(int());
			}
			wait();
		}
	}
}


void FAS::S_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait();
		/*
		if(m_state == ST_ACTIVE && m_first_iter_cfg && m_outBuf_fifo.size() == SYS_MEM_NUM_PIX_WRITE)
		{
			for (int i = 0; i < m_outBuf_fifo.size(); i += OB_FIFO_RD_WIDTH)
			{
				for (int j = 0; j < OB_FIFO_RD_WIDTH; j++)
				{
					int dummyVal;
					m_outBuf_fifo.nb_read(dummyVal);
				}
				wait();
			}
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(0);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(nullptr);
			trans->set_data_length(SYS_MEM_NUM_PIX_WRITE * PIXEL_SIZE);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			sys_mem_init_soc->b_transport(*trans, delay);
			trans->release();
		}
		*/
	}
}


void FAS::result_process()
{
	while(true)
	{
		wait(m_result_in);
		wait();
		/*
		if(m_first_iter_cfg)
		{
			for (int i = 0; i < RES_PKT_SIZE; i += OB_FIFO_WR_WIDTH)
			{
				for (int j = 0; j < OB_FIFO_WR_WIDTH; j++)
				{
					m_outBuf_fifo.nb_write(int());
				}
				wait();
			}	
		}
		else
		{
			for (int i = 0; i < RES_PKT_SIZE; i += PM_FIFO_WR_WIDTH)
			{
				for (int j = 0; j < PM_FIFO_WR_WIDTH; j++)
				{
					m_partMap_fifo.nb_write(int());
				}
				wait();
			}	
		}
		*/
	}
}


void FAS::job_fetch_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait(m_job_fetch);
		wait();
		trans = m_mm.allocate();
		trans->acquire();
		trans->set_address(m_job_fetch_trans.AWP_id);
		trans->set_command(TLM_IGNORE_COMMAND);
		trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_job_fetch_trans));
		trans->set_data_length(SYS_MEM_NUM_PIX_READ * PIXEL_SIZE);
		trans->set_streaming_width(0);
		trans->set_byte_enable_ptr(0);
		trans->set_dmi_allowed(false);
		trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		sys_mem_init_soc->b_transport(*trans, delay);
		rout_init_soc->b_transport(*trans, delay);
		trans->release();
	}	
}


void FAS::b_cfg_FAS(vector<bool> AWP_arr, vector<vector<bool>> AWP_cfg_QUAD_arr, vector<int> num_AWP_QUAD_cfgd, bool first_iter_cfg, int num_1x1_kernels)
{
	wait(clk_if.posedge_event());
	m_AWP_arr = AWP_arr;
	m_AWP_cfg_QUAD_arr = AWP_cfg_QUAD_arr;
	m_AWP_num_QUAD_cfgd = num_AWP_QUAD_cfgd;
	m_first_iter_cfg = first_iter_cfg;
	wait(MAX_3x3_KERNELS * MAX_1x1_KERNELS, SC_NS);
	for (int i = 0; i < MAX_3x3_KERNELS * MAX_1x1_KERNELS; i++)
	{
		m_krnl_1x1_fifo.nb_write(int());
	}
}


void FAS::b_cfg_start_AWPs()
{
	sc_time delay;
	tlm::tlm_generic_payload* trans;
	for (int i = 0; i < MAX_AWP_PER_FAS; i++)
	{
		if (!m_AWP_arr[i])
			continue;
		for (int j = 0; j < NUM_QUADS_PER_AWP; j++)
		{
			wait();
			if (!m_AWP_cfg_QUAD_arr[i][j])
				continue;
			int idx = index2D(NUM_QUADS_PER_AWP, i, j);
			// Accelerator Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			m_accel_trans_arr[idx].num_QUADS_cfgd = m_AWP_num_QUAD_cfgd[i];
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(i);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			trans->set_data_length(0);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Pixel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(i);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			trans->set_data_length(0);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Kernel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(i);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			trans->set_data_length(0);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Job Start
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_JOB_START;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			trans->set_address(i);
			trans->set_command(TLM_IGNORE_COMMAND);
			trans->set_data_ptr(reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]));
			trans->set_data_length(0);
			trans->set_streaming_width(0);
			trans->set_byte_enable_ptr(0);
			trans->set_dmi_allowed(false);
			trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
		}
	}
}


void FAS::b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	accel_trans_t* accel_trans;
	accel_trans = (accel_trans_t*)trans.get_data_ptr();
	int awp_id = accel_trans->AWP_id;
	int res_pkt_size = accel_trans->res_pkt_size;
	tlm_response_status status = TLM_OK_RESPONSE;
	switch(accel_trans->accel_cmd)
	{
		case ACCL_CMD_JOB_FETCH:
		{
			m_job_fetch_trans.accel_cmd = ACCL_CMD_JOB_FETCH;
			m_job_fetch_trans.AWP_id = accel_trans->AWP_id;
			m_job_fetch.notify();
			break;
		}
		case ACCL_CMD_RESULT_WRITE:
		{
			m_result_in.notify();
			m_res_pkt_size = res_pkt_size;
			break;
		}
		case ACCL_CMD_JOB_COMPLETE:
		{
			m_AWP_complt_arr[awp_id] = true;
			break;
		}
	}
	trans.release();
}


void FAS::b_mem_soc_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	trans.release();
}