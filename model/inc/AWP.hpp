#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include "systemc"
#include "string.h"
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
#include "QUAD.hpp"
#include "AWP_if.hpp"
#include "AWPBus.hpp"


SC_MODULE(AWP)
{
	public:
		// Ports
		sc_core::sc_in<bool>						clk;
		tlm_utils::simple_initiator_socket<AWP>		init_soc;
		tlm_utils::simple_target_socket<AWP>		tar_soc;
		AWPBus										bus;

		// Modules
		QUAD* quad[NUM_QUADS_PER_AWP];

		// Constructor
		SC_CTOR(AWP)
			:	clk("clk"),
				bus("bus"),
				m_num_trans_in_prog(0),
				m_next_req_id(0)
		{
			m_AWP_id = atoi(&std::string(name())[std::string(name()).length() - 1]);
			
			// Bindings
			tar_soc.register_b_transport(this, &AWP::b_transport);
			bus.clk(clk);
			for(int i = 0; i < MAX_AWP_TRANS; i++)
			{
				bus.m_req_arr[i].AWP_id = m_AWP_id;
			}
			
			// Create Modules
			for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
			{
				quad[i] = new QUAD(
					("QUAD_" + std::to_string(i)).c_str()
				);
				quad[i]->clk(clk);
				quad[i]->bus(bus);
			}
			
			// Spawn Processes
			for (int i = 0; i < MAX_AWP_TRANS; i++)
			{
				sc_core::sc_spawn_options args;
				args.set_sensitivity(&clk);
				sc_core::sc_spawn(
					nullptr, 
					sc_core::sc_bind(
						&AWP::request_process,
						this,
						i
					),
					("request_process" + std::to_string(i)).c_str(),
					&args
				);
			}	

			// SC processes
			SC_THREAD(bus_arbitrate)
				sensitive << clk.pos();
			SC_THREAD(send_complete)
				sensitive << clk.pos();
			
			m_next_req_id = 0;
			for (int i = 0; i < NUM_QUADS_PER_AWP; i++)
			{
				m_QUADs_cfgd_arr.push_back(false);
			}
			m_num_QUADs_cfgd = 0;
		}

		// Destructor
		~AWP();

		// Processes
		void bus_arbitrate();
		int request_process(int idx);
		void send_complete();

		// Methods
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);

		// Members
		mem_mng m_mem_mng;
		sc_core::sc_event m_trans;
		int m_AWP_id;
		int m_FAS_id;
		int m_num_trans_in_prog;
		int	m_next_req_id;
		std::vector<bool> m_QUADs_cfgd_arr;
		int m_num_QUADs_cfgd;
};
