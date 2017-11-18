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
module cnn_layer_accel_layer_engine #(
    parameter   C_NUM_LAYER_ENG_IO      = 18,
    parameter	C_PACKET_WIDTH	        = 66,
    parameter   C_NUM_LAYER_ENG_CTRL    = 2
) (
    clk,
    rst,
    
    layer_eng_io_input_valid	                        ,
    layer_eng_io_input_accept	                        ,
    layer_eng_io_input_data		                        ,
    layer_eng_io_output_valid	                        ,
    layer_eng_io_output_accept	                        ,
    layer_eng_io_output_data	                        ,

    layer_eng_ctrl_input_valid		                    ,
    layer_eng_ctrl_input_accept	                        ,
    layer_eng_ctrl_input_data		                    ,
    layer_eng_ctrl_output_valid	                        ,
    layer_eng_ctrl_output_accept	                    ,
    layer_eng_ctrl_output_data		                    
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
    input                                               clk;
    input                                               rst;
    
    
    input	[                   C_NUM_LAYER_ENG_IO - 1:0]           layer_eng_io_input_valid	        ;
	output	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_input_accept	        ;
	input	[(C_NUM_LAYER_ENG_IO * C_PACKET_WIDTH) - 1:0]	        layer_eng_io_input_data		        ;
	output	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_output_valid	        ;
	input	[                   C_NUM_LAYER_ENG_IO - 1:0]	        layer_eng_io_output_accept	        ;
	output	[(C_NUM_LAYER_ENG_IO * C_PACKET_WIDTH) - 1:0]	        layer_eng_io_output_data	        ;
  
    input[                   C_NUM_LAYER_ENG_CTRL - 1:0]             layer_eng_ctrl_input_valid		    ;
	output[                   C_NUM_LAYER_ENG_CTRL - 1:0]             layer_eng_ctrl_input_accept		;
	input[(C_NUM_LAYER_ENG_CTRL * C_PACKET_WIDTH) - 1:0]	         layer_eng_ctrl_input_data		    ;
	output[                   C_NUM_LAYER_ENG_CTRL - 1:0]	         layer_eng_ctrl_output_valid		;
	input[                   C_NUM_LAYER_ENG_CTRL - 1:0]	         layer_eng_ctrl_output_accept	    ;
	output[(C_NUM_LAYER_ENG_CTRL * C_PACKET_WIDTH) - 1:0]	         layer_eng_ctrl_output_data		    ;
    
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs / Integers
	//-----------------------------------------------------------------------------------------------------------------------------------------------

	
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	genvar i;
    for(i = 0; i < C_NUM_LAYER_ENG_IO; i = i + 1) begin // fix so not hardcoded
        cnn_layer_accel_layer_engine_pe #(
            .C_PACKET_WIDTH ( C_PACKET_WIDTH )
        )
        i0_cnn_layer_accel_layer_engine_pe  (
            .clk                            ( clk                                           ),
            .rst                            ( rst                                           ),
        
            .layer_eng_rd_input_valid	    ( layer_eng_io_input_valid	    [                         i]   ),   
            .layer_eng_rd_input_accept	    ( layer_eng_io_input_accept	    [                         i]   ),
            .layer_eng_rd_input_data		( layer_eng_io_input_data	    [(i * C_PACKET_WIDTH) +: C_PACKET_WIDTH]   ),
            .layer_eng_rd_output_valid	    ( layer_eng_io_output_valid	    [                         i]   ),
            .layer_eng_rd_output_accept	    ( layer_eng_io_output_accept	[                         i]   ),
            .layer_eng_rd_output_data	    ( layer_eng_io_output_data	    [(i * C_PACKET_WIDTH) +: C_PACKET_WIDTH]   ),  

            .layer_eng_wr_input_valid	    ( layer_eng_io_input_valid	    [                         i]   ),   
            .layer_eng_wr_input_accept	    ( layer_eng_io_input_accept	    [                         i]   ),
            .layer_eng_wr_input_data		( layer_eng_io_input_data	    [(i * C_PACKET_WIDTH) +: C_PACKET_WIDTH]  ),
            .layer_eng_wr_output_valid	    ( layer_eng_io_output_valid	    [                         i]   ),
            .layer_eng_wr_output_accept	    ( layer_eng_io_output_accept	[                         i]   ),
            .layer_eng_wr_output_data	    ( layer_eng_io_output_data	    [(i * C_PACKET_WIDTH) +: C_PACKET_WIDTH]   )               
        );
    end

    
    cnn_layer_accel_layer_engine_controller #(
       .C_NUM_LAYER_ENG_CTRL                            ( C_NUM_LAYER_ENG_CTRL                              ),
       .C_PACKET_WIDTH	                                ( C_PACKET_WIDTH	                                )   
    )
    i0_cnn_layer_accel_layer_engine_controller (
        .clk                                            ( clk                                           ),
        .rst                                            ( rst                                           ),
        
        .layer_eng_ctrl_input_valid		            ( layer_eng_ctrl_input_valid	[                                    0]	 ),
        .layer_eng_ctrl_input_accept		        ( layer_eng_ctrl_input_accept	[                                    0]  ),
        .layer_eng_ctrl_input_data		            ( layer_eng_ctrl_input_data		[(0 * C_PACKET_WIDTH) +: C_PACKET_WIDTH] ),
        .layer_eng_ctrl_output_valid		        ( layer_eng_ctrl_output_valid	[                                    0]  ),
        .layer_eng_ctrl_output_accept	            ( layer_eng_ctrl_output_accept	[                                    0]  ),
        .layer_eng_ctrl_output_data		            ( layer_eng_ctrl_output_data	[(0 * C_PACKET_WIDTH) +: C_PACKET_WIDTH] )
        
    );
 
	
	
	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule