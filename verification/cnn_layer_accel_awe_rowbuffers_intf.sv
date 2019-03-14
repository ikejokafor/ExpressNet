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
    output_row_ce0              ,
    output_row_ce1              ,
    output_col_ce0              ,
    output_col_ce1              ,
    ce0_last_kernel             ,
    ce1_last_kernel             ,
    ce0_cycle_counter           ,
    ce1_cycle_counter
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
    input logic                                 clk                         ;
    input logic [C_CE_PIXEL_DOUT_WIDTH - 1:0]   ce0_pixel_dataout           ;
    input logic [C_CE_PIXEL_DOUT_WIDTH - 1:0]   ce1_pixel_dataout           ;
	input logic                                 ce0_pixel_dataout_valid     ;
    input logic                                 ce1_pixel_dataout_valid     ;
    input int                                   output_row_ce0              ; 
    input int                                   output_row_ce1              ;
    input int                                   output_col_ce0              ;
    input int                                   output_col_ce1              ;
    input logic                                 ce0_last_kernel             ;
    input logic                                 ce1_last_kernel             ;
    input logic [                        2:0]   ce0_cycle_counter           ;
    input logic [                        2:0]   ce1_cycle_counter           ;
    
    
	clocking clk_cb @(posedge clk);
        input ce0_pixel_dataout           ;
        input ce1_pixel_dataout           ;
        input ce0_pixel_dataout_valid     ;
        input ce1_pixel_dataout_valid     ;
        input output_row_ce0              ;
        input output_row_ce1              ;
        input output_col_ce0              ;
        input output_col_ce1              ;
        input ce0_last_kernel             ;
        input ce1_last_kernel             ;
        input ce0_cycle_counter           ;
        input ce1_cycle_counter           ;
	endclocking
    

endinterface: cnn_layer_accel_awe_rowbuffers_intf


`endif