`ifndef __CNL_SC0_ASSERTION__
`define __CNL_SC0_ASSERTION__


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
// Additional Comments:    This class checks assertions of the DUT
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "assertion.sv"
`include "cnl_sc0_defs.vh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_quad_intf.sv"


class sc0_asrtParams_t extends asrtParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc0_asrtParams_t


class cnl_sc0_assertion extends assertion;
    extern function new(asrtParams_t asrtParams = null);
    extern task run();
    
    
    virtual cnn_layer_accel_quad_intf m_quad_intf;
endclass: cnl_sc0_assertion


function cnl_sc0_assertion::new(asrtParams_t asrtParams = null);
    sc0_asrtParams_t sc0_asrtParams;
    
    
    $cast(sc0_asrtParams, asrtParams);
    if(sc0_asrtParams != null) begin
        m_quad_intf = sc0_asrtParams.quad_intf;
    end
endfunction: new


task cnl_sc0_assertion::run();
endtask: run


`endif