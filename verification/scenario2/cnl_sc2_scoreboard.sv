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


    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_core_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            `scX_DUTOutParams                  = new();
            `scX_DUTOutParams.m_num_kernels    = test.m_num_kernels;
            `scX_DUTOutParams.m_depth          = test.m_depth;
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


function void `cnl_scX_scoreboard::createSolution(generator test, DUTOutput sol);
    `cnl_scX_generator `scX_test;
    `cnl_scX_DUTOutput `scX_sol;

    

    $cast(`scX_test, test);
    $cast(`scX_sol, sol);

endfunction: createSolution


function int `cnl_scX_scoreboard::checkSolution(DUTOutput query, DUTOutput sol);
    `cnl_scX_DUTOutput `scX_query;
    `cnl_scX_DUTOutput `scX_sol;
    int i;
    int j;
    int k;
    int n;
    int num_output_rows;  
    int num_output_cols;
    int num_sim_output_rows;   
    int num_sim_output_cols;
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
    
    

    
    
    return 0;
endfunction: checkSolution


`endif