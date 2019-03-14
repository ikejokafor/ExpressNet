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
    int depth_offset;
    int tid;
endclass: sc0_scoreParams_t


class cnl_sc0_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator test, DUToutput sol);
    extern function int checkSolution(DUToutput query, DUToutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf; 
    int m_depth_offset;
    int m_tid;
endclass: cnl_sc0_scoreboard


function cnl_sc0_scoreboard::new(scoreParams_t scoreParams = null);
    sc0_scoreParams_t sc0_scoreParams;

    if(scoreParams != null) begin
        $cast(sc0_scoreParams, scoreParams);
        m_agent2scoreboardMB = sc0_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = sc0_scoreParams.monitor2scoreboardMB;
        m_quad_intf = sc0_scoreParams.quad_intf;
        m_scbd_done = sc0_scoreParams.scbd_done;
        m_numTests = sc0_scoreParams.numTests;
        m_depth_offset = sc0_scoreParams.depth_offset;
        m_tid = sc0_scoreParams.tid;
    end
endfunction: new


task cnl_sc0_scoreboard::run();
    cnl_sc0_generator test;
    cnl_sc0_DUTOutput query;
    cnl_sc0_DUTOutput sol;
    sc0_DUTOutParams_t sc0_DUTOutParams;
    int i;
    int signal;


    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            sc0_DUTOutParams                        = new();

            sc0_DUTOutParams.num_output_rows        = ((test.m_num_input_rows - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 1;
            sc0_DUTOutParams.num_output_cols        = ((test.m_num_input_cols - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 1;
            sc0_DUTOutParams.num_sim_output_rows    = ((test.m_num_input_cols - test.m_kernel_size + (2 * test.m_padding)) / test.m_stride) + 2;
            sc0_DUTOutParams.num_sim_output_cols    = test.m_num_input_cols;
            sc0_DUTOutParams.kernel_size            = test.m_kernel_size;
            sc0_DUTOutParams.depth_offset           = m_depth_offset;
            sol = new(sc0_DUTOutParams);            
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_core_cb);
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
    m_scbd_done.put(signal);
endtask: run


function void cnl_sc0_scoreboard::createSolution(generator test, DUToutput sol);
    cnl_sc0_generator sc0_test;
    cnl_sc0_DUTOutput sc0_sol;
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
    int t;
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
    

    $cast(sc0_test, test);
    $cast(sc0_sol, sol);
    num_input_rows                      = sc0_test.m_num_input_rows;
    num_input_cols                      = sc0_test.m_num_input_cols;    
    kernel_size                         = sc0_test.m_kernel_size;
    padding                             = sc0_test.m_padding;
    stride                              = sc0_test.m_stride;
    pix_data_sim                        = sc0_test.m_pix_data_sim;
    num_output_rows                     = sc0_sol.m_num_output_rows;
    num_output_cols                     = sc0_sol.m_num_output_cols;
    
    
    t = 0;
    for(m = m_depth_offset; m <(m_depth_offset + `NUM_CE_PER_AWE); m = m + 1) begin
        a = 0;
        for(x = 0; x < num_output_rows; x = x + 1) begin
            b = 0;
            for(y = 0; y < num_output_cols; y = y + 1) begin
                kr = 0;
                n = 0;
                for(i = a - padding; kr < kernel_size; i = i + 1) begin
                    kc = 0;
                    for(j = b - padding; kc < kernel_size; j = j + 1) begin
                        if((i >= 0 && j >= 0) && (i < num_input_rows && j < num_input_cols)) begin                      
                            sc0_sol.m_pix_data_sol[t][x][y][n].pixel 
                                = pix_data_sim[(m * num_input_rows + i) * num_input_cols + j];
                        end
                        kc = kc + 1;
                        n = n + 1;
                    end
                    kr = kr + 1;
                end
                b = b + stride;
            end
            a = a + stride;
        end
        t = t + 1;
    end
endfunction: createSolution


function int cnl_sc0_scoreboard::checkSolution(DUToutput query, DUToutput sol);
    cnl_sc0_DUTOutput sc0_query;
    cnl_sc0_DUTOutput sc0_sol;
    int i;
    int j;
    int k;
    int n;
    int num_output_rows;  
    int num_output_cols;
    int num_sim_output_rows;   
    int num_sim_output_cols;    
    sc0_datum_t sol_conv_map[][][][];
    sc0_datum_t qry_conv_map[][][][];    
    integer fd;
    
    
    $cast(sc0_query, query);
    $cast(sc0_sol, sol);
    num_output_rows        = sc0_sol.m_num_output_rows;
    num_output_cols        = sc0_sol.m_num_output_cols;
    num_sim_output_rows    = sc0_query.m_num_sim_output_rows;
    num_sim_output_cols    = sc0_query.m_num_sim_output_cols;    
    sol_conv_map           = sc0_sol.m_pix_data_sol;
    qry_conv_map           = sc0_query.m_pix_data_sol;
    
    
    fd = $fopen("sol_conv_map.txt", "w");
    for(k = 0; k < `NUM_CE_PER_AWE; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                for(n = 0; n < `KERNEL_3x3_COUNT_FULL_CFG; n = n + 1) begin
                    $fwrite(fd, "%d ", sol_conv_map[k][i][j][n].pixel);
                end
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);


    fd = $fopen("qry_conv_map.txt", "w");
    for(k = 0; k < `NUM_CE_PER_AWE; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                for(n = 0; n < `KERNEL_3x3_COUNT_FULL_CFG; n = n + 1) begin
                    $fwrite(fd, "%d ", qry_conv_map[k][i][j][n].pixel);
                end
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);
    
    
    for(k = 0; k < `NUM_CE_PER_AWE; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                for(n = 0; n < `KERNEL_3x3_COUNT_FULL_CFG - 1; n = n + 1) begin
                    if(sol_conv_map[k][i][j][n].pixel 
                        == qry_conv_map[k][i][j][n].pixel) begin
                        break;
                    end
                end
                if(n == `KERNEL_3x3_COUNT_FULL_CFG - 1) begin
                    $stop;
                end
            end
        end
    end 
    
    
    return 0;
endfunction: checkSolution


`endif