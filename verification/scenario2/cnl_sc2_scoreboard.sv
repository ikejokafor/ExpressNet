`ifndef	__CNL_SC2_SCOREBOARD__
`define	__CNL_SC2_SCOREBOARD__


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
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnl_sc2_generator.sv"
`include "cnl_sc2_DUTOutput.sv"


class `scX_scoreParams_t extends scoreParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf; 
endclass: `scX_scoreParams_t


class `cnl_scX_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator test, DUTOutput sol);
    extern function int checkSolution(DUTOutput query, DUTOutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf;    
endclass: `cnl_scX_scoreboard


function `cnl_scX_scoreboard::new(scoreParams_t scoreParams = null);
    `scX_scoreParams_t `scX_scoreParams;

    if(scoreParams != null) begin
        $cast(`scX_scoreParams, scoreParams);
        m_agent2scoreboardMB = `scX_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = `scX_scoreParams.monitor2scoreboardMB;
        m_quad_intf = `scX_scoreParams.quad_intf;
        m_scbd_done = `scX_scoreParams.scbd_done;
        m_numTests = `scX_scoreParams.numTests;
        m_tid = `scX_scoreParams.tid;
        m_runForever = `scX_scoreParams.runForever;
    end
endfunction: new


task `cnl_scX_scoreboard::run();
    `cnl_scX_generator test;
    `cnl_scX_DUTOutput query;
    `cnl_scX_DUTOutput sol;
    `scX_DUTOutParams_t `scX_DUTOutParams;
    int t;
    int signal;
    integer fd;
    

    t = 0;
    fd = $fopen("verification_results.csv", "w");
    $fwrite(fd, "Test Idx, PASS/FAIL\n");
    while(t < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            `scX_DUTOutParams                        = new();
            `scX_DUTOutParams.depth                  = test.m_depth;
            `scX_DUTOutParams.num_kernels            = test.m_num_kernels;
            `scX_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            `scX_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            `scX_DUTOutParams.num_acl_output_rows    = test.m_num_acl_output_rows;
            `scX_DUTOutParams.num_acl_output_cols    = test.m_num_acl_output_cols;
            `scX_DUTOutParams.inst_cfg               = 0;
            sol = new(`scX_DUTOutParams);
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    $display("// Checking Test ------------------------------------------------");
                    $display("// At Time:               %0t", $time                             );
                    $display("// Test Index:            %0d", test.m_ti                         ); 
                    $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
                    $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
                    $display("// Input Depth:           %0d", test.m_depth                      );
                    $display("// Num Kernels:           %0d", test.m_num_kernels                );
                    $display("// Kernel size:           %0d", test.m_kernel_size                );
                    $display("// Stride:                %0d", test.m_stride                     );
                    $display("// Padding:               %0d", test.m_padding                    );
                    $display("// Upsample               %0d", test.m_upsample                   );
                    $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
                    $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
                    $display("// Num Acl Output Rows:   %0d", test.m_num_acl_output_rows        );
                    $display("// Num Acl Output Cols:   %0d", test.m_num_acl_output_cols        ); 
                    $display("// Checking Test ------------------------------------------------");
                    $display("\n");

                    
                    if(checkSolution(query, sol)) begin
                        $display("//---------------------------------------------------------------");
                        $display("// Test Failed"                                                   );
                        $display("//---------------------------------------------------------------");
                        $display("\n");
                        $fwrite(fd, "%0d, FAIL\n", test.m_ti);
                    end else begin
                        $display("//---------------------------------------------------------------");
                        $display("// Test Passed"                                                   );
                        $display("//---------------------------------------------------------------");
                        $display("\n");
                        $fwrite(fd, "%0d, PASS\n", test.m_ti);
                    end
                    break;
                end
            end
            $fflush(fd);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
    $fclose(fd);
    m_scbd_done.put(signal);
endtask: run


function void `cnl_scX_scoreboard::createSolution(generator test, DUTOutput sol);
    `cnl_scX_generator `scX_test;
    `cnl_scX_DUTOutput `scX_sol;
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
    int num_acl_output_rows;
    int num_acl_output_cols; 
    logic[15:0] pix_data_sim[];
    logic[15:0] kernel_data_sim[];
    integer fd;
    

    $cast(`scX_test, test);
    $cast(`scX_sol, sol);    
 
    kernel_size                         = `scX_test.m_kernel_size;
    padding                             = `scX_test.m_padding;
    stride                              = `scX_test.m_stride;
    kernel_data_sim                     = `scX_test.m_kernel_data_sim;
    num_output_rows                     = `scX_sol.m_num_output_rows;
    num_output_cols                     = `scX_sol.m_num_output_cols;
    num_kernels                         = `scX_sol.m_num_kernels;
    depth                               = `scX_sol.m_depth;
    if(`scX_test.m_upsample) begin
        pix_data_sim                    = `scX_test.m_pix_data_upsle_sim;
        if(padding) begin
            num_input_rows                  = `scX_test.m_num_expd_input_rows - 2;
            num_input_cols                  = `scX_test.m_num_expd_input_cols - 2;
        end else begin
            num_input_rows                  = `scX_test.m_num_expd_input_rows;
            num_input_cols                  = `scX_test.m_num_expd_input_cols;
        end
    end else begin
        pix_data_sim                    = `scX_test.m_pix_data_sim;
        num_input_rows                  = `scX_test.m_num_input_rows;
        num_input_cols                  = `scX_test.m_num_input_cols;   
    end

    
    for(m = 0; m < num_kernels; m = m + 1) begin
        a = 0;
        for(x = 0; x < num_output_rows; x = x + 1) begin
            b = 0;
            for(y = 0; y < num_output_cols; y = y + 1) begin
                `scX_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y].pixel = 0;
                for(k = 0; k < depth; k = k + 1) begin
                    kr = 0;
                    n = 0;
                    for(i = a - padding; kr < kernel_size; i = i + 1) begin
                        kc = 0;
                        for(j = b - padding; kc < kernel_size; j = j + 1) begin
                            if((i >= 0 && j >= 0) && (i < num_input_rows && j < num_input_cols)) begin                      
                                `scX_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y].pixel
                                    = `scX_sol.m_conv_map[(m * num_output_rows + x) * num_output_cols + y].pixel +
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
    
    
    fd = $fopen("sol_conv_map.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", `scX_sol.m_conv_map[(k * num_output_rows + i) * num_output_cols + j].pixel);
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);
endfunction: createSolution


function int `cnl_scX_scoreboard::checkSolution(DUTOutput query, DUTOutput sol);
    `cnl_scX_DUTOutput `scX_query;
    `cnl_scX_DUTOutput `scX_sol;
    int i;
    int j;
    int k;
    int num_kernels;      
    int num_output_rows;  
    int num_output_cols;
    int num_acl_output_rows;   
    int num_acl_output_cols;    
    `scX_datum_t sol_conv_map[];
    `scX_datum_t qry_conv_map[];
    integer fd;
    
    
    $cast(`scX_query, query);
    $cast(`scX_sol, sol);
    num_kernels            = `scX_sol.m_num_kernels;
    num_output_rows        = `scX_sol.m_num_output_rows;
    num_output_cols        = `scX_sol.m_num_output_cols;
    num_acl_output_rows    = `scX_query.m_num_acl_output_rows;
    num_acl_output_cols    = `scX_query.m_num_acl_output_cols;    
    sol_conv_map           = `scX_sol.m_conv_map;
    qry_conv_map           = `scX_query.m_conv_map;
       
        
    fd = $fopen("qry_conv_map.txt", "w");
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                $fwrite(fd, "%d ", qry_conv_map[(k * num_acl_output_rows + i) * num_acl_output_cols + j].pixel);
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
                if(sol_conv_map[(k * num_output_rows + i) * num_output_cols + j].pixel
                    != int'(qry_conv_map[(k * num_acl_output_rows + i) * num_acl_output_cols + j].pixel)) begin
                    return 1;
                end
            end
        end
    end 
    
    
    return 0;
endfunction: checkSolution


`endif