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


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "monitor.sv"
`include "cnl_sc0_DUTOutput.sv"
`include "cnl_sc0_generator.sv"
`include "cnn_layer_accel_awe_rowbuffers_intf.sv"


class sc0_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf;
endclass: sc0_monParams_t;


class cnl_sc0_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf m_awe_buf_intf;
endclass: cnl_sc0_monitor


function cnl_sc0_monitor::new(monParams_t monParams = null);
    sc0_monParams_t sc0_monParams;
  
  
    if(monParams != null) begin
        $cast(sc0_monParams, monParams);
        m_monitor2scoreboardMB = sc0_monParams.monitor2scoreboardMB;
        m_agent2monitorMB = sc0_monParams.agent2monitorMB;    
        m_numTests = sc0_monParams.numTests;
        m_DUT_rdy = sc0_monParams.DUT_rdy;
        m_quad_intf = sc0_monParams.quad_intf;
        m_mon_rdy = sc0_monParams.mon_rdy;
        m_awe_buf_intf = sc0_monParams.awe_buf_intf;
        m_tid = sc0_monParams.tid;
    end
endfunction: new


task cnl_sc0_monitor::run();
    sc0_DUTOutParams_t sc0_DUTOutParams;
    cnl_sc0_DUTOutput query;
    cnl_sc0_generator test;
    int i;
    int n;
    int signal;
    int num_kernels;
    int num_sim_output_rows;
    int num_sim_output_cols;
    int stride;


    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            sc0_DUTOutParams                        = new();
            sc0_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            sc0_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            sc0_DUTOutParams.num_sim_output_rows    = test.m_num_sim_output_rows;
            sc0_DUTOutParams.num_sim_output_cols    = test.m_num_sim_output_cols;
            query                                   = new(sc0_DUTOutParams);
            stride                                  = test.m_stride;
            num_sim_output_rows                     = test.m_num_sim_output_rows;
            num_sim_output_cols                     = test.m_num_sim_output_cols;
            m_mon_rdy.put(signal);


            forever begin
                @(m_awe_buf_intf.clk_cb);
                if(m_awe_buf_intf.clk_cb.output_row_ce0 == num_sim_output_rows && m_awe_buf_intf.clk_cb.output_row_ce1 == num_sim_output_rows) begin
                    break;
                end else begin
                    if(m_awe_buf_intf.clk_cb.ce0_pixel_dataout_valid && m_awe_buf_intf.clk_cb.ce0_last_kernel) begin
                        query.m_pix_data[((0 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 0)].sim_time = $time * 1000;
                        query.m_pix_data[((0 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 0)].pixel = m_awe_buf_intf.clk_cb.ce0_pixel_dataout[ 15:0];
                        query.m_pix_data[((0 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 1)].sim_time = $time * 1000;
                        query.m_pix_data[((0 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce0) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce0) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce0_cycle_counter * 2) + 1)].pixel = m_awe_buf_intf.clk_cb.ce0_pixel_dataout[31:16];                                              
                    end
                    if(m_awe_buf_intf.clk_cb.ce1_pixel_dataout_valid && m_awe_buf_intf.clk_cb.ce1_last_kernel) begin
                        query.m_pix_data[((1 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 0)].sim_time = $time * 1000;
                        query.m_pix_data[((1 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 0)].pixel = m_awe_buf_intf.clk_cb.ce1_pixel_dataout[ 15:0];
                        query.m_pix_data[((1 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 1)].sim_time = $time * 1000;
                        query.m_pix_data[((1 * num_sim_output_rows + m_awe_buf_intf.clk_cb.output_row_ce1) * num_sim_output_cols + m_awe_buf_intf.clk_cb.output_col_ce1) * `KERNEL_3x3_COUNT_FULL_CFG + ((m_awe_buf_intf.clk_cb.ce1_cycle_counter * 2) + 1)].pixel = m_awe_buf_intf.clk_cb.ce1_pixel_dataout[31:16];  
                    end
                end
            end


            m_monitor2scoreboardMB.put(query);
            $display("// Finished Test ----------------------------------------------");
            $display("// Num Input Rows:      %0d", test.m_num_input_rows             );
            $display("// Num Input Cols:      %0d", test.m_num_input_cols             );
            $display("// Num Depth:           %0d", test.m_depth                      );
            $display("// Num kernels:         %0d", test.m_num_kernels                );
            $display("// Num Kernel size:     %0d", test.m_kernel_size                );
            $display("// Stride               %0d", test.m_stride                     );
            $display("// Padding:             %0d", test.m_padding                    );
            $display("// Finished Test ----------------------------------------------");
            $display("\n");
            $display("//-------------------------------------------");
            $display("// DUT ready for next test");
            $display("//-------------------------------------------");
            $display("\n");
            m_DUT_rdy.put(signal);
            i = i + 1;
        end
    end
endtask: run


`endif