#include "AWP.hpp"
using namespace std;
using namespace sc_core;
using namespace sc_dt;
using namespace tlm;
using namespace tlm_utils;


AWPBus::~AWPBus()
{

}


void AWPBus::b_request(int QUAD_id, accel_cmd_t accel_cmd, int res_pkt_size)
{
	if (accel_cmd == ACCL_CMD_JOB_COMPLETE)
	{
		m_QUAD_complt_arr[QUAD_id] = true;
	}
	else
	{
		int req_id = (accel_cmd == ACCL_CMD_JOB_FETCH) ? 0 : 1;
		int reqArrIdx = index2D(NUM_QUADS_PER_AWP, req_id, QUAD_id);
		m_req_arr[reqArrIdx].QUAD_id = QUAD_id;
		m_req_arr[reqArrIdx].accel_cmd = accel_cmd;
		m_req_arr[reqArrIdx].res_pkt_size = res_pkt_size;
		m_req_arr[reqArrIdx].req_pending = true;	
		wait(m_req_arr[reqArrIdx].ack);
		wait(clk.posedge_event());
		m_req_arr[reqArrIdx].req_pending = false;
		b_transaction(reqArrIdx);		
	}
}


void AWPBus::b_transaction(int idx)
{
	sc_time delay;
	tlm_command tlm_cmd = (m_req_arr[idx].accel_cmd == ACCL_CMD_JOB_FETCH) ? TLM_READ_COMMAND
						: (m_req_arr[idx].accel_cmd == ACCL_CMD_RESULT_WRITE) ? TLM_WRITE_COMMAND
						: TLM_IGNORE_COMMAND;
	Accel_Trans* accel_trans = new Accel_Trans();
	accel_trans->AWP_id = m_AWP_id;
	accel_trans->FAS_id = m_FAS_id;
	accel_trans->QUAD_id = m_req_arr[idx].QUAD_id;
	accel_trans->accel_cmd = m_req_arr[idx].accel_cmd;
	accel_trans->res_pkt_size = m_req_arr[idx].res_pkt_size;
	tlm_generic_payload* trans = nb_createTLMTrans(
		m_mem_mng,
		m_FAS_id,
		tlm_cmd,
		(unsigned char*)accel_trans,
		m_req_arr[idx].res_pkt_size,
		0,
		nullptr,
		false,
		TLM_INCOMPLETE_RESPONSE
	);
	wait(clk->posedge_event());
	init_soc->b_transport(*trans, delay);
	trans->release();
}