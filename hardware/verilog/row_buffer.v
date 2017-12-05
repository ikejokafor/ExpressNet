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
module row_buffer #(
    parameter C_PIXEL_WIDTH  = 16,             
    parameter C_IMAGE_WIDTH  = 256              
) (
    wr_addr,   
    din,       
    clk,       
    wren,      
    rden,      
    rst,       
    dout,      
    full,
    count
);	
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    // Includes
    // ----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input       [clog2(C_IMAGE_WIDTH) - 1:0]    wr_addr;
    input       [       C_PIXEL_WIDTH - 1:0]    din; 
    input                                       clk;
    input                                       wren;  
    input                                       rden;  
    input                                       rst; 
    output reg  [        C_PIXEL_WIDTH - 1:0]   dout;
    output                                      full;
    output reg  [clog2(C_IMAGE_WIDTH):0]        count;
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Regs
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [       C_PIXEL_WIDTH - 1:0]    BUFFER[C_IMAGE_WIDTH - 1:0];
    integer                                 i;
	
	// BEGIN BUFFER Write logic -----------------------------------------------------------------------------------------------------------------------   
    always@(posedge clk) begin
        if (wren) begin
            BUFFER[wr_addr] <= din;
        end 
    end
    // END BUFFER Write logic -------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN BUFFER Count logic -----------------------------------------------------------------------------------------------------------------------
    assign full = (count == C_IMAGE_WIDTH);
    
    always@(posedge clk) begin
        if(rst) begin
            count <= 0;
        end else begin
            if(wren && rden) begin
                count <= count;
            end else if(wren && count < C_IMAGE_WIDTH) begin
                count <= count + 1;
            end else if(rden && count > 0) begin
                count <= count - 1;
            end
        end
    end
    // END BUFFER Count logic -------------------------------------------------------------------------------------------------------------------------

    
    
    // BEGIN BUFFER Read logic ------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rden) begin
            for(i = 0; i < (C_IMAGE_WIDTH - 1); i = i + 1) begin
                BUFFER[i] <= BUFFER[i + 1];
            end
        end
    end

    always@(*) begin
        dout <= BUFFER[0];
    end
  // END BUFFER logic ---------------------------------------------------------------------------------------------------------------------------------

endmodule
