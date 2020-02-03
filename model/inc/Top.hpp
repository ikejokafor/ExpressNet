#pragma once


#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "AWE.hpp"
#include "Interconnect.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


SC_MODULE(Top)
{
	public:
		// Clocks
		sc_clock clk_if;
		sc_clock clk_core;
		tlm_utils::simple_initiator_socket<Top> init_soc;
		tlm_utils::simple_target_socket<Top> tar_soc;

		AWE* awe[NUM_AWE];
		Interconnect FAS2AWE_bus;
		Interconnect AWE2FAS_bus;

		SC_CTOR(Top)
			:	clk_if("clk_if", CLK_IF_PRD, SC_NS),
				clk_core("clk_core", CLK_CORE_PRD, SC_NS),
				FAS2AWE_bus("FAS2AWE_bus"),
				AWE2FAS_bus("AWE2FAS_bus"),
				init_soc("initiator_socket"),
				tar_soc("target_socket")
		{
			for(int i = 0; i < NUM_AWE; i++)
			{
				// Bindings
				tar_soc.register_b_transport(this, &Top::b_transport);
				awe[i]->clk_if(clk_if);
				awe[i]->clk_core(clk_core);
				init_soc(awe.tar_soc);
				awe[i].init_soc(tar_soc);
			}

			SC_THREAD(top_process);
		}

		// Processes
		void top_process();

		void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay);

		// Members
		mm m_mm;
		tlm_generic_payload* m_trans;
		accel_trans_t* m_accel_trans;
};
