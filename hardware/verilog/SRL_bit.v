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
module SRL_bit #(
    parameter C_CLOCK_CYCLES = 1
) (
    clk,
    rst,
    ce,
    data_in,
    data_out
);
`ifdef SIMULATION
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Ports
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic clk;
    input  logic rst;
    input  logic ce;
    input  logic data_in;
    output logic data_out;   
  

    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Variables
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    reg  shift_reg[C_CLOCK_CYCLES - 1:0];
    integer srl_index;
    
    generate
        if(C_CLOCK_CYCLES == 0) begin
            assign data_out = data_in;
        end else begin
            assign data_out = shift_reg[C_CLOCK_CYCLES - 1];
            always @(posedge clk) begin
                if(rst) begin
                    for(srl_index = 0; srl_index < C_CLOCK_CYCLES; srl_index = srl_index + 1) begin
                        shift_reg[srl_index] <= 0;
                    end
                end else if(ce) begin
                    shift_reg[0] <= data_in;
                    for(srl_index = 1; srl_index < C_CLOCK_CYCLES; srl_index = srl_index + 1) begin   
                        shift_reg[srl_index] <= shift_reg[srl_index - 1];
                    end
                end
            end
        end
    endgenerate
`else
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
                    if(C_CLOCK_CYCLES == 1) begin
                        shift_reg  <= {data_in};
                    end else begin   
                        shift_reg  <= {shift_reg[C_CLOCK_CYCLES - 2:0], data_in};
                    end
                end
            end
          
            assign data_out = shift_reg[C_CLOCK_CYCLES - 1];
        end
    endgenerate
`endif
endmodule                  
