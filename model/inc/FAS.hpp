#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "common.hpp"


SC_MODULE(FAS)
{
	typedef enum
	{
		ST_IDLE				= 0,
		ST_CFG_AWP			= 1,
		ST_ACTIVE			= 2,
		ST_SEND_COMPLETE	= 3
	} FAS_state_t;

	public:
		// Ports
		sc_core::sc_in<bool>						clk_if;
		sc_core::sc_in<bool>						clk_core;
		tlm_utils::simple_initiator_socket<FAS>		init_soc;
		tlm_utils::simple_target_socket<FAS>		tar_soc;

		// Constructor
		SC_CTOR(FAS)
			:	clk_if("clk_if"),
				clk_core("clk_core"),
				m_AWP_complt_list(MAX_AWP_PER_FAS, false)
		{
			tar_soc.register_b_transport(this, &FAS::b_transport);
			SC_THREAD(FAS_ctrl_process);
				sensitive << clk_if.pos();
			
			m_FAS_id = atoi(&std::string(name())[std::string(name()).length() - 1]); 
			m_state = ST_IDLE;
		}

		// Destructor
		~FAS();

		// Processes
		void FAS_ctrl_process();

		// Target Socket Inferface
		void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
		
		// Methods
		void b_cfg_FAS(std::vector<bool> AWP_list, std::vector<std::vector<bool>> cfg_QUAD_list, std::vector<int> num_QUAD_cfgd);
		void b_cfg_start_AWPs();

		// Members
		mm								m_mm;
		sc_core::sc_event				m_start;
		sc_core::sc_event				m_start_ack;
		sc_core::sc_event				m_complete;
		sc_core::sc_event				m_complete_ack;
		FAS_state_t						m_state;
		tlm::tlm_generic_payload*		m_trans;
		std::vector<bool>				m_AWP_complt_list;
		accel_trans_t*					m_accel_trans_arr;
		std::vector<bool>				m_AWP_list;
		std::vector<std::vector<bool>>	m_cfg_QUAD_list;
		std::vector<int>				m_num_QUAD_cfgd;
		int								m_FAS_id;
};
