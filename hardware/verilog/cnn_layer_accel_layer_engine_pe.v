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
    parameter C_PACKET_WIDTH = 66,
    parameter C_NUM_PE       = 4
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
    input                                                   clk;
    input                                                   rst;

    input	[C_NUM_PE  - 1:0]                       layer_eng_rd_input_valid	        ;
	output	[C_NUM_PE  - 1:0] 	                  	layer_eng_rd_input_accept	        ;
	input	[(C_PACKET_WIDTH * C_NUM_PE) - 1:0]   	layer_eng_rd_input_data	            ;
    output	[C_NUM_PE  - 1:0]                       layer_eng_rd_output_valid	        ;
	input	[C_NUM_PE  - 1:0] 	                  	layer_eng_rd_output_accept	        ;
	output	[(C_PACKET_WIDTH * C_NUM_PE) - 1:0]	  	layer_eng_rd_output_data		    ; 

    input	[C_NUM_PE  - 1:0]                     	layer_eng_wr_input_valid	        ;
	output	[C_NUM_PE  - 1:0] 	                  	layer_eng_wr_input_accept	        ;
	input	[(C_PACKET_WIDTH * C_NUM_PE) - 1:0]	  	layer_eng_wr_input_data	            ;
    output	[C_NUM_PE  - 1:0]                       layer_eng_wr_output_valid	        ;
	input	[C_NUM_PE  - 1:0] 	                  	layer_eng_wr_output_accept	        ;
	output	[(C_PACKET_WIDTH * C_NUM_PE) - 1:0]	  	layer_eng_wr_output_data		    ; 
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------

	
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	genvar i;
	
	
	// BEGIN Layer Eng PE logic ---------------------------------------------------------------------------------------------------------------------
    assign layer_eng_rd_input_accept[0] = 1;
    assign layer_eng_rd_input_accept[1] = 1;  
    assign layer_eng_rd_input_accept[2] = 1;  
    assign layer_eng_rd_input_accept[3] = 1;      
    wire  [(C_PACKET_WIDTH * C_NUM_PE) - 1:0] packet_rd;
    assign packet_rd[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH] = layer_eng_rd_input_data[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH];
    assign packet_rd[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH] = layer_eng_rd_input_data[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH];
    assign packet_rd[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH] = layer_eng_rd_input_data[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH];
    assign packet_rd[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH] = layer_eng_rd_input_data[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH];
    assign layer_eng_rd_output_valid[0] = 0;
    assign layer_eng_rd_output_valid[1] = 0;
    assign layer_eng_rd_output_valid[2] = 0;
    assign layer_eng_rd_output_valid[3] = 0;
    assign layer_eng_rd_output_data[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_rd_output_data[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_rd_output_data[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_rd_output_data[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH] = 66'b0;

    assign layer_eng_wr_input_accept[0] = 1;
    assign layer_eng_wr_input_accept[1] = 1;  
    assign layer_eng_wr_input_accept[2] = 1;  
    assign layer_eng_wr_input_accept[3] = 1;      
    wire  [(C_PACKET_WIDTH * C_NUM_PE) - 1:0] packet_wr;
    assign packet_wr[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH] = layer_eng_wr_input_data[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH];
    assign packet_wr[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH] = layer_eng_wr_input_data[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH];
    assign packet_wr[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH] = layer_eng_wr_input_data[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH];
    assign packet_wr[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH] = layer_eng_wr_input_data[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH];
    assign layer_eng_wr_output_valid[0] = 0;
    assign layer_eng_wr_output_valid[1] = 0;
    assign layer_eng_wr_output_valid[2] = 0;
    assign layer_eng_wr_output_valid[3] = 0;
    assign layer_eng_wr_output_data[(C_PACKET_WIDTH * 0) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_wr_output_data[(C_PACKET_WIDTH * 1) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_wr_output_data[(C_PACKET_WIDTH * 2) +: C_PACKET_WIDTH] = 66'b0;
    assign layer_eng_wr_output_data[(C_PACKET_WIDTH * 3) +: C_PACKET_WIDTH] = 66'b0;    
	// END Layer Eng PE logic -----------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule