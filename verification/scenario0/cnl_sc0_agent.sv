`ifndef	__CNL_SC0_AGENT__
`define	__CNL_SC0_AGENT__


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
`include "cnl_sc0_defs.vh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnl_sc0_generator.sv"


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
    int ti_offset;
    int signal;
    `cnl_scX_generator test;
    `cnl_scX_generator test_queue[$];
    `scX_genParams_t `scX_genParams;
    integer fd;
    int crpd_input_col_start;
    int crpd_input_row_start;
    int crpd_input_col_end;
    int crpd_input_row_end;
    int num_conv_input_rows;
    int num_conv_input_cols;
    logic [15:0] pix_data_sim[];
    

    ti = 0;
    ti_offset = m_crt_test_queue.size();
    fd = $fopen("test_index.txt", "w");

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
        end
        test_queue.push_back(test);
        $fwrite(fd, "Test Index:                   %0d\n", test.m_ti                         ); 
        $fwrite(fd, "Num Input Rows:               %0d\n", test.m_num_input_rows             );
        $fwrite(fd, "Num Input Cols:               %0d\n", test.m_num_input_cols             );
        $fwrite(fd, "Num Expd Input Rows:          %0d\n", test.m_num_expd_input_rows        );
        $fwrite(fd, "Num Expd Input Cols;          %0d\n", test.m_num_expd_input_cols        );
        $fwrite(fd, "Input Depth:                  %0d\n", test.m_depth                      );
        $fwrite(fd, "Num Kernels:                  %0d\n", test.m_num_kernels                );
        $fwrite(fd, "Kernel size:                  %0d\n", test.m_kernel_size                );
        $fwrite(fd, "Stride:                       %0d\n", test.m_stride                     );
        $fwrite(fd, "Padding:                      %0d\n", test.m_padding                    );
        $fwrite(fd, "Upsample                      %0d\n", test.m_upsample                   );
        $fwrite(fd, "Num Output Rows:              %0d\n", test.m_num_output_rows            );
        $fwrite(fd, "Num Output Cols;              %0d\n", test.m_num_output_cols            ); 
        $fwrite(fd, "Num Acl Output Rows:          %0d\n", test.m_num_acl_output_rows        );
        $fwrite(fd, "Num Acl Output Cols;          %0d\n", test.m_num_acl_output_cols        ); 
        $fwrite(fd, "Conv Output Format:           %0d\n", test.m_conv_out_fmt               );  
        $fwrite(fd, "\n");
    end
    $fclose(fd);

    
    t = 0;
    ti_offset = m_crt_test_queue.size();
    fd = $fopen("test_index.txt", "a");
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
            test_queue.push_back(test);
            $fwrite(fd, "Test Index:                   %0d\n", test.m_ti                         ); 
            $fwrite(fd, "Num Input Rows:               %0d\n", test.m_num_input_rows             );
            $fwrite(fd, "Num Input Cols:               %0d\n", test.m_num_input_cols             );
            $fwrite(fd, "Num Expd Input Rows:          %0d\n", test.m_num_expd_input_rows        );
            $fwrite(fd, "Num Expd Input Cols;          %0d\n", test.m_num_expd_input_cols        );
            $fwrite(fd, "Input Depth:                  %0d\n", test.m_depth                      );
            $fwrite(fd, "Num Kernels:                  %0d\n", test.m_num_kernels                );
            $fwrite(fd, "Kernel size:                  %0d\n", test.m_kernel_size                );
            $fwrite(fd, "Stride:                       %0d\n", test.m_stride                     );
            $fwrite(fd, "Padding:                      %0d\n", test.m_padding                    );
            $fwrite(fd, "Upsample                      %0d\n", test.m_upsample                   );
            $fwrite(fd, "Num Output Rows:              %0d\n", test.m_num_output_rows            );
            $fwrite(fd, "Num Output Cols;              %0d\n", test.m_num_output_cols            ); 
            $fwrite(fd, "Num Acl Output Rows:          %0d\n", test.m_num_acl_output_rows        );
            $fwrite(fd, "Num Acl Output Cols;          %0d\n", test.m_num_acl_output_cols        ); 
            $fwrite(fd, "Conv Output Format:           %0d\n", test.m_conv_out_fmt               );             
            $fwrite(fd, "\n");
            $fflush(fd);
        end
        
        test = test_queue.pop_front();
        test.plain2bits();
        fd = $fopen("map.txt", "w");
        for(k = 0; k < test.m_depth; k = k + 1) begin
            for(i = 0; i < test.m_num_input_rows; i = i + 1) begin
                for(j = 0; j < test.m_num_input_cols; j = j + 1) begin
                    $fwrite(fd, "%d ", test.m_pix_data_sim[(k * test.m_num_input_rows + i) * test.m_num_input_cols + j]);
                end
                $fwrite(fd, "\n");
            end
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
        end
        $fclose(fd);
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
            fd = $fopen("map_expd.txt", "w");
            for(k = 0; k < test.m_depth; k = k + 1) begin
                for(i = 0; i < test.m_num_expd_input_rows; i = i + 1) begin
                    for(j = 0; j < test.m_num_expd_input_cols; j = j + 1) begin
                        if(test.m_padding) begin
                            if(i < crpd_input_row_start || i > crpd_input_row_end || j < crpd_input_col_start || j > crpd_input_col_end) begin
                                $fwrite(fd, "%5d ", 0);
                            end else begin
                                _i = i - 1;
                                _j = j - 1;
                                $fwrite(fd, "%d ", pix_data_sim[(k * num_conv_input_rows + _i) * num_conv_input_cols + _j]);
                            end
                         end else begin
                            $fwrite(fd, "%d ", pix_data_sim[(k * num_conv_input_rows + i) * num_conv_input_cols + j]);
                         end
                    end
                    $fwrite(fd, "\n");
                end
                $fwrite(fd, "\n");
                $fwrite(fd, "\n");
            end
            $fclose(fd);
        end
        fd = $fopen("kernel_map.txt", "w");
        for(n = 0; n < test.m_num_kernels; n = n + 1) begin
            $fwrite(fd, "Kernel %d\n", n);
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
            $fwrite(fd, "\n");
            for(k = 0; k < test.m_depth; k = k + 1) begin
                $fwrite(fd, "Depth %d\n", k);
                $fwrite(fd, "\n");
                for(i = 0; i < test.m_kernel_size; i = i + 1) begin
                    for(j = 0; j < test.m_kernel_size; j = j + 1) begin
                        $fwrite(fd, "%d ", test.m_kernel_data[((n * test.m_depth + k) * test.m_kernel_size + i) * test.m_kernel_size + j]);
                    end
                    $fwrite(fd, "\n");
                end
            end
        end
        $fclose(fd);
        
        
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
    $fclose(fd);
    
endtask: run

    
`endif