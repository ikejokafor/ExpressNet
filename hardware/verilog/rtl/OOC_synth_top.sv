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
module OOC_synth_top;

    logic clk_intf;
    logic clk_FAS;

    clk_wiz
    i0_clk_wiz (
        .clk_out1( clk_intf ),
        .clk_out2( clk_FAS  ),
        .clk_in1 ( );
    );

    cnn_layer_accel 
    i0_cnn_layer_accel(
        .clk_intf  ( clk_intf ),
        .clk_FAS   ( clk_FAS )    
    );
endmodule