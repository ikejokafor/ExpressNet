#pragma once


#include <deque>
#include <string>
#include "systemc"
#include <csignal>
#include <cstring>
#include <vector>
#include <thread>
#include <random>
#include <algorithm>
#include <functional>
#include "cnn_layer_accel_common.hpp"
#include "AWP_if.hpp"


SC_MODULE(QUAD)
{
    typedef enum
    {
        ST_IDLE					= 0,
        ST_PRIM_BUFFER			= 1,
        ST_WAIT_PFB_LOAD		= 2,
        ST_ACTIVE				= 3,
        ST_WAIT_LAST_RES_WRITE	= 4,
        ST_SEND_COMPLETE		= 5
    } QUAD_state_t;

    public:
        // Ports
        sc_core::sc_in<bool>		clk;
        sc_core::sc_port<AWP_if>	bus;

        // Constructor
        SC_CTOR(QUAD)
            :	clk("clk"),
                bus("bus")
        {
            SC_THREAD(ctrl_process_0);
                sensitive << clk.pos();
            SC_THREAD(ctrl_process_1);
                sensitive << clk.pos();
            SC_THREAD(result_write_process);
                sensitive << clk.pos();
            // SC_THREAD(conv_process)
            //     sensitive << clk.pos();

            m_state             = ST_IDLE;
            m_pfb_count         = 0;
            m_krnl_count        = 0;
            m_input_row         = 0;
            m_output_col        = 0;
            m_output_row        = 0;
            m_stride_count      = 0;
            m_res_fifo_sz       = 0;
            m_num_outputs       = 0;
            m_output_count      = 0;
            m_processing        = false;
            m_last_res_wrtn     = false;
        }

        // Destructor
        ~QUAD();

        // Processes
        void ctrl_process_0();
        void ctrl_process_1();
        // void conv_process();
        void result_write_process();

        // Methods
        void b_cfg_write(unsigned char* data);
        void print_cfg();
        void b_pxSeqCfg_write();
        void b_krnl3x3Cfg_write();
        void b_krnl3x3BiasCfg_write();
        bool nb_job_start();
        void b_job_fetch();
        void b_pfb_write();
        void b_pfb_read();


        // Module Variables
        QUAD_state_t			    m_state						;
        QUAD_state_t			    m_return_state				;
        uint64_t				    m_ex_start_time				;
        int						    m_pfb_count					;
        int						    m_krnl_count				;
        int						    m_input_row					;
        int						    m_input_col					;
        int						    m_output_col				;
        int						    m_output_row				;
        int                         m_res_high_watermark_cfg    ;
        int						    m_num_output_cols_cfg		;
        int						    m_num_output_rows_cfg		;
        int                         m_output_depth_cfg          ;
        int						    m_num_3x3_kernels_cfg		;
        int                         m_kernel3x3Depth_cfg        ;
        bool					    m_master_QUAD_cfg			;
        bool					    m_cascade_cfg				;
        int						    m_num_expd_input_cols_cfg	;
        int                         m_num_expd_input_rows_cfg   ;
        int						    m_num_input_cols_cfg	    ;
        int                         m_num_input_rows_cfg        ;
        bool					    m_conv_out_fmt0_cfg			;
        bool					    m_padding_cfg				;
        bool					    m_upsmaple_cfg				;
        int                         m_stride_cfg                ;
        int                         m_stride_count              ;
        int						    m_crpd_input_row_start_cfg	;
        int						    m_crpd_input_row_end_cfg	;
        int                         m_numKernelRows_cfg         ;
        int                         m_numKernelCols_cfg         ;
        int                         m_kernelDepth               ;
        int						    m_QUAD_id					;
        int         	            m_res_fifo_sz   			;
        bool					    m_last_res_wrtn				;
        sc_core::sc_event_queue     m_pfb_wrtn					;
        sc_core::sc_event_queue     m_recvd_start               ;
        sc_core::sc_event_queue*    m_prev_quad_ack				;
        bool*                       m_primed    				;
        bool*                       m_en                        ;
        sc_core::sc_event_queue*    m_QUAD_start   				;
        double                      m_start_time                ;
        double                      m_QUAD_time                 ;
        int                         m_num_outputs               ;
        bool                        m_processing                ;
        int                         m_output_count              ;
};
