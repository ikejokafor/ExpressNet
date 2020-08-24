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
// Additional Comments:     Scenario 1 Checks the convolution logic
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "math.svh"
    `include "cnn_layer_accel_defs.vh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2;
	
	localparam C_VECTOR_ADD_WTH 	    = `PIXEL_WIDTH * VECTOR_ADD_SIMD;
    localparam C_SYS_MEM_RD_ADDR_WTH    = `MAX_FAS_RD_ID * `AXI_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH     = `MAX_FAS_RD_ID * `RD_LEN_WIDTH;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic                                   clk     				    ;
    logic                                   rst                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                   start_FAS                   ;
    logic                                   start_FAS_ack               ;
    logic  [      `CFG_DATA_WIDTH - 1:0]    cfg_data                    ;
    logic  [     `MAX_AWP_PER_FAS - 1:0]    AWP_complete                ;
    logic                                   send_FAS_complete           ;
    logic                                   FAS_complete_ack            ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [       `MAX_FAS_RD_ID - 1:0]     sys_mem_read_req            ;
    logic [C_SYS_MEM_RD_ADDR_WTH - 1:0]     sys_mem_read_addr           ;
    logic [ C_SYS_MEM_RD_LEN_WTH - 1:0]     sys_mem_read_len            ;
    logic  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_req_ack        ;
    logic  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_in_prog        ;
    logic  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_cmpl           ;
    logic                                   sys_mem_write_req           ;
    logic [   `AXI_WR_ADDR_WIDTH - 1:0]     sys_mem_write_addr          ;
    logic [        `WR_LEN_WIDTH - 1:0]     sys_mem_write_len           ;
    logic                                   sys_mem_write_req_ack       ;
    logic                                   sys_mem_write_in_prog       ;
    logic                                   sys_mem_write_cmpl          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                   trans_fifo_wren             ;
    logic                                   convMap_bram_wren           ;
    logic                                   resdMap_bram_wren           ;
    logic                                   partMap_bram_wren           ;
    logic                                   prevMap_fifo_wren           ;
    logic  [       `KRNL_1X1_SIMD - 1:0]    krnl1x1_bram_wren           ;
    logic  [       `KRNL_1X1_SIMD - 1:0]    krnl1x1Bias_bram_wren       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic  [   `TRANS_FIFO_DT_WIH - 1:0]    trans_fifo_datain           ;
    logic  [   `AXI_RD_DATA_WIDTH - 1:0]    resdMap_bram_datain         ;
    logic  [   `AXI_RD_DATA_WIDTH - 1:0]    partMap_bram_datain         ;
    logic  [   `AXI_RD_DATA_WIDTH - 1:0]    prevMap_fifo_datain         ;
    logic  [   `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1_bram_datain         ;
    logic  [   `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1Bias_bram_datain     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                   outBuf_fifo_rden            ;
    logic [   `AXI_WR_DATA_WIDTH - 1:0]     outBuf_fifo_dout            ;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    clock_gen #(
        .C_PERIOD(C_PERIOD_500MHz)
    )
    i1_clock_gen(
        .clk_out(clk_core)
    );
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_core                   ( clk_core                  ),  
        .rst                        ( rst                       ),
        .start_FAS                  ( start_FAS                 ),
        .start_FAS_ack              ( start_FAS_ack             ),
        .cfg_data                   ( cfg_data                  ),
        .sys_mem_read_req           ( sys_mem_read_req          ),
        .sys_mem_read_req_ack       ( sys_mem_read_req_ack      ),
        .sys_mem_read_in_prog       ( sys_mem_read_in_prog      ),
        .sys_mem_read_cmpl          ( sys_mem_read_cmpl         ),
        .sys_mem_write_req          ( sys_mem_write_req         ),
        .sys_mem_write_req_ack      ( sys_mem_write_req_ack     ),
        .sys_mem_write_in_prog      ( sys_mem_write_in_prog     ),
        .sys_mem_write_cmpl         ( sys_mem_write_cmpl        ),
        .trans_fifo_wren            ( trans_fifo_wren           ),
        .convMap_bram_wren          ( convMap_bram_wren         ),
        .resdMap_bram_wren          ( resdMap_bram_wren         ),
        .partMap_bram_wren          ( partMap_bram_wren         ),
        .prevMap_fifo_wren          ( prevMap_fifo_wren         ),
        .krnl1x1_bram_wren          ( krnl1x1_bram_wren         ),
        .krnl1x1Bias_bram_wren      ( krnl1x1Bias_bram_wren     ),
        .trans_fifo_datain          ( trans_fifo_datain         ),
        .convMap_bram_datain        ( convMap_bram_datain       ),
        .resdMap_bram_datain        ( resdMap_bram_datain       ),
        .partMap_bram_datain        ( partMap_bram_datain       ),
        .prevMap_fifo_datain        ( prevMap_fifo_datain       ),
        .krnl1x1_bram_datain        ( krnl1x1_bram_datain       ),
        .krnl1x1Bias_bram_datain    ( krnl1x1Bias_bram_datain   ),
        .outBuf_fifo_rden           ( outBuf_fifo_rden          ),
        .outBuf_fifo_dout           ( outBuf_fifo_dout          ),
        .AWP_complete               ( AWP_complete              ),
        .send_FAS_complete          ( send_FAS_complete         ),
        .FAS_complete_ack           ( FAS_complete_ack          )
    );
 
    
    initial begin
        rst = 1;
		#(C_PERIOD_500MHz * 10) rst <= 0;    // 10 cycle rst asserted is arbitrairy
    end
    

endmodule
    