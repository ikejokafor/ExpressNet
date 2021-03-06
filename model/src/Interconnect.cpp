#include "Interconnect.hpp"
using namespace sc_core;
using namespace sc_dt;
using namespace std;
using namespace tlm;
using namespace tlm_utils;


void Interconnect::run()
{
#ifdef SIMULATE_NOC_LATENCY
    sc_time delay;
    tlm_generic_payload* trans;
    while(true)
    {
        wait();
        if(m_trans_fifo.size() > 0)
        {
            trans = m_trans_fifo.front();
            m_trans_fifo.pop_front();
            wait();
            init_soc[trans->get_address()]->b_transport(*trans, delay);
            trans->release();
        }
    }
#endif
}


void Interconnect::b_transport(int id, tlm_generic_payload& trans, sc_core::sc_time& delay)
{
#ifdef SIMULATE_NOC_LATENCY
    while(true)
    {
        wait(clk.posedge_event());
        if(m_trans_fifo.size() < MAX_NETWORK_TRANS)
        {
            trans.acquire();
            m_trans_fifo.push_back(&trans);
            break;
        }
    }
#else
    init_soc[trans.get_address()]->b_transport(trans, delay);
#endif
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
