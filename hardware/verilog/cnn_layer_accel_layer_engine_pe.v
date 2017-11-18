`timescale 1ns / 1ns
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
module cnn_layer_accel_layer_engine_pe #(
    C_PACKET_WIDTH = 66
) (
    clk                                 ,
    rst                                 ,
    
    layer_eng_rd_input_valid	        ,
    layer_eng_rd_input_accept	        ,
    layer_eng_rd_input_data		        ,
    layer_eng_rd_output_valid	        ,
    layer_eng_rd_output_accept	        ,
    layer_eng_rd_output_data	        ,

    layer_eng_wr_input_valid	        ,
    layer_eng_wr_input_accept	        ,
    layer_eng_wr_input_data		        ,
    layer_eng_wr_output_valid	        ,
    layer_eng_wr_output_accept	        ,
    layer_eng_wr_output_data	        
  
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
	`include "soc_it_defs.vh"
	`include "cnn_layer_accel_defines.vh"
	
	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------

	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                                           clk;
    input                                                           rst;
    
	input	                                layer_eng_rd_input_valid	        ;
	output		                            layer_eng_rd_input_accept	        ;
	input	[C_PACKET_WIDTH - 1:0]	        layer_eng_rd_input_data		        ;
	output		                            layer_eng_rd_output_valid	        ;
	input		                            layer_eng_rd_output_accept	        ;
	output	[C_PACKET_WIDTH - 1:0]	        layer_eng_rd_output_data	        ;
    
    input	                                layer_eng_wr_input_valid	        ;
	output		                            layer_eng_wr_input_accept	        ;
	input	[C_PACKET_WIDTH - 1:0]	        layer_eng_wr_input_data		        ;
	output		                            layer_eng_wr_output_valid	        ;
	input		                            layer_eng_wr_output_accept	        ;
	output	[C_PACKET_WIDTH - 1:0]	        layer_eng_wr_output_data	        ;
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------

	
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	genvar i;
	
	
	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign layer_eng_wr_output_valid	= layer_eng_rd_input_valid;	
    assign layer_eng_rd_input_accept    = layer_eng_wr_output_accept;	
    assign layer_eng_wr_output_data     = layer_eng_rd_input_data;		    
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule