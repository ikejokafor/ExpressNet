#pragma once


#include "systemc"
#include "common.hpp"
#include "awe_if.hpp"


class Request
{
	public:
		bool m_req;
		sc_core::sc_event m_proceed;
		Request() : m_req(false) { }
};



class AWEBus : public sc_core::sc_module, public AWE_if
{
	public:
		sc_core::sc_in<bool> clk;


		SC_CTOR(AWEBus)
			:	m_quad_id(0)
		{
			SC_THREAD(AWEBus_process);
				sensitive << clk.pos();
			m_trans_in_prog = false;

			for (int i = 0; i < NUM_QUADS_PER_AWE; i++)
			{
				m_req_arr[i].m_req = false;
			}
			m_next_quad_id = 0;
		}


		~AWEBus();

		// Processes
		void AWEBus_process();


		// Channel Methods
		void b_transaction(int quad_id, accel_cmd_t accel_cmd, int res_pkt_size);


		// Memebers
		bool				m_trans_in_prog;
		accel_cmd_t			m_accel_cmd;
		int					m_res_pkt_size;
		Request				m_req_arr[NUM_QUADS_PER_AWE];
		sc_core::sc_event	m_start_trans;
		sc_core::sc_event	m_trans_complete;
		int					m_quad_id;
		int					m_next_quad_id;

};