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
function integer clog2;
    input integer value;
    begin
        value = value-1;      
        for(clog2 = 0; value > 0; clog2 = clog2 + 1)
            value = value >> 1;
    end
endfunction


module xilinx_simple_dual_port_no_change_ram #(
    parameter C_RAM_WIDTH       = 64                ,                   
    parameter C_RAM_DEPTH       = 512               ,
    parameter C_RAM_PERF        = "LOW_LATENCY"
) (
    wrAddr      ,     
    rdAddr      ,     
    datain      ,        
    clk         ,
    wren        ,       
    rden        ,       
    dataout   
);	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    localparam C_CLG2_RAM_DEPTH = clog2(C_RAM_DEPTH);
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input       [C_CLG2_RAM_DEPTH - 1:0]   wrAddr;     
    input       [C_CLG2_RAM_DEPTH - 1:0]   rdAddr;     
    input       [     C_RAM_WIDTH - 1:0]   datain;        
    input                                  clk;
    input                                  wren;       
    input                                  rden;       
    output      [     C_RAM_WIDTH - 1:0]   dataout;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [       C_RAM_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];


	// BEGIN BRAM Write logic -----------------------------------------------------------------------------------------------------------------------   
    always@(posedge clk) begin
        if(wren) begin
            BRAM[wrAddr] <= datain;
        end
    end
    // END BRAM Write logic -------------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Read logic ------------------------------------------------------------------------------------------------------------------------
    generate
        if(C_RAM_PERF == "HIGH_PERFORMANCE") begin
            reg [C_RAM_WIDTH - 1:0] dout_reg0;
            reg [C_RAM_WIDTH - 1:0] dout_reg1;
            reg [C_RAM_WIDTH - 1:0] dout_reg2;    
            assign dataout = dout_reg2;
            always@(posedge clk) begin
                if(rden) begin
                    dout_reg0 <= BRAM[rdAddr];
                    dout_reg1 <= dout_reg0;
                    dout_reg2 <= dout_reg1;
                end
            end
        end else if(C_RAM_PERF == "LOW_LATENCY") begin
            reg [C_RAM_WIDTH - 1:0] dout_reg;
            assign dataout = dout_reg;        
            always@(posedge clk) begin
                if(rden) begin
                    dout_reg <= BRAM[rdAddr];
                end
            end
        end
    endgenerate
    // END BRAM logic -------------------------------------------------------------------------------------------------------------------------------

endmodule
