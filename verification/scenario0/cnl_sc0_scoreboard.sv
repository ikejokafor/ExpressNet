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
`include "cnl_sc0_DUToutput.sv"


class sc0_scoreParams_t extends scoreParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf; 
endclass: sc0_scoreParams_t


class cnl_sc0_scoreboard extends scoreboard;
    extern function new(scoreParams_t scoreParams = null);
    extern task run();
    extern function void createSolution(generator genParams, DUToutput sol);
    extern function void checkSolution(DUToutput query, DUToutput sol);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf;    
endclass: cnl_sc0_scoreboard


function cnl_sc0_scoreboard::new(scoreParams_t scoreParams = null);
    sc0_scoreParams_t sc0_scoreParams;

    
    $cast(sc0_scoreParams, scoreParams);
    m_agent2scoreboardMB = sc0_scoreParams.agent2scoreboardMB;
    m_monitor2scoreboardMB = sc0_scoreParams.monitor2scoreboardMB;
    m_quad_intf = sc0_scoreParams.quad_intf;
    m_simOver = sc0_scoreParams.simOver;
    m_numTests = sc0_scoreParams.numTests;
endfunction: new


task cnl_sc0_scoreboard::run();
    cnl_sc0_generator test;
    cnl_sc0_DUToutput query;
    cnl_sc0_DUToutput sol;
    int i;

    for(i = 0; i < m_numTests; i = i + 1) begin
        @(m_quad_intf.clk_if);
        if(m_agent2scoreboardMB.try_get(test)) begin
            createSolution(test, sol);
            forever begin
                @(m_quad_intf.clk_if);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    checkSolution(query, sol);
                    $display("// Checked Test ---------------------------------------------");
                    $display("Num Rows:            %d", test.m_rows                         );
                    $display("Num Cols:            %d", test.m_cols                         );
                    $display("Num Depth:           %d", test.m_depth                        );
                    $display("Num kernels:         %d", test.m_num_kernels                  );
                    $display("Num Kernel size:     %d", test.m_kernel_size                  );
                    $display("Pixel data size:     %d", test.m_pix_data.size()              );
                    $display("Kernel data size     %d", test.m_kernel_data.size()           );
                    $display("// Checked Test ---------------------------------------------");
                    $display("\n");
                    break;
                end
            end
        end
    end
    ->m_simOver;
endtask: run


function void cnl_sc0_scoreboard::createSolution(generator genParams, DUToutput sol);
endfunction: createSolution


function void cnl_sc0_scoreboard::checkSolution(DUToutput query, DUToutput sol);
endfunction: checkSolution


`endif