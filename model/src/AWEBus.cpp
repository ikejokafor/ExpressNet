#include "AWEBus.hpp"


AWEBus::~AWEBus()
{
	for (int i = 0; i < NUM_QUADS_PER_AWE; i++)
	{
		delete m_req_arr;
	}
}


void AWEBus::AWEBus_process()
{
	while(true)
	{
		wait();
		int num_req = 0;
		for (int i = 0; i < NUM_QUADS_PER_AWE; i++)
		{
			if (m_req_arr[i].m_req)
			{
				num_req++;
			}
		}
		if(num_req > 0 && !m_trans_in_prog)
		{
			for(int i = m_next_quad_id; i < NUM_QUADS_PER_AWE; i++)
			{
				if(m_req_arr[i].m_req)
				{
					m_next_quad_id = (i + 1) % NUM_QUADS_PER_AWE;
					m_trans_in_prog = true;
					m_req_arr[i].m_proceed.notify();
					break;
				} 
				else
				{
					m_next_quad_id = (i + 1) % NUM_QUADS_PER_AWE;
				}
			}
		}
	}
}


void AWEBus::b_transaction(int quad_id, accel_cmd_t accel_cmd, int res_pkt_size)
{
	m_req_arr[quad_id].m_req = true;
	wait(m_req_arr[quad_id].m_proceed);
	wait();
	m_accel_cmd = accel_cmd;
	m_res_pkt_size = res_pkt_size;
	m_quad_id = quad_id;
	m_start_trans.notify();
	wait(m_trans_complete);
	wait();
	m_trans_in_prog = false;
	m_req_arr[quad_id].m_req = false;
}