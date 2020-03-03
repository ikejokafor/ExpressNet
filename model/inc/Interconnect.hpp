#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/multi_passthrough_initiator_socket.h"
#include "tlm_utils/multi_passthrough_target_socket.h"
#include "common.hpp"


SC_MODULE(Interconnect)
{
	class TransNode
	{
		public:
			TransNode() {}
			tlm::tlm_generic_payload* trans;
			sc_core::sc_time delay;
	};
	
	
	sc_core::sc_in<bool> clk;
	tlm_utils::multi_passthrough_target_socket<Interconnect>    tar_soc;
	tlm_utils::multi_passthrough_initiator_socket<Interconnect> init_soc;

	SC_CTOR(Interconnect)
		:	tar_soc("target_socket"),
			init_soc("init_socket"),
			m_trans_fifo(MAX_NETWORK_TRANS)
	{
		tar_soc.register_b_transport(this, &Interconnect::b_transport);
		tar_soc.register_nb_transport_fw(this, &Interconnect::nb_transport_fw);
		tar_soc.register_get_direct_mem_ptr(this, &Interconnect::get_direct_mem_ptr);
		tar_soc.register_transport_dbg(this, &Interconnect::transport_dbg);
		init_soc.register_nb_transport_bw(this, &Interconnect::nb_transport_bw);
		init_soc.register_invalidate_direct_mem_ptr(this, &Interconnect::invalidate_direct_mem_ptr);
		
		SC_THREAD(run)
			sensitive << clk.pos();
	}

	// Process
	void run();

	// Forward interface
	virtual void b_transport(int id, tlm::tlm_generic_payload & trans, sc_core::sc_time & delay);
	virtual tlm::tlm_sync_enum nb_transport_fw(int id, tlm::tlm_generic_payload & trans, tlm::tlm_phase & phase, sc_core::sc_time & delay);
	virtual bool get_direct_mem_ptr(int id, tlm::tlm_generic_payload & trans, tlm::tlm_dmi & dmi_data);
	virtual unsigned int transport_dbg(int id, tlm::tlm_generic_payload & trans);

	// Backward interface
	virtual tlm::tlm_sync_enum nb_transport_bw(int id, tlm::tlm_generic_payload & trans, tlm::tlm_phase & phase, sc_core::sc_time & delay);
	virtual void invalidate_direct_mem_ptr(int id, sc_dt::uint64 start_range, sc_dt::uint64 end_range);
	
	sc_core::sc_fifo<tlm::tlm_generic_payload*> m_trans_fifo;
};
