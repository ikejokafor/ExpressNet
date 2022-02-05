`ifndef	__CNN_LAYER_ACCEL_SYNCH_INTF__
`define	__CNN_LAYER_ACCEL_SYNCH_INTF__




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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


interface cnn_layer_accel_synch_intf (
    clk_if    ,
    clk_core  ,
    rst                             
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "math.svh"
    `include "utilities.svh"
    `include "cnn_layer_accel.svh"
    `include "cnn_layer_accel_AWP.svh"
    `include "cnn_layer_accel_conv1x1_pip.svh"
    `include "cnn_layer_accel_FAS.svh"
    `include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"
    `include "cnn_layer_accel_trans_fifo.svh"
    `include "awe.svh"
    `include "axi_defs.svh"
    
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Interface Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic            clk_if    ;
    input  logic            clk_core  ;
    output  logic           rst       ;

    
    clocking clk_if_cb @(posedge clk_if);
    endclocking
    

    clocking clk_core_cb @(posedge clk_core);
    endclocking
    
endinterface: cnn_layer_accel_synch_intf


`endif