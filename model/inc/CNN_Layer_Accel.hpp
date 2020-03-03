#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <string>
#include "systemc"
#include "tlm.h"
#ifdef MODELSIM
#include "peq_with_cb_and_phase.h"
#include "simple_initiator_socket.h"
#include "simple_target_socket.h"
#else
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#endif
#include "mem_mng.hpp"
#include "common.hpp"
#include "FAS.hpp"
#include "AWP.hpp"
#include "Interconnect.hpp"


SC_MODULE(CNN_Layer_Accel)
{
	public:
		// Clocks
		sc_core::sc_clock clk;
		tlm_utils::simple_target_socket<CNN_Layer_Accel>	tar_soc;

		AWP* awp[MAX_AWP_PER_FAS];
		FAS* fas[NUM_FAS];
		Interconnect FAS2AWE_bus;
		Interconnect AWE2FAS_bus;

		SC_CTOR(CNN_Layer_Accel)
			:	clk("clk", CLK_PRD, sc_core::SC_NS),
				FAS2AWE_bus("FAS2AWE_bus"),
				AWE2FAS_bus("AWE2FAS_bus"),
				m_AWP_arr(NUM_FAS, std::vector<bool>(MAX_AWP_PER_FAS, false)),
				m_AWP_cfg_QUAD_arr(NUM_FAS, std::vector<std::vector<bool>>(MAX_AWP_PER_FAS, std::vector<bool>(NUM_QUADS_PER_AWP, false))),
				m_AWP_num_QUADS_cfgd(NUM_FAS, std::vector<int>(MAX_AWP_PER_FAS, 0))
		{
			tar_soc.register_b_transport(this, &CNN_Layer_Accel::b_transport);
			FAS2AWE_bus.clk(clk);
			AWE2FAS_bus.clk(clk);
			for(int i = 0, k = 0; i < NUM_FAS; i++)
			{
				fas[i] = new FAS(("FAS_" + std::to_string(i)).c_str());
				fas[i]->clk(clk);
				fas[i]->rout_init_soc(FAS2AWE_bus.tar_soc);
				AWE2FAS_bus.init_soc(fas[i]->rout_tar_soc);
				fas[i]->sys_mem_init_soc(tar_soc);
				for (int j = 0; j < MAX_AWP_PER_FAS; j++, k++)
				{
					awp[k] = new AWP(("AWP_" + std::to_string(k)).c_str());
					awp[k]->clk(clk);
					FAS2AWE_bus.init_soc(awp[k]->tar_soc);
					awp[k]->init_soc(AWE2FAS_bus.tar_soc);
				}
			}
			SC_THREAD(main_process);
				sensitive << clk.posedge_event();
		}

		// Destructor
		~CNN_Layer_Accel();
		
		// Processes
		void main_process();
		int complt_process(int idx);

	
		// Methods
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
	
		// Members
		std::vector<bool> m_FAS_complt_arr;
		std::vector<std::vector<bool>> m_AWP_arr;
		std::vector<std::vector<std::vector<bool>>> m_AWP_cfg_QUAD_arr;
		std::vector<std::vector<int>> m_AWP_num_QUADS_cfgd;
};
