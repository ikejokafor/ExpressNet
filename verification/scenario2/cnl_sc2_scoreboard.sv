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
        m_scbd_rdy = `scX_scoreParams.scbd_rdy;
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
    fd = $fopen({m_outputDir, "/", "verification_results.csv"}, "w");
    $fwrite(fd, "Test Idx, PASS/FAIL\n");
    if(m_test_ei != -1) begin
        m_numTests = (m_test_ei - m_test_bi) + 1;
    end else begin
        m_test_ei = m_numTests - 1;
    end
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2scoreboardMB.try_get(test)) begin
            `scX_DUTOutParams                  = new();
            `scX_DUTOutParams.m_num_kernels    = test.m_num_kernels;
            `scX_DUTOutParams.m_depth          = test.m_depth;
            sol = new(`scX_DUTOutParams);            
            createSolution(test, sol);
            m_scbd_rdy.put(signal);
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_monitor2scoreboardMB.try_get(query)) begin
                    $display("// Checking Test ------------------------------------------------");
                    $display("// At Time: %0t", $time                                           );
                    $display("// Test Index: %0d", test.m_ti                                    );
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
    m_scbd_done.put(signal);
endtask: run


function void `cnl_scX_scoreboard::createSolution(generator test, DUTOutput sol);
    `cnl_scX_generator `scX_test;
    `cnl_scX_DUTOutput `scX_sol;
    $cast(`scX_test, test);
    $cast(`scX_sol, sol);
    `scX_sol.m_kernel_data_sim               = `scX_test.m_kernel_data_sim                ;
    `scX_sol.m_pix_seq_data_sim              = `scX_test.m_pix_seq_data_sim               ;
    `scX_sol.m_pfb_full_count_cfg            = `scX_test.m_pfb_full_count_cfg             ;      
    `scX_sol.m_stride_cfg    		         = `scX_test.m_stride_cfg    		          ;
    `scX_sol.m_conv_out_fmt_cfg              = `scX_test.m_conv_out_fmt_cfg               ;
    `scX_sol.m_padding_cfg                   = `scX_test.m_padding_cfg                    ;
    `scX_sol.m_num_output_cols_cfg           = `scX_test.m_num_output_cols_cfg            ;
    `scX_sol.m_num_output_rows_cfg           = `scX_test.m_num_output_rows_cfg            ;
    `scX_sol.m_pix_seq_data_full_count_cfg   = `scX_test.m_pix_seq_data_full_count_cfg    ;
    `scX_sol.m_upsample_cfg                  = `scX_test.m_upsample_cfg                   ;
    `scX_sol.m_num_expd_input_cols_cfg       = `scX_test.m_num_expd_input_cols_cfg        ;
    `scX_sol.m_num_expd_input_rows_cfg       = `scX_test.m_num_expd_input_rows_cfg        ;
    `scX_sol.m_crpd_input_col_start_cfg      = `scX_test.m_crpd_input_col_start_cfg       ;
    `scX_sol.m_crpd_input_row_start_cfg      = `scX_test.m_crpd_input_row_start_cfg       ;
    `scX_sol.m_crpd_input_col_end_cfg        = `scX_test.m_crpd_input_col_end_cfg         ;
    `scX_sol.m_crpd_input_row_end_cfg        = `scX_test.m_crpd_input_row_end_cfg         ;
    `scX_sol.m_num_kernels_cfg               = `scX_test.m_num_kernels_cfg                ;
    `scX_sol.m_master_quad_cfg               = `scX_test.m_master_quad_cfg                ;
    `scX_sol.m_cascade_cfg                   = `scX_test.m_cascade_cfg                    ;
    `scX_sol.m_actv_cfg                      = `scX_test.m_actv_cfg                       ;
endfunction: createSolution


function int `cnl_scX_scoreboard::checkSolution(DUTOutput query, DUTOutput sol);
    int i;
    int numValues;
    `cnl_scX_DUTOutput `scX_query;
    `cnl_scX_DUTOutput `scX_sol;
    $cast(`scX_query, query);
    $cast(`scX_sol, sol);
    numValues = `PIX_SEQ_BRAM_DEPTH;
    for(i = 0; i < numValues; i = i + 1) begin
        if(`scX_sol.m_pix_seq_data_sim[i] != `scX_query.m_pix_seq_data_sim[i]) begin
            $stop;
        end
    end
    numValues = `scX_sol.m_kernel_data_sim.size();
    for(i = 0; i < numValues; i = i + 1) begin
        if(`scX_sol.m_kernel_data_sim[i] != `scX_query.m_kernel_data_sim[i]) begin
            $stop;
        end
    end
    if(
        `scX_sol.m_pfb_full_count_cfg             != `scX_query.m_pfb_full_count_cfg         
        || `scX_sol.m_stride_cfg    		      != `scX_query.m_stride_cfg    		     
        || `scX_sol.m_conv_out_fmt_cfg            != `scX_query.m_conv_out_fmt_cfg           
        || `scX_sol.m_padding_cfg                 != `scX_query.m_padding_cfg                
        || `scX_sol.m_num_output_cols_cfg         != `scX_query.m_num_output_cols_cfg        
        || `scX_sol.m_num_output_rows_cfg         != `scX_query.m_num_output_rows_cfg        
        || `scX_sol.m_pix_seq_data_full_count_cfg != `scX_query.m_pix_seq_data_full_count_cfg
        || `scX_sol.m_upsample_cfg                != `scX_query.m_upsample_cfg               
        || `scX_sol.m_num_expd_input_cols_cfg     != `scX_query.m_num_expd_input_cols_cfg    
        || `scX_sol.m_num_expd_input_rows_cfg     != `scX_query.m_num_expd_input_rows_cfg    
        || `scX_sol.m_crpd_input_col_start_cfg    != `scX_query.m_crpd_input_col_start_cfg   
        || `scX_sol.m_crpd_input_row_start_cfg    != `scX_query.m_crpd_input_row_start_cfg   
        || `scX_sol.m_crpd_input_col_end_cfg      != `scX_query.m_crpd_input_col_end_cfg     
        || `scX_sol.m_crpd_input_row_end_cfg      != `scX_query.m_crpd_input_row_end_cfg     
        || `scX_sol.m_num_kernels_cfg             != `scX_query.m_num_kernels_cfg            
        || `scX_sol.m_master_quad_cfg             != `scX_query.m_master_quad_cfg            
        || `scX_sol.m_cascade_cfg                 != `scX_query.m_cascade_cfg                
        || `scX_sol.m_actv_cfg                    != `scX_query.m_actv_cfg                   
    ) begin
        $stop;
    end
    return 0;
endfunction: checkSolution


`endif