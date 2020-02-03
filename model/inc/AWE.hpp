#pragma once


#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "common.hpp"
#include "Quad.hpp"
#include "AWE_if.hpp"
#include "AWEBus.hpp"


SC_MODULE(AWE)
{
	public:
		// Ports
		sc_core::sc_in<bool>						clk_if;
		sc_core::sc_in<bool>						clk_core;
		tlm_utils::simple_initiator_socket<AWE>		init_soc;
		tlm_utils::simple_target_socket<AWE>		tar_soc;
		AWEBus										bus;

		// Modules
		Quad* quad[NUM_QUADS_PER_AWE];

		// Constructor
		SC_CTOR(AWE)
			:	clk_if("clk_if"),
				clk_core("clk_core"),
				bus("bus")
		{
			// Bindings
			tar_soc.register_b_transport(this, &AWE::b_transport);
			bus.clk(clk_if);

			// Create Modules
			for(int i = 0; i < NUM_QUADS_PER_AWE; i++)
			{
				quad[i] = new Quad(
					("Quad_" + std::to_string(i)).c_str(),
					i
				);
				quad[i]->clk(clk_if);
				quad[i]->bus(bus);
			}

			// SC processes
			SC_THREAD(awe_process);
				sensitive << clk_if.pos();
		}

		// Destructor
		~AWE();

		// Processes
		void awe_process();

		// Target Socket Inferface
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);

		// Methods
		void decode_event();

		// Members
		mm m_mm;
		sc_core::sc_event m_trans;
};
