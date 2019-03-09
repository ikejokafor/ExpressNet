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
        m_agent2scoreboardMB  = sc0_agentParams.agent2scoreboardMB;
        m_agent2monitorMB = sc0_agentParams.agent2monitorMB;
        m_numTests = sc0_agentParams.numTests;
        m_test_queue = sc0_agentParams.test_queue;
        m_DUT_rdy = sc0_agentParams.DUT_rdy;
        m_quad_intf = sc0_agentParams.quad_intf;
    end
endfunction : new


task cnl_sc0_agent::run();
    int i;
    int signal;
    cnl_sc0_generator test;

    
    i = 0;
    while(i < m_numTests) begin
        @(m_quad_intf.clk_if);
        if(m_DUT_rdy.try_get(signal)) begin      
            if(m_test_queue.size() > 0) begin
                test = m_test_queue.pop_front();
                test.plain2bits();
                m_agent2scoreboardMB.put(test);
                m_agent2monitorMB.put(test);
                m_agent2driverMB.put(test);            
                $display("// Running Test ----------------------------------------------");
                $display("// Num Rows:            %d", test.m_num_input_rows             );
                $display("// Num Cols:            %d", test.m_num_input_cols             );
                $display("// Num Depth:           %d", test.m_depth                      );
                $display("// Num kernels:         %d", test.m_num_kernels                );
                $display("// Num Kernel size:     %d", test.m_kernel_size                );
                $display("// Stride               %d", test.m_stride                     );
                $display("// Padding:             %d", test.m_padding                    );
                $display("// Pixel data size:     %d", test.m_pix_data.size()            );
                $display("// Kernel data size     %d", test.m_kernel_data.size()         );
                $display("// Running Test ---------------------------------------------");
                $display("\n");
                i = i + 1;
                continue;
            end
            test = new();
            void'(test.randomize());
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
            test.plain2bits();
            m_agent2scoreboardMB.put(test);
            m_agent2monitorMB.put(test);
            m_agent2driverMB.put(test);        
            $display("// Running Test ----------------------------------------------");
            $display("// Num Rows:            %d", test.m_num_input_rows             );
            $display("// Num Cols:            %d", test.m_num_input_cols             );
            $display("// Num Depth:           %d", test.m_depth                      );
            $display("// Num kernels:         %d", test.m_num_kernels                );
            $display("// Num Kernel size:     %d", test.m_kernel_size                );
            $display("// Stride               %d", test.m_stride                     );
            $display("// Padding:             %d", test.m_padding                    );
            $display("// Pixel data size:     %d", test.m_pix_data.size()            );
            $display("// Kernel data size     %d", test.m_kernel_data.size()         );
            $display("// Running Test ----------------------------------------------");
            $display("\n");
            i = i + 1;
        end
    end
endtask: run

    
`endif