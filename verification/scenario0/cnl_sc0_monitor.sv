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


class sc0_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc0_monParams_t;


class cnl_sc0_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: cnl_sc0_monitor


function cnl_sc0_monitor::new(monParams_t monParams = null);
    sc0_monParams_t sc0_monParams;
    
    
    $cast(sc0_monParams, monParams);
    m_monitor2scoreboardMB = sc0_monParams.monitor2scoreboardMB;
    m_agent2monitorMB = sc0_monParams.agent2monitorMB;    
    m_numTests = sc0_monParams.numTests;
    m_DUT_rdy = sc0_monParams.DUT_rdy;
    m_quad_intf = sc0_monParams.quad_intf;
    m_mon_rdy = sc0_monParams.mon_rdy;
endfunction: new


task cnl_sc0_monitor::run();
    int n;
    sc0_DUTOutParams_t sc0_DUTOutParams;
    cnl_sc0_DUTOutput query;
    cnl_sc0_generator test;
    int i;
    int j;
    int k;
    int signal;
    int num_kernels;
    int num_sim_output_rows;
    int num_sim_output_cols;
    int stride;
    

    n = 0;
    while(n < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            sc0_DUTOutParams                        = new();
            sc0_DUTOutParams.num_kernels            = test.m_num_kernels;
            sc0_DUTOutParams.num_output_rows        = ((test.m_num_input_rows - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 1;
            sc0_DUTOutParams.num_output_cols        = ((test.m_num_input_cols - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 1;
            sc0_DUTOutParams.num_sim_output_rows    = ((test.m_num_input_rows - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 2;    // might need to double check this
            sc0_DUTOutParams.num_sim_output_cols    = test.m_num_input_cols;
            query                                   = new(sc0_DUTOutParams);
            m_mon_rdy.put(signal);
            stride                                  = test.m_stride;
            num_kernels                             = query.m_num_kernels;
            num_sim_output_rows                     = query.m_num_sim_output_rows;
            num_sim_output_cols                     = query.m_num_sim_output_cols;
            
            
            for(j = 0; j < num_sim_output_rows; j = j + stride) begin
                for(i = 0; i < num_kernels; i = i + 1) begin
                    k = 0;
                    while(k < num_sim_output_cols) begin
                        @(m_quad_intf.clk_core_cb);
                        if(m_quad_intf.clk_core_cb.result_valid) begin
                            query.m_conv_map[(i * num_sim_output_rows + j) * num_sim_output_cols + k] = m_quad_intf.clk_core_cb.result_data;
                            k = k + stride;
                        end
                    end
                end
            end
            m_monitor2scoreboardMB.put(query);
            $display("// Finished Test ---------------------------------------------");
            $display("// Num Input Rows:      %d", test.m_num_input_rows             );
            $display("// Num Input Cols:      %d", test.m_num_input_cols             );
            $display("// Num Depth:           %d", test.m_depth                      );
            $display("// Num kernels:         %d", test.m_num_kernels                );
            $display("// Num Kernel size:     %d", test.m_kernel_size                );
            $display("// Stride               %d", test.m_stride                     );
            $display("// Padding:             %d", test.m_padding                    );
            $display("// Pixel data size:     %d", test.m_pix_data.size()            );
            $display("// Kernel data size     %d", test.m_kernel_data.size()         );
            $display("// Finished Test ---------------------------------------------");
            $display("\n");
            $display("//-------------------------------------------");
            $display("// DUT ready for next test");
            $display("//-------------------------------------------");
            $display("\n");
            m_DUT_rdy.put(signal);
            n = n + 1;
            
            
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.job_complete) begin
                    m_quad_intf.clk_if_cb.job_complete_ack <= 1;
                    break;
                end
            end
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.job_complete_ack <= 0;
        end
    end





    // i = 0;
    // while(i < m_numTests) begin    
    //     @(m_quad_intf.clk_if);
    //     if(m_agent2monitorMB.try_get(test)) begin
    //         m_mon_rdy.put(signal);
    //         forever begin
    //             @(m_quad_intf.clk_if_cb);
    //             if(m_quad_intf.clk_if_cb.job_complete) begin
    //                 m_quad_intf.clk_if_cb.job_complete_ack <= 1;
    //                 break;
    //             end
    //         end
    //         @(m_quad_intf.clk_if_cb);
    //         m_quad_intf.clk_if_cb.job_complete_ack <= 0;
    //         // query = new();
    //         m_monitor2scoreboardMB.put(query);
    //         $display("// Finished Test ---------------------------------------------");
    //         $display("// Num Rows:            %d", test.m_num_input_rows             );
    //         $display("// Num Cols:            %d", test.m_num_input_cols             );
    //         $display("// Num Depth:           %d", test.m_depth                      );
    //         $display("// Num kernels:         %d", test.m_num_kernels                );
    //         $display("// Num Kernel size:     %d", test.m_kernel_size                );
    //         $display("// Stride               %d", test.m_stride                     );
    //         $display("// Padding:             %d", test.m_padding                    );
    //         $display("// Pixel data size:     %d", test.m_pix_data.size()            );
    //         $display("// Kernel data size     %d", test.m_kernel_data.size()         );
    //         $display("// Finished Test ---------------------------------------------");
    //         $display("\n");
    //         $display("//-------------------------------------------");
    //         $display("DUT ready for next test");
    //         $display("//-------------------------------------------");
    //         $display("\n");
    //         m_DUT_rdy.put(signal);
    //         i = i + 1;
    //     end
    // end

endtask: run


`endif