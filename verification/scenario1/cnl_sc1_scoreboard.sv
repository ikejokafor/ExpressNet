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
    extern function void createSolution(generator test, DUTOutput sol);
    extern function int checkSolution(DUTOutput query, DUTOutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf;    
endclass: cnl_sc1_scoreboard


function cnl_sc1_scoreboard::new(scoreParams_t scoreParams = null);
    sc1_scoreParams_t sc1_scoreParams;

    if(scoreParams != null) begin
        $cast(sc1_scoreParams, scoreParams);
        m_agent2scoreboardMB = sc1_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = sc1_scoreParams.monitor2scoreboardMB;
        m_quad_intf = sc1_scoreParams.quad_intf;
        m_scbd_done = sc1_scoreParams.scbd_done;
        m_numTests = sc1_scoreParams.numTests;
        m_tid = sc1_scoreParams.tid;
    end
endfunction: new


task cnl_sc1_scoreboard::run();
    cnl_sc1_generator test;
    cnl_sc1_DUTOutput query;
    cnl_sc1_DUTOutput sol;
    sc1_DUTOutParams_t sc1_DUTOutParams;
    int i;
    int signal;


    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            sc1_DUTOutParams                        = new();
            sc1_DUTOutParams.depth                  = test.m_depth;
            sc1_DUTOutParams.num_kernels            = test.m_num_kernels;
            sc1_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            sc1_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            sc1_DUTOutParams.num_sim_output_rows    = test.m_num_sim_output_rows;
            sc1_DUTOutParams.num_sim_output_cols    = test.m_num_sim_output_cols;
            sol = new(sc1_DUTOutParams);
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    $display("// Checking Test ------------------------------------------------");
                    $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
                    $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
                    $display("// Input Depth:           %0d", test.m_depth                      );
                    $display("// Num kernels:           %0d", test.m_num_kernels                );
                    $display("// Kernel size:           %0d", test.m_kernel_size                );
                    $display("// Stride                 %0d", test.m_stride                     );
                    $display("// Padding:               %0d", test.m_padding                    );
                    $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
                    $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
                    $display("// Num Sim Output Rows:   %0d", test.m_num_sim_output_rows        );
                    $display("// Num Sim Output Cols:   %0d", test.m_num_sim_output_cols        ); 
                    $display("// Checking Test ------------------------------------------------");
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
    m_scbd_done.put(signal);
endtask: run


function void cnl_sc1_scoreboard::createSolution(generator test, DUTOutput sol);
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
    int num_sim_output_rows;
    int num_sim_output_cols; 
    logic[15:0] pix_data_sim[];
    logic[15:0] kernel_data_sim[];
    

    $cast(sc1_test, test);
    $cast(sc1_sol, sol);    
    num_input_rows                      = sc1_test.m_num_input_rows;
    num_input_cols                      = sc1_test.m_num_input_cols;    
    kernel_size                         = sc1_test.m_kernel_size;
    padding                             = sc1_test.m_padding;
    stride                              = sc1_test.m_stride;
    pix_data_sim                        = sc1_test.m_pix_data_sim;
    kernel_data_sim                     = sc1_test.m_kernel_data_sim;
    num_output_rows                     = sc1_sol.m_num_output_rows;
    num_output_cols                     = sc1_sol.m_num_output_cols;
    num_sim_output_rows                 = sc1_sol.m_num_sim_output_rows;
    num_sim_output_cols                 = sc1_sol.m_num_sim_output_cols;
    num_kernels                         = sc1_sol.m_num_kernels;
    depth                               = sc1_sol.m_depth;
    
    
    for(m = 0; m < num_kernels; m = m + 1) begin
        a = 0;
        for(x = 0; x < num_output_rows; x = x + 1) begin
            b = 0;
            for(y = 0; y < num_output_cols; y = y + 1) begin
                sc1_sol.m_conv_map[(m * num_sim_output_rows + x) * num_sim_output_cols + y].pixel = 0;
                for(k = 0; k < depth; k = k + 1) begin
                    kr = 0;
                    n = 0;
                    for(i = a - padding; kr < kernel_size; i = i + 1) begin
                        kc = 0;
                        for(j = b - padding; kc < kernel_size; j = j + 1) begin
                            if((i >= 0 && j >= 0) && (i < num_input_rows && j < num_input_cols)) begin                      
                                sc1_sol.m_conv_map[(m * num_sim_output_rows + x) * num_sim_output_cols + y].pixel
                                    = sc1_sol.m_conv_map[(m * num_sim_output_rows + x) * num_sim_output_cols + y].pixel +
                                    (pix_data_sim[(k * num_input_rows + i) * num_input_cols + j]
                                    * kernel_data_sim[(m * depth + k) * `KERNEL_3x3_COUNT_FULL + n]);
                            end
                            kc = kc + 1;
                            n = n + 1;
                        end
                        kr = kr + 1;
                    end
                end
                b = b + stride;
            end
            a = a + stride;
        end
    end
endfunction: createSolution


function int cnl_sc1_scoreboard::checkSolution(DUTOutput query, DUTOutput sol);
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
    sc1_datum_t sol_conv_map[];
    sc1_datum_t qry_conv_map[];
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

    
    fd = $fopen("sol_conv_map.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", sol_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j].pixel);
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);
        
        
    fd = $fopen("qry_conv_map.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", qry_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j].pixel);
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
                if(sol_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j].pixel
                    != qry_conv_map[(k * num_sim_output_rows + i) * num_sim_output_cols + j].pixel) begin
                   $stop;
                end
            end
        end
    end 
    
    
    return 0;
endfunction: checkSolution


`endif