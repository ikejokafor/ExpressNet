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
endclass: sc0_agentParams_t


class cnl_sc0_agent extends agent;
    extern function new(agentParams_t agentParams = null);
    extern task run();
endclass: cnl_sc0_agent


function cnl_sc0_agent::new(agentParams_t agentParams = null);
    sc0_agentParams_t sc0_agentParams;


    $cast(sc0_agentParams, agentParams);
    m_agent2driverMB = sc0_agentParams.agent2driverMB;
    m_agent2scoreboardMB  = sc0_agentParams.agent2scoreboardMB;
    m_agent2monitorMB = sc0_agentParams.agent2monitorMB;
    m_numTests = sc0_agentParams.numTests;
    m_test_queue = sc0_agentParams.test_queue;
    m_DUT_rdy = sc0_agentParams.DUT_rdy;    
endfunction : new


task cnl_sc0_agent::run();
    int i;
    int signal;
    cnl_sc0_generator test;

    

    for(i = 0; i < m_numTests; i = i + 1) begin
        m_DUT_rdy.get(signal);
        if(m_test_queue.size() > 0) begin
            test = m_test_queue.pop_front();
            m_agent2driverMB.put(test);
            m_agent2scoreboardMB.put(test);
            m_agent2monitorMB.put(test);
            $display("// Running Test ---------------------------------------------");
            $display("Num Rows:            %d", test.m_rows                         );
            $display("Num Cols:            %d", test.m_cols                         );
            $display("Num Depth:           %d", test.m_depth                        );
            $display("Num kernels:         %d", test.m_num_kernels                  );
            $display("Num Kernel size:     %d", test.m_kernel_size                  );
            $display("Pixel data size:     %d", test.m_pix_data.size()              );
            $display("Kernel data size     %d", test.m_kernel_data.size()           );
            $display("// Running Test ---------------------------------------------");
            $display("\n"); 
            continue;
        end
        test = new();
        void'(test.randomize());
        $display("// Created Test ---------------------------------------------");
        $display("Num Rows:            %d", test.m_rows                         );
        $display("Num Cols:            %d", test.m_cols                         );
        $display("Num Depth:           %d", test.m_depth                        );
        $display("Num kernels:         %d", test.m_num_kernels                  );
        $display("Num Kernel size:     %d", test.m_kernel_size                  );
        $display("Pixel data size:     %d", test.m_pix_data.size()              );
        $display("Kernel data size     %d", test.m_kernel_data.size()           );
        $display("// Created Test ---------------------------------------------");
        $display("\n");
        m_agent2driverMB.put(test);
        m_agent2scoreboardMB.put(test);
        m_agent2monitorMB.put(test);
        $display("// Running Test ---------------------------------------------");
        $display("Num Rows:            %d", test.m_rows                         );
        $display("Num Cols:            %d", test.m_cols                         );
        $display("Num Depth:           %d", test.m_depth                        );
        $display("Num kernels:         %d", test.m_num_kernels                  );
        $display("Num Kernel size:     %d", test.m_kernel_size                  );
        $display("Pixel data size:     %d", test.m_pix_data.size()              );
        $display("Kernel data size     %d", test.m_kernel_data.size()           );
        $display("// Running Test ---------------------------------------------");
        $display("\n");    
    end
endtask: run

    
`endif