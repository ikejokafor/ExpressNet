#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <queue>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mem_mng.hpp"
#include "cnn_layer_accel_common.hpp"
#include "fixedPoint.hpp"
#include "FPGA_shim.hpp"
#include "AccelConfig.hpp"
#include "InputMaps.hpp"
#include "PartialMaps.hpp"
#include "ResidualMaps.hpp"
#include "Bias.hpp"
#include "OutputMaps.hpp"
#include "Kernels.hpp"


SC_MODULE(FAS)
{
	typedef enum
	{
		ST_IDLE				= 0,
		ST_CFG_START_AWP	= 1,
		ST_ACTIVE			= 2,
		ST_SEND_COMPLETE	= 3
	} FAS_state_t;
	

	typedef enum
	{
		PARTMAP_FIFO		= 0,
		INMAP_FIFO			= 1,
		KRNL_1X1_FIFO		= 2,
		RESMAP_FIFO			= 3,
		OUTBUF_FIFO			= 4
	} fifo_sel_t;
	

	typedef enum
	{
		FIFO_READ	= 0,
		FIFO_WRITE	= 1
	} fifo_cmd_t;


	public:
		// Ports
		sc_core::sc_in<bool>						clk;
		tlm_utils::simple_initiator_socket<FAS>		rout_init_soc;
		tlm_utils::simple_target_socket<FAS>		rout_tar_soc;
		tlm_utils::simple_initiator_socket<FAS>		sys_mem_init_soc;


		// Constructor
		SC_CTOR(FAS)
			:	clk("clk"),
				m_AWP_complt_arr(MAX_AWP_PER_FAS, false),
				m_partMap_fifo(PM_FIFO_SIZE),
				m_inMap_fifo(IM_FIFO_SIZE),
				m_resMap_fifo(RSM_FIFO_SIZE),
				m_krnl_1x1_fifo(KRNL_1X1_FIFO_SIZE),
				m_outBuf_fifo(OB_FIFO_SIZE),
				m_sys_mem_bus_sema(MAX_FAS_SYS_MEM_TRNS),
				m_trans_fifo(MAX_AWP_PER_FAS * NUM_QUADS_PER_AWP)
		{
			m_FAS_id = atoi(&std::string(name())[std::string(name()).length() - 1]); 

			rout_tar_soc.register_b_transport(this, &FAS::b_rout_soc_transport);
			SC_THREAD(ctrl_process);
				sensitive << clk.pos();
			SC_THREAD(F_process)
				sensitive << clk.pos();
			SC_THREAD(A_process)
				sensitive << clk.pos();
			SC_THREAD(outBuf_wr_process)
				sensitive << clk.pos();
			SC_THREAD(S_process)
				sensitive << clk.pos();
			SC_THREAD(job_fetch_process)
				sensitive << clk.pos();
			
			m_state					= ST_IDLE;
			m_partMapFetchCount		= 0;
			m_partMapFetchTotal		= 0;
			m_inMapFetchCount		= 0;
			m_inMapFetchTotal		= 0;
			m_krnl1x1FetchCount		= 0;
			m_resMapFetchCount		= 0;
			m_resMapFetchTotal		= 0;

			m_accelCfg = new AccelConfig();
		}

		// Destructor
		~FAS();

		// Processes
		void ctrl_process();
		void F_process();
		void A_process();
		void outBuf_wr_process();
		void S_process();
		void resMap_fetch_process();
		void job_fetch_process();

		// Target Socket Inferface
		void b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
		
		// Methods
		void nb_result_write();
		void nb_fifo_trans(sc_core::sc_fifo<int>& fifo, fifo_cmd_t fifo_cmd, int fifo_trans_size, int fifo_trans_width);
		void nb_fifo_trans(fifo_sel_t fifo_sel, fifo_cmd_t fifo_cmd, int fifo_trans_size, int fifo_trans_width);
		void b_cfg_Accel();
		void b_getCfgData();
		void b_cfg1x1Kernels();
		void b_sendCfgs();
		void b_QUAD_config(int AWP_addr, int QUAD_addr);
		void b_QUAD_pix_seq_config(int AWP_addr, int QUAD_addr);
		void b_QUAD_krnl_config(int AWP_addr, int QUAD_addr);
		void b_QUAD_job_start(int AWP_addr, int QUAD_addr);
	
		// Members
		std::vector<uint64_t>			m_memory				;
		AccelConfig* 					m_accelCfg				;
		mem_mng							m_mem_mng               ;
		sc_core::sc_event				m_start                 ;
		sc_core::sc_event				m_start_ack             ;
		sc_core::sc_event				m_complete              ;
		sc_core::sc_event				m_complete_ack          ;
		FAS_state_t						m_state                 ;
		std::vector<bool>				m_AWP_complt_arr        ;
		std::vector<bool>				m_AWP_en_arr            ;
		std::vector<std::vector<bool>>	m_QUAD_en_arr       	;
		std::vector<int>				m_num_QUAD_cfgd     	;
		int								m_FAS_id                ;
		sc_core::sc_fifo<int>			m_partMap_fifo          ;
		int								m_partMapFetchCount		;
		int								m_partMapFetchTotal     ;
		sc_core::sc_fifo<int>			m_inMap_fifo            ;
		int								m_inMapFetchCount		;
		int								m_inMapFetchTotal       ;
		sc_core::sc_fifo<int>			m_krnl_1x1_fifo         ;
		int								m_krnl1x1FetchCount		;
		int								m_krnl1x1FetchTotal     ;
		sc_core::sc_fifo<int>			m_resMap_fifo           ;
		int								m_resMapFetchCount		;
		int								m_resMapFetchTotal      ;
		sc_core::sc_fifo<int>			m_outBuf_fifo           ;
		bool							m_first_depth_iter_cfg  ;
		bool							m_last_depth_iter_cfg   ;
		bool							m_conv_out_fmt0_cfg     ;
	    int								m_res_pkt_size          ;
		bool							m_do_res_layer_cfg      ;
		bool							m_do_kernel1x1_cfg		;
		int								m_process_count         ;
		sc_core::sc_event				m_job_fetch             ;
		Accel_Trans 					m_job_fetch_trans       ;
		sc_core::sc_event				m_wr_outBuf	            ;
		sc_core::sc_semaphore			m_sys_mem_bus_sema      ;
		sc_core::sc_fifo<tlm::tlm_generic_payload*> m_trans_fifo;
};
