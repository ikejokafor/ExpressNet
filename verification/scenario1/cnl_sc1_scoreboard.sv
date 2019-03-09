`ifndef	__CNL_SC1_SCOREBOARD__
`define	__CNL_SC1_SCOREBOARD__


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
`include "cnl_sc1_generator.sv"
`include "cnl_sc1_DUTOutput.sv"


class sc1_scoreParams_t extends scoreParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf; 
endclass: sc1_scoreParams_t


class cnl_sc1_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator test, DUToutput sol);
    extern function int checkSolution(DUToutput query, DUToutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf;    
endclass: cnl_sc1_scoreboard


function cnl_sc1_scoreboard::new(scoreParams_t scoreParams = null);
    sc1_scoreParams_t sc1_scoreParams;

    if(scoreParams != null) begin
        $cast(sc1_scoreParams, scoreParams);
        m_agent2scoreboardMB = sc1_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = sc1_scoreParams.monitor2scoreboardMB;
        m_quad_intf = sc1_scoreParams.quad_intf;
        m_simOver = sc1_scoreParams.simOver;
        m_numTests = sc1_scoreParams.numTests;
    end
endfunction: new


task cnl_sc1_scoreboard::run();
    cnl_sc1_generator test;
    cnl_sc1_DUTOutput query;
    cnl_sc1_DUTOutput sol;
    int i;
    int signal;


    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            sol = new();
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_if_cb);
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


function void cnl_sc1_scoreboard::createSolution(generator test, DUToutput sol);
    cnl_sc1_generator sc1_test;
    cnl_sc1_DUTOutput sc1_sol;
    int i;
    int j;
    int k;
    int a;
    int b;
    int kr;
    int kc;
    int m;
    int x;
    int y;
    int n;
    int depth;
    int num_kernels;
    int num_output_rows;
    int num_output_cols;
    int kernel_size;
    int padding;
    int stride;
    int num_input_rows;
    int num_input_cols;
    logic[15:0] pix_data_sim[];
    logic[15:0] kernel_data_sim[];
    

    $cast(sc1_test, test);
    $cast(sc1_sol, sol);    
    depth                               = sc1_test.m_depth;
    num_input_rows                      = sc1_test.m_num_input_rows;
    num_input_cols                      = sc1_test.m_num_input_cols;    
    kernel_size                         = sc1_test.m_kernel_size;
    padding                             = sc1_test.m_padding;
    stride                              = sc1_test.m_stride;
    pix_data_sim                        = sc1_test.m_pix_data_sim;
    kernel_data_sim                     = sc1_test.m_kernel_data_sim;
    sc1_sol.m_num_kernels               = sc1_test.m_num_kernels;
    sc1_sol.m_num_output_rows           = ((num_input_rows - kernel_size + (2 * padding)) / stride) + 1;
    sc1_sol.m_num_output_cols           = ((num_input_cols - kernel_size + (2 * padding)) / stride) + 1;
    sc1_sol.m_conv_map                  = new[sc1_sol.m_num_kernels * sc1_sol.m_num_output_rows * sc1_sol.m_num_output_cols];
    num_kernels                         = sc1_sol.m_num_kernels; 
    num_output_rows                     = sc1_sol.m_num_output_rows;
    num_output_cols                     = sc1_sol.m_num_output_cols;

    
    for(m = 0; m < num_kernels; m = m + 1) begin
        a = 0;
        for(x = 0; x < num_output_rows; x = x + 1) begin
            b = 0;
            for(y = 0; y < num_output_cols; y = y + 1) begin
                sc1_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y] = 0;
                for(k = 0; k < depth; k = k + 1) begin
                    kr = 0;
                    n = 0;
                    for(i = a - padding; kr < kernel_size; i = i + 1) begin
                        kc = 0;
                        for(j = b - padding; kc < kernel_size; j = j + 1) begin
                            if((i >= 0 && j >= 0) && (i < num_input_rows && j < num_input_cols)) begin                      
                                sc1_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y] 
                                    = sc1_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y] +
                                    (pix_data_sim[(k * num_input_rows + i) * num_input_cols + j]
                                    * kernel_data_sim[(m * depth + k) * `KERNEL_3x3_COUNT_FULL_CFG + n]);    // you are indexing into kernel_data_sim wrong
                            end
                            kc = kc + 1;
                        end
                        kr = kr + 1;
                        n = n + 1;
                    end
                end
                b = b + stride;
            end
            a = a + stride;
        end
    end
endfunction: createSolution


function int cnl_sc1_scoreboard::checkSolution(DUToutput query, DUToutput sol);
    cnl_sc1_DUTOutput sc1_query;
    cnl_sc1_DUTOutput sc1_sol;
    int i;
    int j;
    int k;
    int num_kernels;      
    int num_output_rows;  
    int num_output_cols;
    int num_sim_output_rows;   
    int num_sim_output_cols;    
    logic [15:0] sol_conv_map[];
    logic [15:0] qry_conv_map[];
    integer fd;
    
    
    $cast(sc1_query, query);
    $cast(sc1_sol, sol);
    num_kernels            = sc1_sol.m_num_kernels;
    num_output_rows        = sc1_sol.m_num_output_rows;
    num_output_cols        = sc1_sol.m_num_output_cols;
    num_sim_output_rows    = sc1_query.m_num_sim_output_rows;
    num_sim_output_cols    = sc1_query.m_num_sim_output_cols;    
    sol_conv_map           = sc1_sol.m_conv_map;
    qry_conv_map           = sc1_query.m_conv_map;

    
    fd = $fopen("map.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", sol_conv_map[(k * num_output_rows + i) * num_output_cols + j]);
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);
        
        
    fd = $fopen("map0.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_sim_output_rows; i = i + 1) begin
            for(j = 0; j < num_sim_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", qry_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j]);
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);
    
    
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                if(sol_conv_map[(k * num_output_rows + i) * num_output_cols + j] 
                    != qry_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j]) begin
                    $stop;
                end
            end
        end
    end 
    
    
    return 0;
endfunction: checkSolution


`endif