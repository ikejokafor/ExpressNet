#include "AWPBus.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;


AWPBus::~AWPBus()
{

}


void AWPBus::b_transaction(int QUAD_id, accel_cmd_t accel_cmd, int res_pkt_size)
{
	int req_id = (accel_cmd == ACCL_CMD_JOB_FETCH) ? 0 : 1;
	int reqArrIdx = index2D(NUM_QUADS_PER_AWP, req_id, QUAD_id);
	m_req_arr[reqArrIdx].QUAD_id = QUAD_id;
	m_req_arr[reqArrIdx].accel_cmd = accel_cmd;
	m_req_arr[reqArrIdx].res_pkt_size = res_pkt_size;
	m_req_arr[reqArrIdx].req_pending = true;
	if(accel_cmd == ACCL_CMD_JOB_COMPLETE)
	{
		m_QUAD_complt_arr[QUAD_id] = true;
	}
	else
	{
		wait(m_req_arr[reqArrIdx].ack);
		m_req_arr[QUAD_id].req_pending = false;
		wait(m_req_arr[reqArrIdx].finished);
		wait();
	}
}