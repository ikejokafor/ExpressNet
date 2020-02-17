#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <string>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "common.hpp"
#include "FAS.hpp"
#include "AWP.hpp"
#include "Interconnect.hpp"


SC_MODULE(Top)
{
	public:
		// Clocks
		sc_core::sc_clock clk_if;
		sc_core::sc_clock clk_core;
		tlm_utils::simple_initiator_socket<Top>	init_soc;
		tlm_utils::simple_target_socket<Top>	tar_soc;

		AWP* awp[MAX_AWP_PER_FAS];
		FAS* fas[NUM_FAS];
		Interconnect FAS2AWE_bus;
		Interconnect AWE2FAS_bus;

		SC_CTOR(Top)
			:	clk_if("clk_if", CLK_IF_PRD, sc_core::SC_NS),
				clk_core("clk_core", CLK_CORE_PRD, sc_core::SC_NS),
				FAS2AWE_bus("FAS2AWE_bus"),
				AWE2FAS_bus("AWE2FAS_bus"),
				m_complt_proc_ret_arr(NUM_FAS, 0),
				m_AWP_arr(NUM_FAS, std::vector<bool>(MAX_AWP_PER_FAS, false)),
				m_AWP_cfg_QUAD_arr(NUM_FAS, std::vector<std::vector<bool>>(MAX_AWP_PER_FAS, std::vector<bool>(NUM_QUADS_PER_AWP, false))),
				m_AWP_num_QUADS_cfgd(NUM_FAS, std::vector<int>(MAX_AWP_PER_FAS, 0))
		{
			tar_soc.register_b_transport(this, &Top::b_transport);
			for(int i = 0, k = 0; i < NUM_FAS; i++)
			{
				fas[i] = new FAS(("FAS_" + std::to_string(i)).c_str());
				fas[i]->clk_if(clk_if);
				fas[i]->clk_core(clk_core);
				fas[i]->rout_init_soc(FAS2AWE_bus.tar_soc);
				AWE2FAS_bus.init_soc(fas[i]->rout_tar_soc);
				init_soc(fas[i]->sys_mem_tar_soc);
				fas[i]->sys_mem_init_soc(tar_soc);
				for (int j = 0; j < MAX_AWP_PER_FAS; j++, k++)
				{
					awp[k] = new AWP(("AWP_" + std::to_string(k)).c_str());
					awp[k]->clk_if(clk_if);
					awp[k]->clk_core(clk_core);
					FAS2AWE_bus.init_soc(awp[k]->tar_soc);
					awp[k]->init_soc(AWE2FAS_bus.tar_soc);
				}
			}
			SC_THREAD(top_process);
				sensitive << clk_if.posedge_event();
		}

		// Destructor
		~Top()
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
		
		// Processes
		void top_process()
		{
			m_AWP_arr[0][0] = false;
			m_AWP_arr[0][1] = true;
			m_AWP_num_QUADS_cfgd[0][0] = 0;
			m_AWP_num_QUADS_cfgd[0][1] = 1;
			// m_AWP_cfg_QUAD_arr[0][1][0] = true;
			// m_AWP_cfg_QUAD_arr[0][1][1] = true;
			m_AWP_cfg_QUAD_arr[0][1][2] = true;
			// m_AWP_cfg_QUAD_arr[0][1][3] = true;
			for (int i = 0; i < NUM_FAS; i++)
			{
				sc_core::sc_spawn_options args;
				args.set_sensitivity(&clk_if);
				m_FAS_complt_arr.push_back(false);
				sc_core::sc_spawn(
					&m_complt_proc_ret_arr[i], 
					sc_core::sc_bind(
						&Top::complt_process,
						this,
						i
					),
					"complt_process",
					&args
				);
			}	
			for(int i = 0; i < NUM_FAS; i++)
			{
				fas[i]->m_accel_trans_arr = new accel_trans_t[MAX_AWP_PER_FAS * NUM_QUADS_PER_AWP];
				bool first_iter_cfg = true;
				int num_1x1_kernels = 10;
				fas[i]->b_cfg_FAS(m_AWP_arr[i], m_AWP_cfg_QUAD_arr[i], m_AWP_num_QUADS_cfgd[i], first_iter_cfg, num_1x1_kernels);
				for(int j = 0; j < MAX_AWP_PER_FAS; j++)
				{
					for(int k = 0; k < NUM_QUADS_PER_AWP; k++)
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
						fas[i]->m_accel_trans_arr[idx].crpd_input_row_end_cfg = 17; // num_output_rows_cfg - 2
						fas[i]->m_accel_trans_arr[idx].num_1x1_kernels_cfg = 6;
					}
				}
				fas[i]->m_start.notify();
				wait(fas[i]->m_start_ack);
			}
			while(true)
			{
				wait();
				bool all_complete = true;
				for (int i = 0; i < m_FAS_complt_arr.size(); i++)
				{
					if(!m_FAS_complt_arr[i])
					{
						all_complete = false;
						break;
					}
				}
				if (all_complete)
				{
					std::cout << "Processing Complete" << std::endl;
					break;
				}
			}
		}
	
		// Spawned Processes
		int complt_process(int idx)
		{
			wait(fas[idx]->m_complete);
			wait();
			m_FAS_complt_arr[idx] = true;
			fas[idx]->m_complete_ack.notify();
		}
	
		// Blocking transport interface
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
		{
			trans.acquire();
			init_soc->b_transport(trans, delay);
			trans.release();
		}
	
		// Members
		std::vector<int> m_complt_proc_ret_arr;
		std::vector<bool> m_FAS_complt_arr;
		std::vector<std::vector<bool>> m_AWP_arr;
		std::vector<std::vector<std::vector<bool>>> m_AWP_cfg_QUAD_arr;
		std::vector<std::vector<int>> m_AWP_num_QUADS_cfgd;
};
