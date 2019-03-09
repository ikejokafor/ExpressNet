`ifndef	__CNL_SC0_ENVIRONMENT__
`define	__CNL_SC0_ENVIRONMENT__


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
// Additional Comments:     
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnn_layer_accel_quad_intf.sv"
`include "cnl_sc0_generator.sv"
`include "cnl_sc0_agent.sv"
`include "cnl_sc0_driver.sv"
`include "cnl_sc0_scoreboard.sv"
`include "cnl_sc0_monitor.sv"
`include "cnl_sc0_assertion.sv"


class cnl_sc0_environment #(parameter C_PERIOD_100MHz, parameter C_PERIOD_500MHz);
    extern function new(virtual cnn_layer_accel_quad_intf quad_intf, int numTests, cnl_sc0_generator test_queue[$]);
    extern function void build();
    extern task run();
 

    virtual cnn_layer_accel_quad_intf   m_quad_intf;    
    int                                 m_numTests;
    cnl_sc0_generator                   m_test_queue[$];
    mailbox                             m_agent2driverMB;
    mailbox                             m_agent2scoreboardMB;
    mailbox                             m_monitor2scoreboardMB;
    mailbox                             m_agent2monitorMB;
    sc0_agentParams_t                   m_agentParams;
    sc0_drvParams_t                     m_drvParams;
    sc0_scoreParams_t                   m_scoreParams;
    sc0_monParams_t                     m_monParams;
    sc0_asrtParams_t                    m_asrtParams; 
    cnl_sc0_agent                       m_agent;
    cnl_sc0_driver                      m_driver;
    cnl_sc0_scoreboard                  m_scoreboard;
    cnl_sc0_monitor                     m_monitor;
    cnl_sc0_assertion                   m_assetion;
    mailbox                             m_DUT_rdy;
    mailbox                             m_mon_rdy;
    mailbox                             m_simOver;
endclass: cnl_sc0_environment


function cnl_sc0_environment::new(virtual cnn_layer_accel_quad_intf quad_intf, int numTests, cnl_sc0_generator test_queue[$]);
    m_quad_intf     = quad_intf;    
    m_numTests      = numTests;
    m_test_queue    = test_queue;
endfunction: new


function void cnl_sc0_environment::build();
    m_agent2driverMB = new();
    m_agent2scoreboardMB = new();
    m_monitor2scoreboardMB = new();
    m_agent2monitorMB = new();
    m_agentParams = new();
    m_drvParams = new();
    m_monParams = new();
    m_scoreParams = new();
    m_asrtParams = new();    
    m_DUT_rdy = new();
    m_mon_rdy = new();
    m_simOver = new();
    
    
    m_agentParams.agent2driverMB = m_agent2driverMB;
    m_agentParams.agent2scoreboardMB = m_agent2scoreboardMB;
    m_agentParams.agent2monitorMB = m_agent2monitorMB;
    m_agentParams.test_queue = m_test_queue;
    m_agentParams.numTests = m_numTests;
    m_agentParams.DUT_rdy = m_DUT_rdy;
    m_agentParams.quad_intf = m_quad_intf;
    m_drvParams.agent2driverMB = m_agent2driverMB;
    m_drvParams.quad_intf = m_quad_intf;
    m_drvParams.mon_rdy = m_mon_rdy;
    m_monParams.monitor2scoreboardMB = m_monitor2scoreboardMB;
    m_monParams.numTests = m_numTests;
    m_monParams.DUT_rdy = m_DUT_rdy;
    m_monParams.quad_intf = m_quad_intf;
    m_monParams.agent2monitorMB = m_agent2monitorMB;
    m_monParams.mon_rdy = m_mon_rdy;
    m_scoreParams.agent2scoreboardMB = m_agent2scoreboardMB;
    m_scoreParams.monitor2scoreboardMB = m_monitor2scoreboardMB;
    m_scoreParams.simOver = m_simOver;
    m_scoreParams.numTests = m_numTests;
    m_scoreParams.quad_intf = m_quad_intf;   


    m_agent = new(m_agentParams);
    m_driver = new(m_drvParams);
    m_scoreboard = new(m_scoreParams);
    m_monitor = new(m_monParams);
    m_assetion = new(m_asrtParams);
endfunction: build


task cnl_sc0_environment::run();
    int signal;


    m_quad_intf.rst <= 1;
    #(C_PERIOD_100MHz * 10) m_quad_intf.rst <= 0;    // 10 cycle rst asserted is arbitrairy
    
    
    fork
        m_agent.run();
        m_driver.run();
        m_scoreboard.run();
        m_monitor.run();
        m_assetion.run();
    join_none
    m_DUT_rdy.put(signal);
    
    
    while(!m_simOver.try_get(signal)) begin
        @(m_quad_intf.clk_if);
    end
    $stop;
endtask: run


`endif