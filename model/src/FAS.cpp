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
				if (m_partMapFetchCount == m_partMapFetchTotal
					&& m_inMapFetchCount == m_inMapFetchTotal
					&& m_krnlFetchCount == m_krnlFetchTotal
					&& m_resMapFetchCount == m_resMapFetchTotal
					& m_outBuf_fifo.num_available() == 0
				) {
					m_state = ST_SEND_COMPLETE;
				}
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
	/*
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait();
		if (m_state == ST_ACTIVE && !m_first_iter_cfg && m_inMap_fifo.num_available() <= IM_LOW_WATERMARK  && m_inMapFetchCount != m_inMapFetchTotal)
		{
			trans = nb_createTLMTrans(
				m_mem_mng,
				0,
				TLM_READ_COMMAND,
				nullptr,
				(IM_NUM_PIX_READ * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			m_sys_mem_bus_sema.wait();
			sys_mem_init_soc->b_transport(*trans, delay);
			m_sys_mem_bus_sema.post();
			trans->release();
			nb_fifo_trans(INMAP_FIFO, FIFO_WRITE, IM_NUM_PIX_READ, IM_FIFO_WR_WIDTH);
		}
	}
	*/
}


void FAS::A_process()
{
	/*
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
	*/
}


void FAS::outBuf_wr_process()
{
	while(true)
	{
		wait(m_wr_outBuf);
		wait();
		nb_fifo_trans(OUTBUF_FIFO, FIFO_WRITE, OB_NUM_PIX_WRITE, OB_FIFO_WR_WIDTH);
		wait();
	}
}


void FAS::S_process()
{
	/*
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait();
		if (m_state == ST_ACTIVE && m_outBuf_fifo.num_available() >= OB_HIGH_WATERMARK)
		{
			nb_fifo_trans(OUTBUF_FIFO, FIFO_READ, OB_NUM_PIX_READ, OB_FIFO_RD_WIDTH);
			trans = nb_createTLMTrans(
				m_mem_mng,
				0,
				TLM_WRITE_COMMAND,
				nullptr,
				(OB_NUM_PIX_WRITE * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			m_sys_mem_bus_sema.wait();
			sys_mem_init_soc->b_transport(*trans, delay);
			m_sys_mem_bus_sema.post();
			trans->release();
		}
	}
	*/
}


void FAS::result_process()
{
	while(true)
	{
		wait(m_result_in);
		wait();
		if(m_first_iter_cfg)
		{
			nb_fifo_trans(OUTBUF_FIFO, FIFO_WRITE, RES_PKT_SIZE, OB_FIFO_WR_WIDTH);
			wait();	
		}
		else
		{
			nb_fifo_trans(PARTMAP_FIFO, FIFO_WRITE, RES_PKT_SIZE, PM_FIFO_WR_WIDTH);
			wait();
		}
	}
}


void FAS::resMap_fetch_process()
{
	/*
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while(true)
	{
		wait();
		if(m_state == ST_ACTIVE && m_last_iter_cfg && m_resMap_fifo.num_available() == RSM_LOW_WATERMARK && m_resMapFetchCount != m_resMapFetchTotal)
		{
			trans = nb_createTLMTrans(
				m_mem_mng,
				0,
				TLM_READ_COMMAND,
				nullptr,
				(RSM_NUM_PIX_READ * PIXEL_SIZE),
				0,
				nullptr,
				false,
				TLM_INCOMPLETE_RESPONSE
			);
			m_sys_mem_bus_sema.wait();
			sys_mem_init_soc->b_transport(*trans, delay);
			m_resMapFetchTotal += (RSM_NUM_PIX_READ * PIXEL_SIZE);
			m_sys_mem_bus_sema.post();
			trans->release();
			nb_fifo_trans(RESMAP_FIFO, FIFO_WRITE, RSM_NUM_PIX_WRITE, RSM_FIFO_WR_WIDTH);
			wait();
		}
	}
	*/
}


void FAS::job_fetch_process()
{
	tlm::tlm_generic_payload* trans;
	sc_time delay;
	while (true)
	{
		wait(m_job_fetch);
		wait();
		Accel_Trans* job_fetch_trans = new Accel_Trans();
		job_fetch_trans->accel_cmd = m_job_fetch_trans.accel_cmd;
		job_fetch_trans->AWP_id = m_job_fetch_trans.AWP_id;
		job_fetch_trans->QUAD_id = m_job_fetch_trans.QUAD_id;			
		trans = nb_createTLMTrans(
			m_mem_mng,
			m_job_fetch_trans.AWP_id,
			TLM_READ_COMMAND,
			(unsigned char*)job_fetch_trans,
			(JF_NUM_PIX_READ * PIXEL_SIZE),
			0,
			nullptr,
			false,
			TLM_INCOMPLETE_RESPONSE
		);
		m_sys_mem_bus_sema.wait();
		sys_mem_init_soc->b_transport(*trans, delay);
		m_sys_mem_bus_sema.post();
		rout_init_soc->b_transport(*trans, delay);
		trans->release();
	}	
}


void FAS::b_cfg_FAS(vector<bool> AWP_arr, vector<vector<bool>> AWP_cfg_QUAD_arr, vector<int> num_AWP_QUAD_cfgd, bool first_iter_cfg, bool last_iter_cfg, bool res_layer_cfg, int num_1x1_kernels)
{
	wait(clk.posedge_event());
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


void FAS::b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	Accel_Trans* accel_trans;
	accel_trans = (Accel_Trans*)trans.get_data_ptr();
	int awp_id = accel_trans->AWP_id;
	int res_pkt_size = accel_trans->res_pkt_size;
	tlm_response_status status = TLM_OK_RESPONSE;
	switch (accel_trans->accel_cmd)
	{
		case ACCL_CMD_JOB_FETCH:
		{
			m_job_fetch_trans.accel_cmd = ACCL_CMD_JOB_FETCH;
			m_job_fetch_trans.AWP_id = accel_trans->AWP_id;
			m_job_fetch_trans.QUAD_id = accel_trans->QUAD_id;
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


void FAS::b_cfg_start_AWPs()
{
	for (int i = 0; i < MAX_AWP_PER_FAS; i++)
	{
		if (!m_AWP_arr[i])
			continue;
		for (int j = 0; j < NUM_QUADS_PER_AWP; j++)
		{
			if (!m_AWP_cfg_QUAD_arr[i][j])
				continue;
			int idx = index2D(NUM_QUADS_PER_AWP, i, j);
			b_QUAD_config(idx, i, j);
			b_QUAD_pix_seq_config(idx, i, j);
			b_QUAD_krnl_config(idx, i, j);
			b_QUAD_job_start(idx, i, j);
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


void FAS::b_QUAD_config(int trans_idx, int AWP_addr, int QUAD_addr)
{
	wait(clk->posedge_event());
	sc_time delay;
	tlm::tlm_generic_payload* trans;
	// payload needs its own unique data Structure
	Accel_Trans* accel_trans				= new Accel_Trans();
	accel_trans->accel_cmd					= ACCL_CMD_CFG_WRITE;
	accel_trans->QUAD_id					= QUAD_addr;
	accel_trans->FAS_id						= m_FAS_id;
	accel_trans->num_QUADS_cfgd				= m_AWP_num_QUAD_cfgd[AWP_addr];
	accel_trans->num_output_col_cfg			= m_accel_trans_arr[trans_idx].num_output_col_cfg;	
	accel_trans->num_output_rows_cfg		= m_accel_trans_arr[trans_idx].num_output_rows_cfg;
	accel_trans->num_kernels_cfg			= m_accel_trans_arr[trans_idx].num_kernels_cfg;
	accel_trans->master_QUAD_cfg			= m_accel_trans_arr[trans_idx].master_QUAD_cfg;
	accel_trans->cascade_cfg				= m_accel_trans_arr[trans_idx].cascade_cfg;
	accel_trans->num_expd_input_cols_cfg	= m_accel_trans_arr[trans_idx].num_expd_input_cols_cfg;
	accel_trans->accel_cmd					= m_accel_trans_arr[trans_idx].accel_cmd;
	accel_trans->conv_out_fmt0_cfg			= m_accel_trans_arr[trans_idx].conv_out_fmt0_cfg;
	accel_trans->padding_cfg				= m_accel_trans_arr[trans_idx].padding_cfg;
	accel_trans->upsmaple_cfg				= m_accel_trans_arr[trans_idx].upsmaple_cfg;
	accel_trans->crpd_input_row_start_cfg	= m_accel_trans_arr[trans_idx].crpd_input_row_start_cfg;
	accel_trans->crpd_input_row_end_cfg		= m_accel_trans_arr[trans_idx].crpd_input_row_end_cfg;
	accel_trans->num_1x1_kernels_cfg		= m_accel_trans_arr[trans_idx].num_1x1_kernels_cfg;
	trans = nb_createTLMTrans(
		m_mem_mng,
		AWP_addr,
		TLM_IGNORE_COMMAND,
		(unsigned char*)accel_trans,
		6,
		0,
		nullptr,
		false,
		TLM_INCOMPLETE_RESPONSE
	);
	wait(clk->posedge_event());
	rout_init_soc->b_transport(*trans, delay);
	trans->release();
}


void FAS::b_QUAD_pix_seq_config(int trans_idx, int AWP_addr, int QUAD_addr)
{
	wait(clk->posedge_event());
	sc_time delay;
	tlm::tlm_generic_payload* trans;
	Accel_Trans* accel_trans = new Accel_Trans();
	accel_trans->accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
	accel_trans->QUAD_id = QUAD_addr;
	accel_trans->FAS_id = m_FAS_id;	
	trans = nb_createTLMTrans(
		m_mem_mng,
		AWP_addr,
		TLM_IGNORE_COMMAND,
		(unsigned char*)accel_trans,
		7,
		0,
		nullptr,
		false,
		TLM_INCOMPLETE_RESPONSE
	);
	wait(clk->posedge_event());
	rout_init_soc->b_transport(*trans, delay);
	trans->release();
}


void FAS::b_QUAD_krnl_config(int trans_idx, int AWP_addr, int QUAD_addr)
{
	wait(clk->posedge_event());
	sc_time delay;
	tlm::tlm_generic_payload* trans;
	Accel_Trans* accel_trans = new Accel_Trans();
	accel_trans->accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
	accel_trans->QUAD_id = QUAD_addr;
	accel_trans->FAS_id = m_FAS_id;	
	trans = nb_createTLMTrans(
		m_mem_mng,
		AWP_addr,
		TLM_IGNORE_COMMAND,
		(unsigned char*)accel_trans,
		7,
		0,
		nullptr,
		false,
		TLM_INCOMPLETE_RESPONSE);
	wait(clk->posedge_event());
	rout_init_soc->b_transport(*trans, delay);
	trans->release();
}


void FAS::b_QUAD_job_start(int trans_idx, int AWP_addr, int QUAD_addr)
{
	wait(clk->posedge_event());
	sc_time delay;
	tlm::tlm_generic_payload* trans;
	Accel_Trans* accel_trans = new Accel_Trans();
	accel_trans->accel_cmd = ACCL_CMD_JOB_START;
	accel_trans->QUAD_id = QUAD_addr;
	accel_trans->FAS_id = m_FAS_id;	
	trans = nb_createTLMTrans(
		m_mem_mng,
		AWP_addr,
		TLM_IGNORE_COMMAND,
		(unsigned char*)accel_trans,
		7,
		0,
		nullptr,
		false,
		TLM_INCOMPLETE_RESPONSE);
	wait(clk->posedge_event());
	rout_init_soc->b_transport(*trans, delay);
	trans->release();
}
