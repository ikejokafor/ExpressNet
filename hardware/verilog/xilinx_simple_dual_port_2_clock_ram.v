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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module xilinx_simple_dual_port_2_clock_ram #(
    parameter C_RAM_WIDTH       = 64,                   
    parameter C_RAM_DEPTH       = 512                   
) (
    wrAddr,     
    rdAddr,     
    datain, 
    clk_wr,    
    clk_rd,
    wren,       
    rden,       
    dataout   
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
    input                                       wren;       
    input                                       rden;       
    output      [          C_RAM_WIDTH - 1:0]   dataout;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Regs
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [       C_RAM_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];
    reg     [       C_RAM_WIDTH - 1:0]    dout_reg0;
    reg     [       C_RAM_WIDTH - 1:0]    dout_reg1;
    reg     [       C_RAM_WIDTH - 1:0]    dout_reg2;

	
	// BEGIN BRAM Write logic -----------------------------------------------------------------------------------------------------------------------   
    always@(posedge clk_wr) begin
        if(clk_wr) begin
            BRAM[wrAddr] <= datain;
        end
    end
    // END BRAM Write logic -------------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Read logic ------------------------------------------------------------------------------------------------------------------------     
    assign dataout = dout_reg2;
    
    always@(posedge clk_rd) begin
        if(rden) begin
            dout_reg0 <= BRAM[rdAddr];
            dout_reg1 <= dout_reg0;
            dout_reg2 <= dout_reg1;
        end
    end
    // END BRAM logic -------------------------------------------------------------------------------------------------------------------------------

endmodule
