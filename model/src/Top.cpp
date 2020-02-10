/*
#include "Top.hpp"


Top::~Top()
{
	for (int i = 0; i < NUM_AWE; i++)
	{
		delete awe[i];
	}
	for (int i = 0; i < NUM_FAS; i++)
	{
		delete fas[i];
	}
}


void Top::top_process()
{
	
	for(int i = 0; i < NUM_QUADS_PER_AWE; i++)
	{
		// Accelerator Configuration
		m_accel_trans = new accel_trans_t;
		m_accel_trans->num_output_col_cfg = 19;
		m_accel_trans->num_output_rows_cfg = 19;
		m_accel_trans->num_kernels_cfg = 5;
		m_accel_trans->master_quad_cfg = true;
		m_accel_trans->cascade_cfg = false;
		m_accel_trans->result_quad_cfg = false;
		m_accel_trans->num_expd_input_cols_cfg = 19;
		m_accel_trans->accel_cmd = ACCL_CMD_CFG_WRITE;
		m_accel_trans->quad_id = i;
		m_trans = m_mm.allocate();
		m_trans->acquire();
		m_trans->set_command(TLM_IGNORE_COMMAND);
		m_trans->set_address(0);
		m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(m_accel_trans));
		m_trans->set_data_length(0);
		m_trans->set_streaming_width(0);
		m_trans->set_byte_enable_ptr(0);
		m_trans->set_dmi_allowed(false);
		m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		init_soc->b_transport(*m_trans, sc_time());
		m_trans->release();
		free(m_accel_trans);

		// Pixel Sequence Configuration
		m_accel_trans = new accel_trans_t;
		m_accel_trans->accel_cmd = ACCL_CMD_PIX_SEQ_CFG_WRITE;
		m_accel_trans->quad_id = i;
		m_trans = m_mm.allocate();
		m_trans->acquire();
		m_trans->set_command(TLM_IGNORE_COMMAND);
		m_trans->set_address(0);
		m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(m_accel_trans));
		m_trans->set_data_length(0);
		m_trans->set_streaming_width(0);
		m_trans->set_byte_enable_ptr(0);
		m_trans->set_dmi_allowed(false);
		m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		init_soc->b_transport(*m_trans, sc_time());
		m_trans->release();
		free(m_accel_trans);

		// Kernel Sequence Configuration
		m_accel_trans = new accel_trans_t;
		m_accel_trans->accel_cmd = ACCL_CMD_KRL_CFG_WRITE;
		m_accel_trans->quad_id = i;
		m_trans = m_mm.allocate();
		m_trans->acquire();
		m_trans->set_command(TLM_IGNORE_COMMAND);
		m_trans->set_address(0);
		m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(m_accel_trans));
		m_trans->set_data_length(0);
		m_trans->set_streaming_width(0);
		m_trans->set_byte_enable_ptr(0);
		m_trans->set_dmi_allowed(false);
		m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		init_soc->b_transport(*m_trans, sc_time());
		m_trans->release();
		free(m_accel_trans);

		// Job Start
		m_accel_trans = new accel_trans_t;
		m_accel_trans->accel_cmd = ACCL_CMD_JOB_START;
		m_accel_trans->quad_id = i;
		m_trans = m_mm.allocate();
		m_trans->acquire();
		m_trans->set_command(TLM_IGNORE_COMMAND);
		m_trans->set_address(0);
		m_trans->set_data_ptr(reinterpret_cast<unsigned char*>(m_accel_trans));
		m_trans->set_data_length(0);
		m_trans->set_streaming_width(0);
		m_trans->set_byte_enable_ptr(0);
		m_trans->set_dmi_allowed(false);
		m_trans->set_response_status(TLM_INCOMPLETE_RESPONSE);
		init_soc->b_transport(*m_trans, sc_time());
		m_trans->release();
		free(m_accel_trans);
	}

	while (true) 
	{
		wait(clk_if.posedge_event());
	}
}


void Top::b_transport(tlm::tlm_generic_payload& trans, sc_time& delay)
{
	trans.acquire();
	trans.release();
	return;
}

*/