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
//                         
//                         
//                         
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_weight_seq_data_table_top (
    clk         ,
    rst         ,
    rdAddr      ,
    rden        ,
    seq_dout0   ,
    seq_dout1   
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"
 

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_RDADDR_WIDTH       = clog2(`NUM_WHT_SEQ_VALUES);
    localparam C_SEQ_DOUT_WIDTH     = `WHT_SEQ_WIDTH * `NUM_WHT_SEQ_TABLE_PER_AWE;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
    input                                   clk         ;
    input                                   rst         ;
    input       [  C_RDADDR_WIDTH - 1:0]    rdAddr      ;
    input                                   rden        ;
    output reg  [C_SEQ_DOUT_WIDTH - 1:0]    seq_dout0   ;
    output reg  [C_SEQ_DOUT_WIDTH - 1:0]    seq_dout1   ;
 

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    cnn_layer_accel_weight_seq_data_table0 
    i0_cnn_layer_accel_weight_seq_data_table0 (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .rdAddr     ( rdAddr                                                ),
        .rden       ( rden                                                  ),
        .seq_dout0  ( seq_dout0[(0 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     ),
        .seq_dout1  ( seq_dout1[(0 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     )
    );

    
    cnn_layer_accel_weight_seq_data_table1
    i0_cnn_layer_accel_weight_seq_data_table1 (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .rdAddr     ( rdAddr                                                ),
        .rden       ( rden                                                  ),
        .seq_dout0  ( seq_dout0[(1 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     ),
        .seq_dout1  ( seq_dout1[(1 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     )
    );

    
    cnn_layer_accel_weight_seq_data_table2
    i0_cnn_layer_accel_weight_seq_data_table2 (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .rdAddr     ( rdAddr                                                ),
        .rden       ( rden                                                  ),
        .seq_dout0  ( seq_dout0[(2 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     ),
        .seq_dout1  ( seq_dout1[(2 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     )
    );

    
    cnn_layer_accel_weight_seq_data_table3
    i0_cnn_layer_accel_weight_seq_data_table1 (
        .clk        ( clk                                                   ),
        .rst        ( rst                                                   ),
        .rdAddr     ( rdAddr                                                ),
        .rden       ( rden                                                  ),
        .seq_dout0  ( seq_dout0[(3 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     ),
        .seq_dout1  ( seq_dout1[(3 * `WHT_SEQ_WIDTH) +: `WHT_SEQ_WIDTH]     )
    );  
    
    
endmodule