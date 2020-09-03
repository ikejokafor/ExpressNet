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
    `include "utilities.svh"
    `include "cnn_layer_accel_defs.vh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    localparam C_PERIOD_100MHz                      = 10;    
    localparam C_PERIOD_500MHz                      = 2;
	localparam C_VEC_ADD_WIDTH 	               	    = `KRNL_1X1_SIMD * `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_SYS_MEM_RD_ADDR_WTH                = `MAX_FAS_RD_ID * `AXI_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH                 = `MAX_FAS_RD_ID * `AXI_RD_LEN_WIDTH;
	localparam C_CONVMAP_BRAM_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_CONVMAP_WR_ADDR_WTH                = clog2(`CONVMAP_BRAM_WR_DEPTH);
    localparam C_CONVMAP_RD_ADDR_WTH                = clog2(`CONVMAP_BRAM_RD_DEPTH);
	localparam C_CONVMAP_CT_WITH   		            = clog2(`CONVMAP_BRAM_RD_DEPTH);
    localparam C_KRNL_1X1_BRAM_WR_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_WR_DEPTH);
    localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_RD_DEPTH);
    localparam C_KRNL_1X1_BRAM_RD_WTH               = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_WR_DEPTH);
    localparam C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_RD_DEPTH);
	localparam C_KRNL_1X1_BIAS_BRAM_RD_WTH          = `PIXEL_WIDTH;
    localparam C_RESDMAP_BRAM_WR_ADDR_WTH           = clog2(`RESDMAP_BRAM_WR_DEPTH);
    localparam C_RESDMAP_BRAM_RD_ADDR_WTH           = clog2(`RESDMAP_BRAM_RD_DEPTH);
    localparam C_RESDMAP_BRAM_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_RESDMAP_BRAM_CT_WTH                = clog2(`RESDMAP_BRAM_RD_DEPTH);
    localparam C_PARTMAP_BRAM_WR_ADDR               = clog2(`PARTMAP_BRAM_WR_DEPTH);
    localparam C_PARTMAP_BRAM_RD_ADDR               = clog2(`PARTMAP_BRAM_RD_DEPTH);
    localparam C_PARTMAP_BRAM_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_PARTMAP_BRAM_CT_WTH                = clog2(`PARTMAP_BRAM_RD_DEPTH);
    localparam C_PREVMAP_FIFO_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_DIN                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_DOUT               = `PIXEL_WIDTH;
	localparam C_OUTBUF_FIFO_DIN_WTH                = `PIXEL_WIDTH * `OUTBUF_FIFO_DIN_FACTOR;
    localparam C_OUTBUF_FIFO_COUNT                  = clog2(`OUTBUF_FIFO_DEPTH);
    localparam C_VEC_MULT_WIDTH                     = `KRNL_1X1_SIMD * `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic									    clk_intf				    ;
	logic                                       clk_FAS   				    ;
    logic                                       rst                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                       start_FAS                   ;
    logic                                       start_FAS_ack               ;    
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    cfg_data                    ;
    logic                                       cfg_grp                     ;
    logic                                       send_FAS_complete           ;
    logic                                       FAS_complete_ack            ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [           `MAX_FAS_RD_ID - 1:0]     sys_mem_read_req            ;
    logic [    C_SYS_MEM_RD_ADDR_WTH - 1:0]     sys_mem_read_addr           ;
    logic [     C_SYS_MEM_RD_LEN_WTH - 1:0]     sys_mem_read_len            ;
    logic [           `MAX_FAS_RD_ID - 1:0]     sys_mem_read_req_ack        ;
    logic [           `MAX_FAS_RD_ID - 1:0]     sys_mem_read_in_prog        ;
    logic [           `MAX_FAS_RD_ID - 1:0]     sys_mem_read_cmpl           ;
    logic                                       sys_mem_write_req           ;
    logic [       `AXI_WR_ADDR_WIDTH - 1:0]     sys_mem_write_addr          ;
    logic [        `AXI_WR_LEN_WIDTH - 1:0]     sys_mem_write_len           ;
    logic                                	    sys_mem_write_req_ack       ;
    logic                                	    sys_mem_write_in_prog       ;
    logic                                	    sys_mem_write_cmpl          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                	    trans_in_fifo_wren          ;
    logic                                	    convMap_bram_wren           ;
    logic                                	    resdMap_bram_wren           ;
    logic                                	    partMap_bram_wren           ;
    logic [            `KRNL_1X1_SIMD - 1:0]    prevMap_fifo_wren           ;
    logic [            `KRNL_1X1_SIMD - 1:0]    krnl1x1_bram_wren           ;
    logic [            `KRNL_1X1_SIMD - 1:0]    krnl1x1Bias_bram_wren	    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [           `TRANS_FIFO_WIH - 1:0]	trans_in_fifo_datain        ;
	logic [        `AXI_INTC_DT_WIDTH - 1:0]	convMap_bram_datain		    ;
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    resdMap_bram_datain         ;
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    partMap_bram_datain         ;
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    prevMap_fifo_datain         ;
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1_bram_datain		    ;
    logic [        `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1Bias_bram_datain	    ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
	logic                                	    outBuf_fifo_rden            ;
    logic [        `AXI_WR_DATA_WIDTH - 1:0]    outBuf_fifo_dout            ;
    logic                                       trans_eg_fifo_dout_vld      ;
    logic [           `TRANS_FIFO_WIH - 1:0]    trans_eg_fifo_dataout       ;

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    clock_gen #(
        .C_PERIOD(C_PERIOD_100MHz)
    )
    i0_clock_gen(
        .clk_out(clk_intf)
    );
    
    
    clock_gen #(
        .C_PERIOD(C_PERIOD_500MHz)
    )
    i1_clock_gen(
        .clk_out(clk_FAS)
    );
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_intf					( clk_intf                  ),
        .clk_FAS   				    ( clk_FAS                   ),
        .rst                        ( rst                       ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .start_FAS                  ( start_FAS                 ),
        .start_FAS_ack              ( start_FAS_ack             ),
        .cfg_data                   ( cfg_data                  ),
        .cfg_grp                    ( cfg_grp                   ),
        .send_FAS_complete          ( send_FAS_complete         ),
        .FAS_complete_ack           ( FAS_complete_ack          ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .sys_mem_read_req           ( sys_mem_read_req          ),
        .sys_mem_read_addr          ( sys_mem_read_addr         ),
        .sys_mem_read_len           ( sys_mem_read_len          ),
        .sys_mem_read_req_ack       ( sys_mem_read_req_ack      ),
        .sys_mem_read_in_prog       ( sys_mem_read_in_prog      ),
        .sys_mem_read_cmpl          ( sys_mem_read_cmpl         ),
        .sys_mem_write_req          ( sys_mem_write_req         ),
        .sys_mem_write_addr         ( sys_mem_write_addr        ),
        .sys_mem_write_len          ( sys_mem_write_len         ),
        .sys_mem_write_req_ack      ( sys_mem_write_req_ack     ),
        .sys_mem_write_in_prog      ( sys_mem_write_in_prog     ),
        .sys_mem_write_cmpl         ( sys_mem_write_cmpl        ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .trans_in_fifo_wren         ( trans_in_fifo_wren        ),            
        .convMap_bram_wren          ( convMap_bram_wren         ),            
        .resdMap_bram_wren          ( resdMap_bram_wren         ),            
        .partMap_bram_wren          ( partMap_bram_wren         ),            
        .prevMap_fifo_wren          ( prevMap_fifo_wren         ),            
        .krnl1x1_bram_wren          ( krnl1x1_bram_wren         ),            
        .krnl1x1Bias_bram_wren		( krnl1x1Bias_bram_wren	    ),           
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .trans_in_fifo_datain       ( trans_in_fifo_datain      ),
        .convMap_bram_datain		( convMap_bram_datain	    ),
        .resdMap_bram_datain        ( resdMap_bram_datain       ),
        .partMap_bram_datain        ( partMap_bram_datain       ),
        .prevMap_fifo_datain        ( prevMap_fifo_datain       ),
        .krnl1x1_bram_datain		( krnl1x1_bram_datain	    ),
        .krnl1x1Bias_bram_datain    ( krnl1x1Bias_bram_datain	),
        // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
        .outBuf_fifo_rden           ( outBuf_fifo_rden          ),
        .outBuf_fifo_dout           ( outBuf_fifo_dout          ),
        .trans_eg_fifo_dout_vld     ( trans_eg_fifo_dout_vld    ),
        .trans_eg_fifo_dataout      ( trans_eg_fifo_dataout     )
    );
 
    
    initial begin
        rst = 1;
		#(C_PERIOD_500MHz * 10) rst <= 0;    // 10 cycle rst asserted is arbitrairy
    end
    

endmodule
    