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
module signal_ext #(
    parameter C_CLOCK_CYCLES   = 1,
    parameter C_DATAIN_WIDTH   = 3
) (
    clk     ,
    din     ,
    dout
);	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                         clk;
    input  logic [C_DATAIN_WIDTH - 1:0]  din;
    output logic [C_DATAIN_WIDTH - 1:0]  dout;	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic [C_DATAIN_WIDTH - 1:0] register[C_CLOCK_CYCLES - 1:0];
    integer i0;    
    integer i;
	integer j;

	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    if(C_CLOCK_CYCLES == 0) begin
        assign dout = din;
    end else begin
        always@(*) begin
            for(i = 0; i < C_DATAIN_WIDTH; i = i + 1) begin
                dout[i] = din[i];
                for(j = 0; j < (C_CLOCK_CYCLES - 1); j = j + 1) begin
                    dout[i] = din[i] | register[j][i] | register[j + 1][i];
                end
            end
        end
        
        always@(posedge clk) begin
            register[0] <= din;
            for(i0 = 1; i0 < C_CLOCK_CYCLES; i0 = i0 + 1) begin
                register[i0] <= register[i0 - 1];
            end        
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
	
	
endmodule