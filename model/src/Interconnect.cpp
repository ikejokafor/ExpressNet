#include "Interconnect.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


void Interconnect::b_transport(int id, tlm::tlm_generic_payload & trans, sc_core::sc_time & delay)
{
	init_soc[trans.get_address()]->b_transport(trans, delay);
}


tlm::tlm_sync_enum Interconnect::nb_transport_fw(int id, tlm::tlm_generic_payload & trans, tlm::tlm_phase & phase, sc_core::sc_time & delay)
{
	return init_soc[id]->nb_transport_fw(trans, phase, delay);
}


bool Interconnect::get_direct_mem_ptr(int id, tlm::tlm_generic_payload & trans, tlm::tlm_dmi & dmi_data)
{
	return init_soc[id]->get_direct_mem_ptr(trans, dmi_data);
}


unsigned int Interconnect::transport_dbg(int id, tlm::tlm_generic_payload & trans)
{
	return init_soc[id]->transport_dbg(trans);
}


tlm::tlm_sync_enum Interconnect::nb_transport_bw(int id, tlm::tlm_generic_payload & trans, tlm::tlm_phase & phase, sc_core::sc_time & delay)
{
	return tar_soc[id]->nb_transport_bw(trans, phase, delay);
}


void Interconnect::invalidate_direct_mem_ptr(int id, sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{
	tar_soc[id]->invalidate_direct_mem_ptr(start_range, end_range);
}
