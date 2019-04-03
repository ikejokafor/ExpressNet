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
    parameter C_RAM_WR_WIDTH        = 16    ,                   
    parameter C_RAM_WR_DEPTH        = 1024  ,
    parameter C_RAM_RD_WIDTH        = 32    ,
    parameter C_RD_PORT_HIGH_PERF   = 1     ,
    parameter C_FIFO_FWFT           = 0
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
    //  User Functions
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    function integer clog2;
        input integer value;
        begin
            value = value-1;      
            for(clog2 = 0; value > 0; clog2 = clog2 + 1)
                value = value >> 1;
        end
    endfunction


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    localparam C_RAM_RD_DEPTH            = C_RAM_WR_DEPTH / (C_RAM_RD_WIDTH / C_RAM_WR_WIDTH);
    localparam C_RAM_DEPTH               = C_RAM_WR_DEPTH;
    localparam C_CLG2_RAM_WR_DEPTH       = clog2(C_RAM_WR_DEPTH);
    localparam C_CLG2_RAM_RD_DEPTH       = clog2(C_RAM_RD_DEPTH);
   
  
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//------------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                 wr_clk      ;        
    input  logic [C_CLG2_RAM_WR_DEPTH - 1:0]     wrAddr      ;
    input  logic                                 wren        ;  
    input  logic [     C_RAM_WR_WIDTH - 1:0]     din         ;
    input  logic                                 rd_clk      ;    
    input  logic [C_CLG2_RAM_RD_DEPTH - 1:0]     rdAddr      ;
    input  logic                                 rden        ;
    output logic [     C_RAM_RD_WIDTH - 1:0]     dout        ;
  
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic    [C_RAM_WR_WIDTH - 1:0]    BRAM[C_RAM_DEPTH - 1:0];

	
	// BEGIN BRAM Port A Write logic ----------------------------------------------------------------------------------------------------------------
    always@(posedge wr_clk) begin
        if(wren) begin
            BRAM[wrAddr] <= din;
        end
    end
    // END BRAM Port A Write logic ------------------------------------------------------------------------------------------------------------------


    // BEGIN BRAM Port B Read logic -----------------------------------------------------------------------------------------------------------------   
    generate
        if(C_RD_PORT_HIGH_PERF == 1) begin
            logic [C_RAM_RD_WIDTH - 1:0] dout_reg0;
            logic [C_RAM_RD_WIDTH - 1:0] dout_reg1;
            logic [C_RAM_RD_WIDTH - 1:0] dout_reg2;   
            assign dout = dout_reg2;
            always@(posedge rd_clk) begin
                if(rden) begin
                    dout_reg0 <= BRAM[rdAddr];
                    dout_reg1 <= dout_reg0;
                    dout_reg2 <= dout_reg1;
                end
            end
        end else begin
            logic   [C_CLG2_RAM_RD_DEPTH - 1:0] rdAddr_plus_one  ;
            logic   [C_CLG2_RAM_RD_DEPTH - 1:0] address          ;
            
            assign address = (rden) ? rdAddr_plus_one : rdAddr;
            always@(posedge rd_clk) begin
                rdAddr_plus_one     <= rdAddr + 1;
                if(rden) begin
                    rdAddr_plus_one <= rdAddr_plus_one + 1;
                end
            end
            
            if(C_FIFO_FWFT == 1) begin
                always@(*) begin
                    dout = BRAM[address];
                end
            end else begin
                always@(posedge rd_clk) begin
                    dout <= BRAM[address];
                end
            end
        end
    endgenerate
    // END BRAM Port B logic ------------------------------------------------------------------------------------------------------------------------

endmodule

