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



module xilinx_true_dual_port_no_change_ram #(
    parameter C_RAM_A_WIDTH         = 16                        ,                   
    parameter C_RAM_A_DEPTH         = 1024                      ,
    parameter C_RAM_B_WIDTH         = 32                        ,                   
    parameter C_PORT_A_RAM_PERF     = "PORT_A_LOW_LATENCY"      ,
    parameter C_PORT_B_RAM_PERF     = "PORT_B_LOW_LATENCY"
) (
    clkA    ,
    addrA   ,
    wrenA   ,
    dinA    ,
    rdenA   ,  
    doutA   ,
    clkB    ,
    addrB   ,
    wrenB   ,
    dinB    ,
    rdenB   ,  
    doutB    
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
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                   clkA     ;    
    input   [C_CLG2_RAM_A_DEPTH - 1:0]      addrA    ;
    input                                   wrenA    ;  
    input   [     C_RAM_A_WIDTH - 1:0]      dinA     ;
    input                                   rdenA    ;
    output  [     C_RAM_A_WIDTH - 1:0]      doutA    ;
    input                                   clkB     ;    
    input   [C_CLG2_RAM_B_DEPTH - 1:0]      addrB    ;
    input                                   wrenB    ;  
    input   [     C_RAM_B_WIDTH - 1:0]      dinB     ;
    input                                   rdenB    ;
    output  [     C_RAM_B_WIDTH - 1:0]      doutB    ;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [C_RAM_A_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];

	
	// BEGIN BRAM Port A Write logic ----------------------------------------------------------------------------------------------------------------
    always@(posedge clkA) begin
        if(wrenA) begin
            BRAM[addrA] <= dinA;
        end
    end
    // END BRAM Port A Write logic ------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Port A Read logic -----------------------------------------------------------------------------------------------------------------   
    generate

        if(C_PORT_A_RAM_PERF == "PORT_A_HIGH_PERFORMANCE") begin

            reg [C_RAM_A_WIDTH - 1:0] dout_regA0;
            reg [C_RAM_A_WIDTH - 1:0] dout_regA1;
            reg [C_RAM_A_WIDTH - 1:0] dout_regA2;   
            assign doutA = dout_regA2;
            always@(posedge clkA) begin
                if(rdenA) begin
                    dout_regA0 <= BRAM[addrA];
                    dout_regA1 <= dout_regA0;
                    dout_regA2 <= dout_regA1;
                end
            end
            
        end else if(C_PORT_A_RAM_PERF == "PORT_A_LOW_LATENCY") begin

            reg [C_RAM_A_WIDTH - 1:0] dout_regA;
            assign doutA = dout_regA;        
            always@(posedge clkA) begin
                if(rdenA) begin
                    dout_regA <= BRAM[addrA];
                end
            end
            
        end

    endgenerate
    // END BRAM Port A logic ------------------------------------------------------------------------------------------------------------------------
    

	// BEGIN BRAM Port B Write logic ----------------------------------------------------------------------------------------------------------------
    always@(posedge clkB) begin
        if(wrenB) begin
            BRAM[addrB] <= dinB;
        end
    end
    // END BRAM Port B Write logic ------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Port B Read logic -----------------------------------------------------------------------------------------------------------------   
    generate

        if(C_PORT_B_RAM_PERF == "PORT_B_HIGH_PERFORMANCE") begin

            reg [C_RAM_B_WIDTH - 1:0] dout_regB0;
            reg [C_RAM_B_WIDTH - 1:0] dout_regB1;
            reg [C_RAM_B_WIDTH - 1:0] dout_regB2;   
            assign doutB = dout_regB2;
            always@(posedge clkB) begin
                if(rdenB) begin
                    dout_regB0 <= BRAM[addrB];
                    dout_regB1 <= dout_regB0;
                    dout_regB2 <= dout_regB1;
                end
            end
            
        end else if(C_PORT_B_RAM_PERF == "PORT_B_LOW_LATENCY") begin

            reg [C_RAM_B_WIDTH - 1:0] dout_regB;
            assign doutB = dout_regB;        
            always@(posedge clkB) begin
                if(rdenB) begin
                    dout_regB <= BRAM[addrB];
                end
            end
            
        end

    endgenerate
    // END BRAM Port B logic ------------------------------------------------------------------------------------------------------------------------

endmodule
