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
// Description:   DSP module which takes its two inputs, subtracts them, squares them, and then 
//                --> if it is not last DSP, passes the result on to next DSP, or 
//                --> if it is the last DSP, it will accumulate values from previous DSP's.
//
// Dependencies:
//   
// Revision:
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
module cnn_layer_accel_macc_DSP  #(
    parameter C_DSP_INPUT_WIDTH  = 18,
    parameter C_INPUT_DELAY      = 1,
    parameter C_IS_ACCUM         = 0,
    parameter C_DSP_OUTPUT_WIDTH = 48
) (
    clk        ,
    rst        ,
    accum      ,
    a          ,
    b          ,
    pcin       ,
    pout       
); 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"

    
    
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs /Outputs
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    input                                       clk;
    input                                       rst;
    input                                       accum;
    input   signed [C_DSP_INPUT_WIDTH - 1:0]    a;
    input   signed [C_DSP_INPUT_WIDTH - 1:0]    b;
    input          [C_DSP_OUTPUT_WIDTH - 1:0]   pcin;
    output  reg    [C_DSP_OUTPUT_WIDTH - 1:0]   pout;
  
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Wire / Regs / Integers
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    reg signed [2 * C_DSP_INPUT_WIDTH :0]   m_reg;
    wire       [2 * C_DSP_INPUT_WIDTH :0]   m_reg_u;

    reg        [C_DSP_INPUT_WIDTH - 1:0]    a_delay_reg[C_INPUT_DELAY -1:0];
    reg        [C_DSP_INPUT_WIDTH - 1:0]    b_delay_reg[C_INPUT_DELAY -1:0];
    integer                                 idx;

    
    // BEGIN DSP Logic ------------------------------------------------------------------------------------------------------------------------------
    assign m_reg_u = m_reg;
    
    always@(posedge clk)begin
        a_delay_reg[0] <= a;
        b_delay_reg[0] <= b;
        for(idx = 1; idx < C_INPUT_DELAY; idx = idx + 1) begin
            a_delay_reg[idx] <= a_delay_reg[idx - 1];
            b_delay_reg[idx] <= b_delay_reg[idx - 1];
        end
    end
    
    always @(posedge clk) begin 
        if(rst) begin
            m_reg    <= 0;
        end  else begin
            m_reg <= a_delay_reg[C_INPUT_DELAY - 1] * b_delay_reg[C_INPUT_DELAY - 1];          
        end
    end 

    generate
        if(C_IS_ACCUM) begin
            always@(posedge clk) begin
                if(rst) begin
                    pout <= 0;
                end else if(accum) begin
                    pout <= m_reg_u + pcin + pout;
                end 
            end
        end else begin
            always@(posedge clk) begin
                if(rst) begin
                        pout <= 0;
                    end else begin
                        pout <= m_reg_u + pcin;
                    end
                end
            end
    endgenerate 
    // END DSP Logic --------------------------------------------------------------------------------------------------------------------------------

endmodule 
