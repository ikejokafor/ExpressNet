`ifndef	__CNN_LAYER_ACCEL_AWE_ROWBUFFERS_INTF__
`define	__CNN_LAYER_ACCEL_AWE_ROWBUFFERS_INTF__


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


interface cnn_layer_accel_awe_rowbuffers_intf (
    clk                         ,   
    ce0_pixel_dataout           ,
    ce1_pixel_dataout           ,
    ce0_pixel_dataout_valid     ,
    ce1_pixel_dataout_valid     ,
    ce0_last_kernel             ,
    ce1_last_kernel    
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CE_PIXEL_DOUT_WIDTH = `PIXEL_WIDTH * `NUM_CE_PER_AWE;
   
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Interface Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input logic                                        clk                         ;
    input logic    [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce0_pixel_dataout           ;
    input logic    [   C_CE_PIXEL_DOUT_WIDTH - 1:0]    ce1_pixel_dataout           ;
	input logic                                        ce0_pixel_dataout_valid     ;
    input logic                                        ce1_pixel_dataout_valid     ;
    input logic                                        ce0_last_kernel             ;
    input logic                                        ce1_last_kernel             ;

    
	clocking clk_cb @(posedge clk);
        input ce0_pixel_dataout           ;
        input ce1_pixel_dataout           ;
        input ce0_pixel_dataout_valid     ;
        input ce1_pixel_dataout_valid     ;
        input ce0_last_kernel             ;        
        input ce1_last_kernel             ;        
	endclocking
    

endinterface: cnn_layer_accel_awe_rowbuffers_intf


`endif