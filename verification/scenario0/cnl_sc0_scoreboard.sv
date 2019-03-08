`ifndef	__CNL_SC0_SCOREBOARD__
`define	__CNL_SC0_SCOREBOARD__


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
// Additional Comments:    This class receives test from agent, creates the solution, and then passes it to the checker
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "scoreboard.sv"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnl_sc0_generator.sv"
`include "cnl_sc0_DUTOutput.sv"


class sc0_scoreParams_t extends scoreParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf; 
endclass: sc0_scoreParams_t


class cnl_sc0_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator test, DUToutput sol);
    extern function int checkSolution(DUToutput query, DUToutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf;    
endclass: cnl_sc0_scoreboard


function cnl_sc0_scoreboard::new(scoreParams_t scoreParams = null);
    sc0_scoreParams_t sc0_scoreParams;

    if(scoreParams != null) begin
        $cast(sc0_scoreParams, scoreParams);
        m_agent2scoreboardMB = sc0_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = sc0_scoreParams.monitor2scoreboardMB;
        m_quad_intf = sc0_scoreParams.quad_intf;
        m_simOver = sc0_scoreParams.simOver;
        m_numTests = sc0_scoreParams.numTests;
    end
endfunction: new


task cnl_sc0_scoreboard::run();
    cnl_sc0_generator test;
    cnl_sc0_DUTOutput query;
    cnl_sc0_DUTOutput sol;
    int i;
    int signal;


    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_if);
        if(m_agent2scoreboardMB.try_get(test)) begin
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_if);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    $display("// Checking Test ---------------------------------------------");
                    $display("// Num Rows:            %d", test.m_num_input_rows             );
                    $display("// Num Cols:            %d", test.m_num_input_cols             );
                    $display("// Num Depth:           %d", test.m_depth                      );
                    $display("// Num kernels:         %d", test.m_num_kernels                );
                    $display("// Num Kernel size:     %d", test.m_kernel_size                );
                    $display("// Stride               %d", test.m_stride                     );
                    $display("// Padding:             %d", test.m_padding                    );
                    $display("// Pixel data size:     %d", test.m_pix_data.size()            );
                    $display("// Kernel data size     %d", test.m_kernel_data.size()         );
                    $display("// Checking Test ---------------------------------------------");
                    $display("\n");
                    if(checkSolution(query, sol)) begin
                        $display("// -----------------------------------------------------------");
                        $display("// Test Failed");
                        $display("// -----------------------------------------------------------");
                        $display("\n");
                    end else begin
                        $display("// -----------------------------------------------------------");
                        $display("// Test Passed");
                        $display("// -----------------------------------------------------------");
                        $display("\n");
                    end
                    break;
                end
            end
            i = i + 1;
        end
    end
    m_simOver.put(signal);
endtask: run


function void cnl_sc0_scoreboard::createSolution(generator test, DUToutput sol);
    // cnl_sc0_generator sc0_test;
    // cnl_sc0_DUTOutput sc0_sol;
    // sc0_DUTOutParams_t sc0_DUTOutParams;
    // int i;
    // int j;
    // int k;
    // int a;
    // int b;
    // int kr;
    // int kc;
    // int m;
    // int x;
    // int y;
    // 
    // 
    // $cast(sc0_test, test);
    // $cast(sc0_sol, sol);
    // sc0_DUTOutParams                    = new();
    // sc0_DUTOutParams.num_kernels        = sc0_test.m_num_kernels;
    // sc0_DUTOutParams.num_output_rows    = ((sc0_test.m_num_input_rows - sc0_test.m_kernel_size + (2 * sc0_test.m_padding)) / sc0_test.m_stride) + 1;       
    // sc0_DUTOutParams.num_output_cols    = ((sc0_test.m_num_input_cols - sc0_test.m_kernel_size + (2 * sc0_test.m_padding)) / sc0_test.m_stride) + 1;       
    // sc0_sol                             = new(sc0_DUTOutParams);
    // 
    // 
    // for(m = 0; m < sc0_DUTOutParams.num_kernels; m = m + 1) begin
    //     a = 0;
    //     for(x = 0; x < sc0_DUTOutParams.num_output_rows; x = x + 1) begin
    //         b = 0;
    //         for(y = 0; y < sc0_DUTOutParams.num_output_cols; y = y + 1) begin
    //             sc0_sol.m_conv_map[(m * sc0_DUTOutParams.num_output_rows + x) * sc0_DUTOutParams.num_output_cols + y] = 0;
    //             for(k = 0; k < sc0_test.m_depth; k = k + 1) begin
    //                 kr = 0;
    //                 for(i = a - sc0_test.m_padding; kr < sc0_test.m_kernel_size; i = i + 1) begin
    //                     kc = 0;
    //                     for(j = b - sc0_test.m_padding; kc < sc0_test.m_kernel_size; j = j + 1) begin
    //                         if((i >= 0 && j >= 0) && (i < sc0_test.m_num_input_rows && j < sc0_test.m_num_input_cols)) begin                      
    //                             sc0_sol.m_conv_map[(m * sc0_DUTOutParams.num_output_rows + x) * sc0_DUTOutParams.num_output_cols + y] 
    //                                 = sc0_sol.m_conv_map[(m * sc0_DUTOutParams.num_output_rows + x) * sc0_DUTOutParams.num_output_cols + y] +
    //                                 (sc0_test.m_pix_data_sim[(k * sc0_test.m_num_input_rows + i) * sc0_test.m_num_input_cols + j]
    //                                 * sc0_test.m_kernel_data_sim[((m * sc0_test.m_depth + k) * sc0_test.m_kernel_size + kr) * sc0_test.m_kernel_size + kc]);
    //                         end
    //                         kc = kc + 1;
    //                     end
    //                     kr = kr + 1;
    //                 end
    //             end
    //             b = b + sc0_test.m_stride;
    //         end
    //         a = a + sc0_test.m_stride;
    //     end
    // end
    
endfunction: createSolution


function int cnl_sc0_scoreboard::checkSolution(DUToutput query, DUToutput sol);
    // cnl_sc0_DUTOutput sc0_query;
    // cnl_sc0_DUTOutput sc0_sol;
    // int i;
    // int j;
    // int k;
    // 
    // 
    // $cast(sc0_query, query);
    // $cast(sc0_sol, sol);
    // 
    // 
    // for(k = 0; k < sc0_sol.m_num_kernels; k = k + 1) begin
    //     for(i = 0; i < sc0_sol.m_num_output_rows; i = i + 1) begin
    //         for(j = 0; j < sc0_sol.m_num_output_cols; j = j + 1) begin
    //             if(sc0_sol.m_conv_map[(k * sc0_sol.m_num_output_rows + i) * sc0_sol.m_num_output_cols + j] 
    //                 != sc0_query.m_conv_map[(k * sc0_query.m_num_output_rows + i) * sc0_query.m_num_output_cols + j]) begin
    //                 $stop;
    //             end
    //         end
    //     end
    // end
endfunction: checkSolution


`endif