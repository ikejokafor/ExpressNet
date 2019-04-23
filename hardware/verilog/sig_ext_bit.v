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
module sig_ext_bit #(
    parameter C_CLOCK_CYCLES   = 1
) (
    clk,
    ce,
    rst,
    data_in,
    data_out
);
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Outputs
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic clk;
    input  logic ce;
    input  logic rst;
    input  logic data_in;
    output logic data_out;   
  
  
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Variables
    // ----------------------------------------------------------------------------------------------------------------------------------------------    
    logic [C_CLOCK_CYCLES - 1:0]    ext_reg;
    integer                         idx;
  
  
    // BEGIN LOGIC ----------------------------------------------------------------------------------------------------------------------------------
    generate
        if(C_CLOCK_CYCLES == 0) begin
            assign data_out = data_in;
        end else begin
            assign data_out = |ext_reg;
            always@(posedge clk) begin
                if(ce) begin
                    ext_reg[0] <= data_in;
                    for(idx = 1; idx < C_CLOCK_CYCLES; idx = idx + 1) begin
                        ext_reg[idx] <= ext_reg[idx - 1];
                    end
                end
            end
        end
    endgenerate
    // END LOGIC --------------------------------------------------------------------------------------------------------------------------------------

endmodule          
