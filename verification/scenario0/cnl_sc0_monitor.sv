`ifndef	__CNL_SC0_MONITOR__
`define	__CNL_SC0_MONITOR__


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
`include "cnl_`scX_defs.vh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_awe_rowbuffers_intf.sv"
`include "cnl_`scX_DUTOutput.sv"
`include "cnl_`scX_generator.sv"



class `scX_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf;
endclass: `scX_monParams_t;


class cnl_`scX_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf m_awe_buf_intf;
endclass: cnl_`scX_monitor


function cnl_`scX_monitor::new(monParams_t monParams = null);
    `scX_monParams_t `scX_monParams;
  
  
    if(monParams != null) begin
        $cast(`scX_monParams, monParams);
        m_monitor2scoreboardMB = `scX_monParams.monitor2scoreboardMB;
        m_agent2monitorMB = `scX_monParams.agent2monitorMB;    
        m_numTests = `scX_monParams.numTests;
        m_DUT_rdy = `scX_monParams.DUT_rdy;
        m_quad_intf = `scX_monParams.quad_intf;
        m_mon_rdy = `scX_monParams.mon_rdy;
        m_awe_buf_intf = `scX_monParams.awe_buf_intf;
        m_tid = `scX_monParams.tid;
        m_runForever = `scX_monParams.runForever;        
    end
endfunction: new


task cnl_`scX_monitor::run();
    `scX_DUTOutParams_t `scX_DUTOutParams;
    cnl_`scX_DUTOutput query;
    cnl_`scX_generator test;
    int t;
    int n;
    int signal;
    int num_kernels;
    int num_acl_output_rows;
    int num_acl_output_cols;
    int stride;


    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            `scX_DUTOutParams                        = new();
            `scX_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            `scX_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            `scX_DUTOutParams.num_acl_output_rows    = test.m_num_acl_output_rows;
            `scX_DUTOutParams.num_acl_output_cols    = test.m_num_acl_output_cols;
            query                                   = new(`scX_DUTOutParams);
            stride                                  = test.m_stride;
            num_acl_output_rows                     = test.m_num_acl_output_rows;
            num_acl_output_cols                     = test.m_num_acl_output_cols;
            m_mon_rdy.put(signal);


            forever begin
                @(m_awe_buf_intf.clk_cb);
                if(m_awe_buf_intf.clk_cb.output_row_ce0 == num_acl_output_rows && m_awe_buf_intf.clk_cb.output_row_ce1 == num_acl_output_rows) begin
                    $display("//---------------------------------------------------------------");
                    $display("// At Time: %0t", $time                                           ); 
                    $display("// Test Index: %0d", test.m_ti                                    );                    
                    $display("// Monitor Recieved last output"                                  );
                    $display("//---------------------------------------------------------------");
                    $display("\n");
                    break;
                end else begin
                    if(m_awe_buf_intf.clk_cb.ce0_pixel_dataout_valid && m_awe_buf_intf.clk_cb.ce0_last_kernel) begin
                        query.m_pix_data[((0 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 0)].sim_time = $time * 1000;
                        query.m_pix_data[((0 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 0)].pixel = m_awe_buf_intf.clk_cb.ce0_pixel_dataout[ 15:0];
                        query.m_pix_data[((0 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 1)].sim_time = $time * 1000;
                        query.m_pix_data[((0 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 1)].pixel = m_awe_buf_intf.clk_cb.ce0_pixel_dataout[31:16];                                              
                    end
                    if(m_awe_buf_intf.clk_cb.ce1_pixel_dataout_valid && m_awe_buf_intf.clk_cb.ce1_last_kernel) begin
                        query.m_pix_data[((1 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 0)].sim_time = $time * 1000;
                        query.m_pix_data[((1 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 0)].pixel = m_awe_buf_intf.clk_cb.ce1_pixel_dataout[ 15:0];
                        query.m_pix_data[((1 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 1)].sim_time = $time * 1000;
                        query.m_pix_data[((1 * num_acl_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_acl_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `NUM_CONV_WINDOW_VALUES + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 1)].pixel = m_awe_buf_intf.clk_cb.ce1_pixel_dataout[31:16];  
                    end
                end
            end
            m_monitor2scoreboardMB.put(query);
            
            m_mon_rdy.put(signal);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
endtask: run


`endif