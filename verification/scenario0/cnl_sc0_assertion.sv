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
// Additional Comments:    This class drives the appropiate signals to recieve outputs from the DUT, transforms them into
//                              a more readable format, and passes it to the checker
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "assertion.sv"


class sc0_asrtParams_t extends asrtParams_t;
endclass: sc0_asrtParams_t


class cnl_sc0_assertion extends assertion;
    extern function new(asrtParams_t asrtParams = null);
    extern task run();
endclass: cnl_sc0_assertion


function cnl_sc0_assertion::new(asrtParams_t asrtParams = null);

endfunction: new


task cnl_sc0_assertion::run();
endtask: run


`endif