#pragma once


#define	MAX_TRANS_IN_PROG 1


#include "systemc"
#include "common.hpp"
#include "AWP_if.hpp"


class Request
{
	public:
		bool m_req;
		sc_core::sc_event m_proceed;
		Request() : m_req(false) { }
};



class AWPBus : public sc_core::sc_module, public AWP_if
{
	public:
		sc_core::sc_in<bool> clk;


		SC_CTOR(AWPBus)
			:	m_quad_id(0)
		{
			SC_THREAD(AWPBus_process);
				sensitive << clk.pos();
			
			m_num_trans_in_prog = 0;

			for (int i = 0; i < NUM_QUADS_PER_AWP; i++)
			{
				m_req_arr[i].m_req = false;
			}
			m_next_quad_id = 0;
		}


		~AWPBus();

		// Processes
		void AWPBus_process();


		// Channel Methods
		void b_transaction(int FAS_id, int quad_id, accel_cmd_t accel_cmd, int res_pkt_size);


		// Memebers
		int					m_num_trans_in_prog;
		accel_cmd_t			m_accel_cmd;
		int					m_res_pkt_size;
		Request				m_req_arr[NUM_QUADS_PER_AWP];
		sc_core::sc_event	m_start_trans;
		sc_core::sc_event	m_trans_complete;
		int					m_quad_id;
		int					m_FAS_id;
		int					m_next_quad_id;
		std::vector<bool>	m_QUAD_complt_list;
		int					m_num_QUADs_cfgd;
};