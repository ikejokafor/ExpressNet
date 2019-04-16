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
`include "cnl_sc2_DUTOutput.sv"
`include "cnl_sc2_generator.sv"


class `scX_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
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
        m_DUT_rdy = `scX_monParams.DUT_rdy;
        m_quad_intf = `scX_monParams.quad_intf;
        m_mon_rdy = `scX_monParams.mon_rdy;
        m_tid = `scX_monParams.tid;
        m_runForever = `scX_monParams.runForever;
    end
endfunction: new


task `cnl_scX_monitor::run();
    `scX_DUTOutParams_t `scX_DUTOutParams;
    `cnl_scX_DUTOutput query;
    `cnl_scX_generator test;
    int t;
    int signal;
    int num_kernels;
    int num_acl_output_rows;
    int num_acl_output_cols;
    int stride;
    int output_depth;
    

    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            `scX_DUTOutParams                        = new();
            `scX_DUTOutParams.num_kernels            = test.m_num_kernels;
            `scX_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            `scX_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            `scX_DUTOutParams.num_acl_output_rows    = test.m_num_acl_output_rows;
            `scX_DUTOutParams.num_acl_output_cols    = test.m_num_acl_output_cols;
            output_depth                            = test.m_num_kernels;
            query                                   = new(`scX_DUTOutParams);
            m_mon_rdy.put(signal);
            stride                                  = test.m_stride;
            num_kernels                             = query.m_num_kernels;
            num_acl_output_rows                     = query.m_num_acl_output_rows;
            num_acl_output_cols                     = query.m_num_acl_output_cols;
            
            
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_quad_intf.clk_core_cb.output_row == (num_acl_output_rows - 1) && m_quad_intf.clk_core_cb.output_col == (num_acl_output_cols - 1) && m_quad_intf.clk_core_cb.output_depth == (output_depth - 1)) begin
                    break;
                end else if(m_quad_intf.clk_core_cb.result_valid) begin
                    query.m_conv_map[(m_quad_intf.clk_core_cb.output_depth * num_acl_output_rows + m_quad_intf.clk_core_cb.output_row) * num_acl_output_cols + m_quad_intf.clk_core_cb.output_col].pixel = m_quad_intf.clk_core_cb.result_data;
                end
            end
            

            m_monitor2scoreboardMB.put(query);
            $display("// Finished Test ------------------------------------------------");
            $display("// At Time:                %t", $time                             );            
            $display("// Test Index:            %0d", test.m_ti                         ); 
            $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
            $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
            $display("// Input Depth:           %0d", test.m_depth                      );
            $display("// Num Kernels:           %0d", test.m_num_kernels                );
            $display("// Kernel size:           %0d", test.m_kernel_size                );
            $display("// Stride                 %0d", test.m_stride                     );
            $display("// Padding:               %0d", test.m_padding                    );
            $display("// UpSample:              %0d", test.m_upsample                   );
            $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
            $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
            $display("// Num Acl Output Rows:   %0d", test.m_num_acl_output_rows        );
            $display("// Num Acl Output Cols:   %0d", test.m_num_acl_output_cols        ); 
            $display("// Finished Test ------------------------------------------------");
            $display("\n");
            $display("//---------------------------------------------------------------");
            $display("// DUT ready for next test");
            $display("//---------------------------------------------------------------");
            $display("\n");
            m_DUT_rdy.put(signal);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
endtask: run


`endif