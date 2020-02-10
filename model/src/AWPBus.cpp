#include "AWPBus.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;


AWPBus::~AWPBus()
{

}


void AWPBus::AWPBus_process()
{
	while(true)
	{
		wait();
		int num_req = 0;
		for (int i = 0; i < NUM_QUADS_PER_AWP; i++)
		{
			if (m_req_arr[i].m_req)
			{
				num_req++;
			}
		}
		if(num_req > 0 && m_num_trans_in_prog < MAX_TRANS_IN_PROG)
		{
			for(int i = m_next_quad_id; i < NUM_QUADS_PER_AWP; i++)
			{
				if(m_req_arr[i].m_req)
				{
					m_next_quad_id = (i + 1) % NUM_QUADS_PER_AWP;
					m_num_trans_in_prog++;
					m_req_arr[i].m_proceed.notify();
					break;
				} 
				else
				{
					m_next_quad_id = (i + 1) % NUM_QUADS_PER_AWP;
				}
			}
		}
	}
}


void AWPBus::b_transaction(int FAS_id, int quad_id, accel_cmd_t accel_cmd, int res_pkt_size)
{
	m_accel_cmd = accel_cmd;
	m_res_pkt_size = res_pkt_size;
	m_quad_id = quad_id;
	m_FAS_id = FAS_id;
	if(accel_cmd == ACCL_CMD_JOB_COMPLETE)
	{
		m_QUAD_complt_list.push_back(true);
		wait();
		if(m_QUAD_complt_list.size() == m_num_QUADs_cfgd)
		{
			m_QUAD_complt_list.clear();
			m_start_trans.notify();
		}
	}
	else
	{
		m_req_arr[quad_id].m_req = true;
		wait(m_req_arr[quad_id].m_proceed);
		wait();
		m_start_trans.notify();
		wait(m_trans_complete);
		wait();
		m_num_trans_in_prog--;
		m_req_arr[quad_id].m_req = false;
	}
}