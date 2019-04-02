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
//                      
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module xilinx_simple_dual_port_no_change_2_clock_ram #(
    parameter C_RAM_A_WIDTH         = 16                        ,                   
    parameter C_RAM_A_DEPTH         = 1024                      ,
    parameter C_RAM_B_WIDTH         = 32                        ,                   
    parameter C_PORT_A_RAM_PERF     = "PORT_A_LOW_LATENCY"      ,
    parameter C_PORT_B_RAM_PERF     = "PORT_B_LOW_LATENCY"
) (
    wr_clk      ,
    wrAddr      ,
    wren        ,
    din         ,
    rd_clk      ,
    rdAddr      ,
    rden        ,
    dout    
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    localparam C_RAM_B_DEPTH            = C_RAM_A_DEPTH / (C_RAM_B_WIDTH / C_RAM_A_WIDTH);
    localparam C_RAM_DEPTH              = C_RAM_A_DEPTH;
    localparam C_CLG2_RAM_A_DEPTH       = clog2(C_RAM_A_DEPTH);
    localparam C_CLG2_RAM_B_DEPTH       = clog2(C_RAM_B_DEPTH);
   
  
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------4
    input                                   wr_clk      ;        
    input                                   rd_clk      ;
    input   [C_CLG2_RAM_A_DEPTH - 1:0]      wrAddr      ;
    input                                   wren        ;  
    input   [     C_RAM_A_WIDTH - 1:0]      din        ;
    input                                   rd_clk      ;    
    input   [C_CLG2_RAM_B_DEPTH - 1:0]      rdAddr      ;
    input                                   rden        ;
    output  [     C_RAM_B_WIDTH - 1:0]      dout        ;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [C_RAM_A_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];

	
	// BEGIN BRAM Port A Write logic ----------------------------------------------------------------------------------------------------------------
    always@(posedge wr_clk) begin
        if(wren) begin
            BRAM[wrAddr] <= din;
        end
    end
    // END BRAM Port A Write logic ------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Port B Read logic -----------------------------------------------------------------------------------------------------------------   
    generate
        if(C_PORT_B_RAM_PERF == "PORT_B_HIGH_PERFORMANCE") begin

            reg [C_RAM_B_WIDTH - 1:0] dout_reg0;
            reg [C_RAM_B_WIDTH - 1:0] dout_reg1;
            reg [C_RAM_B_WIDTH - 1:0] dout_reg2;   
            assign dout = dout_reg2;
            always@(posedge rd_clk) begin
                if(rden) begin
                    dout_reg0 <= BRAM[rdAddr];
                    dout_reg1 <= dout_reg0;
                    dout_reg2 <= dout_reg1;
                end
            end
            
        end else if(C_PORT_B_RAM_PERF == "PORT_B_LOW_LATENCY") begin

            reg [C_RAM_B_WIDTH - 1:0] dout_reg;
            assign dout = dout_reg;        
            always@(posedge rd_clk) begin
                if(rden) begin
                    dout_reg <= BRAM[rdAddr];
                end
            end
            
        end
    endgenerate
    // END BRAM Port B logic ------------------------------------------------------------------------------------------------------------------------

endmodule

