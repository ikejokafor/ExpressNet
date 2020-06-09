#pragma once


#define SC_INCLUDE_DYNAMIC_PROCESSES


#include <vector>
#include <deque>
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
                m_sys_mem_bus_sema(MAX_FAS_SYS_MEM_TRANS),
                m_QUAD_en_arr(MAX_AWP_PER_FAS, std::vector<bool>(NUM_QUADS_PER_AWP, false)),
                m_num_QUAD_cfgd(MAX_AWP_PER_FAS, 0),
                m_inMapDepthFetchAmt(MAX_AWP_PER_FAS, std::vector<int>(NUM_QUADS_PER_AWP, 0)),
                m_two_cycles_later(2 * CLK_PRD, sc_core::SC_NS),
                m_three_cycles_later(3 * CLK_PRD, sc_core::SC_NS),
                m_four_cycles_later(4 * CLK_PRD, sc_core::SC_NS),
                m_adder_tree_lat((log2(KERNEL_1x1_DEPTH_SIMD) + 1) * CLK_PRD, sc_core::SC_NS),
                m_adder_tree_bias_lat((log2(KERNEL_1x1_DEPTH_SIMD) + 1) * CLK_PRD, sc_core::SC_NS)

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
            SC_THREAD(A_process)
                sensitive << clk.pos();
            SC_THREAD(krnl_1x1_bram_rd_process)
                sensitive << clk.pos();
            SC_THREAD(adder_tree_start_process)
                sensitive << clk.pos();
            SC_THREAD(adder_tree_done_process)
                sensitive << clk.pos();
            SC_THREAD(resdMap_read_process)
                sensitive << clk.pos();
            SC_THREAD(S_process)
                sensitive << clk.pos();
            SC_THREAD(outBuf_dwc_wr_process)
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
            m_resMapFetchCount              = 0;
            m_resMapFetchTotal_cfg          = 0;
            m_outMapStoreCount              = 0;
            m_outMapStoreTotal_cfg          = 0;
            m_ob_dwc                        = 0;
            m_pm_dwc                        = 0;
            m_dpth_count                    = 0;
            m_krnl_count                    = 0;
            m_outBuf_fifo_sz                = 0;
            m_partMap_bram_sz               = 0;
            m_resdMap_bram_sz               = 0;
            m_convMap_bram_sz               = 0;
            m_first_depth_iter_cfg          = 0;
            m_do_resLayer_cfg               = 0;
            m_do_kernels1x1_cfg             = 0;
            m_pixSeqCfgFetchTotal_cfg       = 0;
            m_inMapFetchTotal_cfg           = 0;
            m_krnl3x3FetchTotal_cfg         = 0;
            m_krnl3x3BiasFetchTotal_cfg     = 0;
            m_partMapFetchTotal_cfg         = 0;
            m_krnl1x1FetchTotal_cfg         = 0;
            m_krnl1x1BiasFetchTotal_cfg     = 0;
            m_krnl1x1Depth_cfg              = 0;
            m_num_1x1_kernels_cfg           = 0;
            m_resMapFetchTotal_cfg          = 0;
            m_outMapStoreTotal_cfg          = 0;
            m_inMapFetchFactor_cfg          = 0;
            m_outMapStoreFactor_cfg         = 0;
            m_krnl1x1Addr_cfg               = 0;
            m_krnl1x1BiasAddr_cfg           = 0;
            m_pixelSeqAddr_cfg              = 0;
            m_partMapAddr_cfg               = 0;
            m_resMapAddr_cfg                = 0;
            m_outMapAddr_cfg                = 0;
            m_co_high_watermark_cfg         = 0;
            m_rm_low_watermark_cfg          = 0;
            m_pm_low_watermark_cfg          = 0;
            m_krnl1x1_pding_cfg             = 0;
            m_krnl1x1_pad_bgn_cfg           = 0;
            m_krnl1x1_pad_end_cfg           = 0;
            m_krnl_1x1_layer_cfg            = 0;
            m_prev1x1MapFetchCount          = 0;
            m_prev1x1MapFetchTotal_cfg      = 0;
            m_prevMap_fifo_sz               = 0;
            m_prevMap_dwc_fifo_sz           = 0;
            m_opcode0_cfg                   = 0;
            m_opcode1_cfg                   = 0;
            m_opcode2_cfg                   = 0;
            m_opcode3_cfg                   = 0;
            m_opcode4_cfg                   = 0;
            m_opcode5_cfg                   = 0;
            m_opcode6_cfg                   = 0;
            m_opcode7_cfg                   = 0;
            m_opcode8_cfg                   = 0;
            m_opcode9_cfg                   = 0;
            m_opcode10_cfg                  = 0;
            m_opcode11_cfg                  = 0;
            m_opcode12_cfg                  = 0;
            m_opcode13_cfg                  = 0;
            m_opcode14_cfg                  = 0;
            m_opcode15_cfg                  = 0;
            m_last_wrt                      = 0;
            m_last_CO_recvd                 = 0;
            m_adder_tree_rdv_count          = 0;
        }

        // Destructor
        ~FAS();

        // Processes
        void ctrl_process();
        void job_fetch_process();
        void partMap_fetch_process();
        void prev1x1Map_fetch_process();
        void resdMap_fetch_process();
        void A_process();
        void krnl_1x1_bram_rd_process();
        void adder_tree_start_process();
        void adder_tree_done_process();
        void resdMap_read_process();
        void S_process();
        void outBuf_dwc_wr_process();
        void outBuf_wr_process();

        // Target Socket Inferface
        void b_rout_soc_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);


        // Methods
        void buffer_update();
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
        uint64_t                                m_resMapAddr_cfg                ;
        uint64_t                                m_outMapAddr_cfg                ;
        int                                     m_pixSeqCfgFetchTotal_cfg       ;
        std::vector<std::vector<uint64_t>>      m_inMapAddrArr                  ;
        std::vector<std::vector<uint64_t>>      m_krnl3x3AddrArr                ;
        std::vector<std::vector<uint64_t>>      m_krnl3x3BiasAddrArr            ;
        std::vector<std::vector<int>>           m_inMapDepthFetchAmt            ;
        int                                     m_inMapFetchFactor_cfg          ;
        int                                     m_inMapFetchCount               ;
        int                                     m_inMapFetchTotal_cfg           ;
        int                                     m_convMap_bram_sz               ;
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
        int                                     m_partMap_bram_sz               ;
        int                                     m_partMapFetchCount             ;
        int                                     m_partMapFetchTotal_cfg         ;
        int                                     m_resMap_dwc_fifo_sz            ;
        int                                     m_resdMap_bram_sz               ;
        int                                     m_resMapFetchCount              ;
        int                                     m_resMapFetchTotal_cfg          ;
        int                                     m_outBuf_fifo_sz                ;
        int                                     m_outMapStoreCount              ;
        int                                     m_outMapStoreTotal_cfg          ;
        int                                     m_outMapStoreFactor_cfg         ;
        int                                     m_prev1x1MapFetchCount          ;
        int                                     m_prev1x1MapFetchTotal_cfg      ;
        bool                                    m_first_depth_iter_cfg          ;
        bool                                    m_last_depth_iter_cfg           ;
        bool                                    m_first_krnl_iter_cfg           ;
        bool                                    m_conv_out_fmt0_cfg             ;
        bool                                    m_do_resLayer_cfg              ;
        bool                                    m_do_kernels1x1_cfg             ;
        int                                     m_num_1x1_kernels_cfg           ;
        int                                     m_co_high_watermark_cfg         ;
        int                                     m_rm_low_watermark_cfg          ;
        int                                     m_pm_low_watermark_cfg          ;
        int                                     m_pv_low_watermark_cfg          ;
        bool                                    m_krnl_1x1_layer_cfg            ;
        bool                                    m_krnl1x1_pding_cfg             ;
        int                                     m_krnl1x1_pad_bgn_cfg           ;
        int                                     m_krnl1x1_pad_end_cfg           ;
        bool                                    m_num_depth_iter_gt_1_cfg       ;
        bool                                    m_do_1x1_res_cfg                ;
        bool                                    m_do_res_1x1_cfg                ;
        bool                                    m_opcode0_cfg                   ;
        bool                                    m_opcode1_cfg                   ;
        bool                                    m_opcode2_cfg                   ;
        bool                                    m_opcode3_cfg                   ;
        bool                                    m_opcode4_cfg                   ;
        bool                                    m_opcode5_cfg                   ;
        bool                                    m_opcode6_cfg                   ;
        bool                                    m_opcode7_cfg                   ;
        bool                                    m_opcode8_cfg                   ;
        bool                                    m_opcode9_cfg                   ;
        bool                                    m_opcode10_cfg                  ;
        bool                                    m_opcode11_cfg                  ;
        bool                                    m_opcode12_cfg                  ;
        bool                                    m_opcode13_cfg                  ;
        bool                                    m_opcode14_cfg                  ;
        bool                                    m_opcode15_cfg                  ;
        int                                     m_ob_dwc                        ;
        int                                     m_pm_dwc                        ;
        sc_core::sc_event                       m_job_fetch                     ;
        Accel_Trans                             m_job_fetch_trans               ;
        sc_core::sc_semaphore                   m_sys_mem_bus_sema              ;
        std::deque<tlm::tlm_generic_payload*>   m_trans_fifo                    ;
        bool                                    m_last_wrt                      ;
        bool                                    m_last_CO_recvd                 ;
        int                                     m_dpth_count                    ;
        int                                     m_krnl_count                    ;
        int                                     m_prev1x1Map_fifo_sz            ;
        sc_core::sc_event_queue                 m_outBuf_wr                     ;
        sc_core::sc_event_queue                 m_outBuf_dwc_wr                 ;
        sc_core::sc_event_queue                 m_partMap_dwc_wr                ;
        sc_core::sc_event_queue                 m_resMap_dwc_wr                 ;
        sc_core::sc_event_queue                 m_krnl_1x1_read_valid           ;
        sc_core::sc_event_queue                 m_resdMap_read_valid            ;
        sc_core::sc_time                        m_two_cycles_later              ;
        sc_core::sc_event_queue                 m_adder_tree_datain_valid       ;
        sc_core::sc_event_queue                 m_adder_tree_dataout_valid      ;
        sc_core::sc_time                        m_three_cycles_later            ;
        sc_core::sc_time                        m_four_cycles_later             ;
        sc_core::sc_time                        m_adder_tree_lat                ;
        sc_core::sc_time                        m_adder_tree_bias_lat           ;
        int                                     m_adder_tree_rdv_count          ;
        int                                     m_prevMap_fifo_sz               ;
        int                                     m_prevMap_dwc_fifo_sz           ;
};
