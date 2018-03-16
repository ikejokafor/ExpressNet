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
module macc_dsp #(
    parameter SIZEIN = 16,   // width of the inputs
    parameter SIZEOUT = 40   // width of output
) (
    input clk,
    input accum_reg_rst,
    input signed [SIZEIN-1:0]   a,
    input signed [SIZEIN-1:0]   b,
    input signed [SIZEIN-1:0]   bias,
    output signed [SIZEOUT-1:0] accum_out
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //	Wires / Regs
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg signed [    SIZEIN - 1:0]   a_reg;
    reg signed [    SIZEIN - 1:0]   b_reg;
    reg                             sload_reg;
    reg signed [2 * SIZEIN - 1:0]   mult_reg;
    reg signed [   SIZEOUT - 1:0]   adder_out; 
    reg signed [   SIZEOUT - 1:0]   accum;

    
   	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign accum_out = adder_out;

    always@(*) begin
        if(accum_reg_rst) begin
            accum = 0;
        end else begin
            accum = bias;
        end
    end

    always@(posedge clk) begin
        a_reg       <= a;
        b_reg       <= b;
        accum       <= bias;
        mult_reg    <= a_reg * b_reg;
        // Store accumulation result into a register
        adder_out   <= accum + mult_reg;
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------



endmodule 
