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
		if (m_state == ST_ACTIVE && !m_first_iter_cfg && m_inMap_fifo.num_available() <= IM_LOW_WATERMARK)
		{
			trans = m_mm.allocate();
			trans->acquire();
			nb_createTrans(
				&trans,
				0,
				TLM_READ_COMMAND,
				nullptr,
				(IM_NUM_PIX_READ * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			sys_mem_init_soc->b_transport(*trans, delay);
			trans->release();
			nb_fifo_trans(INMAP_FIFO, FIFO_WRITE, IM_NUM_PIX_READ, IM_FIFO_WR_WIDTH);
		}
	}
}


void FAS::A_process()
{
	int dummyVal;
	while(true)
	{
		wait();
		if (m_state == ST_ACTIVE 
			&& m_first_iter_cfg 
			&& m_conv_out_fmt0_cfg 
			&& m_inMap_fifo.num_available() > 0
			&& m_partMap_fifo.num_available() > 0 
		) {
			// pop input map, pop partial map
			nb_fifo_trans(INMAP_FIFO, FIFO_READ, IM_NUM_PIX_READ, IM_FIFO_RD_WIDTH);
			nb_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
			wait();
			// accum
			wait();
			// store to buffer
			m_wr_outBuf.notify();
		}
		else if(m_state == ST_ACTIVE 
			&& m_last_iter_cfg 
			&& m_res_layer_cfg 
			&& m_conv_out_fmt0_cfg
			&& m_inMap_fifo.num_available() > 0
			&& m_partMap_fifo.num_available() > 0 
			&& m_resMap_fifo.num_available() > 0
		) {
			// pop input map, pop partial map, pop res map
			nb_fifo_trans(INMAP_FIFO, FIFO_READ, IM_NUM_PIX_READ, IM_FIFO_RD_WIDTH);
			nb_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
			nb_fifo_trans(RESMAP_FIFO, FIFO_READ, RSM_NUM_PIX_READ, RSM_FIFO_RD_WIDTH);
			wait();
			// add input map, partial map, and residual map pixel
			wait();
			// store to buffer
			m_wr_outBuf.notify();
		}
		else if (m_state == ST_ACTIVE 
			&& m_first_iter_cfg 
			&& !m_conv_out_fmt0_cfg
			&& m_inMap_fifo.num_available() > 0
			&& m_partMap_fifo.num_available() > 0
		) {
			// pop input map, pop partial map
			nb_fifo_trans(INMAP_FIFO, FIFO_READ, IM_NUM_PIX_READ, IM_FIFO_RD_WIDTH);
			nb_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
			wait();
			// add input and partial map, pop 1x1 kernel
			nb_fifo_trans(KRNL_1X1_FIFO, FIFO_READ, KRNL_NUM_PIX_READ, KRNL_FIFO_RD_WIDTH);
			wait();	
			// multiply sum with 1x1
			wait();
			// store to buffer
			if(m_process_count == OB_FIFO_WR_WIDTH)
			{
				m_process_count = 0;
				m_wr_outBuf.notify();
			}
			else
			{
				m_process_count++;
			}			
		}
		else if (m_state == ST_ACTIVE 
			&& !m_first_iter_cfg 
			&& !m_conv_out_fmt0_cfg
			&& m_inMap_fifo.num_available() > 0
			&& m_partMap_fifo.num_available() > 0
		) {
			// pop partial map, pop 1x1 fifo
			nb_fifo_trans(PARTMAP_FIFO, FIFO_READ, PM_NUM_PIX_READ, PM_FIFO_RD_WIDTH);
			nb_fifo_trans(KRNL_1X1_FIFO, FIFO_READ, KRNL_NUM_PIX_READ, KRNL_FIFO_RD_WIDTH);
			wait();
			// pop input map, multiply partial map with 1x1
			nb_fifo_trans(INMAP_FIFO, FIFO_READ, IM_NUM_PIX_READ, IM_FIFO_RD_WIDTH);	
			wait();
			// add input and partial map 1x1 product
			wait();
			// store to buffer
			if(m_process_count == OB_FIFO_WR_WIDTH)
			{
				m_process_count = 0;
				m_wr_outBuf.notify();
			}
			else
			{
				m_process_count++;
			}	
		}
	}
}


void FAS::outBuf_wr_process()
{
	while(true)
	{
		wait(m_wr_outBuf);
		wait();
		for (int i = 0; i < OB_NUM_PIX_WRITE; i += OB_FIFO_WR_WIDTH)
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
		if (m_state == ST_ACTIVE && m_outBuf_fifo.num_available() == OB_HIGH_WATERMARK)
		{
			for (int i = 0; i < m_outBuf_fifo.num_available(); i += OB_FIFO_RD_WIDTH)
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
			nb_createTrans(
				&trans,
				0,
				TLM_WRITE_COMMAND,
				nullptr,
				(OB_NUM_PIX_WRITE * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			sys_mem_init_soc->b_transport(*trans, delay);
			trans->release();
		}
	}
}


void FAS::result_process()
{
	while(true)
	{
		wait(m_result_in);
		wait();
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
	}
}


void FAS::res_map_fetch_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_first_iter_cfg && m_outBuf_fifo.num_available() == RSM_LOW_WATERMARK)
		{
			trans = m_mm.allocate();
			trans->acquire();
			nb_createTrans(
				&trans,
				0,
				TLM_READ_COMMAND,
				nullptr,
				(RSM_NUM_PIX_READ * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);		
			sys_mem_init_soc->b_transport(*trans, delay);
			trans->release();
			nb_fifo_trans(RESMAP_FIFO, FIFO_WRITE, RSM_NUM_PIX_WRITE, RSM_FIFO_WR_WIDTH);
			wait();
		}
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
		nb_createTrans(
			&trans,
			0,
			TLM_READ_COMMAND,
			reinterpret_cast<unsigned char*>(&m_job_fetch_trans),
			(JF_NUM_PIX_READ * PIXEL_SIZE),
			0,
			nullptr,
			false,
			TLM_INCOMPLETE_RESPONSE
		);	
		sys_mem_init_soc->b_transport(*trans, delay);
		rout_init_soc->b_transport(*trans, delay);
		trans->release();
	}	
}


void FAS::b_cfg_FAS(vector<bool> AWP_arr, vector<vector<bool>> AWP_cfg_QUAD_arr, vector<int> num_AWP_QUAD_cfgd, bool first_iter_cfg, bool last_iter_cfg, bool res_layer_cfg, int num_1x1_kernels)
{
	wait(clk_if.posedge_event());
	m_AWP_arr = AWP_arr;
	m_AWP_cfg_QUAD_arr = AWP_cfg_QUAD_arr;
	m_AWP_num_QUAD_cfgd = num_AWP_QUAD_cfgd;
	m_first_iter_cfg = first_iter_cfg;
	m_last_iter_cfg = last_iter_cfg;
	m_res_layer_cfg = res_layer_cfg;
	int krnl_1x1_depth = MAX_3x3_KERNELS;
	wait(MAX_1x1_KERNELS * krnl_1x1_depth, SC_NS);
	for (int i = 0; i <(MAX_3x3_KERNELS * krnl_1x1_depth); i++)
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
			nb_createTrans(
				&trans,
				i,
				TLM_IGNORE_COMMAND,
				reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]),
				0,
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Pixel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			nb_createTrans(
				&trans,
				i,
				TLM_IGNORE_COMMAND,
				reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]),
				0,
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Kernel Sequence Configuration
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			nb_createTrans(
				&trans,
				i,
				TLM_IGNORE_COMMAND,
				reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]),
				0,
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
			// Job Start
			m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_JOB_START;
			m_accel_trans_arr[idx].QUAD_id = j;
			m_accel_trans_arr[idx].FAS_id = m_FAS_id;
			trans = m_mm.allocate();
			trans->acquire();
			nb_createTrans(
				&trans,
				i,
				TLM_IGNORE_COMMAND,
				reinterpret_cast<unsigned char*>(&m_accel_trans_arr[idx]),
				0,
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			rout_init_soc->b_transport(*trans, delay);
			trans->release();
		}
	}
}


void FAS::nb_fifo_trans(sc_core::sc_fifo<int>& fifo, FAS::fifo_cmd_t fifo_cmd, int fifo_trans_size, int fifo_trans_width)
{
	for (int i = 0; i < fifo_trans_size; i += fifo_trans_width)
	{
		for (int j = 0; j < fifo_trans_width; j++)
		{
			switch (fifo_cmd)
			{
			case FAS::FIFO_READ:
				{
					int dummy;
					fifo.nb_read(dummy);
					break;
				}
			case FAS::FIFO_WRITE:
				{
					fifo.nb_write(int());
					break;
				}
			}
		}
	}
}


void FAS::nb_fifo_trans(fifo_sel_t fifo_sel, FAS::fifo_cmd_t fifo_cmd, int fifo_trans_size, int fifo_trans_width)
{
	switch(fifo_sel)
	{
		case PARTMAP_FIFO:
		{
			nb_fifo_trans(m_partMap_fifo, fifo_cmd, fifo_trans_size, fifo_trans_width);
			break;
		}
		case INMAP_FIFO:
		{
			nb_fifo_trans(m_inMap_fifo, fifo_cmd, fifo_trans_size, fifo_trans_width);
			break;
		}
		case KRNL_1X1_FIFO:
		{
			nb_fifo_trans(m_krnl_1x1_fifo, fifo_cmd, fifo_trans_size, fifo_trans_width);
			break;
		}
		case RESMAP_FIFO:
		{
			nb_fifo_trans(m_resMap_fifo, fifo_cmd, fifo_trans_size, fifo_trans_width);
			break;
		}
		case OUTBUF_FIFO:
		{
			nb_fifo_trans(m_outBuf_fifo, fifo_cmd, fifo_trans_size, fifo_trans_width);			
			break;
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