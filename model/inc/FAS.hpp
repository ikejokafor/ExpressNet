#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <queue>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mm.hpp"
#include "common.hpp"


SC_MODULE(FAS)
{
	typedef enum
	{
		ST_IDLE				= 0,
		ST_CFG_START_AWP	= 1,
		ST_ACTIVE			= 2,
		ST_SEND_COMPLETE	= 3
	} FAS_state_t;

	public:
		// Ports
		sc_core::sc_in<bool>						clk_if;
		sc_core::sc_in<bool>						clk_core;
		tlm_utils::simple_initiator_socket<FAS>		rout_init_soc;
		tlm_utils::simple_target_socket<FAS>		rout_tar_soc;
		tlm_utils::simple_initiator_socket<FAS>		sys_mem_init_soc;
		tlm_utils::simple_target_socket<FAS>		sys_mem_tar_soc;

		// Constructor
		SC_CTOR(FAS)
			:	clk_if("clk_if"),
				clk_core("clk_core"),
				m_AWP_complt_arr(MAX_AWP_PER_FAS, false),
				m_partMap_fifo(PARTMAP_FIFO_SIZE),
				m_inMap_fifo(INMAP_FIFO_SIZE),
				m_krnl_1x1_fifo(KRNL_1X1_FIFO_SIZE),
				m_outBuf_fifo(OUTBUF_FIFO_SIZE)
		{
			rout_tar_soc.register_b_transport(this, &FAS::b_rout_soc_transport);
			sys_mem_tar_soc.register_b_transport(this, &FAS::b_mem_soc_transport);
			SC_THREAD(ctrl_process);
				sensitive << clk_if.pos();
			SC_THREAD(F_process)
				sensitive << clk_if.pos();
			SC_THREAD(A_process)
				sensitive << clk_if.pos();
			SC_THREAD(outBuf_wr_process)
				sensitive << clk_if.pos();
			SC_THREAD(S_process)
				sensitive << clk_if.pos();
			SC_THREAD(result_process)
				sensitive << clk_if.pos();
			SC_THREAD(job_fetch_process)
				sensitive << clk_if.pos();
			
			m_FAS_id = atoi(&std::string(name())[std::string(name()).length() - 1]); 
			m_state = ST_IDLE;
		}

		// Destructor
		~FAS();

		// Processes
		void ctrl_process();
		void F_process();
		void A_process();
		void outBuf_wr_process();
		void S_process();
		void result_process();
		void job_fetch_process();

		// Target Socket Inferface
		void b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
		void b_mem_soc_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
		
		// Methods
		void b_cfg_FAS(std::vector<bool> AWP_list, std::vector<std::vector<bool>> AWP_cfg_QUAD_list, std::vector<int> num_AWP_QUAD_cfgd, bool first_iter_cfg, int num_1x1_kernels);
		void b_cfg_start_AWPs();

		// Members
		mm								m_mm;
		sc_core::sc_event				m_start;
		sc_core::sc_event				m_start_ack;
		sc_core::sc_event				m_complete;
		sc_core::sc_event				m_complete_ack;
		FAS_state_t						m_state;
		std::vector<bool>				m_AWP_complt_arr;
		accel_trans_t*					m_accel_trans_arr;
		std::vector<bool>				m_AWP_arr;
		std::vector<std::vector<bool>>	m_AWP_cfg_QUAD_arr;
		std::vector<int>				m_AWP_num_QUAD_cfgd;
		int								m_FAS_id;
		sc_core::sc_fifo<int>			m_partMap_fifo;
		sc_core::sc_fifo<int>			m_inMap_fifo;
		sc_core::sc_fifo<int>			m_krnl_1x1_fifo;
		sc_core::sc_fifo<int>			m_outBuf_fifo;
		bool							m_first_iter_cfg;
		bool							m_conv_out_fmt0_cfg;
	    int								m_res_pkt_size;
		sc_core::sc_event				m_result_in;
		sc_core::sc_event				m_job_fetch;
		accel_trans_t					m_job_fetch_trans;
		sc_core::sc_event				m_wr_outBuf;		
};
