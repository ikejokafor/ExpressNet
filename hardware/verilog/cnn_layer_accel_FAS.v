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
    clk     			        ,
    rst                         ,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    start_FAS                   ,
    start_FAS_ack               ,
    cfg_data                    ,
    AWP_complete                ,
    send_FAS_complete           ,
    FAS_complete_ack			,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    sys_mem_read_req            ,
    sys_mem_read_req_ack        ,
    sys_mem_read_in_prog        ,
    sys_mem_read_cmpl           ,
    sys_mem_write_req           ,
    sys_mem_write_req_ack       ,
    sys_mem_write_in_prog       ,
    sys_mem_write_cmpl          ,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
    trans_fifo_wren             ,
    convMap_bram_wren           ,
    resdMap_bram_wren           ,
    partMap_bram_wren           ,
    prevMap_fifo_wren           ,
    krnl1x1_bram_wren           ,
    krnl1x1Bias_bram_wren       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    	
    trans_fifo_datain           ,
    convMap_bram_datain         ,
    resdMap_bram_datain         ,
    partMap_bram_datain         ,
    prevMap_fifo_datain         ,
    krnl1x1_bram_datain			,
    krnl1x1Bias_bram_datain		,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    	
    outBuf_fifo_rden			,	
    outBuf_fifo_dout            
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
    `include "cnn_layer_accel_defs.vh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE                  = 6'b000001;
    localparam ST_CFG_AWP               = 6'b000010;
    localparam ST_START_AWP             = 6'b000100;
    localparam ST_ACTIVE                = 6'b001000;
    localparam ST_WAIT_LAST_WRITE       = 6'b010000;
    localparam ST_SEND_COMPLETE         = 6'b100000;

	localparam C_VEC_ADD_WIDTH 	               	    = `KRNL_1X1_SIMD * `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_SYS_MEM_RD_ADDR_WTH                = `MAX_FAS_RD_ID * `AXI_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH                 = `MAX_FAS_RD_ID * `RD_LEN_WIDTH;
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
    localparam C_RESDMAP_BRAM_CT_WTH                = clog2(`RESDMAP_BRAM_WR_DEPTH);
    localparam C_PARTMAP_BRAM_WR_ADDR               = clog2(`PARTMAP_BRAM_WR_DEPTH);
    localparam C_PARTMAP_BRAM_RD_ADDR               = clog2(`PARTMAP_BRAM_RD_DEPTH);
    localparam C_PARTMAP_BRAM_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_PARTMAP_BRAM_CT_WTH                = clog2(`PARTMAP_BRAM_RD_DEPTH);
    localparam C_PREVMAP_FIFO_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_PREVMAP_FIFO_CT_WTH                = clog2(`KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH);
    localparam C_OUTBUF_DWC_FIFO_DIN                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_DOUT               = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_COUNT              = clog2(`KRNL_1X1_SIMD * `KRNL_1X1_DEPTH_SIMD);
    localparam C_OUTBUF_FIFO_COUNT                  = clog2(`OUTBUF_FIFO_DEPTH);
    localparam C_VEC_MULT_WIDTH                     = `KRNL_1X1_SIMD * `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                   clk     				    ;
    input                                   rst                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input                                   start_FAS                   ;
    output                                  start_FAS_ack               ;
    input  [      `CFG_DATA_WIDTH - 1:0]    cfg_data                    ;
    input  [     `MAX_AWP_PER_FAS - 1:0]    AWP_complete                ;
    input                                   send_FAS_complete           ;
    output                                  FAS_complete_ack            ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_req            ;
    output [C_SYS_MEM_RD_ADDR_WTH - 1:0]    sys_mem_read_addr           ;
    output [ C_SYS_MEM_RD_LEN_WTH - 1:0]    sys_mem_read_len            ;
    input  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_req_ack        ;
    input  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_in_prog        ;
    input  [       `MAX_FAS_RD_ID - 1:0]    sys_mem_read_cmpl           ;
    output                                  sys_mem_write_req           ;
    output [   `AXI_WR_ADDR_WIDTH - 1:0]    sys_mem_write_addr          ;
    output [        `WR_LEN_WIDTH - 1:0]    sys_mem_write_len           ;
    input                                   sys_mem_write_req_ack       ;
    input                                   sys_mem_write_in_prog       ;
    input                                   sys_mem_write_cmpl          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input                                   trans_fifo_wren             ;
    input                                   convMap_bram_wren           ;
    input                                   resdMap_bram_wren           ;
    input                                   partMap_bram_wren           ;
    input                                   prevMap_fifo_wren           ;
    input  [       `KRNL_1X1_SIMD - 1:0]    krnl1x1_bram_wren           ;
    input  [       `KRNL_1X1_SIMD - 1:0]    krnl1x1Bias_bram_wren       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  [   `TRANS_FIFO_DT_WIH - 1:0]    trans_fifo_datain           ;
    input  [   `AXI_RD_DATA_WIDTH - 1:0]    resdMap_bram_datain         ;
    input  [   `AXI_RD_DATA_WIDTH - 1:0]    partMap_bram_datain         ;
    input  [   `AXI_RD_DATA_WIDTH - 1:0]    prevMap_fifo_datain         ;
    input  [   `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1_bram_datain         ;
    input  [   `AXI_RD_DATA_WIDTH - 1:0]    krnl1x1Bias_bram_datain     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input                                   outBuf_fifo_rden            ;
    output [   `AXI_WR_DATA_WIDTH - 1:0]    outBuf_fifo_dout            ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [`AXI_RD_ADDR_WIDTH - 1:0] sys_mem_read_addr_arr[`MAX_FAS_RD_ID - 1:0];
        genvar g0; `UNPACK_ARRAY_1D(`AXI_RD_ADDR_WIDTH, `MAX_FAS_RD_ID , sys_mem_read_addr, sys_mem_read_addr_arr, g0);
    logic [`RD_LEN_WIDTH - 1:0] sys_mem_read_len_arr[`MAX_FAS_RD_ID - 1:0];
        genvar g1; `UNPACK_ARRAY_1D(`RD_LEN_WIDTH, `MAX_FAS_RD_ID , sys_mem_read_len, sys_mem_read_len_arr, g1);
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [  				                 15:0]  krnl1x1Depth_cfg           	;
	logic [  				                 15:0]  krnl1x1Addr_cfg            	;
	logic [  				                 15:0]  krnl1x1BiasAddr_cfg        	;
	logic [  				                 15:0]  pixelSeqAddr_cfg           	;
	logic [  				                 15:0]  partMapAddr_cfg            	;
	logic [  				                 15:0]  resdMapAddr_cfg            	;
	logic [  				                 15:0]  outMapAddr_cfg             	;
	logic [  				                 15:0]  pixSeqCfgFetchTotal_cfg		;
	logic [  				                 15:0]  inMapAddr_cfg              	;
	logic [  				                 15:0]  prevMapAddr_cfg				;
	logic [  				                 15:0]  inMapFetchFactor_cfg       	;
	logic [  				                 15:0]  inMapFetchTotal_cfg        	;
	logic [  				                 15:0]  krnl3x3Addr_cfg				;
	logic [  				                 15:0]  krnl3x3BiasAddr_cfg			;
	logic [  				                 15:0]  krnl3x3FetchTotal_cfg      	;
	logic [  				                 15:0]  krnl3x3BiasFetchTotal_cfg  	;
	logic [  				                 15:0]  krnl1x1FetchTotal_cfg      	;
	logic [  				                 15:0]  krnl1x1BiasFetchTotal_cfg  	;
	logic [  				                 15:0]  partMapFetchTotal_cfg      	;
	logic [  				                 15:0]  resdMapFetchTotal_cfg      	;
	logic [  				                 15:0]  outMapStoreTotal_cfg       	;
	logic [  				                 15:0]  outMapStoreFactor_cfg      	;
	logic [  				                 15:0]  prevMapFetchTotal_cfg      	;
	logic [  				                 15:0]  num_1x1_kernels_cfg        	;
	logic [  				                 15:0]  cm_high_watermark_cfg      	;
	logic [  				                 15:0]  rm_low_watermark_cfg       	;
	logic [  				                 15:0]  pm_low_watermark_cfg       	;
	logic [  				                 15:0]  pv_low_watermark_cfg       	;
	logic [  				                 15:0]  rm_fetch_amount_cfg        	;
	logic [  				                 15:0]  pm_fetch_amount_cfg        	;
	logic [  				                 15:0]  pv_fetch_amount_cfg        	;
	logic [  				                 15:0]  krnl1x1_pding_cfg          	;
	logic [  				                 15:0]  krnl1x1_pad_bgn_cfg        	;
	logic [  				                 15:0]  krnl1x1_pad_end_cfg        	;
	logic [  				                 15:0]  opcode_cfg                 	;
	logic [  				                 15:0]  res_high_watermark_cfg     	;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [               				      5:0]	state                      	;
    logic [               ` MAX_AWP_PER_FAS - 1:0]  all_AWP_complete			;
    logic 	                						FAS_complete_acked			;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           vector_add_0               	;
    logic                                           vector_add_0_d             	;
    logic                                           vector_add_1               	;
    logic                                           vector_add_1_d             	;
    logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_0			;
	logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_1			;
	logic [                 C_VEC_ADD_WIDTH - 1:0]  vector_add_out_2			;
	logic [                C_VEC_MULT_WIDTH - 1:0]	vector_mult					;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                  `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req_acked      ;
	logic 								            sys_mem_writereq_acked      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	logic [           C_CONVMAP_WR_ADDR_WTH - 1:0]  convMap_bram_wrAddr         ;
    logic                                           convMap_bram_wren           ;
    logic [           C_CONVMAP_RD_ADDR_WTH - 1:0]  convMap_bram_rdAddr         ;
    logic                                           convMap_bram_rden           ;
	logic [              C_CONVMAP_CT_WITH - 1:0]	convMap_bram_count          ;
    logic [           C_CONVMAP_BRAM_RD_WTH - 1:0]  convMap_bram_dout           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [     C_KRNL_1X1_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1_bram_wrAddr[`KRNL_1X1_SIMD];
    logic [     C_KRNL_1X1_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1_bram_rdAddr         ;
    logic                                           krnl1x1_bram_rden           ;
    logic [          C_KRNL_1X1_BRAM_RD_WTH - 1:0]  krnl1x1_bram_dout           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH - 1:0]	krnl1x1Bias_bram_wrAddr     ;
    logic [C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1Bias_bram_rdAddr     ;
    logic                                           krnl1x1Bias_bram_rden       ;
    logic [                    `PIXEL_WIDTH - 1:0]  krnl1x1Bias_bram_dout       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [      C_RESDMAP_BRAM_WR_ADDR_WTH - 1:0]  resdMap_bram_wrAddr         ;
    logic                                           resdMap_bram_wren           ;
    logic [      C_RESDMAP_BRAM_RD_ADDR_WTH - 1:0]  resdMap_bram_rdAddr         ;
    logic                                           resdMap_bram_rden           ;
    logic [           C_RESDMAP_BRAM_RD_WTH - 1:0]  resdMap_bram_dout           ;
    logic                                           resdMap_bram_wren_w1        ;
    logic                                           resdMap_bram_rden_w1_d      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [          C_PARTMAP_BRAM_WR_ADDR - 1:0]  partMap_bram_wrAddr         ;
    logic [          C_PARTMAP_BRAM_RD_ADDR - 1:0]  partMap_bram_rdAddr         ;
    logic                                           partMap_bram_rden           ;
    logic [           C_PARTMAP_BRAM_CT_WTH - 1:0]  partMap_bram_count          ;
    logic [           C_PARTMAP_BRAM_RD_WTH - 1:0]  partMap_bram_dout           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           prevMap_dwc_fifo_rden       ;
    logic [           C_PREVMAP_FIFO_RD_WTH - 1:0]  prevMap_dwc_fifo_dout       ;
    logic                                           prevMap_dwc_fifo_empty      ;
    logic                                           prevMap_fifo_wren           ;
    logic                                           prevMap_fifo_rden           ;
    logic [           C_PREVMAP_FIFO_RD_WTH - 1:0]  prevMap_fifo_dout           ;
    logic [           C_PREVMAP_FIFO_CT_WTH - 1:0]  prevMap_fifo_count          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           outBuf_dwc_fifo_wren        ;
    logic                                           outBuf_dwc_fifo_rden        ;
    logic                                           outBuf_dwc_fifo_din         ;
    logic [         C_OUTBUF_DWC_FIFO_COUNT - 1:0]  outBuf_dwc_fifo_count       ;
    logic [          C_OUTBUF_DWC_FIFO_DOUT - 1:0]  outBuf_dwc_fifo_dout        ;
    logic                                           outBuf_fifo_wren            ;
    logic                                           outBuf_fifo_wren_w1         ;
    logic                                           outBuf_fifo_wren_w1_d       ;
    logic                                           outBuf_fifo_wren_w2         ;
    logic                                           outBuf_fifo_wren_w2_d       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           trans_fifo_wren             ;
    logic                                           trans_fifo_rden             ;
    logic [              `TRANS_FIFO_DT_WIH - 1:0]  trans_fifo_dataout          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                C_VEC_MULT_WIDTH - 1:0]  vec_mult_din                ;
    logic                                           vec_mult_din_vld            ;
    logic                                           vec_mult_dout_vld           ;
    logic [                C_VEC_MULT_WIDTH - 1:0]  vec_mult_dout               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                  `KRNL_1X1_SIMD - 1:0]  adder_tree_out_vld          ;
    logic [                    `PIXEL_WIDTH - 1:0]  adder_tree_out              ;
    logic                                           conv_1x1_vld   				;
    logic                                           conv_1x1_vld_r              ;
    logic                                           conv_1x1_vld_d              ;


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
        .wr_clk      ( clk                                      ),
        .wrAddr      ( convMap_bram_wrAddr                      ),
        .wren        ( convMap_bram_wren                        ),
        .din         ( trans_fifo_dataout[`TRANS_DATA_FIELD]    ),
        .rd_clk      ( clk                                      ),
        .rdAddr      ( convMap_bram_rdAddr                      ),
        .rden        ( convMap_bram_rden                        ),
        .rd_mode     ( 1'b1                                     ),
        .fifo_fwft   ( 1'b1                                     ),
		.count		 ( convMap_bram_count						),
        .dout        ( convMap_bram_dout                        )
    );
	
	// genvar gi;
	// generate
	// 	for(gi = 0; gi < 
		xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
			.C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH     	),
			.C_RAM_WR_DEPTH        ( `KRNL_1X1_BRAM_WR_DEPTH 	),
			.C_RAM_RD_WIDTH        ( C_KRNL_1X1_BRAM_RD_WTH 	),
			.C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"			)
		)
		krnl1x1_bram (
			.wr_clk      ( clk                      ),
			.wrAddr      ( krnl1x1_bram_wrAddr      ),
			.wren        ( krnl1x1_bram_wren        ),
			.din         ( krnl1x1_bram_datain		),
			.rd_clk      ( clk                      ),
			.rdAddr      ( krnl1x1_bram_rdAddr      ),
			.rden        ( krnl1x1_bram_rden        ),
			.rd_mode     ( 1'b1                     ),
			.fifo_fwft   ( 1'b1                     ),
			.count		 ( 							),
			.dout        ( krnl1x1_bram_dout        )
		);


		xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
			.C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH     		),
			.C_RAM_WR_DEPTH        ( `CONVMAP_BRAM_WR_DEPTH 		),
			.C_RAM_RD_WIDTH        ( C_KRNL_1X1_BIAS_BRAM_RD_WTH 	),
			.C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"				)
		)
		krnl1x1Bias_bram (
			.wr_clk      ( clk                      ),
			.wrAddr      ( krnl1x1Bias_bram_wrAddr  ),
			.wren        ( krnl1x1Bias_bram_wren    ),
			.din         ( krnl1x1Bias_bram_datain	),
			.rd_clk      ( clk                      ),
			.rdAddr      ( krnl1x1Bias_bram_rdAddr	),
			.rden        ( krnl1x1Bias_bram_rden    ),
			.rd_mode     ( 1'b1                     ),
			.fifo_fwft   ( 1'b1                     ),
			.count		 ( 							),
			.dout        ( krnl1x1Bias_bram_dout    )
		);
	// endgenerate


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH 		),
        .C_RAM_WR_DEPTH        ( `RESDMAP_BRAM_WR_DEPTH		),
        .C_RAM_RD_WIDTH        ( C_RESDMAP_BRAM_RD_WTH		),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"			)
    )
    resdMap_bram (
        wr_clk      ( clk                   ),
        wrAddr      ( resdMap_bram_wrAddr   ),
        wren        ( resdMap_bram_wren     ),
        din         ( resdMap_bram_datain   ),
        rd_clk      ( clk                   ),
        rdAddr      ( resdMap_bram_rdAddr   ),
        rden        ( resdMap_bram_rden     ),
        rd_mode     ( 1'b1                  ),
        fifo_fwft   ( 1'b1                  ),
        dout        ( resdMap_bram_dout     )
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `AXI_WR_DATA_WIDTH 	),
        .C_RAM_WR_DEPTH        ( `PARTMAP_BRAM_WR_DEPTH ),
        .C_RAM_RD_WIDTH        ( C_PARTMAP_BRAM_RD_WTH 	),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"		)
    )
    partMap_bram (
        wr_clk      ( clk                   ),
        wrAddr      ( partMap_bram_wrAddr   ),
        wren        ( partMap_bram_wren     ),
        din         ( partMap_bram_datain   ),
        rd_clk      ( clk                   ),
        rdAddr      ( partMap_bram_rdAddr   ),
        rden        ( partMap_bram_rden     ),
        rd_mode     ( 1'b1                  ),
        fifo_fwft   ( 1'b1                  ),
        dout        ( partMap_bram_dout     )
    );

	/*
    fifo_fwft #(
        .C_DATA_WIDTH  ( ),
        .C_FIFO_DEPTH  ( )
    )
    prevMap_dwc_fifo
    (
        .clk            ( clk                       ),
        .rst            ( rst                       ),
        .wren           ( prevMap_dwc_fifo_wren     ),
        .rden           ( prevMap_dwc_fifo_rden     ),
        .datain         ( prevMap_dwc_fifo_din      ),
        .dataout        ( prevMap_dwc_fifo_dout     ),
        .empty          ( prevMap_dwc_fifo_empty    ),
        .full           (                           )
    );
	
	
   // FIFO_SYNC_MACRO: Synchronous First-In, First-Out (FIFO) RAM Buffer
   //                  Virtex-7
   // Xilinx HDL Language Template, version 2018.3
   /////////////////////////////////////////////////////////////////
   // DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
   // ===========|===========|============|=======================//
   //   37-72    |  "36Kb"   |     512    |         9-bit         //
   //   19-36    |  "36Kb"   |    1024    |        10-bit         //
   //   19-36    |  "18Kb"   |     512    |         9-bit         //
   //   10-18    |  "36Kb"   |    2048    |        11-bit         //
   //   10-18    |  "18Kb"   |    1024    |        10-bit         //
   //    5-9     |  "36Kb"   |    4096    |        12-bit         //
   //    5-9     |  "18Kb"   |    2048    |        11-bit         //
   //    1-4     |  "36Kb"   |    8192    |        13-bit         //
   //    1-4     |  "18Kb"   |    4096    |        12-bit         //
   /////////////////////////////////////////////////////////////////
   FIFO_SYNC_MACRO  #(
      .DEVICE				( "7SERIES"		), // Target Device: "7SERIES" 
      .ALMOST_EMPTY_OFFSET	( 0				), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET	( 0				),  // Sets almost full threshold
      .DATA_WIDTH			(`PIXEL_WIDTH	), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DO_REG				( 1				),     // Optional output register (0 or 1)
      .FIFO_SIZE ("18Kb")  // Target BRAM: "18Kb" or "36Kb" 
   ) 
   prevMap_dwc_fifo (
      .ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output almost empty
      .ALMOSTFULL(ALMOSTFULL),   // 1-bit output almost full
      .DO(DO),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(EMPTY),             // 1-bit output empty
      .FULL(FULL),               // 1-bit output full
      .RDCOUNT(RDCOUNT),         // Output read count, width determined by FIFO depth
      .RDERR(RDERR),             // 1-bit output read error
      .WRCOUNT(WRCOUNT),         // Output write count, width determined by FIFO depth
      .WRERR(WRERR),             // 1-bit output write error
      .CLK(CLK),                 // 1-bit input clock
      .DI(DI),                   // Input data, width defined by DATA_WIDTH parameter
      .RDEN(RDEN),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WREN(WREN)                // 1-bit input write enable
    );


    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH = 128,
        .C_FIFO_DEPTH = 16,
    )
    prevMap_fifo (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .wren           ( prevMap_fifo_wren     ),
        .rden           ( prevMap_fifo_rden     ),
        .datain         ( prevMap_fifo_din      ),
        .dataout        ( prevMap_fifo_dout     ),
        .empty          (                       ),
        .full           (                       ),
        .thresh         (                       ),
        .prog_full      (                       ),
        .count          (                       )
    );


	// FIFO_DUALCLOCK_MACRO: Dual Clock First-In, First-Out (FIFO) RAM Buffer
	//                       Virtex-7
	// Xilinx HDL Language Template, version 2018.3
	/////////////////////////////////////////////////////////////////
	// DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
	// ===========|===========|============|=======================//
	//   37-72    |  "36Kb"   |     512    |         9-bit         //
	//   19-36    |  "36Kb"   |    1024    |        10-bit         //
	//   19-36    |  "18Kb"   |     512    |         9-bit         //
	//   10-18    |  "36Kb"   |    2048    |        11-bit         //
	//   10-18    |  "18Kb"   |    1024    |        10-bit         //
	//    5-9     |  "36Kb"   |    4096    |        12-bit         //
	//    5-9     |  "18Kb"   |    2048    |        11-bit         //
	//    1-4     |  "36Kb"   |    8192    |        13-bit         //
	//    1-4     |  "18Kb"   |    4096    |        12-bit         //
	/////////////////////////////////////////////////////////////////
	FIFO_DUALCLOCK_MACRO  #(
		.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
		.ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
		.DATA_WIDTH(0),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
		.DEVICE("7SERIES"),  // Target device: "7SERIES" 
		.FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
		.FIRST_WORD_FALL_THROUGH ("FALSE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
	) 
	prevMap_fifo (
		.ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output almost empty
		.ALMOSTFULL(ALMOSTFULL),   // 1-bit output almost full
		.DO(DO),                   // Output data, width defined by DATA_WIDTH parameter
		.EMPTY(EMPTY),             // 1-bit output empty
		.FULL(FULL),               // 1-bit output full
		.RDCOUNT(RDCOUNT),         // Output read count, width determined by FIFO depth
		.RDERR(RDERR),             // 1-bit output read error
		.WRCOUNT(WRCOUNT),         // Output write count, width determined by FIFO depth
		.WRERR(WRERR),             // 1-bit output write error
		.DI(DI),                   // Input data, width defined by DATA_WIDTH parameter
		.RDCLK(RDCLK),             // 1-bit input read clock
		.RDEN(RDEN),               // 1-bit input read enable
		.RST(RST),                 // 1-bit input reset
		.WRCLK(WRCLK),             // 1-bit input write clock
		.WREN(WREN)                // 1-bit input write enable
	);


    fifo_fwft_prog_full_count #(
        C_DATA_WIDTH                ( ),
        C_FIFO_DEPTH                ( )
    )
    outBuf_dwc_fifo (
        .clk            ( clk                       ),
        .rst            ( rst                       ),
        .wren           ( outBuf_dwc_fifo_wren      ),
        .rden           ( outBuf_dwc_fifo_rden      ),
        .datain         ( outBuf_dwc_fifo_din       ),
        .dataout        ( outBuf_dwc_fifo_dout      ),
        .empty          (                           ),
        .full           (                           ),
        .thresh         (                           ),
        .prog_full      (                           ),
        .count          ( outBuf_dwc_fifo_count     )
    );
	
	
	// FIFO_SYNC_MACRO: Synchronous First-In, First-Out (FIFO) RAM Buffer
	//                  Virtex-7
	// Xilinx HDL Language Template, version 2018.3
	/////////////////////////////////////////////////////////////////
	// DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
	// ===========|===========|============|=======================//
	//   37-72    |  "36Kb"   |     512    |         9-bit         //
	//   19-36    |  "36Kb"   |    1024    |        10-bit         //
	//   19-36    |  "18Kb"   |     512    |         9-bit         //
	//   10-18    |  "36Kb"   |    2048    |        11-bit         //
	//   10-18    |  "18Kb"   |    1024    |        10-bit         //
	//    5-9     |  "36Kb"   |    4096    |        12-bit         //
	//    5-9     |  "18Kb"   |    2048    |        11-bit         //
	//    1-4     |  "36Kb"   |    8192    |        13-bit         //
	//    1-4     |  "18Kb"   |    4096    |        12-bit         //
	/////////////////////////////////////////////////////////////////
	FIFO_SYNC_MACRO  #(
		.DEVICE("7SERIES"), // Target Device: "7SERIES" 
		.ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
		.ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
		.DATA_WIDTH(0), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
		.DO_REG(0),     // Optional output register (0 or 1)
		.FIFO_SIZE ("18Kb")  // Target BRAM: "18Kb" or "36Kb" 
	) 
	outBuf_dwc_fifo (
		.ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output almost empty
		.ALMOSTFULL(ALMOSTFULL),   // 1-bit output almost full
		.DO(DO),                   // Output data, width defined by DATA_WIDTH parameter
		.EMPTY(EMPTY),             // 1-bit output empty
		.FULL(FULL),               // 1-bit output full
		.RDCOUNT(RDCOUNT),         // Output read count, width determined by FIFO depth
		.RDERR(RDERR),             // 1-bit output read error
		.WRCOUNT(WRCOUNT),         // Output write count, width determined by FIFO depth
		.WRERR(WRERR),             // 1-bit output write error
		.CLK(CLK),                 // 1-bit input clock
		.DI(DI),                   // Input data, width defined by DATA_WIDTH parameter
		.RDEN(RDEN),               // 1-bit input read enable
		.RST(RST),                 // 1-bit input reset
		.WREN(WREN)                // 1-bit input write enable
	);


    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH   ( ),
        .C_FIFO_DEPTH   ( ),
    )
    outBuf_fifo (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .wren           ( outBuf_fifo_wren      ),
        .rden           ( outBuf_fifo_rden      ),
        .datain         ( outBuf_fifo_datain    ),
        .dataout        ( outBuf_fifo_dout      ),
        .empty          (                       ),
        .full           (                       ),
        .thresh         (                       ),
        .prog_full      (                       ),
        .count          (                       )
    );
	
	
	// FIFO_DUALCLOCK_MACRO: Dual Clock First-In, First-Out (FIFO) RAM Buffer
	//                       Virtex-7
	// Xilinx HDL Language Template, version 2018.3
	/////////////////////////////////////////////////////////////////
	// DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
	// ===========|===========|============|=======================//
	//   37-72    |  "36Kb"   |     512    |         9-bit         //
	//   19-36    |  "36Kb"   |    1024    |        10-bit         //
	//   19-36    |  "18Kb"   |     512    |         9-bit         //
	//   10-18    |  "36Kb"   |    2048    |        11-bit         //
	//   10-18    |  "18Kb"   |    1024    |        10-bit         //
	//    5-9     |  "36Kb"   |    4096    |        12-bit         //
	//    5-9     |  "18Kb"   |    2048    |        11-bit         //
	//    1-4     |  "36Kb"   |    8192    |        13-bit         //
	//    1-4     |  "18Kb"   |    4096    |        12-bit         //
	/////////////////////////////////////////////////////////////////
   FIFO_DUALCLOCK_MACRO  #(
      .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(0),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DEVICE("7SERIES"),  // Target device: "7SERIES" 
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("FALSE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) 
   outBuf_fifo (
      .ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output almost empty
      .ALMOSTFULL(ALMOSTFULL),   // 1-bit output almost full
      .DO(DO),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(EMPTY),             // 1-bit output empty
      .FULL(FULL),               // 1-bit output full
      .RDCOUNT(RDCOUNT),         // Output read count, width determined by FIFO depth
      .RDERR(RDERR),             // 1-bit output read error
      .WRCOUNT(WRCOUNT),         // Output write count, width determined by FIFO depth
      .WRERR(WRERR),             // 1-bit output write error
      .DI(DI),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK(RDCLK),             // 1-bit input read clock
      .RDEN(RDEN),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WRCLK(WRCLK),             // 1-bit input write clock
      .WREN(WREN)                // 1-bit input write enable
   );
	

    fifo_fwft #(
        C_DATA_WIDTH ( ),
        C_FIFO_DEPTH ( )
    )
    trans_fifo
    (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .wren           ( trans_fifo_wren       ),
        .rden           ( trans_fifo_rden       ),
        .datain         ( trans_fifo_datain     ),
        .dataout        ( trans_fifo_dataout    ),
        .empty          (                       ),
        .full           (                       )
    );
	

	// FIFO_DUALCLOCK_MACRO: Dual Clock First-In, First-Out (FIFO) RAM Buffer
	//                       Virtex-7
	// Xilinx HDL Language Template, version 2018.3
	/////////////////////////////////////////////////////////////////
	// DATA_WIDTH | FIFO_SIZE | FIFO Depth | RDCOUNT/WRCOUNT Width //
	// ===========|===========|============|=======================//
	//   37-72    |  "36Kb"   |     512    |         9-bit         //
	//   19-36    |  "36Kb"   |    1024    |        10-bit         //
	//   19-36    |  "18Kb"   |     512    |         9-bit         //
	//   10-18    |  "36Kb"   |    2048    |        11-bit         //
	//   10-18    |  "18Kb"   |    1024    |        10-bit         //
	//    5-9     |  "36Kb"   |    4096    |        12-bit         //
	//    5-9     |  "18Kb"   |    2048    |        11-bit         //
	//    1-4     |  "36Kb"   |    8192    |        13-bit         //
	//    1-4     |  "18Kb"   |    4096    |        12-bit         //
	/////////////////////////////////////////////////////////////////
   FIFO_DUALCLOCK_MACRO  #(
      .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(0),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DEVICE("7SERIES"),  // Target device: "7SERIES" 
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("FALSE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) 
   trans_fifo (
      .ALMOSTEMPTY(ALMOSTEMPTY), // 1-bit output almost empty
      .ALMOSTFULL(ALMOSTFULL),   // 1-bit output almost full
      .DO(DO),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(EMPTY),             // 1-bit output empty
      .FULL(FULL),               // 1-bit output full
      .RDCOUNT(RDCOUNT),         // Output read count, width determined by FIFO depth
      .RDERR(RDERR),             // 1-bit output read error
      .WRCOUNT(WRCOUNT),         // Output write count, width determined by FIFO depth
      .WRERR(WRERR),             // 1-bit output write error
      .DI(DI),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK(RDCLK),             // 1-bit input read clock
      .RDEN(RDEN),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WRCLK(WRCLK),             // 1-bit input write clock
      .WREN(WREN)                // 1-bit input write enable
   );
   */
	


	vector_multiply
	#(
		.C_OP_WIDTH 	( `PIXEL_WIDTH 		),
		.C_NUM_OPERANDS	( `VECTOR_MULT_SIMD )
	(
    i0_vector_multiply
		.clk     			( clk 								),
		.rst            	( rst 								),
		.datain	            ( {vec_mult_din, krnl1x1_bram_dout}	),
		.datain_ready		( 									),
		.datain_valid		( vec_mult_din_vld					),
		.dout				( vec_mult_dout 					),
		.dout_ready			( 1'b1								),
		.dout_valid         ( vec_mult_dout_vld					)
	);


	adder_tree #(
        .C_NUINPUTS         ( `KRNL_1X1_DEPTH_SIMD 	),
        .C_INPUT_WIDTH      ( `PIXEL_WIDTH 			),
        .C_OUTPUT_WIDTH     ( `PIXEL_WIDTH 			)
    )
    i0_adder_tree
    (
        .clk                ( clk 					),
        .rst                (						),
        .datain_ready       ( 1'b1 					),
        .datain_valid       ( vec_mult_dout_vld 	),
        .datain             ( vec_mult_dout			),
        .dataout_ready      ( 1'b1					),
        .dataout_valid      ( adder_tree_out_vld	),
        .dataout            ( adder_tree_out 		)
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 1 )
    )
    i0_SRL_bit (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_0          ),
        .data_out   ( vector_add_0_d        )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 2 )
    )
    i1_SRL_bit (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_1          ),
        .data_out   ( vector_add_1_d        )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    )
    i2_SRL_bit (
        .clk        ( clk                      ),
        .ce         ( 1'b1                     ),
        .rst        ( rst                      ),
        .data_in    ( resdMap_bram_wren_w1     ),
        .data_out   ( resdMap_bram_rden_w1_d   )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 4 )
    )
    i3_SRL_bit (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( outBuf_fifo_wren_w1       ),
        .data_out   ( outBuf_fifo_wren_w1_d     )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 1 )
    )
    i4_SRL_bit (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( outBuf_fifo_wren_w2       ),
        .data_out   ( outBuf_fifo_wren_w2_d     )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 1 )
    )
    i5_SRL_bit (
        .clk        ( clk                ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( conv_1x1_vld_r     ),
        .data_out   ( conv_1x1_vld_d     )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge ckk) begin
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
			krnl1x1_pding_cfg           <= 0;
			krnl1x1_pad_bgn_cfg         <= 0;
			krnl1x1_pad_end_cfg         <= 0;
			opcode_cfg                  <= 0;
			res_high_watermark_cfg      <= 0;
        end else begin
            krnl1x1Depth_cfg            <= cfg_data[`KRNL1X1_DEPTH_FIELD];
            krnl1x1Addr_cfg             <= cfg_data[`KRNL1X1_ADDR_FIELD];
            krnl1x1BiasAddr_cfg         <= cfg_data[`KRNL1X1_BIAS_ADDR_FIELD];
            pixelSeqAddr_cfg            <= cfg_data[`PIXEL_SEQ_ADDR_FIELD];
            partMapAddr_cfg             <= cfg_data[`PARTMAP_ADDR_FIELD];
            resdMapAddr_cfg             <= cfg_data[`RESDMAP_ADDR_FIELD];
            outMapAddr_cfg              <= cfg_data[`OUTMAP_ADDR_FIELD];
            pixSeqCfgFetchTotal_cfg     <= cfg_data[`INMAP_ADDR_FIELD];
            inMapAddr_cfg            	<= cfg_data[`INMAP_ADDR_FIELD];
            prevMapAddr_cfg			    <= cfg_data[`PREVMAP_ADDR_FIELD];
            inMapFetchFactor_cfg        <= cfg_data[`INMAP_FETCHFACTOR_FIELD];
            inMapFetchTotal_cfg         <= cfg_data[`INMAP_FETCHTOTAL_FIELD];
			krnl3x3Addr_cfg				<= cfg_data[`KRNL3X3_ADDR_FIELD];
			krnl3x3BiasAddr_cfg			<= cfg_data[`KRNL3X3_BIAS_ADDR_FIELD];
            krnl3x3FetchTotal_cfg       <= cfg_data[`KRNL3X3_FETCHTOTAL_FIELD];
            krnl3x3BiasFetchTotal_cfg   <= cfg_data[`KRNL3X3_BIAS_FETCHTOTAL_FIELD];
            krnl1x1FetchTotal_cfg       <= cfg_data[`KRNL1X1_FETCHTOTAL_FIELD];
            krnl1x1BiasFetchTotal_cfg   <= cfg_data[`KRNL1X1_BIAS_FETCHTOTAL_FIELD];
            partMapFetchTotal_cfg       <= cfg_data[`PARTMAP_FETCHTOTAL_FIELD];
            resdMapFetchTotal_cfg       <= cfg_data[`RESDMAP_FETCHTOTAL_FIELD];
            outMapStoreTotal_cfg        <= cfg_data[`OUTMAP_STORETOTAL_FIELD];
            outMapStoreFactor_cfg       <= cfg_data[`OUTMAP_STOREFACTOR_FIELD];
            prevMapFetchTotal_cfg       <= cfg_data[`PREVMAP_FETCHTOTAL_FIELD];
            num_1x1_kernels_cfg         <= cfg_data[`NUM_1X1_KERNELS_FIELD];
            cm_high_watermark_cfg       <= cfg_data[`CM_HIGH_WATERMARK_FIELD];
            rm_low_watermark_cfg        <= cfg_data[`RM_LOW_WATERMARK_FIELD];
            pm_low_watermark_cfg        <= cfg_data[`PM_LOW_WATERMARK_FIELD];
            pv_low_watermark_cfg        <= cfg_data[`PV_LOW_WATERMARK_FIELD];
            rm_fetch_amount_cfg         <= cfg_data[`RM_FETCH_AMOUNT_FIELD];
            pm_fetch_amount_cfg         <= cfg_data[`PM_FETCH_AMOUNT_FIELD];
            pv_fetch_amount_cfg         <= cfg_data[`PV_FETCH_AMOUNT_FIELD];
            krnl1x1_pding_cfg           <= cfg_data[`KRNL1X1_PDING_FIELD];
            krnl1x1_pad_bgn_cfg         <= cfg_data[`KRNL1X1_PAD_BGN_FIELD];
            krnl1x1_pad_end_cfg         <= cfg_data[`KRNL1X1_PAD_END_FIELD];
            opcode_cfg                  <= cfg_data[`OPCODE_FIELD];
            res_high_watermark_cfg      <= cfg_data[`RES_HIGH_WATERMARK_FIELD];
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	always@(*) begin
		if(opcode_cfg == `OPCODE_0
			|| opcode_cfg == `OPCODE_1
			|| opcode_cfg == `OPCODE_6
			|| opcode_cfg == `OPCODE_7
			|| opcode_cfg == `OPCODE_10
			|| opcode_cfg == `OPCODE_11)
		begin
			vec_mult_din = vector_add_out_0;
		end else if(opcode_cfg == `OPCODE_4
					|| opcode_cfg == `OPCODE_5)
		begin
			vec_mult_din = vector_add_out_1;
		end else if(opcode_cfg == `OPCODE_2
					|| opcode_cfg == `OPCODE_3
					|| opcode_cfg == `OPCODE_12
					|| opcode_cfg == `OPCODE_13
					|| opcode_cfg == `OPCODE_14)
		begin
			vec_mult_din = convMap_bram_dout;
		end
	end

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
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1)
                vector_add_out_1[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = vector_add_out_0[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + resdMap_bram_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
    end

	integer i3;
	always@(*) begin
        if(opcode_cfg == `OPCODE_8 && vector_add_2_d) begin
            for(i3 = 0; i3 < `VECTOR_ADD_SIMD; i3 = i3 + 1)
                vector_add_out_2[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = adder_tree_out[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + prevMap_fifo_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign outBuf_dwc_fifo_wren = conv_1x1_vld || conv_1x1_vld_d;
    assign outBuf_dwc_fifo_din  = conv_1x1_out;
    assign outBuf_dwc_fifo_rden = outBuf_dwc_fifo_count == `OUTBUF_DEPTH;

	always@(posedge clk) begin
		if(rst) begin
			conv_1x1_vld <= 0;
		end else begin
			conv_1x1_vld <= 0;
			if(adder_tree_out_vld && opcode_cfg != `OPCODE_0
				&& opcode_cfg != `OPCODE_2 && opcode_cfg == `OPCODE_4
				&& opcode_cfg != `OPCODE_6 && opcode_cfg == `OPCODE_10
				&& opcode_cfg != `OPCODE_12 && opcode_cfg == `OPCODE_14)
			begin
				conv_1x1_vld            <= 1;
                conv_1x1_out            <= adder_tree_out;
			end else begin
                krnl1x1_bias_bram_rden  <= 1;
				conv_1x1_out            <= adder_tree_out + krnl1x1Bias_bram_dout;
				conv_1x1_vld_r          <= 1;
			end
		end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign convMap_bram_empty       = (convMap_bram_count > 0);
    assign convMap_bram_prog_full   = (convMap_bram_count > cm_high_watermark_cfg);
    assign convMap_bram_rden        = (convMap_bram_rden_w0 | convMap_bram_rden_w1);

    always@(posedge ckk) begin
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
    assign partMap_bram_prog_full   = (partMap_bram_count > pm_high_watermark_cfg);
    assign partMap_bram_rden        = (partMap_bram_rden_w0 | partMap_bram_rden_w1);

    always@(posedge ckk) begin
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
    assign resdMap_bram_prog_full   = (resdMap_bram_count > cm_high_watermark_cfg);
    assign resdMap_bram_rden        = (resdMap_bram_rden_w0 | resdMap_bram_rden_w1_d | resdMap_bram_rden_w2);

    always@(posedge ckk) begin
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
    always@(posedge clk) begin
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
                        if(opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17)
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
                        && resMapFetchCount == resMapFetchTotal_cfg
                        && prevMapFetchCount == prevMapFetchTotal_cfg
                        && (m_last_CO_recvd || opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17))
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
                        send_FAS_complete 	            <= FAS_complete_ack  ? 1'b0 : (~FAS_complete_acked ? 1'b1 : send_FAS_complete);
                        FAS_complete_acked              <= FAS_complete_ack  ? 1'b1 :  FAS_complete_acked;
                        if(FAS_complete_acked) begin
                            state                       <= ST_IDLE;
                            process_cmpl                <= 1;
                            all_AWP_complete            <= 0;
                            krnl3x3FetchCount           <= 0;
                            krnl3x3BiasFetchCount       <= 0;
                            partMapFetchCount           <= 0;
                            prevMapFetchCount           <= 0;
                            inMapFetchCount             <= 0;
                            krnl1x1FetchCount           <= 0;
                            krnl1x1BiasFetchCount       <= 0;
                            resMapFetchCount            <= 0;
                            outMapStoreCount            <= 0;
                        end
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk)
        if(rst) begin
            trans_fifo_rden <= 0;
        end else begin
            trans_fifo_rden <= 0;
            if(!trans_fifo_empty && !convMap_bram_prog_full) begin
                trans_fifo_rden <= 1
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_IM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= 0;
        end else begin
            if(trans_fifo_rden && !sys_mem_read_in_prog[C_IM_SM_RD_ID]) begin
                sys_mem_read_req[C_IM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_IM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_IM_SM_RD_ID]);
                sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_IM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_PM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= 0;
        end else begin
            if(state == ST_ACTIVE && !sys_mem_read_in_prog[C_PM_SM_RD_ID]
                ((opcode_cfg != `OPCODE_14 && partMap_bram_prog_full && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) && convMap_bram_prog_full && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                sys_mem_read_req[C_PM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_PM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PM_SM_RD_ID]);
                sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_PM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_PV_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_PV_SM_RD_ID] && state == ST_ACTIVE && && prevMap_bram_prog_full && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                sys_mem_read_req[C_PV_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_PV_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PV_SM_RD_ID]);
                sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_PV_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_RM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_RM_SM_RD_ID] && state == ST_ACTIVE && && prevMap_fifo_sz <= resfMap_bram_prog_full && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                sys_mem_read_req[C_RM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_RM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_RM_SM_RD_ID]);
                sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
                sys_mem_read_in_prog[C_RM_SM_RD_ID]       <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk)
        if(rst)
            dpth_count              <= 0;
            krnl_count              <= 0;
            buffer_update           <= 0;
			buffer_update_in_prog   <= 0;
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            adder_tree_datain_valid <= 0;
        end else begin
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            buffer_update           <= 0;
			buffer_update_in_prog	<= 0;
            adder_tree_datain_valid <= 0;
			if(buffer_update) begin
				buffer_update_in_prog <= 1;
			end
            if(krnl_1x1_bram_rden) begin
                if(dpth_count == (krnl1x1Depth_cfg - `KRNL_1x1_BRAM_RD_WIDTH)) begin
                    dpth_count <= 0;
                    if(krnl_count == (num_1x1_kernels_cfg  - 1)) begin
                        buffer_update   <= 1;
                        krnl_count      <= 0;
                    end else begin
                        krnl_count <= krnl_count + 1;
                    end
                end else begin
                    dpth_count <= dpth_count + `KRNL_1x1_BRAM_RD_WIDTH;
                end
                adder_tree_datain_valid <= 1;
                if(opcode_cfg == `OPCODE_0;
                    || opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_10
                    || opcode_cfg == `OPCODE_11)
                begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end  else if(opcode_cfg == `OPCODE_4 || opcode_cfg == `OPCODE_5) begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_6 || opcode_cfg == `OPCODE_7) begin
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_13
                    || opcode_cfg == `OPCODE_14)
                begin
                    convMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_8)
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17)
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_15)
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst || process_cmpl) begin
			convMap_bram_rdAddr <= 0;
			partMap_bram_rdAddr <= 0;
			resdMap_bram_rdAddr <= 0;
            krnl_1x1_bram_rdAddr <= 0;
            convMap_bram_rd_ofst <= 0;
  			partMap_bram_rd_ofst <= 0;
			resdMap_bram_rd_ofst <= 0;
        end else if(buffer_update) begin
            krnl_1x1_bram_rdAddr <= krnl_1x1_bram_rdAddr + 1;
			if(opcode_cfg == `OPCODE_0;
				|| opcode_cfg == `OPCODE_1
				|| opcode_cfg == `OPCODE_10
				|| opcode_cfg == `OPCODE_11
                || opcode_cfg == `OPCODE_15)
			begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    partMap_bram_rd_ofst    <= partMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + partMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + 1;
                end
			end else if(
                opcode_cfg == `OPCODE_4
                || opcode_cfg == `OPCODE_5
                || opcode_cfg == `OPCODE_8)
            begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    partMap_bram_rd_ofst    <= partMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    resdMap_bram_rd_ofst    <= resdMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + partMap_bram_rd_ofst;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + resdMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    partMap_bram_rdAddr     <= partMap_bram_rdAddr + 1;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + 1;
                end
			end else if(
                opcode_cfg == `OPCODE_6
                || opcode_cfg == `OPCODE_7
                || opcode_cfg == `OPCODE_9
                || opcode_cfg == `OPCODE_17)
            begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    resdMap_bram_rd_ofst    <= resdMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + resdMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                    resdMap_bram_rdAddr     <= resdMap_bram_rdAddr + 1;
                end
			end else if(
                opcode_cfg == `OPCODE_2
				|| opcode_cfg == `OPCODE_3
				|| opcode_cfg == `OPCODE_12
				|| opcode_cfg == `OPCODE_13
				|| opcode_cfg == `OPCODE_14)
			begin
                if(krnl_count == (num_1x1_kernels_cfg - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr  + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                    convMap_bram_rd_ofst    <= convMap_bram_rd_ofst + (krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT);
                end else if(dpth_count == ((krnl1x1Depth_cfg >> `KRNL_1x1_DPH_SIMD_SHMAT) - 1)) begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + convMap_bram_rd_ofst;
                end else begin
                    convMap_bram_rdAddr     <= convMap_bram_rdAddr + 1;
                end
			end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            krnl1x1_bias_bram_rdAddr <= 0;
        end else begin
            if(krnl1x1_bias_bram_rden && krnl_count == num_1x1_kernels_cfg) begin
                krnl1x1_bias_bram_rdAddr <= 0;
            end else if(krnl1x1_bias_bram_rden) begin
                krnl1x1_bias_bram_rdAddr <= krnl1x1_bias_bram_rdAddr + 1
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            krnl_1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
            outBuffer_fifo_wren_w1  <= 0;
            outBuffer_fifo_wren_w2  <= 0;
        end else begin
            krnl_1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
            outBuffer_fifo_wren_w1  <= 0;
            outBuffer_fifo_wren_w2  <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_0
                    || opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_10
                    || opcode_cfg == `OPCODE_11)
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_13
                    || opcode_cfg == `OPCODE_14)
                && !convMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_4
                    || opcode_cfg == `OPCODE_5)
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_6
                    || opcode_cfg == `OPCODE_7)
                && !convMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                krnl_1x1_bram_rden <= 1;
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
    assign outBuf_fifo_wren = (outBuf_fifo_wren_w1_d | outBuf_fifo_wren_w2_d | outBuf_dwc_fifo_rden);
    always@(*) begin
        if(opcode_cfg == `OPCODE_8) begin
            outBuf_fifo_din = vector_add_out_1;
        end else if(opcode_cfg == `OPCODE_9
                   || opcode_cfg == `OPCODE_17
                   || opcode_cfg == `OPCODE_15)
        begin
            outBuf_fifo_din = vector_add_out_0;
        end else if() begin
            outBuf_fifo_din = outBuf_dwc_fifo_dout;
        end
    end

    always@(posedge clk)
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
