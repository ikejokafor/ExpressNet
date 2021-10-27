#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <thread>
#include <random>
#include <algorithm>
#include <functional>
#include <deque>
#include "systemc"
#include "tlm.h"
#include "tlm_utils/peq_with_cb_and_phase.h"
#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "mem_mng.hpp"
#include "cnn_layer_accel_common.hpp"
#include "FPGA_shim.hpp"
#include "AccelConfig.hpp"
#include "InputMaps.hpp"
#include "ResidualMaps.hpp"
#include "KernelBias.hpp"
#include "OutputMaps.hpp"
#include "Kernels.hpp"


SC_MODULE(FAS)
{
    typedef enum
    {
        ST_IDLE             = 0,
        ST_CFG_START_AWP    = 1,
        ST_ACTIVE           = 2,
        ST_WAIT_LAST_WRITE  = 3,
        ST_SEND_COMPLETE    = 4
    } FAS_state_t;


    public:
        // Ports
        sc_core::sc_in<bool>                        clk;
        tlm_utils::simple_initiator_socket<FAS>     rout_init_soc;
        tlm_utils::simple_target_socket<FAS>        rout_tar_soc;
        tlm_utils::simple_initiator_socket<FAS>     sys_mem_init_soc;


        // Constructor
        SC_CTOR(FAS)
            :   clk("clk"),
                m_AWP_complt_arr(MAX_AWP_PER_FAS, false),
                m_QUAD_en_arr(MAX_AWP_PER_FAS, std::vector<bool>(NUM_QUADS_PER_AWP, false)),
                m_num_QUAD_cfgd(MAX_AWP_PER_FAS, 0),
                m_two_cycles_later(2 * CLK_PRD, sc_core::SC_NS),
                m_three_cycles_later(3 * CLK_PRD, sc_core::SC_NS),
                m_four_cycles_later(4 * CLK_PRD, sc_core::SC_NS),
                m_five_cycles_later(5 * CLK_PRD, sc_core::SC_NS)
        {
            rout_tar_soc.register_b_transport(this, &FAS::b_rout_soc_transport);
            SC_THREAD(ctrl_process)
                sensitive << clk.pos();
            SC_THREAD(job_fetch_process)
                sensitive << clk.pos();
            SC_THREAD(partMap_fetch_process)
                sensitive << clk.pos();
            SC_THREAD(resdMap_fetch_process)
                sensitive << clk.pos();
            SC_THREAD(prevMap_fetch_process)
                sensitive << clk.pos();
            SC_THREAD(A_process)
                sensitive << clk.pos();
            SC_THREAD(buffer_update_process)
                sensitive << clk.pos();
            SC_THREAD(adder_tree_start_process)
                sensitive << clk.pos();
            SC_THREAD(adder_tree_done_process)
                sensitive << clk.pos();
				
			// TODO: see if you can consolidate this into one fifo	
            SC_THREAD(resdMap_dwc_fifo_process)
                sensitive << clk.pos();
			SC_THREAD(prevMap_dwc_fifo_process)
                sensitive << clk.pos();
			SC_THREAD(outBuf_dwc_wr_process)
                sensitive << clk.pos();
           
		   SC_THREAD(resdMap_read_process)
                sensitive << clk.pos();
            SC_THREAD(S_process)
                sensitive << clk.pos();

            SC_THREAD(outBuf_wr_process)
                sensitive << clk.pos();

            m_state                         = ST_IDLE;
            m_pixSeqCfgFetchTotal_cfg       = 0;
            m_krnl3x3FetchCount             = 0;
            m_krnl3x3FetchTotal_cfg         = 0;
            m_krnl3x3BiasFetchCount         = 0;
            m_krnl3x3BiasFetchTotal_cfg     = 0;
            m_partMapFetchCount             = 0;
            m_partMapFetchTotal_cfg         = 0;
            m_inMapFetchCount               = 0;
            m_inMapFetchTotal_cfg           = 0;
            m_krnl1x1FetchCount             = 0;
            m_krnl1x1FetchTotal_cfg         = 0;
            m_krnl1x1BiasFetchCount         = 0;
            m_krnl1x1BiasFetchTotal_cfg     = 0;
            m_resdMapFetchCount             = 0;
            m_resdMapFetchTotal_cfg         = 0;
            m_outMapStoreCount              = 0;
            m_outMapStoreTotal_cfg          = 0;
            m_ob_dwc_fifo_sz                = 0;
            m_dpth_count                    = 0;
            m_krnl_count                    = 0;
            m_outBuf_fifo_sz                = 0;
            m_partMap_fifo_sz               = 0;
            m_resdMap_fifo_sz               = 0;
            m_convMap_fifo_sz               = 0;
            m_pixSeqCfgFetchTotal_cfg       = 0;
            m_krnl3x3FetchTotal_cfg         = 0;
            m_krnl3x3BiasFetchTotal_cfg     = 0;
            m_partMapFetchTotal_cfg         = 0;
            m_krnl1x1FetchTotal_cfg         = 0;
            m_krnl1x1BiasFetchTotal_cfg     = 0;
            m_krnl1x1Depth_cfg              = 0;
            m_num_1x1_kernels_cfg           = 0;
            m_resdMapFetchTotal_cfg         = 0;
            m_outMapStoreTotal_cfg          = 0;
            m_inMapFetchAmt_cfg             = 0;
            m_outMapStoreFactor_cfg         = 0;
            m_krnl1x1Addr_cfg               = 0;
            m_krnl1x1BiasAddr_cfg           = 0;
            m_pixelSeqAddr_cfg              = 0;
            m_partMapAddr_cfg               = 0;
            m_resdMapAddr_cfg               = 0;
            m_outMapAddr_cfg                = 0;
            m_co_high_watermark_cfg         = 0;
            m_rm_low_watermark_cfg          = 0;
            m_pm_low_watermark_cfg          = 0;
            m_rm_ftch_vld_total_cfg         = 0;
            m_pm_ftch_vld_total_cfg         = 0;
            m_pv_ftch_vld_total_cfg         = 0;
            m_krnl1x1_pding_cfg             = 0;
            m_krnl1x1_pad_bgn_cfg           = 0;
            m_krnl1x1_pad_end_cfg           = 0;
            m_prevMapFetchCount             = 0;
            m_prevMapFetchTotal_cfg         = 0;
			m_num_output_rows_cfg			= 0;
			m_num_output_cols_cfg			= 0;
			m_output_depth_cfg				= 0;
            m_om_store_vld_total_cfg        = 0;
            m_prevMap_fifo_sz               = 0;
            m_prevMap_dwc_fifo_sz           = 0;
            m_opcode_cfg                    = -1;
            m_last_wrt                      = 0;
            m_last_CO_recvd                 = false;
            m_adder_tree_rdv_count          = 0;
            m_prog_factor                   = 10;
            m_store_trans_no                = 0.0f;
            m_trans_no                      = 0;
            m_last_output                   = false;
            m_num_ob_wr                     = 0;
            m_fd                            = NULL;
        }

        // Destructor
        ~FAS();

        // Processes
        void ctrl_process();
        void job_fetch_process();
        void partMap_fetch_process();
        void prevMap_fetch_process();
        void resdMap_fetch_process();
        void A_process();
        void buffer_update_process();
        void adder_tree_start_process();
        void adder_tree_done_process();
        void resdMap_dwc_fifo_process();
        void resdMap_read_process();
        void prevMap_dwc_fifo_process();
        void S_process();
        void outBuf_dwc_wr_process();
        void outBuf_wr_process();

        // Target Socket Inferface
        void b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);


        // Methods
        void nb_krnl_1x1_bram_rd();
        void nb_result_write(int res_pkt_size);
        void b_cfg_Accel();
        void b_getCfgData();
        void b_cfg1x1Kernels();
        void b_sendQUADCfgs();
        void b_start_QUADs();
        void b_QUAD_config(int AWP_addr, int QUAD_addr);
        void b_QUAD_pix_seq_config(int AWP_addr, int QUAD_addr);
        void b_QUAD_krnl3x3_config(int AWP_addr, int QUAD_addr);
        void b_QUAD_krnl3x3Bias_config(int AWP_addr, int QUAD_addr);
        void b_QUAD_job_start(int AWP_addr, int QUAD_addr);
        void nb_print_cfg();

        // Members
        FAS_cfg*                                m_FAS_cfg                       ;
        mem_mng                                 m_mem_mng                       ;
        sc_core::sc_event                       m_start                         ;
        sc_core::sc_event                       m_start_ack                     ;
        sc_core::sc_event                       m_complete                      ;
        sc_core::sc_event                       m_complete_ack                  ;
        FAS_state_t                             m_state                         ;
        std::vector<bool>                       m_AWP_complt_arr                ;
        std::vector<std::vector<bool>>          m_QUAD_en_arr                   ;
        std::vector<int>                        m_num_QUAD_cfgd                 ;
        int                                     m_FAS_id                        ;
        int                                     m_krnl1x1Depth_cfg              ;
        uint64_t                                m_krnl1x1Addr_cfg               ;
        uint64_t                                m_krnl1x1BiasAddr_cfg           ;
        uint64_t                                m_pixelSeqAddr_cfg              ;
        uint64_t                                m_partMapAddr_cfg               ;
        uint64_t                                m_resdMapAddr_cfg               ;
        uint64_t                                m_outMapAddr_cfg                ;
        int                                     m_pixSeqCfgFetchTotal_cfg       ;
        uint64_t                                m_inMapAddr_cfg                 ;
        uint64_t                                m_krnl3x3Addr_cfg               ;
        uint64_t                                m_krnl3x3BiasAddr_cfg           ;
		uint64_t								m_prevMapAddr_cfg				;
        int                                     m_inMapFetchAmt_cfg             ;
        int                                     m_inMapFetchCount               ;
        int                                     m_inMapFetchTotal_cfg           ;
        int                                     m_convMap_fifo_sz               ;
        int                                     m_krnl3x3FetchCount             ;
        int                                     m_krnl3x3FetchTotal_cfg         ;
        int                                     m_krnl3x3BiasFetchCount         ;
        int                                     m_krnl3x3BiasFetchTotal_cfg     ;
        int                                     m_krnl_1x1_bram_sz              ;
        int                                     m_krnl1x1FetchCount             ;
        int                                     m_krnl1x1FetchTotal_cfg         ;
        int                                     m_krnl_1x1_bias_bram_sz         ;
        int                                     m_krnl1x1BiasFetchCount         ;
        int                                     m_krnl1x1BiasFetchTotal_cfg     ;
        int                                     m_partMap_fifo_sz               ;
        int                                     m_partMapFetchCount             ;
        int                                     m_partMapFetchTotal_cfg         ;
        int                                     m_resdMap_dwc_fifo_sz           ;
        int                                     m_resdMap_fifo_sz               ;
        int                                     m_resdMapFetchCount             ;
        int                                     m_resdMapFetchTotal_cfg         ;
        int                                     m_outBuf_fifo_sz                ;
        int                                     m_outMapStoreCount              ;
        int                                     m_outMapStoreTotal_cfg          ;
        int                                     m_outMapStoreFactor_cfg         ;
        int                                     m_prevMapFetchCount             ;
        int                                     m_prevMapFetchTotal_cfg         ;
        bool                                    m_conv_out_fmt0_cfg             ;
        int                                     m_num_1x1_kernels_cfg           ;
        int                                     m_co_high_watermark_cfg         ;
        int                                     m_rm_low_watermark_cfg          ;
        int                                     m_pm_low_watermark_cfg          ;
        int                                     m_pv_low_watermark_cfg          ;
        int                                     m_rm_ftch_vld_total_cfg         ;   
        int                                     m_pm_ftch_vld_total_cfg         ;
        int                                     m_pv_ftch_vld_total_cfg         ;
        bool                                    m_krnl1x1_pding_cfg             ;
        int                                     m_krnl1x1_pad_bgn_cfg           ;
        int                                     m_krnl1x1_pad_end_cfg           ;
        int                                     m_opcode_cfg                    ;
		int										m_num_output_rows_cfg			;
		int										m_num_output_cols_cfg			;
		int										m_output_depth_cfg				;
        int                                     m_ob_dwc_fifo_sz                ;
        std::deque<tlm::tlm_generic_payload*>   m_trans_fifo                    ;
        bool                                    m_last_wrt                      ;
        bool                                    m_last_CO_recvd                 ;
        int                                     m_dpth_count                    ;
        int                                     m_krnl_count                    ;
        int                                     m_prevMap_fifo_sz               ;
        sc_core::sc_event_queue                 m_outBuf_wr                     ;
        sc_core::sc_event_queue                 m_outBuf_dwc_wr                 ;
        sc_core::sc_event_queue                 m_resdMap_read_valid            ;
        sc_core::sc_event_queue                 m_adder_tree_datain_valid       ;
        sc_core::sc_event_queue                 m_adder_tree_dataout_valid      ;
        sc_core::sc_time                        m_two_cycles_later              ;
        sc_core::sc_time                        m_three_cycles_later            ;
        sc_core::sc_time                        m_four_cycles_later             ;
        sc_core::sc_time                        m_five_cycles_later             ;
        int                                     m_adder_tree_rdv_count          ;
        int                                     m_prevMap_dwc_fifo_sz           ;
        sc_core::sc_event_queue                 m_prevMap_dwc_fifo_wr           ;
        sc_core::sc_event_queue                 m_resdMap_dwc_fifo_wr           ;
        int                                     m_prog_factor                   ;
        sc_core::sc_event_queue                 m_buffer_update                 ;
        int                                     m_res_high_watermark_cfg        ;
        bool                                    m_last_output                   ;
        double                                  m_start_time                    ;
        double                                  m_FAS_time                      ;
        int                                     m_trans_no                      ;
        float                                   m_store_trans_no                ;
        float                                   m_total_store_trans             ;
        uint32_t                                m_im_addr                       ;
        uint32_t                                m_pm_addr                       ;
        uint32_t                                m_pv_addr                       ;
        uint32_t                                m_rm_addr                       ;
        uint32_t                                m_om_addr                       ;
        int                                     m_num_ob_wr                     ;
        int                                     m_om_store_vld_total_cfg        ;
        FILE*                                   m_fd                            ;
};
