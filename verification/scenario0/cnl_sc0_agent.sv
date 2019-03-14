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
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnl_sc0_generator.sv"


class sc0_agentParams_t extends agentParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc0_agentParams_t


class cnl_sc0_agent extends agent;
    extern function new(agentParams_t agentParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: cnl_sc0_agent


function cnl_sc0_agent::new(agentParams_t agentParams = null);
    sc0_agentParams_t sc0_agentParams;


    if(agentParams != null) begin
        $cast(sc0_agentParams, agentParams);
        m_agent2driverMB = sc0_agentParams.agent2driverMB;
        m_agent2scoreboardMB_arr  = sc0_agentParams.agent2scoreboardMB_arr;
        m_agent2monitorMB_arr = sc0_agentParams.agent2monitorMB_arr;
        m_numTests = sc0_agentParams.numTests;
        m_test_queue = sc0_agentParams.test_queue;
        m_DUT_rdy_arr = sc0_agentParams.DUT_rdy_arr;
        m_quad_intf = sc0_agentParams.quad_intf;
        m_num_mon = sc0_agentParams.num_mon;
    end
endfunction : new


task cnl_sc0_agent::run();
    int i;
    int j;
    int k;
    int n;
    int t;
    int signal;
    cnl_sc0_generator test;
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
            $display("// Created Random Test ---------------------------------------");
            $display("// Num Rows:            %0d", test.m_num_input_rows             );
            $display("// Num Cols:            %0d", test.m_num_input_cols             );
            $display("// Num Depth:           %0d", test.m_depth                      );
            $display("// Num kernels:         %0d", test.m_num_kernels                );
            $display("// Num Kernel size:     %0d", test.m_kernel_size                );
            $display("// Stride               %0d", test.m_stride                     );
            $display("// Padding:             %0d", test.m_padding                    );
            $display("// Pixel data size:     %0d", test.m_pix_data.size()            );
            $display("// Kernel data size     %0d", test.m_kernel_data.size()         );
            $display("// Created Random Test ---------------------------------------");
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
        m_agent2driverMB.put(test);
        for(n = 0; n < m_num_mon; n = n + 1) begin
            m_agent2scoreboardMB_arr[n].put(test);
            m_agent2monitorMB_arr[n].put(test);
        end
        t = t + 1;
    end
endtask: run

    
`endif