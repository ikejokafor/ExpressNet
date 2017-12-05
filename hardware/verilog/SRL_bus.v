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

module SRL_bus #(
  parameter C_CLOCK_CYCLES   = 1,
  parameter C_DATA_WIDTH     = 32
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
    input                          clk;
    input                          ce;
    input                          rst;
    input   [C_DATA_WIDTH - 1:0]   data_in;
    output  [C_DATA_WIDTH - 1:0]   data_out;   
  
  
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Regs / Integers
    // ----------------------------------------------------------------------------------------------------------------------------------------------    
    reg   [C_CLOCK_CYCLES - 1:0]    shift_reg [C_DATA_WIDTH - 1:0];
    integer                         srl_index;
  
  
    // BEGIN LOGIC ----------------------------------------------------------------------------------------------------------------------------------
    genvar i;
    generate
        for(i = 0; i < C_DATA_WIDTH; i = i + 1) begin
            always@(posedge clk) begin
                if(rst) begin 
                    for (srl_index = 0; srl_index < C_DATA_WIDTH; srl_index = srl_index + 1) begin
                        shift_reg[i] = {C_CLOCK_CYCLES{1'b0}};
                    end
                end else if(ce) begin
                    shift_reg[i] <= {shift_reg[i][C_CLOCK_CYCLES - 2:0], data_in[i]};
                end
            end        
            assign data_out[i] = shift_reg[i][C_CLOCK_CYCLES - 1];
        end
    endgenerate
    // END LOGIC --------------------------------------------------------------------------------------------------------------------------------------


endmodule          
