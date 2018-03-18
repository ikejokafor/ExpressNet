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
// Additional Comments: Xilinx Simple Dual Port Single Clock RAM
//                      This code implements a parameterizable SDP single clock memory.
//                      If a reset or enable is not necessary, it may be tied off or removed from the code.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module xilinx_dual_port_1_clock_ram #(
    parameter C_RAM_WIDTH       = 64,                       // Specify RAM data width
    parameter C_RAM_DEPTH       = 512,                      // Specify RAM depth (number of entries)
    parameter C_SEQ_ACCESS      = 1
) (
    wrAddr,     
    rdAddr,     
    datain,        
    clk, 
    rst,
    wren,       
    rden,       
    dataout,
    count,
    count_rst,
    count_set,
    count_set_value,
    full    
);	
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Includes
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input       [   clog2(C_RAM_DEPTH) - 1:0]   wrAddr;     
    input       [   clog2(C_RAM_DEPTH) - 1:0]   rdAddr;     
    input       [          C_RAM_WIDTH - 1:0]   datain;        
    input                                       clk;
    input                                       rst;
    input                                       wren;       
    input                                       rden;       
    output reg  [          C_RAM_WIDTH - 1:0]   dataout;
    output reg  [       clog2(C_RAM_DEPTH):0]   count;
    input                                       count_rst;
    input                                       count_set;
    input       [       clog2(C_RAM_DEPTH):0]   count_set_value;
    output                                      full;

  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Regs
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [       C_RAM_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];
    wire    [clog2(C_RAM_DEPTH) - 1:0]    rd_address;
    reg     [clog2(C_RAM_DEPTH) - 1:0]    rd_addr_plus_one;
 
	
	// BEGIN BRAM Write logic -----------------------------------------------------------------------------------------------------------------------   
    always@(posedge clk) begin
        if(wren) begin
            BRAM[wrAddr] <= datain;
        end
    end
    // END BRAM Write logic -------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN BRAM Count logic -----------------------------------------------------------------------------------------------------------------------
    assign full = (count == C_RAM_DEPTH);
    
    always@(posedge clk) begin
        if(rst) begin
            count <= 0;
        end else begin
            if(count_rst) begin
                count <= 0;
            end else if(count_set) begin
                count <= count_set_value;
            end else if(wren && rden) begin
                count <= count;
            end else if(wren && count <= C_RAM_DEPTH) begin
                count <= count + 1;
            end else if(rden && count >= 0) begin
                count <= count - 1;
            end
        end
    end
    // END BRAM Count logic -------------------------------------------------------------------------------------------------------------------------
 
 
    // BEGIN BRAM Read logic ------------------------------------------------------------------------------------------------------------------------    
    generate
        if(C_SEQ_ACCESS) begin
            assign rd_address = (rden) ? rd_addr_plus_one : rdAddr;
       
            always@(posedge clk) begin
                rd_addr_plus_one <= rdAddr + 1;
                if(rden) begin
                    rd_addr_plus_one <= rd_addr_plus_one + 1;
                end
            end

            always@(posedge clk) begin
                dataout <= BRAM[rd_address];
            end
        end else begin     
            always@(posedge clk) begin
                if(rden) begin
                    dataout <= BRAM[rdAddr];
                end
            end
        end
    endgenerate
    // END BRAM logic ---------------------------------------------------------------------------------------------------------------------------------

endmodule
