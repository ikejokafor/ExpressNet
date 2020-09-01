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
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_FAS #(
    parameter C_FAS_ID = 0,
    parameter C_IM_SM_RD_ID = 0,
    parameter C_PM_SM_RD_ID = 1,
    parameter C_PV_SM_RD_ID = 2,
    parameter C_RM_SM_RD_ID = 3
) (
	clk_intf					,
    clk_FAS    			        ,
    rst                         ,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    start_FAS                   ,
    start_FAS_ack               ,
    send_FAS_complete           ,
    FAS_complete_ack			,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    sys_mem_read_req            ,
	sys_mem_read_addr			,
	sys_mem_read_len			,
    sys_mem_read_req_ack        ,
    sys_mem_read_in_prog        ,
    sys_mem_read_cmpl           ,
    sys_mem_write_req           ,
	sys_mem_write_addr 			,
	sys_mem_write_len  			,
    sys_mem_write_req_ack       ,
    sys_mem_write_in_prog       ,
    sys_mem_write_cmpl          ,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    trans_in_fifo_wren          ,
    convMap_bram_wren           ,
    resdMap_bram_wren           ,
    partMap_bram_wren           ,
    prevMap_fifo_wren           ,
    krnl1x1_bram_wren           ,
    krnl1x1Bias_bram_wren       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    	
    trans_in_fifo_datain        ,
	convMap_bram_datain         ,
    resdMap_bram_datain         ,
    partMap_bram_datain         ,
    prevMap_fifo_datain         ,
    krnl1x1_bram_datain			,
    krnl1x1Bias_bram_datain		,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	outBuf_fifo_rden			,	
    outBuf_fifo_dout            ,
    trans_eg_fifo_rd_valid      ,
    trans_eg_fifo_dataout       
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
    `include "cnn_layer_accel_defs.vh"
    
  
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Functions
    //-----------------------------------------------------------------------------------------------------------------------------------------------  
    function void getIdx(ref int idx_out, int idx_in);
        return;
    endfunction


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE                 			    = 6'b000001;
    localparam ST_CFG_AWP              			    = 6'b000010;
    localparam ST_START_AWP            			    = 6'b000100;
    localparam ST_ACTIVE               			    = 6'b001000;
    localparam ST_WAIT_LAST_WRITE      			    = 6'b010000;
    localparam ST_SEND_COMPLETE        			    = 6'b100000;

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
	localparam C_KRNL1X1_BRAM_DIN_WTH				= `AXI_RD_DATA_WIDTH * `KRNL_1X1_SIMD;
	localparam C_KRNL1X1BIAS_BRAM_DIN_WTH			= `AXI_RD_DATA_WIDTH * `KRNL_1X1_SIMD;
	localparam C_NUM_OUTBUF							= 1;
    localparam C_PREVMAP_FIFO_DIN_WTH               = `AXI_RD_DATA_WIDTH * `KRNL_1X1_SIMD;
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic									 clk_intf					;
	input  logic                                     clk_FAS   				    ;
    input  logic                                     rst                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                     start_FAS                  ;
    output logic                                     start_FAS_ack              ;    
    input  logic [        `AXI_RD_DATA_WIDTH - 1:0]	 cfg_data                   ;
    input  logic                                     cfg_grp                    ;
    input  logic                                     send_FAS_complete          ;
    output logic                                     FAS_complete_ack           ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [           `MAX_FAS_RD_ID - 1:0]   sys_mem_read_req           ;
    output logic [    C_SYS_MEM_RD_ADDR_WTH - 1:0]   sys_mem_read_addr          ;
    output logic [     C_SYS_MEM_RD_LEN_WTH - 1:0]   sys_mem_read_len           ;
    input  logic [           `MAX_FAS_RD_ID - 1:0]   sys_mem_read_req_ack       ;
    input  logic [           `MAX_FAS_RD_ID - 1:0]   sys_mem_read_in_prog       ;
    input  logic [           `MAX_FAS_RD_ID - 1:0]   sys_mem_read_cmpl          ;
    output logic                                     sys_mem_write_req          ;
    output logic [       `AXI_WR_ADDR_WIDTH - 1:0]   sys_mem_write_addr         ;
    output logic [        `AXI_WR_LEN_WIDTH - 1:0]   sys_mem_write_len          ;
    input  logic                                	 sys_mem_write_req_ack      ;
    input  logic                                	 sys_mem_write_in_prog      ;
    input  logic                                	 sys_mem_write_cmpl         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                	 trans_in_fifo_wren         ;
    input  logic                                	 convMap_bram_wren          ;
    input  logic                                	 resdMap_bram_wren          ;
    input  logic                                	 partMap_bram_wren          ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  prevMap_fifo_wren          ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1_bram_wren          ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1Bias_bram_wren		;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic [           `TRANS_FIFO_WIH - 1:0]	 trans_in_fifo_datain       ;
	input  logic [        `AXI_INTC_RD_WIDTH - 1:0]	 convMap_bram_datain		;
    input  logic [        `AXI_RD_DATA_WIDTH - 1:0]  resdMap_bram_datain        ;
    input  logic [        `AXI_RD_DATA_WIDTH - 1:0]  partMap_bram_datain        ;
    input  logic [    C_PREVMAP_FIFO_DIN_WTH - 1:0]  prevMap_fifo_datain        ;
    input  logic [    C_KRNL1X1_BRAM_DIN_WTH - 1:0]  krnl1x1_bram_datain		;
    input  logic [C_KRNL1X1BIAS_BRAM_DIN_WTH - 1:0]  krnl1x1Bias_bram_datain	;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
	input  logic                                	 outBuf_fifo_rden           ;
    output logic [        `AXI_WR_DATA_WIDTH - 1:0]  outBuf_fifo_dout           ;
    output logic                                     trans_eg_fifo_rd_valid     ;
    output logic [           `TRANS_FIFO_WIH - 1:0]  trans_eg_fifo_dataout      ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [`AXI_RD_ADDR_WIDTH - 1:0] sys_mem_read_addr_arr[`MAX_FAS_RD_ID - 1:0];
        genvar g0; `UNPACK_ARRAY_1D(`AXI_RD_ADDR_WIDTH, `MAX_FAS_RD_ID , sys_mem_read_addr, sys_mem_read_addr_arr, g0);
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [`AXI_RD_LEN_WIDTH - 1:0] sys_mem_read_len_arr[`MAX_FAS_RD_ID - 1:0];
        genvar g1; `UNPACK_ARRAY_1D(`AXI_RD_LEN_WIDTH, `MAX_FAS_RD_ID , sys_mem_read_len, sys_mem_read_len_arr, g1);
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [`AXI_RD_DATA_WIDTH - 1:0] krnl1x1_bram_din_arr[`KRNL_1X1_SIMD - 1:0];
        genvar g2; `UNPACK_ARRAY_1D(`AXI_RD_DATA_WIDTH, `KRNL_1X1_SIMD , krnl1x1_bram_datain, krnl1x1_bram_din_arr, g2);
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [`AXI_RD_DATA_WIDTH - 1:0] krnl1x1Bias_bram_din_arr[`KRNL_1X1_SIMD - 1:0];
        genvar g3; `UNPACK_ARRAY_1D(`AXI_RD_DATA_WIDTH, `KRNL_1X1_SIMD , krnl1x1Bias_bram_datain, krnl1x1Bias_bram_din_arr, g3);
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic [`AXI_RD_DATA_WIDTH - 1:0] prevMap_fifo_din_arr[`KRNL_1X1_SIMD - 1:0];
		genvar g7; `UNPACK_ARRAY_1D(`AXI_RD_DATA_WIDTH, `KRNL_1X1_SIMD , prevMap_bram_datain, prevMap_fifo_din_arr, g7);

  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic 	         	   						     cfg_AWP_done			                                    ;
	logic 	         	   						     start_AWP_done			                                    ;
    logic [                `MAX_AWP_PER_FAS - 1:0]   AWP_complete                                               ;                      
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [  				                 15:0]  krnl1x1Depth_cfg           									;
	logic [  				                 15:0]  krnl1x1Addr_cfg            									;
	logic [  				                 15:0]  krnl1x1BiasAddr_cfg        									;
	logic [  				                 15:0]  pixelSeqAddr_cfg           									;
	logic [  				                 15:0]  partMapAddr_cfg            									;
	logic [  				                 15:0]  resdMapAddr_cfg            									;
	logic [  				                 15:0]  outMapAddr_cfg             									;
	logic [  				                 15:0]  pixSeqCfgFetchTotal_cfg										;
	logic [  				                 15:0]  inMapAddr_cfg              									;
	logic [  				                 15:0]  prevMapAddr_cfg												;
	logic [  				                 15:0]  inMapFetchFactor_cfg       									;
	logic [  				                 15:0]  inMapFetchTotal_cfg        									;
	logic [  				                 15:0]  krnl3x3Addr_cfg												;
	logic [  				                 15:0]  krnl3x3BiasAddr_cfg											;
	logic [  				                 15:0]  krnl3x3FetchTotal_cfg      									;
	logic [  				                 15:0]  krnl3x3BiasFetchTotal_cfg  									;
	logic [  				                 15:0]  krnl1x1FetchTotal_cfg      									;
	logic [  				                 15:0]  krnl1x1BiasFetchTotal_cfg  									;
	logic [  				                 15:0]  partMapFetchTotal_cfg      									;
	logic [  				                 15:0]  resdMapFetchTotal_cfg      									;
	logic [  				                 15:0]  outMapStoreTotal_cfg       									;
	logic [  				                 15:0]  outMapStoreFactor_cfg      									;
	logic [  				                 15:0]  prevMapFetchTotal_cfg      									;
	logic [  				                 15:0]  num_1x1_kernels_cfg        									;
	logic [  				                 15:0]  cm_high_watermark_cfg      									;
	logic [  				                 15:0]  rm_low_watermark_cfg       									;
	logic [  				                 15:0]  pm_low_watermark_cfg       									;
	logic [  				                 15:0]  pv_low_watermark_cfg       									;
	logic [  				                 15:0]  rm_fetch_amount_cfg        									;
	logic [  				                 15:0]  pm_fetch_amount_cfg        									;
	logic [  				                 15:0]  pv_fetch_amount_cfg        									;
	logic [									 15:0]  im_fetch_amount_cfg											;
	logic [  				                 15:0]  krnl1x1_pding_cfg          									;
	logic [  				                 15:0]  krnl1x1_pad_bgn_cfg        									;
	logic [  				                 15:0]  krnl1x1_pad_end_cfg        									;
	logic [  				                 15:0]  opcode_cfg                 									;
	logic [  				                 15:0]  res_high_watermark_cfg     									;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [               				      5:0]	state                      									;
    logic                                           all_AWP_complete											;
    logic 	                						FAS_complete_acked											;
	logic											process_cmpl												;
	logic 											last_wrt_r													;
	logic 											last_wrt													;
	logic 											last_CO_recvd_r												;
	logic 											last_CO_recvd												;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [									 15:0]	dpth_count													;
	logic [									 15:0]	krnl_count													;
	logic											buffer_update												;
	logic											buffer_update_in_prog										;
	logic											adder_tree_datain_valid										;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           vector_add_0           			[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           vector_add_0_d         			[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           vector_add_1           			[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           vector_add_1_d         			[`KRNL_1X1_SIMD - 1:0]		;
	logic											vector_add_2		   			[`KRNL_1X1_SIMD - 1:0]		;
	logic											vector_add_2_d		   			[`KRNL_1X1_SIMD - 1:0]		;
    logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_0	   			[`KRNL_1X1_SIMD - 1:0]		;
	logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_1	   			[`KRNL_1X1_SIMD - 1:0]		;
	logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_2	   			[`KRNL_1X1_SIMD - 1:0]		;
	logic [                C_VEC_MULT_WIDTH - 1:0]	vector_mult			   			[`KRNL_1X1_SIMD - 1:0]		;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                  `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req_acked      								;
	logic 								            sys_mem_write_req_acked     								;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [           C_CONVMAP_WR_ADDR_WTH - 1:0]  convMap_bram_wrAddr         								;
    logic [           C_CONVMAP_RD_ADDR_WTH - 1:0]  convMap_bram_rdAddr         								;
	logic [           C_CONVMAP_RD_ADDR_WTH - 1:0]  convMap_bram_rd_ofst										;
    logic                                           convMap_bram_rden           								;
	logic											convMap_bram_rden_w0										;
	logic											convMap_bram_rden_w1										;
	logic [               C_CONVMAP_CT_WITH - 1:0]	convMap_bram_count          								;
    logic [           C_CONVMAP_BRAM_RD_WTH - 1:0]  convMap_bram_dout           								;
	logic											convMap_bram_empty											;
	logic											convMap_bram_prog_full										;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic  [               TRANS_PYLD_WIDTH - 1:0]  res_dwc_fifo_din                                            ;
    logic                                           res_dwc_fifo_wren                                           ;
    logic                                           res_dwc_fifo_rden                                           ;
    logic  [          C_OUTBUF_FIFO_DIN_WTH - 1:0]  res_dwc_fifo_dout                                           ;
    logic                                           res_dwc_fifo_rd_vld                                         ;
    logic                                           res_dwc_fifo_wr_rst_busy                                    ;
    logic                                           res_dwc_fifo_rd_rst_busy	                                ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [     C_KRNL_1X1_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1_bram_wrAddr		 		[`KRNL_1X1_SIMD - 1:0]		;
    logic [     C_KRNL_1X1_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1_bram_rdAddr		 		[`KRNL_1X1_SIMD - 1:0]   	;
    logic                                           krnl1x1_bram_rden		 		[`KRNL_1X1_SIMD - 1:0]		;
    logic [          C_KRNL_1X1_BRAM_RD_WTH - 1:0]  krnl1x1_bram_dout		 		[`KRNL_1X1_SIMD - 1:0]     	;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic [C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH - 1:0]	krnl1x1Bias_bram_wrAddr  		[`KRNL_1X1_SIMD - 1:0]    	;
    logic [C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1Bias_bram_rdAddr  		[`KRNL_1X1_SIMD - 1:0]   	;
    logic                                           krnl1x1Bias_bram_rden    		[`KRNL_1X1_SIMD - 1:0]    	;
    logic [                    `PIXEL_WIDTH - 1:0]  krnl1x1Bias_bram_dout    		[`KRNL_1X1_SIMD - 1:0]     	;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic [      C_RESDMAP_BRAM_WR_ADDR_WTH - 1:0]  resdMap_bram_wrAddr        									;
    logic [      C_RESDMAP_BRAM_RD_ADDR_WTH - 1:0]  resdMap_bram_rdAddr        									;
	logic [      C_RESDMAP_BRAM_RD_ADDR_WTH - 1:0]	resdMap_bram_rd_ofst	 									;
    logic                                           resdMap_bram_rden          									;
	logic                                           resdMap_bram_rden_w0       									;
	logic											resdMap_bram_rden_w1	 									;
	logic                                           resdMap_bram_rden_w2       									;
    logic [           C_RESDMAP_BRAM_RD_WTH - 1:0]  resdMap_bram_dout          									;
    logic                                           resdMap_bram_wren_w1       									;
    logic                                           resdMap_bram_rden_w1_d     									;
	logic											resdMap_bram_empty		 									;
	logic [ 		  C_RESDMAP_BRAM_CT_WTH - 1:0]	resdMap_bram_count		 									;
	logic											resdMap_bram_prog_empty	 									;
	logic [									 15:0]	resdMapFetchCount		 									;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [          C_PARTMAP_BRAM_WR_ADDR - 1:0]  partMap_bram_wrAddr        									;
    logic [          C_PARTMAP_BRAM_RD_ADDR - 1:0]  partMap_bram_rdAddr        									;
	logic [          C_PARTMAP_BRAM_RD_ADDR - 1:0]  partMap_bram_rd_ofst	 									;
    logic                                           partMap_bram_rden          									;
	logic											partMap_bram_rden_w0	 									;
	logic											partMap_bram_rden_w1	 									;
    logic [           C_PARTMAP_BRAM_CT_WTH - 1:0]  partMap_bram_count         									;
    logic [           C_PARTMAP_BRAM_RD_WTH - 1:0]  partMap_bram_dout          									;
	logic											partMap_bram_empty		 									;
	logic											partMap_bram_prog_empty	 									;
	logic [									 15:0]	partMapFetchCount		 									;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           conv1x1_dwc_fifo_wren    		[`KRNL_1X1_SIMD - 1:0]		;
	logic                                           conv1x1_dwc_fifo_rden    		[`KRNL_1X1_SIMD - 1:0]		;
	logic [           	       `PIXEL_WIDTH - 1:0]  conv1x1_dwc_fifo_din     		[`KRNL_1X1_SIMD - 1:0]		;
    logic [           C_PREVMAP_FIFO_RD_WTH - 1:0]  conv1x1_dwc_fifo_dout    		[`KRNL_1X1_SIMD - 1:0]		;
	logic											conv1x1_dwc_fifo_rd_vld	 		[`KRNL_1X1_SIMD - 1:0]		;
	logic											conv1x1_dwc_fifo_wr_rst_busy	[`KRNL_1X1_SIMD - 1:0]		;
	logic 											conv1x1_dwc_fifo_rd_rst_busy	[`KRNL_1X1_SIMD - 1:0]		;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic                                           prevMap_fifo_rden           	[`KRNL_1X1_SIMD - 1:0]	    ;
    logic [           C_PREVMAP_FIFO_RD_WTH - 1:0]  prevMap_fifo_dout           	[`KRNL_1X1_SIMD - 1:0]      ;
	logic											prevMap_fifo_empty				[`KRNL_1X1_SIMD - 1:0]	    ;
	logic											prevMap_fifo_prog_empty			[`KRNL_1X1_SIMD - 1:0]	    ;
	logic											prevMap_fifo_rd_valid			[`KRNL_1X1_SIMD - 1:0]	    ;
	logic [									 15:0]  prevMapFetchCount				[`KRNL_1X1_SIMD - 1:0]	    ;
	logic 											prevMap_fifo_wr_rst_busy		[`KRNL_1X1_SIMD - 1:0]	    ;
	logic 											prevMap_fifo_rd_rst_busy		[`KRNL_1X1_SIMD - 1:0]	    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    logic                                           outBuf_fifo_wren         		[C_NUM_OUTBUF - 1:0]   		;
    logic                                           outBuf_fifo_wren_w1      		[C_NUM_OUTBUF - 1:0]   		;
    logic                                           outBuf_fifo_wren_w1_d    		[C_NUM_OUTBUF - 1:0]   		;
    logic                                           outBuf_fifo_wren_w2      		[C_NUM_OUTBUF - 1:0]   		;
    logic                                           outBuf_fifo_wren_w2_d    		[C_NUM_OUTBUF - 1:0]   		;
	logic [           C_OUTBUF_FIFO_DIN_WTH - 1:0]	outBuf_fifo_datain		 		[C_NUM_OUTBUF - 1:0]		;
	logic [									 15:0]	outMapStoreCount		 		[C_NUM_OUTBUF - 1:0]		;
	logic											outBuf_fifo_prog_full			[C_NUM_OUTBUF - 1:0]		;
	logic 											outBuf_fifo_wr_rst_busy			[C_NUM_OUTBUF - 1:0]    	;
	logic 											outBuf_fifo_rd_rst_busy			[C_NUM_OUTBUF - 1:0]    	;
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           trans_in_fifo_rden             							    ;
	logic											trans_in_fifo_empty										    ;
    logic [          `job_fetch_fifo_DT_WIH - 1:0]  trans_in_fifo_dataout          							    ;
	logic											trans_in_fifo_rd_valid										;
	logic 											trans_in_fifo_wr_rst_busy									;
	logic 											trans_in_fifo_rd_rst_busy                              	    ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           trans_eg_fifo_rden             							    ;
	logic											trans_eg_fifo_empty										    ;
    logic [          `job_fetch_fifo_DT_WIH - 1:0]  trans_eg_fifo_dataout          							    ;
	logic											trans_eg_fifo_rd_valid										;
	logic 											trans_eg_fifo_wr_rst_busy									;
	logic 											trans_eg_fifo_rd_rst_busy                               	;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           job_fetch_fifo_wren                                         ;
    logic                                           job_fetch_fifo_rden             							;
	logic											job_fetch_fifo_empty										;
    logic [          `job_fetch_fifo_DT_WIH - 1:0]  job_fetch_fifo_dataout          							;
	logic											job_fetch_fifo_rd_valid										;
	logic 											job_fetch_fifo_wr_rst_busy									;
	logic 											job_fetch_fifo_rd_rst_busy                              	;
	logic [									 15:0]	inMapFetchCount												;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                C_VEC_MULT_WIDTH - 1:0]  vec_mult_din             		[`KRNL_1X1_SIMD - 1:0]     	;
    logic                                           vec_mult_din_vld         		[`KRNL_1X1_SIMD - 1:0]     	;
    logic                                           vec_mult_dout_vld        		[`KRNL_1X1_SIMD - 1:0]     	;
    logic [                C_VEC_MULT_WIDTH - 1:0]  vec_mult_dout            		[`KRNL_1X1_SIMD - 1:0]     	;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                  `KRNL_1X1_SIMD - 1:0]  adder_tree_out_vld       		[`KRNL_1X1_SIMD - 1:0]     	;
    logic [                    `PIXEL_WIDTH - 1:0]  adder_tree_out           		[`KRNL_1X1_SIMD - 1:0]		;
	logic											conv_1x1_out			 		[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           conv_1x1_vld   			 		[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           conv_1x1_vld_r           		[`KRNL_1X1_SIMD - 1:0]		;
    logic                                           conv_1x1_vld_d           		[`KRNL_1X1_SIMD - 1:0]		;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH     ),
        .C_RAM_WR_DEPTH        ( `CONVMAP_BRAM_WR_DEPTH ),
        .C_RAM_RD_WIDTH        (  C_CONVMAP_BRAM_RD_WTH ),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"		)
    )
    convMap_bram (
        .wr_clk      ( clk_intf                                 ),
        .wrAddr      ( convMap_bram_wrAddr                      ),
        .wren        ( convMap_bram_wren                        ),
        .din         ( result_datain						    ),
        .rd_clk      ( clk_FAS                                  ),
        .rdAddr      ( convMap_bram_rdAddr                      ),
        .rden        ( convMap_bram_rden                        ),
        .rd_mode     ( 1'b1                                     ),
        .fifo_fwft   ( 1'b1                                     ),
		.count		 ( convMap_bram_count						),
        .dout        ( convMap_bram_dout                        )
    );
    
    
    res_dwc_fifo #(
        .C_DATA_WIDTH  ( ),
        .C_FIFO_DEPTH  ( )
    )
    i0_res_dwc_fifo (
        .clk			    ( clk_FAS                                   ),
        .srst			    ( rst                                       ),
        .din			    ( trans_in_fifo_datain[`TRANS_PYLD_FIELD]   ),
        .wr_en			    ( res_dwc_fifo_wren                         ),
        .rd_en			    ( res_dwc_fifo_rden                         ),
        .dout               ( res_dwc_fifo_dout                         ),
        .full               (                                           ),
        .empty              (                                           ),
        .valid			    ( res_dwc_fifo_rd_vld                       ),
        .wr_rst_busy	    ( res_dwc_fifo_wr_rst_busy                  ),
        .rd_rst_busy	    ( res_dwc_fifo_rd_rst_busy	                )	
    );


	genvar g4;
	generate
		for(g4 = 0; g4 < `KRNL_1X1_SIMD; g4 = g4 + 1) begin
			xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
				.C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH     	),
				.C_RAM_WR_DEPTH        ( `KRNL_1X1_BRAM_WR_DEPTH 	),
				.C_RAM_RD_WIDTH        ( C_KRNL_1X1_BRAM_RD_WTH 	),
				.C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"			)
			)
			iX_krnl1x1_bram (
				.wr_clk      ( clk_intf                 ),
				.wrAddr      ( krnl1x1_bram_wrAddr[g4]  ),
				.wren        ( krnl1x1_bram_wren[g4]    ),
				.din         ( krnl1x1_bram_din_arr[g4] ),
				.rd_clk      ( clk_FAS                  ),
				.rdAddr      ( krnl1x1_bram_rdAddr[g4]  ),
				.rden        ( krnl1x1_bram_rden[g4]    ),
				.rd_mode     ( 1'b1                     ),
				.fifo_fwft   ( 1'b1                     ),
				.count		 ( 							),
				.dout        ( krnl1x1_bram_dout[g4]    )
			);


			xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
				.C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH     		),
				.C_RAM_WR_DEPTH        ( `CONVMAP_BRAM_WR_DEPTH 		),
				.C_RAM_RD_WIDTH        ( C_KRNL_1X1_BIAS_BRAM_RD_WTH 	),
				.C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"				)
			)
			iX_krnl1x1Bias_bram (
				.wr_clk      ( clk_intf                      	),
				.wrAddr      ( krnl1x1Bias_bram_wrAddr[g4]   	),
				.wren        ( krnl1x1Bias_bram_wren[g4]     	),
				.din         ( krnl1x1Bias_bram_din_arr[g4]		),
				.rd_clk      ( clk_FAS                     		),
				.rdAddr      ( krnl1x1Bias_bram_rdAddr[g4] 		),
				.rden        ( krnl1x1Bias_bram_rden[g4]     	),
				.rd_mode     ( 1'b1                     		),
				.fifo_fwft   ( 1'b1                     		),
				.count		 ( 									),
				.dout        ( krnl1x1Bias_bram_dout[g4]     	)
			);
			
			
			SRL_bit #(
				.C_CLOCK_CYCLES ( 1 )
			)
			i0_SRL_bit (
				.clk        ( clk_FAS               ),
				.ce         ( 1'b1                  ),
				.rst        ( rst                   ),
				.data_in    ( vector_add_0[g4]      ),
				.data_out   ( vector_add_0_d[g4]	)
			);


			SRL_bit #(
				.C_CLOCK_CYCLES ( 2 )
			)
			i1_SRL_bit (
				.clk        ( clk_FAS               ),
				.ce         ( 1'b1                  ),
				.rst        ( rst                   ),
				.data_in    ( vector_add_1[g4]      ),
				.data_out   ( vector_add_1_d[g4]    )
			);
			
			
			SRL_bit #(
				.C_CLOCK_CYCLES ( 2 )
			)
			i2_SRL_bit (
				.clk        ( clk_FAS               ),
				.ce         ( 1'b1                  ),
				.rst        ( rst                   ),
				.data_in    ( vector_add_2[g4]      ),
				.data_out   ( vector_add_2_d[g4]    )
			);
			
			
			SRL_bit #(
				.C_CLOCK_CYCLES ( 1 )
			)
			i6_SRL_bit (
				.clk        ( clk_FAS             	),
				.ce         ( 1'b1               	),
				.rst        ( rst                	),
				.data_in    ( conv_1x1_vld_r[g4]	),
				.data_out   ( conv_1x1_vld_d[g4]  	)
			);
			
			
			vector_multiply
			#(
				.C_OP_WIDTH 	( `PIXEL_WIDTH 		),
				.C_NUM_OPERANDS	( `VECTOR_MULT_SIMD )
			)
			i0_vector_multiply (
				.clk     			( clk_FAS									),
				.rst            	( rst 										),
				.datain	            ( {vec_mult_din[g4], krnl1x1_bram_dout[g4]}	),
				.datain_ready		( 											),
				.datain_valid		( vec_mult_din_vld[g4]						),
				.dout				( vec_mult_dout[g4]							),
				.dout_ready			( 1'b1										),
				.dout_valid         ( vec_mult_dout_vld[g4]						)
			);


			adder_tree #(
				.C_NUINPUTS         ( `KRNL_1X1_DEPTH_SIMD 	),
				.C_INPUT_WIDTH      ( `PIXEL_WIDTH 			),
				.C_OUTPUT_WIDTH     ( `PIXEL_WIDTH 			)
			)
			iX_adder_tree (
				.clk                ( clk_FAS					),
				.rst                (							),
				.datain_ready       ( 1'b1 						),
				.datain_valid       ( vec_mult_dout_vld[g4] 	),
				.datain             ( vec_mult_dout[g4]			),
				.dataout_ready      ( 1'b1						),
				.dataout_valid      ( adder_tree_out_vld[g4]	),
				.dataout            ( adder_tree_out[g4] 		)
			);
			
			
			conv1x1_dwc_fifo #(
				.C_DATA_WIDTH  ( ),
				.C_FIFO_DEPTH  ( )
			)
			iX_conv1x1_dwc_fifo (
				.clk			    ( clk_FAS                           ),
				.srst			    ( rst                               ),
				.din			    ( conv1x1_dwc_fifo_din[g4]          ),
				.wr_en			    ( conv1x1_dwc_fifo_wren[g4]         ),
				.rd_en			    ( conv1x1_dwc_fifo_rden[g4]         ),
				.dout               ( conv1x1_dwc_fifo_dout[g4]         ),
				.full               (                                   ),
				.empty              (                                   ),
				.valid			    ( conv1x1_dwc_fifo_rd_vld[g4]       ),
				.wr_rst_busy	    ( conv1x1_dwc_fifo_wr_rst_busy[g4]  ),
				.rd_rst_busy	    ( conv1x1_dwc_fifo_rd_rst_busy[g4]	)
			);
            
            
            prevMap_fifo 
            iX_prevMap_fifo (
                .srst				( rst						    ),
                .wr_clk				( clk_intf					    ),
                .rd_clk				( clk_FAS					    ),
                .din				( prevMap_fifo_din_arr[g4]		),
                .wr_en				( prevMap_fifo_wren[g4]			),
                .rd_en				( prevMap_fifo_rden[g4]			),
                .prog_empty_thresh	( pv_low_watermark_cfg[g4]		),
                .dout				( prevMap_fifo_dout[g4]			),
                .full				(							    ),
                .wr_ack				(							    ),
                .empty				( prevMap_fifo_empty[g4]		),
                .valid				( prevMap_fifo_rd_valid[g4]		),
                .prog_empty			( prevMap_fifo_prog_empty[g4]	),
                .wr_rst_busy		( prevMap_fifo_wr_rst_busy[g4]	),
                .rd_rst_busy		( prevMap_fifo_rd_rst_busy[g4]	)  
            );


			// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------			
			always@(*) begin
				if(opcode_cfg == `OPCODE_0
					|| opcode_cfg == `OPCODE_1
					|| opcode_cfg == `OPCODE_6
					|| opcode_cfg == `OPCODE_7
					|| opcode_cfg == `OPCODE_10
					|| opcode_cfg == `OPCODE_11)
				begin
					vec_mult_din[g4] = vector_add_out_0;
				end else if(opcode_cfg == `OPCODE_4
							|| opcode_cfg == `OPCODE_5)
				begin
					vec_mult_din[g4] = vector_add_out_1;
				end else if(opcode_cfg == `OPCODE_2
							|| opcode_cfg == `OPCODE_3
							|| opcode_cfg == `OPCODE_12
							|| opcode_cfg == `OPCODE_13
							|| opcode_cfg == `OPCODE_14)
				begin
					vec_mult_din[g4] = convMap_bram_dout;
				end
			end
			// END logic ------------------------------------------------------------------------------------------------------------------------------------

			
 			// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------           
            always@(posedge clk_FAS) begin
                if(rst) begin
                    conv1x1_dwc_fifo_count <= 0;
                end else if(conv1x1_dwc_fifo_wren) begin
                    conv1x1_dwc_fifo_count <= conv1x1_dwc_fifo_count + 1;
                end
            end
			// END logic ------------------------------------------------------------------------------------------------------------------------------------


			// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
			assign conv1x1_dwc_fifo_wren[g4] = conv_1x1_vld[g4] || conv_1x1_vld_d[g4];
			assign conv1x1_dwc_fifo_din[g4]  = conv_1x1_out[g4];
			assign conv1x1_dwc_fifo_rden[g4] = conv1x1_dwc_fifo_count == ;

			always@(posedge clk_FAS) begin
				if(rst) begin
					conv_1x1_vld[g4] <= 0;
				end else begin
					conv_1x1_vld[g4] <= 0;
					if(adder_tree_out_vld[g4] && opcode_cfg != `OPCODE_0
						&& opcode_cfg != `OPCODE_2 && opcode_cfg == `OPCODE_4
						&& opcode_cfg != `OPCODE_6 && opcode_cfg == `OPCODE_10
						&& opcode_cfg != `OPCODE_12 && opcode_cfg == `OPCODE_14)
					begin
						conv_1x1_vld[g4]    <= 1;
						conv_1x1_out[g4]    <= adder_tree_out;
					end else begin
						krnl1x1Bias_bram_rden   <= 1;
						conv_1x1_out[g4]        <= adder_tree_out + krnl1x1Bias_bram_dout;
						conv_1x1_vld_r[g4]      <= 1;
					end
				end
			end
			// END logic ------------------------------------------------------------------------------------------------------------------------------------
		end
	endgenerate
	
	
	genvar g5;
	generate
		for(g5 = 0; g5 < C_NUM_OUTBUF; g5 = g5 + 1) begin
			SRL_bit #(
				.C_CLOCK_CYCLES ( 4 )
			)
			i4_SRL_bit (
				.clk        ( clk_FAS                      	),
				.ce         ( 1'b1                      	),
				.rst        ( rst                       	),
				.data_in    ( outBuf_fifo_wren_w1[g5]       ),
				.data_out   ( outBuf_fifo_wren_w1_d[g5]     )
			);


			SRL_bit #(
				.C_CLOCK_CYCLES ( 1 )
			)
			i5_SRL_bit (
				.clk        ( clk_FAS                      	),
				.ce         ( 1'b1                      	),
				.rst        ( rst                       	),
				.data_in    ( outBuf_fifo_wren_w2[g5]       ),
				.data_out   ( outBuf_fifo_wren_w2_d[g5]     )
			);
			
			
			outBuf_fifo 
			iX_outBuf_fifo (
				.clk			  ( clk_FAS							),
				.srst			  ( rst								),
				.din			  ( outBuf_fifo_datain[g5]			),
				.wr_en			  ( outBuf_fifo_wren[g5]			),
				.rd_en			  ( outBuf_fifo_rden[g5]			),
				.prog_full_thresh ( outMapStoreFactor_cfg			),
				.dout			  ( outBuf_fifo_dout[g5]			),
				.full			  ( 								),
				.empty			  ( 								),
				.prog_full		  ( outBuf_fifo_prog_full			),
				.wr_rst_busy	  ( outBuf_fifo_wr_rst_busy[g5]		),
				.rd_rst_busy	  ( outBuf_fifo_rd_rst_busy[g5]		) 
			);
            
            getIdx(g5, g6);
			assign outBuf_fifo_wren[g5] = (outBuf_fifo_wren_w1_d[g5] | outBuf_fifo_wren_w2_d[g5] | conv1x1_dwc_fifo_rden[g6] | res_dwc_fifo_rd_vld);

			always@(*) begin
                if(opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_5
                    || opcode_cfg == `OPCODE_7
                    || opcode_cfg == `OPCODE_11
                    || opcode_cfg == `OPCODE_13) 
                begin
                    outBuf_fifo_din[g5] = vector_add_out_2[g6];
                end else if(opcode_cfg == `OPCODE_8) begin
					outBuf_fifo_din[g5] = vector_add_out_1[g6];
				end else if(opcode_cfg == `OPCODE_9
						   || opcode_cfg == `OPCODE_17
						   || opcode_cfg == `OPCODE_15)
				begin
					outBuf_fifo_din[g5] = vector_add_out_0[g6];
				end else if(opcode_cfg == `OPCODE_16) begin
					outBuf_fifo_din[g5] = res_dwc_fifo_dout;
				end else begin
					outBuf_fifo_din[g5] = conv1x1_dwc_fifo_dout[g6];
				end
			end
		end
	endgenerate


    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    )
    i3_SRL_bit (
        .clk        ( clk_FAS                  ),
        .ce         ( 1'b1                     ),
        .rst        ( rst                      ),
        .data_in    ( resdMap_bram_wren_w1     ),
        .data_out   ( resdMap_bram_rden_w1_d   )
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH 		),
        .C_RAM_WR_DEPTH        ( `RESDMAP_BRAM_WR_DEPTH		),
        .C_RAM_RD_WIDTH        ( C_RESDMAP_BRAM_RD_WTH		),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"			)
    )
    resdMap_bram (
        .wr_clk      ( clk_intf              ),
        .wrAddr      ( resdMap_bram_wrAddr   ),
        .wren        ( resdMap_bram_wren     ),
        .din         ( resdMap_bram_datain   ),
        .rd_clk      ( clk_FAS               ),
        .rdAddr      ( resdMap_bram_rdAddr   ),
        .rden        ( resdMap_bram_rden     ),
        .rd_mode     ( 1'b1                  ),
        .fifo_fwft   ( 1'b1                  ),
        .dout        ( resdMap_bram_dout     )
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH 	),
        .C_RAM_WR_DEPTH        ( `PARTMAP_BRAM_WR_DEPTH ),
        .C_RAM_RD_WIDTH        ( C_PARTMAP_BRAM_RD_WTH 	),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"		)
    )
    partMap_bram (
        .wr_clk      ( clk_intf              ),
        .wrAddr      ( partMap_bram_wrAddr   ),
        .wren        ( partMap_bram_wren     ),
        .din         ( partMap_bram_datain   ),
        .rd_clk      ( clk_FAS               ),
        .rdAddr      ( partMap_bram_rdAddr   ),
        .rden        ( partMap_bram_rden     ),
        .rd_mode     ( 1'b1                  ),
        .fifo_fwft   ( 1'b1                  ),
        .dout        ( partMap_bram_dout     )
    );
	
	
	trans_fifo 
	i0_trans_in_fifo (
		.srst				( rst							),
		.wr_clk				( clk_intf						),
		.rd_clk				( clk_FAS						),
		.din				( trans_in_fifo_datain			),
		.wr_en				( trans_in_fifo_wren			),
		.rd_en				( trans_in_fifo_rden			),
		.dout				( trans_in_fifo_dataout		    ),
		.full				(								),
		.wr_ack				(								),
		.empty				( trans_in_fifo_empty			),
		.valid				( trans_in_fifo_rd_valid		),
		.wr_rst_busy		( trans_in_fifo_wr_rst_busy	    ),
		.rd_rst_busy		( trans_in_fifo_rd_rst_busy	    ) 
	);
    
    
    trans_fifo 
	i0_trans_eg_fifo (
		.srst				( rst							),
		.wr_clk				( clk_FAS				        ),
		.rd_clk				( clk_intf						),
		.din				( trans_eg_fifo_datain			),
		.wr_en				( trans_eg_fifo_wren			),
		.rd_en				( trans_eg_fifo_rden			),
		.dout				( trans_eg_fifo_dataout		    ),
		.full				(								),
		.wr_ack				(								),
		.empty				( trans_eg_fifo_empty			),
		.valid				( trans_eg_fifo_rd_valid		),
		.wr_rst_busy		( trans_eg_fifo_wr_rst_busy	    ),
		.rd_rst_busy		( trans_eg_fifo_rd_rst_busy	    ) 
	);
    
    
    job_fetch_fifo 
	i0_job_fetch_fifo (
		.srst				( rst							),
		.wr_clk				( clk_intf						),
		.rd_clk				( clk_FAS						),
		.din				( job_fetch_fifo_datain			),
		.wr_en				( job_fetch_fifo_wren			),
		.rd_en				( job_fetch_fifo_rden			),
		.dout				( job_fetch_fifo_dataout		),
		.full				(								),
		.wr_ack				(								),
		.empty				( job_fetch_fifo_empty			),
		.valid				( job_fetch_fifo_rd_valid		),
		.wr_rst_busy		( job_fetch_fifo_wr_rst_busy	),
		.rd_rst_busy		( job_fetch_fifo_rd_rst_busy	) 
	);


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
			krnl1x1Depth_cfg            <= 0;
			krnl1x1Addr_cfg             <= 0;
			krnl1x1BiasAddr_cfg         <= 0;
			pixelSeqAddr_cfg            <= 0;
			partMapAddr_cfg             <= 0;
			resdMapAddr_cfg             <= 0;
			outMapAddr_cfg              <= 0;
			pixSeqCfgFetchTotal_cfg     <= 0;
			inMapAddr_cfg            	<= 0;
			prevMapAddr_cfg			    <= 0;
			inMapFetchFactor_cfg        <= 0;
			inMapFetchTotal_cfg         <= 0;
			krnl3x3Addr_cfg				<= 0;
			krnl3x3BiasAddr_cfg			<= 0;
			krnl3x3FetchTotal_cfg       <= 0;
			krnl3x3BiasFetchTotal_cfg	<= 0;
			krnl1x1FetchTotal_cfg       <= 0;
			krnl1x1BiasFetchTotal_cfg   <= 0;
			partMapFetchTotal_cfg       <= 0;
			resdMapFetchTotal_cfg       <= 0;
			outMapStoreTotal_cfg        <= 0;
			outMapStoreFactor_cfg       <= 0;
			prevMapFetchTotal_cfg       <= 0;
			num_1x1_kernels_cfg         <= 0;
			cm_high_watermark_cfg       <= 0;
			rm_low_watermark_cfg        <= 0;
			pm_low_watermark_cfg        <= 0;
			pv_low_watermark_cfg        <= 0;
			rm_fetch_amount_cfg         <= 0;
			pm_fetch_amount_cfg         <= 0;
			pv_fetch_amount_cfg         <= 0;
			im_fetch_amount_cfg			<= 0;
			krnl1x1_pding_cfg           <= 0;
			krnl1x1_pad_bgn_cfg         <= 0;
			krnl1x1_pad_end_cfg         <= 0;
			opcode_cfg                  <= 0;
			res_high_watermark_cfg      <= 0;
        end else begin
            // krnl1x1Depth_cfg            <= cfg_data[`KRNL1X1_DEPTH_FIELD];
            // krnl1x1Addr_cfg             <= cfg_data[`KRNL1X1_ADDR_FIELD];
            // krnl1x1BiasAddr_cfg         <= cfg_data[`KRNL1X1_BIAS_ADDR_FIELD];
            // pixelSeqAddr_cfg            <= cfg_data[`PIXEL_SEQ_ADDR_FIELD];
            // partMapAddr_cfg             <= cfg_data[`PARTMAP_ADDR_FIELD];
            // resdMapAddr_cfg             <= cfg_data[`RESDMAP_ADDR_FIELD];
            // outMapAddr_cfg              <= cfg_data[`OUTMAP_ADDR_FIELD];
            // pixSeqCfgFetchTotal_cfg     <= cfg_data[`INMAP_ADDR_FIELD];
            // inMapAddr_cfg            	<= cfg_data[`INMAP_ADDR_FIELD];
            // prevMapAddr_cfg			    <= cfg_data[`PREVMAP_ADDR_FIELD];
            // inMapFetchFactor_cfg        <= cfg_data[`INMAP_FETCHFACTOR_FIELD];
            // inMapFetchTotal_cfg         <= cfg_data[`INMAP_FETCHTOTAL_FIELD];
			// krnl3x3Addr_cfg			    <= cfg_data[`KRNL3X3_ADDR_FIELD];
			// krnl3x3BiasAddr_cfg			<= cfg_data[`KRNL3X3_BIAS_ADDR_FIELD];
            // krnl3x3FetchTotal_cfg       <= cfg_data[`KRNL3X3_FETCHTOTAL_FIELD];
            // krnl3x3BiasFetchTotal_cfg   <= cfg_data[`KRNL3X3_BIAS_FETCHTOTAL_FIELD];
            // krnl1x1FetchTotal_cfg       <= cfg_data[`KRNL1X1_FETCHTOTAL_FIELD];
            // krnl1x1BiasFetchTotal_cfg   <= cfg_data[`KRNL1X1_BIAS_FETCHTOTAL_FIELD];
            // partMapFetchTotal_cfg       <= cfg_data[`PARTMAP_FETCHTOTAL_FIELD];
            // resdMapFetchTotal_cfg       <= cfg_data[`RESDMAP_FETCHTOTAL_FIELD];
            // outMapStoreTotal_cfg        <= cfg_data[`OUTMAP_STORETOTAL_FIELD];
            // outMapStoreFactor_cfg       <= cfg_data[`OUTMAP_STOREFACTOR_FIELD];
            // prevMapFetchTotal_cfg       <= cfg_data[`PREVMAP_FETCHTOTAL_FIELD];
            // num_1x1_kernels_cfg         <= cfg_data[`NUM_1X1_KERNELS_FIELD];
            // cm_high_watermark_cfg       <= cfg_data[`CM_HIGH_WATERMARK_FIELD];
            // rm_low_watermark_cfg        <= cfg_data[`RM_LOW_WATERMARK_FIELD];
            // pm_low_watermark_cfg        <= cfg_data[`PM_LOW_WATERMARK_FIELD];
            // pv_low_watermark_cfg        <= cfg_data[`PV_LOW_WATERMARK_FIELD];
            // rm_fetch_amount_cfg         <= cfg_data[`RM_FETCH_AMOUNT_FIELD];
            // pm_fetch_amount_cfg         <= cfg_data[`PM_FETCH_AMOUNT_FIELD];
            // pv_fetch_amount_cfg         <= cfg_data[`PV_FETCH_AMOUNT_FIELD];
			// im_fetch_amount_cfg			<= cfg_data[`INMAP_FETCH_AMOUNT_FIELD];
            // krnl1x1_pding_cfg           <= cfg_data[`KRNL1X1_PDING_FIELD];
            // krnl1x1_pad_bgn_cfg         <= cfg_data[`KRNL1X1_PAD_BGN_FIELD];
            // krnl1x1_pad_end_cfg         <= cfg_data[`KRNL1X1_PAD_END_FIELD];
            // opcode_cfg                  <= cfg_data[`OPCODE_FIELD];
            // res_high_watermark_cfg      <= cfg_data[`RM_LOW_WATERMARK_FIELD];
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign res_dwc_fifo_rden = (res_dwc_fifo_count == );
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            res_dwc_fifo_count <= 0;
        end else if(res_dwc_fifo_wren) begin
            res_dwc_fifo_count <= res_dwc_fifo_count + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	integer i0, i1;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && opcode_cfg == `OPCODE_15 && vector_add_0_d) begin
            for(i0 = 0; i0 < `VECTOR_ADD_SIMD; i0 = i0 + 1) begin
                vector_add_out_0[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = convMap_bram_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + partMap_bram_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17 && vector_add_0_d) begin
            for(i1 = 0; i1 < `VECTOR_ADD_SIMD; i1 = i1 + 1) begin
                vector_add_out_0[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = convMap_bram_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + resdMap_bram_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
    end

    integer i2;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && vector_add_1_d) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1) begin
                vector_add_out_1[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = vector_add_out_0[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + resdMap_bram_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
    end

	integer i3;
	always@(*) begin
        if(opcode_cfg == `OPCODE_8 && vector_add_2_d) begin
            for(i3 = 0; i3 < `VECTOR_ADD_SIMD; i3 = i3 + 1) begin
                vector_add_out_2[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = conv1x1_dwc_fifo_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + prevMap_fifo_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            cfg_AWP_done        <= 0;
            start_AWP_done      <= 0;
            all_AWP_complete    <= 0;
            res_dwc_fifo_wren   <= 0;
            trans_in_fifo_rden  <= 0;
        end else begin
            cfg_AWP_done        <= 0;
            start_AWP_done      <= 0;
            all_AWP_complete    <= 0;
            res_dwc_fifo_wren   <= 0;
            if(!trans_in_fifo_empty) begin
                trans_in_fifo_rden <= 1;
            end
            if(trans_in_fifo_rden) begin
                if(trans_in_fifo_dataout[`TRANS_AWP_CFG_ACK]) begin
                    cfg_AWP_done        <= 1;
                end else if(trans_in_fifo_dataout[`TRANS_AWP_START_ACK]) begin
                    start_AWP_done      <= 1;
                end else if(trans_in_fifo_dataout[`TRANS_RESULT_WRITE]) begin
                    res_dwc_fifo_wren   <= 1;
                end else if(trans_in_fifo_dataout[`TRANS_JOB_CMPL]) begin
                    all_AWP_complete    <= 1;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign convMap_bram_empty       = (convMap_bram_count > 0);
    assign convMap_bram_prog_full   = (convMap_bram_count > cm_high_watermark_cfg);
    assign convMap_bram_rden        = (convMap_bram_rden_w0 | convMap_bram_rden_w1);

    always@(posedge clk_FAS) begin
        if(rst) begin
            convMap_bram_count <= 0;
        end else begin
            if(convMap_bram_wren && convMap_bram_rden) begin
                convMap_bram_count <= convMap_bram_count;
            end else if(convMap_bram_wren) begin
                convMap_bram_count <= convMap_bram_count + 1;
            end else if(convMap_bram_rden) begin
                convMap_bram_count <= convMap_bram_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign partMap_bram_empty       = (partMap_bram_count > 0);
    assign partMap_bram_prog_empty  = (partMap_bram_count > pm_low_watermark_cfg);
    assign partMap_bram_rden        = (partMap_bram_rden_w0 | partMap_bram_rden_w1);

    always@(posedge clk_FAS) begin
        if(rst) begin
            partMap_bram_count <= 0;
        end else begin
            if(partMap_bram_wren && partMap_bram_rden) begin
                partMap_bram_count <= partMap_bram_count;
            end else if(partMap_bram_wren) begin
                partMap_bram_count <= partMap_bram_count + 1;
            end else if(partMap_bram_rden) begin
                partMap_bram_count <= partMap_bram_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign resdMap_bram_empty       = (resdMap_bram_count > 0);
    assign resdMap_bram_prog_empty  = (resdMap_bram_count > rm_low_watermark_cfg);
    assign resdMap_bram_rden        = (resdMap_bram_rden_w0 | resdMap_bram_rden_w1_d | resdMap_bram_rden_w2);

    always@(posedge clk_FAS) begin
        if(rst) begin
            resdMap_bram_count <= 0;
        end else begin
            if(resdMap_bram_wren && resdMap_bram_rden) begin
                resdMap_bram_count <= resdMap_bram_count;
            end else if(resdMap_bram_wren) begin
                resdMap_bram_count <= resdMap_bram_count + 1;
            end else if(resdMap_bram_rden) begin
                resdMap_bram_count <= resdMap_bram_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	integer i;
    always@(posedge clk_FAS) begin
        if(rst) begin
            send_FAS_complete   <= 0;
            FAS_complete_acked  <= 0;
            last_wrt_r          <= 0;
            last_CO_recvd_r     <= 0;
            process_cmpl        <= 0;
        end else begin
            start_FAS_ack       <= 0;
            process_cmpl        <= 0;
            last_wrt_r          <= (last_wrt)       ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)  ? 1 : last_CO_recvd_r;
            for(i = 0; i < `MAX_AWP_PER_FAS; i = i + 1) begin
                all_AWP_complete[i] <= AWP_complete[i];
            end
            case(state)
                ST_IDLE: begin
                    if(start_FAS) begin
                        start_FAS_ack   <= 1;
                        if(opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) begin
                            state <= ST_ACTIVE;
                        end else begin
                            state <= ST_CFG_AWP;
                        end
                    end
                end
                ST_CFG_AWP: begin
                    if(cfg_AWP_done) begin
                        state <= ST_START_AWP;
                    end
                end
                ST_START_AWP: begin
                    if(start_AWP_done) begin
                        state <= ST_ACTIVE;
                    end
                end
                ST_ACTIVE: begin
                    if(partMapFetchCount == partMapFetchTotal_cfg
                        && inMapFetchCount == inMapFetchTotal_cfg
                        && resdMapFetchCount == resdMapFetchTotal_cfg
                        && prevMapFetchCount == prevMapFetchTotal_cfg
                        && (last_CO_recvd_r || opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17))
                    begin
                        state <= ST_WAIT_LAST_WRITE;
                    end
                end
                ST_WAIT_LAST_WRITE: begin
                    if(last_wrt_r) begin
                        last_wrt_r          <= 0;
                        last_CO_recvd_r     <= 0;
                        state               <= ST_SEND_COMPLETE;
                    end
                end
                ST_SEND_COMPLETE: begin
                    if(&all_AWP_complete) begin
                        send_FAS_complete 	            <= FAS_complete_ack ? 1'b0 : (~FAS_complete_acked ? 1'b1 : send_FAS_complete);
                        FAS_complete_acked              <= FAS_complete_ack ? 1'b1 :  FAS_complete_acked;
                        if(FAS_complete_acked) begin
                            state                       <= ST_IDLE;
                            process_cmpl                <= 1;
                            partMapFetchCount           <= 0;
                            prevMapFetchCount           <= 0;
                            resdMapFetchCount           <= 0;
                            outMapStoreCount            <= 0;
                        end
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign AWP_id = job_fetch_fifo_dataout[`TRANS_OP_FIELD];

    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            sys_mem_read_req[C_IM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= 0;
			inMapFetchCount							  <= 0;
            job_fetch_fifo_rden                       <= 0;
            job_fetch_data_vld                        <= 0;
        end else begin
            job_fetch_fifo_rden                       <= 0;
            if(!job_fetch_fifo_empty && !sys_mem_read_in_prog[C_IM_SM_RD_ID] && !job_fetch_data_vld) begin
                job_fetch_fifo_rden                   <= 1;
                job_fetch_data_vld                    <= 1;
            end
		    if(!convMap_bram_prog_full && job_fetch_data_vld && inMapFetchCount != inMapFetchTotal_cfg) begin
                sys_mem_read_req[C_IM_SM_RD_ID]           <= sys_mem_read_req_ack[C_IM_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_IM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_IM_SM_RD_ID]);
                sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= sys_mem_read_req_ack[C_IM_SM_RD_ID] ? 1'b1 : sys_mem_read_req_acked[C_IM_SM_RD_ID];
            end
			if(sys_mem_read_cmpl[C_IM_SM_RD_ID]) begin
                job_fetch_data_vld  <= 0;
				inMapFetchCount     <= inMapFetchCount + im_fetch_amount_cfg;
			end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            sys_mem_read_req[C_PM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= 0;
			partMapFetchCount						  <= 0;
        end else begin
            if(state == ST_ACTIVE && !sys_mem_read_in_prog[C_PM_SM_RD_ID]
                && ((opcode_cfg != `OPCODE_14 && partMap_bram_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) && partMap_bram_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                sys_mem_read_req[C_PM_SM_RD_ID]           <= sys_mem_read_req_ack[C_PM_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_PM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PM_SM_RD_ID]);
                sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= sys_mem_read_req_ack[C_PM_SM_RD_ID] ? 1'b1 :  sys_mem_read_req_acked[C_PM_SM_RD_ID];
            end
			if(sys_mem_read_cmpl[C_PM_SM_RD_ID]) begin
				partMapFetchCount  <= partMapFetchCount + pm_fetch_amount_cfg;
			end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            sys_mem_read_req[C_PV_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_PV_SM_RD_ID] && state == ST_ACTIVE && prevMap_fifo_prog_empty && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                sys_mem_read_req[C_PV_SM_RD_ID]           <= sys_mem_read_req_ack[C_PV_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_PV_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PV_SM_RD_ID]);
                sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= sys_mem_read_req_ack[C_PV_SM_RD_ID] ? 1'b1 :  sys_mem_read_req_acked[C_PV_SM_RD_ID];
            end
			if(sys_mem_read_cmpl[C_PV_SM_RD_ID]) begin
				prevMapFetchCount  <= prevMapFetchCount + pv_fetch_amount_cfg;
			end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            sys_mem_read_req[C_RM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_RM_SM_RD_ID] && state == ST_ACTIVE && resdMap_bram_prog_empty && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                sys_mem_read_req[C_RM_SM_RD_ID]           <= sys_mem_read_req_ack[C_RM_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_RM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_RM_SM_RD_ID]);      
				sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= sys_mem_read_req_ack[C_RM_SM_RD_ID] ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
            end 
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            dpth_count              <= 0;
            krnl_count              <= 0;
            buffer_update           <= 0;
			buffer_update_in_prog   <= 0;
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
			prevMap_fifo_rden		<= 0;
            adder_tree_datain_valid <= 0;
        end else begin
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
			prevMap_fifo_rden		<= 0;			
            buffer_update           <= 0;
			buffer_update_in_prog	<= 0;
            adder_tree_datain_valid <= 0;
			if(buffer_update) begin
				buffer_update_in_prog <= 1;
			end
            if(krnl1x1_bram_rden) begin
				adder_tree_datain_valid <= 1;
                if(dpth_count == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WIDTH)) begin
                    dpth_count <= 0;
                    if(krnl_count == (num_1x1_kernels_cfg  - 1)) begin
                        buffer_update   <= 1;
                        krnl_count      <= 0;
                    end else begin
                        krnl_count <= krnl_count + 1;
                    end
                end else begin
                    dpth_count <= dpth_count + `KRNL_1X1_BRAM_RD_WIDTH;
                end
				if(opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_11)
                begin
					prevMap_fifo_rden  		<= 1;
					vector_add_2			<= 1;
                    convMap_bram_rden_w0 	<= 1;
                    partMap_bram_rden_w0 	<= 1;
                end else if(opcode_cfg == `OPCODE_0
                    || opcode_cfg == `OPCODE_10)
                begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_4) begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_5) begin
					prevMap_fifo_rden  		<= 1;
					vector_add_2			<= 1;
                    convMap_bram_rden_w0 	<= 1;
                    partMap_bram_rden_w0 	<= 1;
                    resdMap_bram_rden_w0 	<= 1;
                end else if(opcode_cfg == `OPCODE_6 || opcode_cfg == `OPCODE_7) begin
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_13)
                begin
					prevMap_fifo_rden  		<= 1;
					vector_add_2			<= 1;
                    convMap_bram_rden_w0 	<= 1;
                end else if(opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_14)
                begin
                    convMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_8) begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17) begin
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_15) begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
			convMap_bram_rdAddr <= 0;
			partMap_bram_rdAddr <= 0;
			resdMap_bram_rdAddr <= 0;
            krnl1x1_bram_rdAddr <= 0;
            convMap_bram_rd_ofst <= 0;
  			partMap_bram_rd_ofst <= 0;
			resdMap_bram_rd_ofst <= 0;
        end else if(buffer_update) begin
            krnl1x1_bram_rdAddr <= krnl1x1_bram_rdAddr + 1;
			if(opcode_cfg == `OPCODE_0
				|| opcode_cfg == `OPCODE_1
				|| opcode_cfg == `OPCODE_10
				|| opcode_cfg == `OPCODE_11
                || opcode_cfg == `OPCODE_15)
			begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    partMap_bram_rd_ofst    <= partMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + partMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + 1;
                end
			end else if(opcode_cfg == `OPCODE_4
                || opcode_cfg == `OPCODE_5
                || opcode_cfg == `OPCODE_8)
            begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    partMap_bram_rd_ofst    <= partMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    resdMap_bram_rd_ofst    <= resdMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + partMap_bram_rd_ofst;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + resdMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + 1;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + 1;
                end
			end else if(opcode_cfg == `OPCODE_6
                || opcode_cfg == `OPCODE_7
                || opcode_cfg == `OPCODE_9
                || opcode_cfg == `OPCODE_17)
            begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    resdMap_bram_rd_ofst    <= resdMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + resdMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + 1;
                end
			end else if(opcode_cfg == `OPCODE_2
				|| opcode_cfg == `OPCODE_3
				|| opcode_cfg == `OPCODE_12
				|| opcode_cfg == `OPCODE_13
				|| opcode_cfg == `OPCODE_14)
			begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1X1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                end
			end
        end
    end

    always@(posedge clk_FAS) begin
        if(rst) begin
            krnl1x1Bias_bram_rdAddr <= 0;
        end else begin
            if(krnl1x1Bias_bram_rden && krnl_count == num_1x1_kernels_cfg) begin
                krnl1x1Bias_bram_rdAddr <= 0;
            end else if(krnl1x1Bias_bram_rden) begin
                krnl1x1Bias_bram_rdAddr <= krnl1x1Bias_bram_rdAddr + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            krnl1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
			vector_add_0            <= 0;
			vector_add_1            <= 0;
			vector_add_2			<= 0;
            outBuf_fifo_wren_w1  <= 0;
            outBuf_fifo_wren_w2  <= 0;
        end else begin
            krnl1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
			vector_add_0            <= 0;
			vector_add_1            <= 0;
			vector_add_2			<= 0;
            outBuf_fifo_wren_w1  <= 0;
            outBuf_fifo_wren_w2  <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_11)
                && !convMap_bram_empty
                && !partMap_bram_empty
				&& !prevMap_fifo_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden 	<= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_0
                    || opcode_cfg == `OPCODE_10)
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_13)
                && !convMap_bram_empty
				&& !prevMap_fifo_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden 	<= 1;
				prevMap_fifo_rden  	<= 1;
				vector_add_2		<= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_14)
                && !convMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_4
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_5
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
				&& !prevMap_fifo_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden 	<= 1;
				prevMap_fifo_rden  	<= 1;
				vector_add_2		<= 1;
            end  else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_6
                && !convMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_7
                && !convMap_bram_empty
                && !resdMap_bram_empty
				&& !prevMap_fifo_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl1x1_bram_rden <= 1;
				prevMap_fifo_rden  	<= 1;
				vector_add_2		<= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_8
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                partMap_bram_rden_w1    <= 1;
                vector_add_0            <= 1;
                vector_add_1            <= 1;
                resdMap_bram_rden_w1    <= 1;
                outBuf_fifo_wren_w1     <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg == `OPCODE_9 || opcode_cfg == `OPCODE_17)
                && !convMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                resdMap_bram_rden_w2    <= 1;
                vector_add_0            <= 1;
                outBuf_fifo_wren_w2     <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_15
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                partMap_bram_rden_w1    <= 1;
                vector_add_0            <= 1;
                outBuf_fifo_wren_w2     <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            outMapStoreCount <= 0;
        end else begin
            if(outBuf_fifo_prog_full && (state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)) begin
                sys_mem_write_req          <= sys_mem_write_req_ack  ? 1'b0 : (~sys_mem_write_req_acked ? 1'b1 : sys_mem_write_req);
                sys_mem_write_req_acked    <= sys_mem_write_req_ack  ? 1'b1 :  sys_mem_write_req_acked;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin
        case(state)
            ST_IDLE:                state_s = "ST_IDLE";
            ST_CFG_AWP:             state_s = "ST_CFG_AWP";
            ST_START_AWP:           state_s = "ST_START_AWP";
            ST_ACTIVE:              state_s = "ST_ACTIVE";
            ST_WAIT_LAST_WRITE:     state_s = "ST_WAIT_LAST_WRITE";
            ST_SEND_COMPLETE:       state_s = "ST_SEND_COMPLETE";
        endcase
    end
`endif


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
endmodule
