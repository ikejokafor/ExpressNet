`ifndef __CNL_SC0_DUT_OUTPUT__
`define __CNL_SC0_DUT_OUTPUT__


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
`include "DUTOutput.sv"


class sc0_DUTOutParams_t extends DUTOutParams_t;
endclass: sc0_DUTOutParams_t


class cnl_sc0_DUToutput extends DUToutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
endclass: cnl_sc0_DUToutput


function cnl_sc0_DUToutput::new(DUTOutParams_t DUTOutParams = null);
endfunction: new


function void cnl_sc0_DUToutput::bits2plain();
endfunction: bits2plain


`endif