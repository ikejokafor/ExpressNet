#include "Interconnect.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


void Interconnect::run()
{
	sc_time delay;
	tlm_generic_payload* trans;
	while(true)
	{
		wait();
		if(m_trans_fifo.num_available() > 0)
		{
			m_trans_fifo.nb_read(trans);
			Accel_Trans* accel_trans = (Accel_Trans*)trans->get_data_ptr();
			// string str = "Sending " + to_string(trans->get_data_length()) + " " + to_string(accel_trans->accel_cmd) + " " + to_string(accel_trans->QUAD_id) + " " + sc_time_stamp().to_string() + '\n';
			// cout << str;
			wait();
			init_soc[trans->get_address()]->b_transport(*trans, delay);
			trans->release();
		}
	}
}


void Interconnect::b_transport(int id, tlm_generic_payload & trans, sc_core::sc_time & delay)
{
	while(true)
	{
		wait(clk.posedge_event());
		if(m_trans_fifo.num_free() > 0)
		{
			trans.acquire();
			m_trans_fifo.nb_write(&trans);
			Accel_Trans* accel_trans = (Accel_Trans*)trans.get_data_ptr();
			// string str = "Recieved " + to_string(trans.get_data_length()) + " " + to_string(accel_trans->accel_cmd) + " " + to_string(accel_trans->QUAD_id) + " " + sc_time_stamp().to_string() + '\n';
			// cout << str;
			break;
		}
	}
}


tlm_sync_enum Interconnect::nb_transport_fw(int id, tlm_generic_payload & trans, tlm_phase & phase, sc_core::sc_time & delay)
{
	return init_soc[id]->nb_transport_fw(trans, phase, delay);
}


bool Interconnect::get_direct_mem_ptr(int id, tlm_generic_payload & trans, tlm_dmi & dmi_data)
{
	return init_soc[id]->get_direct_mem_ptr(trans, dmi_data);
}


unsigned int Interconnect::transport_dbg(int id, tlm_generic_payload & trans)
{
	return init_soc[id]->transport_dbg(trans);
}


tlm_sync_enum Interconnect::nb_transport_bw(int id, tlm_generic_payload & trans, tlm_phase & phase, sc_core::sc_time & delay)
{
	return tar_soc[id]->nb_transport_bw(trans, phase, delay);
}


void Interconnect::invalidate_direct_mem_ptr(int id, sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{
	tar_soc[id]->invalidate_direct_mem_ptr(start_range, end_range);
}
