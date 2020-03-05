#include "CNN_Layer_Accel.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
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
	m_AWP_arr[0][0] = false;
	m_AWP_arr[0][1] = true;
	m_AWP_num_QUADS_cfgd[0][0] = 0;
	m_AWP_num_QUADS_cfgd[0][1] = 2;
	m_AWP_cfg_QUAD_arr[0][1][0] = true;
	m_AWP_cfg_QUAD_arr[0][1][1] = true;
	m_AWP_cfg_QUAD_arr[0][1][2] = false;
	m_AWP_cfg_QUAD_arr[0][1][3] = false;
	for(int i = 0 ; i < NUM_FAS ; i++)
	{
		m_FAS_complt_arr.push_back(false);
		sc_core::sc_spawn_options args;
		args.set_sensitivity(&clk);
		sc_core::sc_spawn(
			nullptr, 
			sc_core::sc_bind(
				&CNN_Layer_Accel::complt_process,
				this,
				i),
			("complt_process" + to_string(i)).c_str(),
			&args);
	}	
	for (int i = 0; i < NUM_FAS; i++)
	{
		fas[i]->m_accel_trans_arr = new Accel_Trans[MAX_AWP_PER_FAS * NUM_QUADS_PER_AWP];
		bool first_iter_cfg = true;
		bool last_iter_cfg = true;
		bool res_layer_cfg = true;				
		int num_1x1_kernels = 0;
		fas[i]->b_cfg_FAS(m_AWP_arr[i], m_AWP_cfg_QUAD_arr[i], m_AWP_num_QUADS_cfgd[i], first_iter_cfg, last_iter_cfg, res_layer_cfg, num_1x1_kernels);
		for (int j = 0; j < MAX_AWP_PER_FAS; j++)
		{
			for (int k = 0; k < NUM_QUADS_PER_AWP; k++)
			{
				int idx = index2D(NUM_QUADS_PER_AWP, j, k);
				fas[i]->m_accel_trans_arr[idx].num_output_col_cfg = 19;
				fas[i]->m_accel_trans_arr[idx].num_output_rows_cfg = 19;
				fas[i]->m_accel_trans_arr[idx].num_kernels_cfg = 5;
				fas[i]->m_accel_trans_arr[idx].master_QUAD_cfg = true;
				fas[i]->m_accel_trans_arr[idx].cascade_cfg = false;
				fas[i]->m_accel_trans_arr[idx].num_expd_input_cols_cfg = 19;
				fas[i]->m_accel_trans_arr[idx].accel_cmd = ACCL_CMD_CFG_WRITE;
				fas[i]->m_accel_trans_arr[idx].conv_out_fmt0_cfg = false;
				fas[i]->m_accel_trans_arr[idx].padding_cfg = false;
				fas[i]->m_accel_trans_arr[idx].upsmaple_cfg = false;
				fas[i]->m_accel_trans_arr[idx].crpd_input_row_start_cfg = 1;
				fas[i]->m_accel_trans_arr[idx].crpd_input_row_end_cfg = 17;  // num_output_rows_cfg - 2
				fas[i]->m_accel_trans_arr[idx].num_1x1_kernels_cfg = 6;
			}
		}
		fas[i]->m_start.notify();
		wait(fas[i]->m_start_ack);
	}
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
		if (all_complete)
		{
			str = "Processing Complete at " + sc_time_stamp().to_string() + "\n";
			std::cout << str;
			break;
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


#ifdef MODELSIM
SC_MODULE_EXPORT(CNN_layer_Accel);
#endif