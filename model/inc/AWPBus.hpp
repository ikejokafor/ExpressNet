#pragma once


#include "systemc"
#include "common.hpp"
#include "AWP_if.hpp"





class AWPBus : public sc_core::sc_module, public AWP_if
{
	public:
		sc_core::sc_in<bool> clk;

		SC_CTOR(AWPBus)
		{
			for(int i = 0; i < NUM_QUADS_PER_AWP; i++)
			{
				m_QUAD_complt_arr.push_back(false);
			}
		}

		~AWPBus();

		// Channel Methods
		void b_transaction(int QUAD_id, accel_cmd_t accel_cmd, int res_pkt_size);


		// Memebers
		Accel_Trans			m_req_arr[MAX_AWP_TRANS];	
		std::vector<bool>	m_QUAD_complt_arr;
};