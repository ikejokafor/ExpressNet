#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include "systemc"
#include "string.h"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "common.hpp"
#include "Quad.hpp"
#include "AWP_if.hpp"
#include "AWPBus.hpp"


SC_MODULE(AWP)
{
	public:
		// Ports
		sc_core::sc_in<bool>						clk_if;
		sc_core::sc_in<bool>						clk_core;
		tlm_utils::simple_initiator_socket<AWP>		init_soc;
		tlm_utils::simple_target_socket<AWP>		tar_soc;
		AWPBus										bus;

		// Modules
		Quad* quad[NUM_QUADS_PER_AWP];

		// Constructor
		SC_CTOR(AWP)
			:	clk_if("clk_if"),
				clk_core("clk_core"),
				bus("bus")
		{
			// Bindings
			tar_soc.register_b_transport(this, &AWP::b_transport);
			bus.clk(clk_if);
			
			m_AWP_id = atoi(&std::string(name())[std::string(name()).length() - 1]);
			// Create Modules
			for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
			{
				quad[i] = new Quad(
					("Quad_" + std::to_string(i)).c_str()
				);
				quad[i]->clk(clk_if);
				quad[i]->bus(bus);
			}

			// SC processes
			SC_THREAD(AWP_process)
				sensitive << clk_if.pos();
		}

		// Destructor
		~AWP();

		// Processes
		void AWP_process();

		// Target Socket Inferface
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);

		// Members
		mm m_mm;
		sc_core::sc_event m_trans;
		int m_AWP_id;
};
