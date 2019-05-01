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
// Additional Comments:     Template
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_quad_intf.sv"
`include "cnl_sc0_defs.vh"
`include "cnl_sc0_generator.sv"
`include "cnl_sc0_agent.sv"
`include "cnl_sc0_driver.sv"
`include "cnl_sc0_scoreboard.sv"
`include "cnl_sc0_monitor.sv"
`include "cnl_sc0_assertion.sv"


class `cnl_scX_environment #(parameter C_PERIOD_100MHz, parameter C_PERIOD_500MHz);
    extern function new(virtual cnn_layer_accel_quad_intf quad_intf, int numTests, `cnl_scX_generator test_queue[$], virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf_arr[`NUM_AWE], int num_mon, bool runForever, bool model_delay);
    extern function void build();
    extern task run();
 

    virtual cnn_layer_accel_quad_intf   m_quad_intf;    
    int                                 m_numTests;
    `cnl_scX_generator                   m_test_queue[$];
    mailbox                             m_agent2driverMB;
    mailbox                             m_agent2scoreboardMB_arr[];
    mailbox                             m_monitor2scoreboardMB_arr[];
    mailbox                             m_agent2monitorMB_arr[];
    `scX_agentParams_t                  m_agentParams;
    `scX_drvParams_t                    m_drvParams;
    `scX_scoreParams_t                  m_scoreParams_arr[];
    `scX_monParams_t                    m_monParams_arr[];
    `scX_asrtParams_t                   m_asrtParams; 
    `cnl_scX_agent                      m_agent;
    `cnl_scX_driver #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) m_driver;
    `cnl_scX_scoreboard                 m_scoreboard_arr[];
    `cnl_scX_monitor                    m_monitor_arr[];
    `cnl_scX_assertion                  m_assetion;
    mailbox                             m_DUT_rdy_arr[];
    mailbox                             m_mon_rdy_arr[];
    mailbox                             m_scbd_done_arr[];
    virtual cnn_layer_accel_awe_rowbuffers_intf m_awe_buf_intf_arr[`NUM_AWE];
    int m_num_mon; 
    int m_num_scbd;
    bool m_runForever;
    bool m_model_delay;
endclass: `cnl_scX_environment


function `cnl_scX_environment::new(virtual cnn_layer_accel_quad_intf quad_intf, int numTests, `cnl_scX_generator test_queue[$], virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf_arr[`NUM_AWE], int num_mon, bool runForever, bool model_delay);
    m_quad_intf                 = quad_intf;    
    m_numTests                  = numTests;
    m_test_queue                = test_queue;
    m_awe_buf_intf_arr          = awe_buf_intf_arr;
    m_num_mon                   = num_mon;
    m_num_scbd                  = num_mon;
    m_agent2scoreboardMB_arr    = new[num_mon];
    m_monitor2scoreboardMB_arr  = new[num_mon];
    m_agent2monitorMB_arr       = new[num_mon];
    m_scoreParams_arr           = new[num_mon];
    m_monParams_arr             = new[num_mon];
    m_DUT_rdy_arr               = new[num_mon];
    m_mon_rdy_arr               = new[num_mon];
    m_scbd_done_arr             = new[num_mon];
    m_scoreboard_arr            = new[num_mon];
    m_monitor_arr               = new[num_mon];
    m_runForever                = runForever;
    m_model_delay               = model_delay;    
endfunction: new


function void `cnl_scX_environment::build();
    int i;
    

    m_agent2driverMB = new();
    m_agentParams = new();
    m_drvParams = new();
    m_asrtParams = new();
    for(i = 0; i < m_num_mon; i = i + 1) begin
        m_agent2monitorMB_arr[i] = new();
        m_agent2scoreboardMB_arr[i] = new();
        m_monitor2scoreboardMB_arr[i] = new();
        m_monParams_arr[i] = new();
        m_scoreParams_arr[i] = new();
        m_DUT_rdy_arr[i] = new();
        m_mon_rdy_arr[i] = new();
        m_scbd_done_arr[i] = new();   
    end
    
    
    m_agentParams.agent2driverMB = m_agent2driverMB;
    m_agentParams.agent2scoreboardMB_arr = m_agent2scoreboardMB_arr;
    m_agentParams.agent2monitorMB_arr = m_agent2monitorMB_arr;
    m_agentParams.test_queue = m_test_queue;
    m_agentParams.numTests = m_numTests;
    m_agentParams.DUT_rdy_arr = m_DUT_rdy_arr;
    m_agentParams.quad_intf = m_quad_intf;
    m_agentParams.num_mon = m_num_mon;
    m_agentParams.runForever = m_runForever;    
    m_drvParams.agent2driverMB = m_agent2driverMB;
    m_drvParams.quad_intf = m_quad_intf;
    m_drvParams.mon_rdy_arr = m_mon_rdy_arr;
    m_drvParams.num_mon = m_num_mon;
    m_drvParams.numTests = m_numTests;
    m_drvParams.runForever = m_runForever;
    m_drvParams.model_delay = m_model_delay;    
    m_agent = new(m_agentParams);
    m_driver = new(m_drvParams);
    m_assetion = new(m_asrtParams);    
    for(i = 0; i < m_num_mon; i = i + 1) begin
        m_monParams_arr[i].monitor2scoreboardMB = m_monitor2scoreboardMB_arr[i];
        m_monParams_arr[i].numTests = m_numTests;
        m_monParams_arr[i].DUT_rdy = m_DUT_rdy_arr[i];
        m_monParams_arr[i].quad_intf = m_quad_intf;
        m_monParams_arr[i].agent2monitorMB = m_agent2monitorMB_arr[i];
        m_monParams_arr[i].mon_rdy = m_mon_rdy_arr[i];
        m_monParams_arr[i].awe_buf_intf = m_awe_buf_intf_arr[i];
        m_monParams_arr[i].tid = i;
        m_monParams_arr[i].runForever = m_runForever;
        m_monParams_arr[i].model_delay = m_model_delay;        
        m_scoreParams_arr[i].agent2scoreboardMB = m_agent2scoreboardMB_arr[i];
        m_scoreParams_arr[i].monitor2scoreboardMB = m_monitor2scoreboardMB_arr[i];
        m_scoreParams_arr[i].scbd_done = m_scbd_done_arr[i];
        m_scoreParams_arr[i].numTests = m_numTests;
        m_scoreParams_arr[i].quad_intf = m_quad_intf;
        m_scoreParams_arr[i].depth_offset = i * `NUM_CE_PER_AWE;
        m_scoreParams_arr[i].tid = i;
        m_scoreParams_arr[i].runForever = m_runForever;        
        m_scoreboard_arr[i] = new(m_scoreParams_arr[i]);
        m_monitor_arr[i] = new(m_monParams_arr[i]);        
    end
endfunction: build


task `cnl_scX_environment::run();
    int i;
    int signal;
    
    
    fork
        m_agent.run();
        m_driver.run();
        m_assetion.run();
    join_none
    for(i = 0; i < m_num_mon; i = i + 1) begin
        fork
            automatic int j = i;
            begin
                m_scoreboard_arr[j].run();
            end
            begin
                m_monitor_arr[j].run();
            end
        join_none
    end
    for(i = 0; i < m_num_mon; i = i + 1) begin
        m_DUT_rdy_arr[i].put(signal);
    end

    
    i = 0;
    while(i < m_num_scbd) begin
        @(m_quad_intf.clk_if_cb);
        if(m_scbd_done_arr[i].try_get(signal)) begin
            i = i + 1;
        end
    end
    $stop;
endtask: run


`endif