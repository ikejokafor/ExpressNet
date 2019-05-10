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
`include "cnl_sc0_defs.vh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnl_sc0_generator.sv"
`include "cnl_sc0_DUTOutput.sv"


class `scX_scoreParams_t extends scoreParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    int depth_offset;
endclass: `scX_scoreParams_t


class cnl_`scX_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator test, DUTOutput sol);
    extern function int checkSolution(DUTOutput query, DUTOutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf; 
    int m_depth_offset;
endclass: cnl_`scX_scoreboard


function cnl_`scX_scoreboard::new(scoreParams_t scoreParams = null);
    `scX_scoreParams_t `scX_scoreParams;

    if(scoreParams != null) begin
        $cast(`scX_scoreParams, scoreParams);
        m_agent2scoreboardMB = `scX_scoreParams.agent2scoreboardMB;
        m_monitor2scoreboardMB = `scX_scoreParams.monitor2scoreboardMB;
        m_quad_intf = `scX_scoreParams.quad_intf;
        m_scbd_done = `scX_scoreParams.scbd_done;
        m_numTests = `scX_scoreParams.numTests;
        m_depth_offset = `scX_scoreParams.depth_offset;
        m_tid = `scX_scoreParams.tid;
        m_runForever = `scX_scoreParams.runForever;
    end
endfunction: new


task cnl_`scX_scoreboard::run();
    cnl_`scX_generator test;
    cnl_`scX_DUTOutput query;
    cnl_`scX_DUTOutput sol;
    `scX_DUTOutParams_t `scX_DUTOutParams;
    int t;
    int signal;


    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            `scX_DUTOutParams                        = new();
            `scX_DUTOutParams.num_output_rows        = test.m_num_output_rows;
            `scX_DUTOutParams.num_output_cols        = test.m_num_output_cols;
            `scX_DUTOutParams.num_sim_output_rows    = test.m_num_sim_output_rows;
            `scX_DUTOutParams.num_sim_output_cols    = test.m_num_sim_output_cols;
            `scX_DUTOutParams.kernel_size            = test.m_kernel_size;
            `scX_DUTOutParams.depth_offset           = m_depth_offset;
            sol = new(`scX_DUTOutParams);            
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    $display("// Checking Test ------------------------------------------------");
                    $display("// Test Index:            %0d", test.m_ti                         ); 
                    $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
                    $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
                    $display("// Input Depth:           %0d", test.m_depth                      );
                    $display("// Num Kernels:           %0d", test.m_num_kernels                );
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
                        $display("//---------------------------------------------------------------");
                        $display("// Test Failed");
                        $display("//---------------------------------------------------------------");
                        $display("\n");
                    end else begin
                        $display("//---------------------------------------------------------------");
                        $display("// Test Failed");
                        $display("//---------------------------------------------------------------");
                        $display("\n");
                    end
                    break;
                end
            end
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
    m_scbd_done.put(signal);
endtask: run


function void cnl_`scX_scoreboard::createSolution(generator test, DUTOutput sol);
    cnl_`scX_generator `scX_test;
    cnl_`scX_DUTOutput `scX_sol;
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
    int num_sim_output_rows;
    int num_sim_output_cols;    
    logic[15:0] pix_data_sim[];
    

    $cast(`scX_test, test);
    $cast(`scX_sol, sol);
    num_input_rows                      = `scX_test.m_num_input_rows;
    num_input_cols                      = `scX_test.m_num_input_cols;    
    kernel_size                         = `scX_test.m_kernel_size;
    padding                             = `scX_test.m_padding;
    stride                              = `scX_test.m_stride;
    pix_data_sim                        = `scX_test.m_pix_data_sim;
    num_output_rows                     = `scX_sol.m_num_output_rows;
    num_output_cols                     = `scX_sol.m_num_output_cols;
    num_sim_output_rows                 = `scX_sol.m_num_sim_output_rows;
    num_sim_output_cols                 = `scX_sol.m_num_sim_output_cols;
    
    
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
                            `scX_sol.m_pix_data[((t * num_sim_output_rows + x) * num_sim_output_cols + y) * `NUM_CONV_WINDOW_VALUES + n].pixel 
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


function int cnl_`scX_scoreboard::checkSolution(DUTOutput query, DUTOutput sol);
    cnl_`scX_DUTOutput `scX_query;
    cnl_`scX_DUTOutput `scX_sol;
    int i;
    int j;
    int k;
    int n;
    int num_output_rows;  
    int num_output_cols;
    int num_sim_output_rows;   
    int num_sim_output_cols;    
    `scX_datum_t sol_conv_map[];
    `scX_datum_t qry_conv_map[];    
    integer fd;
    string str;

    $cast(`scX_query, query);
    $cast(`scX_sol, sol);
    num_output_rows        = `scX_sol.m_num_output_rows;
    num_output_cols        = `scX_sol.m_num_output_cols;
    num_sim_output_rows    = `scX_query.m_num_sim_output_rows;
    num_sim_output_cols    = `scX_query.m_num_sim_output_cols;    
    sol_conv_map           = `scX_sol.m_pix_data;
    qry_conv_map           = `scX_query.m_pix_data;
    
    
    str.itoa(m_tid);
    fd = $fopen({"sol_conv_map_", str, ".txt"}, "w");
    for(k = 0; k < `NUM_CE_PER_AWE; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                for(n = 0; n < (`NUM_CONV_WINDOW_VALUES - 1); n = n + 1) begin
                    $fwrite(fd, "%0d,", sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + n].pixel); 
                end
                $fwrite(fd, ";\t\t");
            end
            $fwrite(fd, "\n");
        end
        $fwrite(fd, "\n");
        $fwrite(fd, "\n");
    end
    $fclose(fd);


    str.itoa(m_tid);
    fd = $fopen({"qry_conv_map_", str, ".txt"}, "w");
    for(k = 0; k < `NUM_CE_PER_AWE; k = k + 1) begin
        for(i = 0; i < num_output_rows; i = i + 1) begin
            for(j = 0; j < num_output_cols; j = j + 1) begin
                for(n = 0; n < `NUM_CONV_WINDOW_VALUES; n = n + 1) begin
                    $fwrite(fd, "%0d,", qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + n].pixel);
                end
                $fwrite(fd, ";\t\t");
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
                for(n = 0; n < `NUM_CONV_WINDOW_VALUES - 1; n = n + 1) begin
                    if(sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + n].pixel 
                        == qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + n].pixel) begin
                        break;
                    end
                end
                if(n == `NUM_CONV_WINDOW_VALUES - 1) begin
                    str.itoa(m_tid);
                    fd = $fopen({"errorLog_", str, ".txt"}, "w");
                    $fwrite(fd, "Expected window row0 %0d %0d %0d; row1 %0d %0d %0d; row2 %0d %0d %0d\n", 
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 0].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 1].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 2].pixel, 
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 3].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 4].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 5].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 6].pixel,
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 7].pixel, 
                        sol_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 8].pixel
                    );
                    $fwrite(fd, "For AWE %0d, depth %0d, at output row %0d, output col %0d\n", m_tid, m_tid * 2 + k, i, j);
                    $fwrite(fd, "Recieved window row0 %0d %0d %0d; row1 %0d %0d %0d; row2 %0d, %0d, %0d\n",
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 0].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 1].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 2].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 3].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 4].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 5].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 6].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 7].pixel,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 8].pixel
                    );
                    $fwrite(fd, "At times row0 %0d %0d %0d; row1 %0d %0d %0d; row2 %0d, %0d, %0d\n",
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 0].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 1].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 2].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 3].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 4].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 5].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 6].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 7].sim_time,
                        qry_conv_map[((k * num_sim_output_rows + i) * num_sim_output_cols + j) * `NUM_CONV_WINDOW_VALUES + 8].sim_time
                    );
                    $fclose(fd);
                    $stop;
                end
            end
        end
    end 
    
    
    return 0;
endfunction: checkSolution


`endif