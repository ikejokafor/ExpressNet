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
        m_agent2scoreboardMB  = sc1_agentParams.agent2scoreboardMB;
        m_agent2monitorMB = sc1_agentParams.agent2monitorMB;
        m_numTests = sc1_agentParams.numTests;
        m_test_queue = sc1_agentParams.test_queue;
        m_DUT_rdy = sc1_agentParams.DUT_rdy;
        m_quad_intf = sc1_agentParams.quad_intf;
    end
endfunction : new


task cnl_sc1_agent::run();
    int i;
    int signal;
    cnl_sc1_generator test;

    
    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_DUT_rdy.try_get(signal)) begin      
            if(m_test_queue.size() > 0) begin
                test = m_test_queue.pop_front();
                test.plain2bits();
                m_agent2scoreboardMB.put(test);
                m_agent2monitorMB.put(test);
                m_agent2driverMB.put(test);
                continue;
            end else begin
                test = new();
                void'(test.randomize());
                test.plain2bits();
                m_agent2scoreboardMB.put(test);
                m_agent2monitorMB.put(test);
                m_agent2driverMB.put(test);
                $display("\n");
            end
            $display("// Created Test ----------------------------------------------");
            $display("// Num Rows:            %d", test.m_num_input_rows             );
            $display("// Num Cols:            %d", test.m_num_input_cols             );
            $display("// Num Depth:           %d", test.m_depth                      );
            $display("// Num kernels:         %d", test.m_num_kernels                );
            $display("// Num Kernel size:     %d", test.m_kernel_size                );
            $display("// Stride               %d", test.m_stride                     );
            $display("// Padding:             %d", test.m_padding                    );
            $display("// Pixel data size:     %d", test.m_pix_data.size()            );
            $display("// Kernel data size     %d", test.m_kernel_data.size()         );
            $display("// Created Test ----------------------------------------------");
            $display("\n");
            i = i + 1;
        end
    end
endtask: run

    
`endif