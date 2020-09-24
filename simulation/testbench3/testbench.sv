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

// task configAccel
// 
// endtask


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
    localparam C_PERIOD_400MHz                      = 2.5;
    
    localparam C_VEC_ADD_WIDTH                      = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_VEC_MULT_WIDTH                     = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_SYS_MEM_RD_ADDR_WTH                = `MAX_FAS_RD_ID * `SYS_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH                 = `MAX_FAS_RD_ID * `SYS_RD_LEN_WIDTH;
    localparam C_KRNL_1X1_BRAM_WR_WTH               = 1024; // TODO: Remove hard coding
    localparam C_KRNL_1X1_BRAM_WR_DTH               = 8192; // TODO: Remove hard coding   
    localparam C_KRNL_1X1_BRAM_WR_ADDR_WTH          = clog2(C_KRNL_1X1_BRAM_WR_DTH);
    localparam C_KRNL_1X1_BRAM_RD_WTH               = 1024; // TODO: Remove hard coding
    localparam C_KRNL_1X1_BRAM_RD_DTH               = 8192; // TODO: Remove hard coding    
    localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = clog2(C_KRNL_1X1_BRAM_RD_DTH);
    localparam C_KRNL_1X1_BIAS_BRAM_WR_WTH          = 1024; // TODO: Remove hard coding
    localparam C_KRNL_1X1_BIAS_BRAM_WR_DTH          = 8192; // TODO: Remove hard coding   
    localparam C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH     = clog2(C_KRNL_1X1_BIAS_BRAM_WR_DTH);
    localparam C_KRNL_1X1_BIAS_BRAM_RD_WTH          = 32; // TODO: Remove hard coding
    localparam C_KRNL_1X1_BIAS_BRAM_RD_DTH          = 262144; // TODO: Remove hard coding    
    localparam C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH     = clog2(C_KRNL_1X1_BIAS_BRAM_RD_DTH);  
    localparam C_CONVMAP_FIFO_WR_WTH                = 1024; // TODO: Remove hard coding
    localparam C_CONVMAP_FIFO_WR_DTH                = 512; // TODO: Remove hard coding
    localparam C_CONVMAP_FIFO_RD_WTH                = 1024; // TODO: Remove hard coding
    localparam C_CONVMAP_FIFO_RD_DTH                = 512; // TODO: Remove hard coding
    localparam C_CONVMAP_FIFO_CT_WTH                = clog2(C_CONVMAP_FIFO_RD_DTH) + 1; 
    localparam C_PARTMAP_FIFO_WR_WTH                = 1024; // TODO: Remove hard coding
    localparam C_PARTMAP_FIFO_WR_DTH                = 512; // TODO: Remove hard coding
    localparam C_PARTMAP_FIFO_RD_WTH                = 1024; // TODO: Remove hard coding
    localparam C_PARTMAP_FIFO_RD_DTH                = 512; // TODO: Remove hard coding
    localparam C_PARTMAP_FIFO_CT_WTH                = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_PREVMAP_FIFO_WR_WTH                = 1024; // TODO: Remove hard coding
    localparam C_PREVMAP_FIFO_WR_DTH                = 512; // TODO: Remove hard coding
    localparam C_PREVMAP_FIFO_RD_WTH                = 1024; // TODO: Remove hard coding
    localparam C_PREVMAP_FIFO_RD_DTH                = 512; // TODO: Remove hard coding
    localparam C_PREVMAP_FIFO_CT_WTH                = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_RESDMAP_FIFO_WR_WTH                = 1024; // TODO: Remove hard coding
    localparam C_RESDMAP_FIFO_WR_DTH                = 512; // TODO: Remove hard coding
    localparam C_RESDMAP_FIFO_RD_WTH                = 1024; // TODO: Remove hard coding
    localparam C_RESDMAP_FIFO_RD_DTH                = 512; // TODO: Remove hard coding
    localparam C_RESDMAP_FIFO_CT_WTH                = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;  
    localparam C_OUTBUF_FIFO_WR_WTH                 = 1024; // TODO: Remove hard coding
    localparam C_OUTBUF_FIFO_WR_DTH                 = 512; // TODO: Remove hard coding
    localparam C_OUTBUF_FIFO_RD_WTH                 = 1024; // TODO: Remove hard coding
    localparam C_OUTBUF_FIFO_RD_DTH                 = 512; // TODO: Remove hard coding
    localparam C_OUTBUF_FIFO_CT_WTH                 = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_OUTBUF_FIFO_DIN_FACTOR             = floor(`SYS_WR_DATA_WIDTH, `PIXEL_WIDTH);
    localparam C_CONV1X1_DWC_FIFO_WR_WTH            = 128; // TODO: Remove hard coding
    localparam C_CONV1X1_DWC_FIFO_WR_DTH            = 8192; // TODO: Remove hard coding
    localparam C_CONV1X1_DWC_FIFO_RD_WTH            = 1024; // TODO: Remove hard coding
    localparam C_CONV1X1_DWC_FIFO_RD_DTH            = 1024; // TODO: Remove hard coding
    localparam C_CONV1X1_DWC_CT_WTH                 = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_RES_DWC_FIFO_WR_WTH                = 1024; // TODO: Remove hard coding
    localparam C_RES_DWC_FIFO_WR_DTH                = 512; // TODO: Remove hard coding
    localparam C_RES_DWC_FIFO_RD_WTH                = 1024; // TODO: Remove hard coding
    localparam C_RES_DWC_FIFO_RD_DTH                = 512; // TODO: Remove hard coding
    localparam C_RES_DWC_FIFO_CT_WTH                = clog2(C_CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_TRANS_FIFO_WR_WTH                  = 1024; // TODO: Remove hard coding
    localparam C_TRANS_FIFO_WR_DTH                  = 512; // TODO: Remove hard coding
    localparam C_TRANS_FIFO_RD_WTH                  = 1024; // TODO: Remove hard coding
    localparam C_TRANS_FIFO_RD_DTH                  = 512; // TODO: Remove hard coding
    localparam C_JB_FTH_FIFO_WR_WTH                 = 1024; // TODO: Remove hard coding
    localparam C_JB_FTH_FIFO_WR_DTH                 = 512; // TODO: Remove hard coding
    localparam C_JB_FTH_FIFO_RD_WTH                 = 1024; // TODO: Remove hard coding
    localparam C_JB_FTH_FIFO_RD_DTH                 = 512; // TODO: Remove hard coding
    localparam C_VEC_SUM_ARR_SZ                     = `MAX_1X1_KRNL_DEPTH / `KRNL_1X1_DEPTH_SIMD;
    localparam C_VEC_SUM_ARR_ADDR_WTH               = clog2(`MAX_1X1_KRNL_DEPTH / `KRNL_1X1_DEPTH_SIMD);
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic                                     clk_intf                   ;
    logic                                     clk_FAS                    ;
    logic                                     rst                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                     start_FAS                  ;
    logic                                     start_FAS_ack              ;
    logic                                     send_FAS_complete          ;
    logic                                     FAS_complete_ack           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req           ;
    logic [     C_SYS_MEM_RD_ADDR_WTH - 1:0]  sys_mem_read_addr          ;
    logic [      C_SYS_MEM_RD_LEN_WTH - 1:0]  sys_mem_read_len           ;
    logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req_ack       ;
    logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_in_prog       ;  
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  sys_mem_read_data          ;
    logic                                     sys_mem_read_data_vld      ;
    logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_data_rdy      ;
    logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_cmpl          ;
    logic                                     sys_mem_write_req          ;
    logic [        `SYS_WR_ADDR_WIDTH - 1:0]  sys_mem_write_addr         ;
    logic [         `SYS_WR_LEN_WIDTH - 1:0]  sys_mem_write_len          ;
    logic                                     sys_mem_write_req_ack      ;
    logic                                     sys_mem_write_in_prog      ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  sys_mem_write_data         ;
    logic                                     sys_mem_write_data_vld     ;
    logic                                     sys_mem_write_data_rdy     ;
    logic                                     sys_mem_write_cmpl         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                     trans_in_fifo_wren         ;
    logic                                     convMap_fifo_wren          ;
    logic                                     partMap_fifo_wren          ;
    logic                                     resdMap_fifo_wren          ;
    logic                                     prevMap_fifo_wren          ;
    logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1_bram_wren          ;
    logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1Bias_bram_wren      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [           `TRANS_FIFO_WIH - 1:0]  trans_in_fifo_din          ;
    logic [        `SYS_INTC_DT_WIDTH - 1:0]  convMap_fifo_din           ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  partMap_fifo_din           ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  prevMap_fifo_din           ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  resdMap_fifo_din           ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  krnl1x1_bram_din           ;
    logic [        `SYS_RD_DATA_WIDTH - 1:0]  krnl1x1Bias_bram_din       ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                     outBuf_fifo_rden           ;
    logic [        `SYS_WR_DATA_WIDTH - 1:0]  outBuf_fifo_dout           ;
    logic                                     trans_eg_fifo_dout_vld     ;
    logic [           `TRANS_FIFO_WIH - 1:0]  trans_eg_fifo_dout         ;

    
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
        .C_PERIOD(C_PERIOD_400MHz)
    )
    i1_clock_gen(
        .clk_out(clk_FAS)
    );
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_intf                   ( clk_intf                  ),              
        .clk_FAS                    ( clk_FAS                   ),              
        .rst                        ( rst                       ),              
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .start_FAS                  ( start_FAS                 ),
        .start_FAS_ack              ( start_FAS_ack             ),
        .send_FAS_complete          ( send_FAS_complete         ),
        .FAS_complete_ack           ( FAS_complete_ack          ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .sys_mem_read_req           ( sys_mem_read_req          ),
        .sys_mem_read_addr          ( sys_mem_read_addr         ),
        .sys_mem_read_len           ( sys_mem_read_len          ),
        .sys_mem_read_req_ack       ( sys_mem_read_req_ack      ),
        .sys_mem_read_in_prog       ( sys_mem_read_in_prog      ),  
        .sys_mem_read_data          ( sys_mem_read_data         ),
        .sys_mem_read_data_vld      ( sys_mem_read_data_vld     ),
        .sys_mem_read_data_rdy      ( sys_mem_read_data_rdy     ),
        .sys_mem_read_cmpl          ( sys_mem_read_cmpl         ),
        .sys_mem_write_req          ( sys_mem_write_req         ),
        .sys_mem_write_addr         ( sys_mem_write_addr        ),
        .sys_mem_write_len          ( sys_mem_write_len         ),
        .sys_mem_write_req_ack      ( sys_mem_write_req_ack     ),
        .sys_mem_write_in_prog      ( sys_mem_write_in_prog     ),
        .sys_mem_write_data         ( sys_mem_write_data        ),
        .sys_mem_write_data_vld     ( sys_mem_write_data_vld    ),
        .sys_mem_write_data_rdy     ( sys_mem_write_data_rdy    ),
        .sys_mem_write_cmpl         ( sys_mem_write_cmpl        ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_wren         ( trans_in_fifo_wren        ),
        .convMap_fifo_wren          ( convMap_fifo_wren         ),
        .partMap_fifo_wren          ( partMap_fifo_wren         ),
        .resdMap_fifo_wren          ( resdMap_fifo_wren         ),
        .prevMap_fifo_wren          ( prevMap_fifo_wren         ),
        .krnl1x1_bram_wren          ( krnl1x1_bram_wren         ),
        .krnl1x1Bias_bram_wren      ( krnl1x1Bias_bram_wren     ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_din          ( trans_in_fifo_din         ),
        .convMap_fifo_din           ( convMap_fifo_din          ),
        .partMap_fifo_din           ( partMap_fifo_din          ),
        .prevMap_fifo_din           ( prevMap_fifo_din          ),
        .resdMap_fifo_din           ( resdMap_fifo_din          ),
        .krnl1x1_bram_din           ( krnl1x1_bram_din          ),
        .krnl1x1Bias_bram_din       ( krnl1x1Bias_bram_din      ),
        // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
        .outBuf_fifo_rden           ( outBuf_fifo_rden          ),
        .outBuf_fifo_dout           ( outBuf_fifo_dout          ),
        .trans_eg_fifo_dout_vld     ( trans_eg_fifo_dout_vld    ),
        .trans_eg_fifo_dout         ( trans_eg_fifo_dout        )
    );
 
    
    initial begin
        rst = 1;
		#(C_PERIOD_400MHz * 10) rst <= 0;    // 10 cycle rst asserted is arbitrairy
    end
    

endmodule
    