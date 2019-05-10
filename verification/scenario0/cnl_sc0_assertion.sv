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


class `scX_asrtParams_t extends asrtParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: `scX_asrtParams_t


class `cnl_scX_assertion extends assertion;
    extern function new(asrtParams_t asrtParams = null);
    extern task run();
endclass: `cnl_scX_assertion


function `cnl_scX_assertion::new(asrtParams_t asrtParams = null);


    if(asrtParams != null) begin
    
    end
endfunction: new


task `cnl_scX_assertion::run();
endtask: run


`endif