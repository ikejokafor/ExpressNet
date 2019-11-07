`ifndef	__CNL_SC2_MONITOR__
`define	__CNL_SC2_MONITOR__


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
// Additional Comments:    This class drives the appropiate signals to recieve outputs from the DUT, transforms them into
//                              a more readable format, and passes it to the checker
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "monitor.sv"
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_awe_rowbuffers_intf.sv"
`include "`cnl_scX_DUTOutput.sv"
`include "`cnl_scX_generator.sv"


class `scX_monParams_t extends monParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf;
endclass: `scX_monParams_t;


class `cnl_scX_monitor extends monitor;
    extern function new(monParams_t monParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: `cnl_scX_monitor


function `cnl_scX_monitor::new(monParams_t monParams = null);
    `scX_monParams_t `scX_monParams;
  
  
    if(monParams != null) begin
        $cast(`scX_monParams, monParams);
        m_monitor2scoreboardMB = `scX_monParams.monitor2scoreboardMB;
        m_agent2monitorMB = `scX_monParams.agent2monitorMB;    
        m_numTests = `scX_monParams.numTests;
        m_DUT_rdy = `scX_monParams.DUT_rdy;
        m_quad_intf = `scX_monParams.quad_intf;
        m_mon_rdy = `scX_monParams.mon_rdy;
        m_tid = `scX_monParams.tid;
        m_runForever = `scX_monParams.runForever;        
    end
endfunction: new


task `cnl_scX_monitor::run();
    `scX_DUTOutParams_t `scX_DUTOutParams;
    `cnl_scX_DUTOutput query;
    `cnl_scX_generator test;
    int t;
    int signal;
    int slv_addr;
    int slv_reg_idx;
    t = 0;
    slv_reg_idx = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2monitorMB.try_get(test)) begin
            `scX_DUTOutParams                       = new();
            `scX_DUTOutParams.m_num_kernels         = test.m_num_kernels;
            `scX_DUTOutParams.m_depth               = test.m_depth;
            query                                   = new(`scX_DUTOutParams);
            m_mon_rdy.put(signal);
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.slv_dbg_rdAck && m_quad_intf.clk_if_cb.slv_dbg_rdAddr == `SLV_SPCE_CFG_REG) begin
                    query.m_acl_slv_reg[(slv_reg_idx * 16) +: 16] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                    $display("//---------------------------------------------------------------");
                    $display("// At Time: %0t", $time                                           ); 
                    $display("// Test Index: %0d", test.m_ti                                    );                    
                    $display("// Monitor Recieved last output"                                  );
                    $display("//---------------------------------------------------------------");
                    $display("\n");
                    break;
                end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAck) begin
                    slv_addr = m_quad_intf.clk_if_cb.slv_dbg_rdAddr >> 2;
                    if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_PIX_SEQ_LOW && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_PIX_SEQ_HIGH) begin
                        query.m_pix_seq_data_sim[slv_addr] <= m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                    end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_KRN_DATA_LOW  && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_KRN_DATA_HIGH) begin
                        query.m_kernel_data_sim[slv_addr] <= m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                    end else if(m_quad_intf.clk_if_cb.slv_dbg_rdAddr >= `SLV_SPCE_CFG_REG_LOW && m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= `SLV_SPCE_CFG_REG_HIGH) begin
                        query.m_acl_slv_reg[(slv_reg_idx * 16) +: 16] = m_quad_intf.clk_if_cb.slv_dbg_data[15:0];
                        slv_reg_idx = slv_reg_idx + 1;
                    end
                end
            end
            m_monitor2scoreboardMB.put(query);
            m_mon_rdy.put(signal);
            if(!m_runForever) begin
                t = t + 1;
            end
        end
    end
endtask: run


`endif