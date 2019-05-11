`ifndef	__CNL_SC1_AGENT__
`define	__CNL_SC1_AGENT__


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
// Additional Comments:    This class receives test from the generator, passes the test to the scoreboard class
//                              and transforms them to hardware format and gives its to the driver class
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "agent.sv"
`include "cnl_sc1_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnl_sc1_generator.sv"


class `scX_agentParams_t extends agentParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: `scX_agentParams_t


class `cnl_scX_agent extends agent;
    extern function new(agentParams_t agentParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: `cnl_scX_agent


function `cnl_scX_agent::new(agentParams_t agentParams = null);
    `scX_agentParams_t `scX_agentParams;


    if(agentParams != null) begin
        $cast(`scX_agentParams, agentParams);
        m_agent2driverMB = `scX_agentParams.agent2driverMB;
        m_agent2scoreboardMB_arr  = `scX_agentParams.agent2scoreboardMB_arr;
        m_agent2monitorMB_arr = `scX_agentParams.agent2monitorMB_arr;
        m_numTests = `scX_agentParams.numTests;
        m_crt_test_queue = `scX_agentParams.crt_test_queue;
        m_DUT_rdy = `scX_agentParams.DUT_rdy;
        m_mon_rdy_arr = `scX_agentParams.mon_rdy_arr;
        m_quad_intf = `scX_agentParams.quad_intf;
        m_num_mon = `scX_agentParams.num_mon;
        m_runForever = `scX_agentParams.runForever;
        m_test_bi = `scX_agentParams.test_bi;
        m_test_ei = `scX_agentParams.test_ei;      
        m_outputDir = `scX_agentParams.outputDir;
    end
endfunction: new


task `cnl_scX_agent::run();
    int i;
    int j;
    int _i;
    int _j;
    int k;
    int t;
    int n;
    int ti;
    int ri;
    int ti_offset;
    int signal;
    `cnl_scX_generator test;
    `cnl_scX_generator test_queue[$];
    `scX_genParams_t `scX_genParams;
    integer fd0;
    integer fd1;
    int crpd_input_col_start;
    int crpd_input_row_start;
    int crpd_input_col_end;
    int crpd_input_row_end;
    int num_conv_input_rows;
    int num_conv_input_cols;
    logic [15:0] pix_data_sim[];
    

    ti = 0;
    ti_offset = m_crt_test_queue.size();
    fd0 = $fopen({m_outputDir, "/", "test_index.txt"}, "w");
    for(t = 0; t < m_numTests; t = t + 1) begin
        if(m_crt_test_queue.size() > 0) begin
            test = `cnl_scX_generator'(m_crt_test_queue[t]);
        end else if(!m_runForever) begin
            `scX_genParams = new();
            `scX_genParams.ti = ti + ti_offset;
            test = new(`scX_genParams);
            ti = ti + 1;
            void'(test.randomize());
            $display("// Created Random Test ------------------------------------------");
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
            $display("// Conv Output Format:    %0d", test.m_conv_out_fmt               );        
            $display("// Created Random Test ------------------------------------------");
            $display("\n");
            m_numTests = m_numTests + 1;
        end
        test_queue.push_back(test);
        $fwrite(fd0, "Test Index:                   %0d\n", test.m_ti                         ); 
        $fwrite(fd0, "Num Input Rows:               %0d\n", test.m_num_input_rows             );
        $fwrite(fd0, "Num Input Cols:               %0d\n", test.m_num_input_cols             );
        $fwrite(fd0, "Num Expd Input Rows:          %0d\n", test.m_num_expd_input_rows        );
        $fwrite(fd0, "Num Expd Input Cols;          %0d\n", test.m_num_expd_input_cols        );
        $fwrite(fd0, "Input Depth:                  %0d\n", test.m_depth                      );
        $fwrite(fd0, "Num Kernels:                  %0d\n", test.m_num_kernels                );
        $fwrite(fd0, "Kernel size:                  %0d\n", test.m_kernel_size                );
        $fwrite(fd0, "Stride:                       %0d\n", test.m_stride                     );
        $fwrite(fd0, "Padding:                      %0d\n", test.m_padding                    );
        $fwrite(fd0, "Upsample                      %0d\n", test.m_upsample                   );
        $fwrite(fd0, "Num Output Rows:              %0d\n", test.m_num_output_rows            );
        $fwrite(fd0, "Num Output Cols;              %0d\n", test.m_num_output_cols            ); 
        $fwrite(fd0, "Num Acl Output Rows:          %0d\n", test.m_num_acl_output_rows        );
        $fwrite(fd0, "Num Acl Output Cols;          %0d\n", test.m_num_acl_output_cols        ); 
        $fwrite(fd0, "Conv Output Format:           %0d\n", test.m_conv_out_fmt               );  
        $fwrite(fd0, "\n");
    end
    $fclose(fd0);
    
    
    t = 0;
    ti_offset = m_crt_test_queue.size();
    fd0 = $fopen({m_outputDir, "/", "test_index.txt"}, "a");
    if(m_test_ei != -1) begin
        m_numTests = (m_test_ei - m_test_bi) + 1;
    end else begin
        m_test_ei = m_numTests - 1;
    end
    while(t < m_numTests) begin
        while(!m_DUT_rdy.try_get(signal)) begin
            @(m_quad_intf.clk_if_cb);
        end
        while(n < m_num_mon) begin
            @(m_quad_intf.clk_core_cb);
            if(m_mon_rdy_arr[n].try_get(signal)) begin
                n = n + 1;
            end
        end
        
        if(m_runForever) begin
            //  `scX_genParams = new();
            //  `scX_genParams.ti = ti + ti_offset;
            //  test = new(`scX_genParams);
            //  ti = ti + 1;
            //  void'(test.randomize());
            //  $display("// Created Random Test ------------------------------------------");
            //  $display("// Test Index:            %0d", test.m_ti                         );            
            //  $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
            //  $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
            //  $display("// Input Depth:           %0d", test.m_depth                      );
            //  $display("// Num Kernels:           %0d", test.m_num_kernels                );
            //  $display("// Kernel size:           %0d", test.m_kernel_size                );
            //  $display("// Stride:                %0d", test.m_stride                     );
            //  $display("// Padding:               %0d", test.m_padding                    );
            //  $display("// Upsample               %0d", test.m_upsample                   );
            //  $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
            //  $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
            //  $display("// Num Acl Output Rows:   %0d", test.m_num_acl_output_rows        );
            //  $display("// Num Acl Output Cols:   %0d", test.m_num_acl_output_cols        );
            //  $display("// Conv Output Format:    %0d", test.m_conv_out_fmt               );             
            //  $display("// Created Random Test ------------------------------------------");
            //  $display("\n");
            //  test_queue.push_back(test);
            //  $fwrite(fd0, "Test Index:                   %0d\n", test.m_ti                         ); 
            //  $fwrite(fd0, "Num Input Rows:               %0d\n", test.m_num_input_rows             );
            //  $fwrite(fd0, "Num Input Cols:               %0d\n", test.m_num_input_cols             );
            //  $fwrite(fd0, "Num Expd Input Rows:          %0d\n", test.m_num_expd_input_rows        );
            //  $fwrite(fd0, "Num Expd Input Cols;          %0d\n", test.m_num_expd_input_cols        );
            //  $fwrite(fd0, "Input Depth:                  %0d\n", test.m_depth                      );
            //  $fwrite(fd0, "Num Kernels:                  %0d\n", test.m_num_kernels                );
            //  $fwrite(fd0, "Kernel size:                  %0d\n", test.m_kernel_size                );
            //  $fwrite(fd0, "Stride:                       %0d\n", test.m_stride                     );
            //  $fwrite(fd0, "Padding:                      %0d\n", test.m_padding                    );
            //  $fwrite(fd0, "Upsample                      %0d\n", test.m_upsample                   );
            //  $fwrite(fd0, "Num Output Rows:              %0d\n", test.m_num_output_rows            );
            //  $fwrite(fd0, "Num Output Cols;              %0d\n", test.m_num_output_cols            ); 
            //  $fwrite(fd0, "Num Acl Output Rows:          %0d\n", test.m_num_acl_output_rows        );
            //  $fwrite(fd0, "Num Acl Output Cols;          %0d\n", test.m_num_acl_output_cols        ); 
            //  $fwrite(fd0, "Conv Output Format:           %0d\n", test.m_conv_out_fmt               );             
            //  $fwrite(fd0, "\n");
            //  $fflush(fd0);
            $display("Run Forever Not Implemented");
            $stop;
        end
        

        ri = min(max(t + m_test_bi, t), m_test_ei);
        test = test_queue[ri];
        test.plain2bits();
        fd1 = $fopen({m_outputDir, "/", "map.txt"}, "w");
        for(k = 0; k < test.m_depth; k = k + 1) begin
            for(i = 0; i < test.m_num_input_rows; i = i + 1) begin
                for(j = 0; j < test.m_num_input_cols; j = j + 1) begin
                    $fwrite(fd1, "%d ", test.m_pix_data_sim[(k * test.m_num_input_rows + i) * test.m_num_input_cols + j]);
                end
                $fwrite(fd1, "\n");
            end
            $fwrite(fd1, "\n");
            $fwrite(fd1, "\n");
        end
        $fclose(fd1);
        if(test.m_upsample || test.m_padding) begin
            crpd_input_col_start = test.m_padding;
            crpd_input_row_start = test.m_padding;
            crpd_input_col_end = (test.m_num_expd_input_rows - 1) - test.m_padding;
            crpd_input_row_end = (test.m_num_expd_input_cols - 1) - test.m_padding;
            if(test.m_padding) begin
                num_conv_input_rows = test.m_num_expd_input_rows - 2;
                num_conv_input_cols = test.m_num_expd_input_cols - 2;
            end else begin
                num_conv_input_rows = test.m_num_expd_input_rows;
                num_conv_input_cols = test.m_num_expd_input_cols;
            end
            if(test.m_upsample) begin
                pix_data_sim = test.m_pix_data_upsle_sim;
            end else begin
                pix_data_sim = test.m_pix_data_sim;
            end
            fd1 = $fopen({m_outputDir, "/", "map_expd.txt"}, "w");
            for(k = 0; k < test.m_depth; k = k + 1) begin
                for(i = 0; i < test.m_num_expd_input_rows; i = i + 1) begin
                    for(j = 0; j < test.m_num_expd_input_cols; j = j + 1) begin
                        if(test.m_padding) begin
                            if(i < crpd_input_row_start || i > crpd_input_row_end || j < crpd_input_col_start || j > crpd_input_col_end) begin
                                $fwrite(fd1, "%5d ", 0);
                            end else begin
                                _i = i - 1;
                                _j = j - 1;
                                $fwrite(fd1, "%d ", pix_data_sim[(k * num_conv_input_rows + _i) * num_conv_input_cols + _j]);
                            end
                         end else begin
                            $fwrite(fd1, "%d ", pix_data_sim[(k * num_conv_input_rows + i) * num_conv_input_cols + j]);
                         end
                    end
                    $fwrite(fd1, "\n");
                end
                $fwrite(fd1, "\n");
                $fwrite(fd1, "\n");
            end
            $fclose(fd1);
        end
        fd1 = $fopen({m_outputDir, "/", "kernel_map.txt"}, "w");
        for(n = 0; n < test.m_num_kernels; n = n + 1) begin
            $fwrite(fd1, "Kernel %d\n", n);
            $fwrite(fd1, "\n");
            $fwrite(fd1, "\n");
            $fwrite(fd1, "\n");
            for(k = 0; k < test.m_depth; k = k + 1) begin
                $fwrite(fd1, "Depth %d\n", k);
                $fwrite(fd1, "\n");
                for(i = 0; i < test.m_kernel_size; i = i + 1) begin
                    for(j = 0; j < test.m_kernel_size; j = j + 1) begin
                        $fwrite(fd1, "%d ", test.m_kernel_data[((n * test.m_depth + k) * test.m_kernel_size + i) * test.m_kernel_size + j]);
                    end
                    $fwrite(fd1, "\n");
                end
            end
            $fwrite(fd1, "\n");
            $fwrite(fd1, "\n");
            $fwrite(fd1, "\n");
        end
        $fclose(fd1);
        
        
        if(test.m_stride >= 3 || test.m_padding >= 2) begin
            $stop;
        end
        
        
        m_agent2driverMB.put(test);
        for(n = 0; n < m_num_mon; n = n + 1) begin
            m_agent2scoreboardMB_arr[n].put(test);
            m_agent2monitorMB_arr[n].put(test);
        end
        if(!m_runForever) begin
            t = t + 1;
        end
    end
    $fclose(fd0);
 
 
endtask: run

    
`endif