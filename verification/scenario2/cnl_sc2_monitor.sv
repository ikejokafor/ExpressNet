`ifndef	__CNL_SC2_MONITOR__
`define	__CNL_SC2_MONITOR__


`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:			
//				
// Engineer:		
//
// Create Date:		
// Design Name:		
// Module Name:		
// Project Name:	
// Target Devices:  
// Tool versions:
// Description:		
//
// Dependencies:
//	 
// 	 
//
// Revision:
//
//
//
//
// Additional Comments:    This class drives the appropiate signals to recieve outputs from the DUT, transforms them into
//                              a more readable format, and passes it to the checker
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "monitor.sv"
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_awe_rowbuffers_intf.sv"
`include "cnl_sc2_DUTOutput.sv"
`include "cnl_sc2_generator.sv"


class `scX_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf;
endclass: `scX_monParams_t;


class `cnl_scX_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: `cnl_scX_monitor


function `cnl_scX_monitor::new(monParams_t monParams = null);
    `scX_monParams_t `scX_monParams;
    if(monParams != null) begin
        $cast(`scX_monParams, monParams);
        m_monitor2scoreboardMB = `scX_monParams.monitor2scoreboardMB;
        m_agent2monitorMB = `scX_monParams.agent2monitorMB;    
        m_numTests = `scX_monParams.numTests;
        m_quad_intf = `scX_monParams.quad_intf;
        m_mon_rdy = `scX_monParams.mon_rdy;
        m_tid = `scX_monParams.tid;
        m_runForever = `scX_monParams.runForever;
        m_test_bi = `scX_monParams.test_bi;
        m_test_ei = `scX_monParams.test_ei;
        m_outputDir = `scX_monParams.outputDir;        
    end
endfunction: new


task `cnl_scX_monitor::run();
    `scX_DUTOutParams_t `scX_DUTOutParams;
    `cnl_scX_DUTOutput query;
    `cnl_scX_generator test;
    int t;
    int signal;
    int slv_addr;
    int slv_reg_idx;
    t = 0;
    slv_reg_idx = 0;
    m_mon_rdy.put(signal);
    if(m_test_ei != -1) begin
        m_numTests = (m_test_ei - m_test_bi) + 1;
    end else begin
        m_test_ei = m_numTests - 1;
    end
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            `scX_DUTOutParams                       = new();
            `scX_DUTOutParams.m_num_kernels         = test.m_num_kernels;
            `scX_DUTOutParams.m_depth               = test.m_depth;
            query                                   = new(`scX_DUTOutParams);
            m_mon_rdy.put(signal);
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.slv_dbg_rdAck && m_quad_intf.clk_if_cb.slv_dbg_rdAddr == `SLV_SPCE_CFG_REG_HIGH) begin
                    query.m_acl_slv_reg[(slv_reg_idx * 16) +: 16] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];                    
                    query.m_pfb_full_count_cfg                    = query.m_acl_slv_reg[`PFB_FULL_COUNT_FIELD];
                    query.m_stride_cfg    		                  = query.m_acl_slv_reg[`STRIDE_FIELD];
                    query.m_conv_out_fmt_cfg                      = query.m_acl_slv_reg[`CONV_OUT_FMT_FIELD];
                    query.m_padding_cfg                           = query.m_acl_slv_reg[`PADDING_FIELD];
                    query.m_num_output_cols_cfg                   = query.m_acl_slv_reg[`NUM_OUTPUT_COLS_FIELD];
                    query.m_num_output_rows_cfg                   = query.m_acl_slv_reg[`NUM_OUTPUT_ROWS_FIELD];
                    query.m_pix_seq_data_full_count_cfg           = query.m_acl_slv_reg[`PIX_SEQ_DATA_FULL_COUNT_FIELD];
                    query.m_upsample_cfg                          = query.m_acl_slv_reg[`UPSAMPLE_FIELD];
                    query.m_num_expd_input_cols_cfg               = query.m_acl_slv_reg[`NUM_EXPD_INPUT_COLS_FIELD];
                    query.m_num_expd_input_rows_cfg               = query.m_acl_slv_reg[`NUM_EXPD_INPUT_ROWS_FIELD];
                    query.m_crpd_input_col_start_cfg              = query.m_acl_slv_reg[`CRPD_INPUT_COL_START_FIELD];
                    query.m_crpd_input_row_start_cfg              = query.m_acl_slv_reg[`CRPD_INPUT_ROW_START_FIELD];
                    query.m_crpd_input_col_end_cfg                = query.m_acl_slv_reg[`CRPD_INPUT_COL_END_FIELD];
                    query.m_crpd_input_row_end_cfg                = query.m_acl_slv_reg[`CRPD_INPUT_ROW_END_FIELD];
                    query.m_num_kernels_cfg                       = query.m_acl_slv_reg[`NUM_KERNELS_FIELD];
                    query.m_master_quad_cfg                       = query.m_acl_slv_reg[`MASTER_QUAD_FIELD];
                    query.m_cascade_cfg                           = query.m_acl_slv_reg[`CASCADE_FIELD];
                    query.m_actv_cfg                              = query.m_acl_slv_reg[`ACTV_FIELD];
                    $display("//---------------------------------------------------------------");
                    $display("// At Time: %0t", $time                                           ); 
                    $display("// Test Index: %0d", test.m_ti                                    );                    
                    $display("// Monitor Recieved last output"                                  );
                    $display("//---------------------------------------------------------------");
                    $display("\n");
                    break;
                end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAck) begin
                    slv_addr = m_quad_intf.clk_if_cb.slv_dbg_rdAddr >> 2;
                    if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_PIX_SEQ_LOW && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_PIX_SEQ_HIGH) begin
                        query.m_pix_seq_data_sim[slv_addr] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                    end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_KRN_DATA_LOW  && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_KRN_DATA_HIGH) begin
                        query.m_kernel_data_sim[slv_addr] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                    end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_CFG_REG_LOW && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_CFG_REG_HIGH) begin
                        query.m_acl_slv_reg[(slv_reg_idx * 16) +: 16] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                        slv_reg_idx = slv_reg_idx + 1;
                    end
                end
            end
            m_monitor2scoreboardMB.put(query);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
endtask: run


`endif