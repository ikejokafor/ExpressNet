`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
module SRL_bit #(
    parameter C_CLOCK_CYCLES = 1
) (
    clk,
    rst,
    ce,
    data_in,
    data_out
);
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Ports
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input       clk;
    input       rst;
    input       ce;
    input       data_in;
    output      data_out;   
  

    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Variables
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    reg [C_CLOCK_CYCLES - 1:0] shift_reg;

    generate
        if(C_CLOCK_CYCLES == 0) begin
            assign data_out = data_in;
        end else begin
            always @(posedge clk) begin
                if(rst) begin
                    shift_reg  <= {C_CLOCK_CYCLES{1'b0}};
                end else if(ce) begin
                    if(C_CLOCK_CYCLES == 1)
                        shift_reg  <= {data_in};
                    else    
                        shift_reg  <= {shift_reg[C_CLOCK_CYCLES - 2:0], data_in};
                end
            end
          
            assign data_out = shift_reg[C_CLOCK_CYCLES - 1];
        end
    endgenerate
endmodule                  
