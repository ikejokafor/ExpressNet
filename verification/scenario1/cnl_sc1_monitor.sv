`ifndef	__CNL_SC1_MONITOR__
`define	__CNL_SC1_MONITOR__


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
`include "cnl_sc1_DUTOutput.sv"
`include "cnl_sc1_generator.sv"


class sc1_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc1_monParams_t;


class cnl_sc1_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: cnl_sc1_monitor


function cnl_sc1_monitor::new(monParams_t monParams = null);
    sc1_monParams_t sc1_monParams;
    
    
    if(monParams != null) begin
        $cast(sc1_monParams, monParams);
        m_monitor2scoreboardMB = sc1_monParams.monitor2scoreboardMB;
        m_agent2monitorMB = sc1_monParams.agent2monitorMB;    
        m_numTests = sc1_monParams.numTests;
        m_DUT_rdy = sc1_monParams.DUT_rdy;
        m_quad_intf = sc1_monParams.quad_intf;
        m_mon_rdy = sc1_monParams.mon_rdy;
        m_tid = sc1_monParams.tid;
        m_runForever = sc1_monParams.runForever;
    end
endfunction: new


task cnl_sc1_monitor::run();
    sc1_DUTOutParams_t sc1_DUTOutParams;
    cnl_sc1_DUTOutput query;
    cnl_sc1_generator test;
    int t;
    int signal;
    int num_kernels;
    int num_sim_output_rows;
    int num_sim_output_cols;
    int stride;
    int output_depth;
    

    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            sc1_DUTOutParams                        = new();
            sc1_DUTOutParams.num_kernels            = test.m_num_kernels;
            sc1_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            sc1_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            sc1_DUTOutParams.num_sim_output_rows    = test.m_num_sim_output_rows;
            sc1_DUTOutParams.num_sim_output_cols    = test.m_num_sim_output_cols;
            output_depth                            = test.m_num_kernels;
            query                                   = new(sc1_DUTOutParams);
            m_mon_rdy.put(signal);
            stride                                  = test.m_stride;
            num_kernels                             = query.m_num_kernels;
            num_sim_output_rows                     = query.m_num_sim_output_rows;
            num_sim_output_cols                     = query.m_num_sim_output_cols;
            
            
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_quad_intf.clk_core_cb.output_row == (num_sim_output_rows - 1) && m_quad_intf.clk_core_cb.output_col == (num_sim_output_cols - 1) && m_quad_intf.clk_core_cb.output_depth == (output_depth - 1)) begin
                    break;
                end else if(m_quad_intf.clk_core_cb.result_valid) begin
                    query.m_conv_map[(m_quad_intf.clk_core_cb.output_depth * num_sim_output_rows + m_quad_intf.clk_core_cb.output_row) * num_sim_output_cols + m_quad_intf.clk_core_cb.output_col].pixel = m_quad_intf.clk_core_cb.result_data;
                end
            end
            

            m_monitor2scoreboardMB.put(query);
            $display("// Finished Test ------------------------------------------------");
            $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
            $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
            $display("// Input Depth:           %0d", test.m_depth                      );
            $display("// Num kernels:           %0d", test.m_num_kernels                );
            $display("// Num Kernel size:       %0d", test.m_kernel_size                );
            $display("// Stride                 %0d", test.m_stride                     );
            $display("// Padding:               %0d", test.m_padding                    );
            $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
            $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
            $display("// Num Sim Output Rows:   %0d", test.m_num_sim_output_rows        );
            $display("// Num Sim Output Cols:   %0d", test.m_num_sim_output_cols        ); 
            $display("// Finished Test ------------------------------------------------");
            $display("\n");
            $display("//-------------------------------------------");
            $display("// DUT ready for next test");
            $display("//-------------------------------------------");
            $display("\n");
            m_DUT_rdy.put(signal);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
endtask: run


`endif