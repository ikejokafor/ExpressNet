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
`ifdef SIMULATION
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Outputs
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                        clk;
    input  logic                        ce;
    input  logic                        rst;
    input  logic [C_DATA_WIDTH - 1:0]   data_in;
    output logic [C_DATA_WIDTH - 1:0]   data_out;   
  
  
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Variables
    // ----------------------------------------------------------------------------------------------------------------------------------------------    
    reg   [C_DATA_WIDTH - 1:0]    shift_reg[C_CLOCK_CYCLES - 1:0];
    integer                       srl_index;
 
 
    // BEGIN LOGIC ----------------------------------------------------------------------------------------------------------------------------------
    generate
        if(C_CLOCK_CYCLES == 0) begin
            assign data_out = data_in;
        end else begin
            assign data_out = shift_reg[C_CLOCK_CYCLES - 1];
            always@(posedge clk) begin
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
    // END LOGIC --------------------------------------------------------------------------------------------------------------------------------------
`else
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Outputs
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input                          clk;
    input                          ce;
    input                          rst;
    input   [C_DATA_WIDTH - 1:0]   data_in;
    output  [C_DATA_WIDTH - 1:0]   data_out;   
  
  
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Variables
    // ----------------------------------------------------------------------------------------------------------------------------------------------    
    reg   [C_CLOCK_CYCLES - 1:0]    shift_reg [C_DATA_WIDTH - 1:0];
    integer                         srl_index;
    genvar i;
  
  
    // BEGIN LOGIC ----------------------------------------------------------------------------------------------------------------------------------
    generate
        if(C_CLOCK_CYCLES == 0) begin
            assign data_out = data_in;
        end else begin
            for(i = 0; i < C_DATA_WIDTH; i = i + 1) begin
                always@(posedge clk) begin
                    if(rst) begin 
                        for (srl_index = 0; srl_index < C_DATA_WIDTH; srl_index = srl_index + 1) begin
                            shift_reg[i] = {C_CLOCK_CYCLES{1'b0}};
                        end
                    end else if(ce) begin
                        if(C_CLOCK_CYCLES == 1) begin
                            shift_reg[i] <= {data_in[i]};
                        end else begin  
                            shift_reg[i] <= {shift_reg[i][C_CLOCK_CYCLES - 2:0], data_in[i]};
                        end
                    end
                end        
                assign data_out[i] = shift_reg[i][C_CLOCK_CYCLES - 1];
            end
        end
    endgenerate
    // END LOGIC --------------------------------------------------------------------------------------------------------------------------------------

`endif

endmodule          
