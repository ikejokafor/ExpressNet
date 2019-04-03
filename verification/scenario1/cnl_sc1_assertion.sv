`ifndef __CNL_SC1_ASSERTION__
`define __CNL_SC1_ASSERTION__


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


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "assertion.sv"


class sc1_asrtParams_t extends asrtParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
endclass: sc1_asrtParams_t


class cnl_sc1_assertion extends assertion;
    extern function new(asrtParams_t asrtParams = null);
    extern task run();
endclass: cnl_sc1_assertion


function cnl_sc1_assertion::new(asrtParams_t asrtParams = null);


    if(asrtParams != null) begin
    
    end
endfunction: new


task cnl_sc1_assertion::run();
endtask: run


`endif