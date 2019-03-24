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
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnl_sc1_generator.sv"


class sc1_agentParams_t extends agentParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc1_agentParams_t


class cnl_sc1_agent extends agent;
    extern function new(agentParams_t agentParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: cnl_sc1_agent


function cnl_sc1_agent::new(agentParams_t agentParams = null);
    sc1_agentParams_t sc1_agentParams;


    if(agentParams != null) begin
        $cast(sc1_agentParams, agentParams);
        m_agent2driverMB = sc1_agentParams.agent2driverMB;
        m_agent2scoreboardMB_arr  = sc1_agentParams.agent2scoreboardMB_arr;
        m_agent2monitorMB_arr = sc1_agentParams.agent2monitorMB_arr;
        m_numTests = sc1_agentParams.numTests;
        m_test_queue = sc1_agentParams.test_queue;
        m_DUT_rdy_arr = sc1_agentParams.DUT_rdy_arr;
        m_quad_intf = sc1_agentParams.quad_intf;
        m_num_mon = sc1_agentParams.num_mon;
    end
endfunction : new


task cnl_sc1_agent::run();
    int i;
    int j;
    int k;
    int n;
    int t;
    int signal;
    cnl_sc1_generator test;
    integer fd;

    
    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        n = 0;
        while(n < m_num_mon) begin
            @(m_quad_intf.clk_if_cb);
            if(m_DUT_rdy_arr[n].try_get(signal)) begin
                n = n + 1;
            end
        end  
        if(m_test_queue.size() > 0) begin
            test = m_test_queue.pop_front();
            test.plain2bits();
        end else begin
            test = new();
            void'(test.randomize());
            $display("// Created Random Test ------------------------------------------");
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
            $display("// Created Random Test ------------------------------------------");
            $display("\n");
            test.plain2bits();
        end
        
        
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
        
        if(test.m_stride >= 3) begin
            $stop;
        end
        
        m_agent2driverMB.put(test);
        for(n = 0; n < m_num_mon; n = n + 1) begin
            m_agent2scoreboardMB_arr[n].put(test);
            m_agent2monitorMB_arr[n].put(test);
        end
        t = t + 1;
    end
endtask: run

    
`endif