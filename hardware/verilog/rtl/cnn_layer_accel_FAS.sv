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
    parameter C_FAS_ID          = 0,
    parameter C_KL_IT_RD_ID     = 0,    // mem trans ID for kernels params
	parameter C_KB_IT_RD_ID     = 1,    // mem trans ID for kernel bias params
    parameter C_AC_IT_RD_ID     = 2,    // mem trans ID for AWP cfg params
    parameter C_IM_IT_RD_ID     = 3,    // mem trans ID for input map params
    parameter C_PM_IT_RD_ID     = 4,    // mem trans ID for part maps params
    parameter C_RM_IT_RD_ID     = 5,    // mem trans ID for resd maps params
    parameter C_PV_IT_RD_ID     = 6,    // mem trans ID for prev maps params
    parameter C_NUM_RD_CLIENTS  = 4,
    parameter C_NUM_WR_CLIENTS  = 1
) (
    clk_intf                    ,
    clk_FAS                     ,
    rst                         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_rd_req               ,
    init_rd_req_id            ,
    init_rd_addr              ,
    init_rd_len               ,
    init_rd_req_ack           ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_rd_data              ,
    init_rd_data_vld          ,
    init_rd_data_rdy          ,
    init_rd_cmpl              ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------  
    init_wr_req              ,
    init_wr_req_id           ,
    init_wr_addr             ,
    init_wr_len              ,
    init_wr_req_ack          ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    init_wr_cmpl             ,
    init_wr_data             ,
    init_wr_data_vld         ,
    init_wr_data_rdy         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    targ_wr_addr             ,
    targ_wr_addr_vld         ,
    targ_wr_data             ,
    targ_wr_ack              ,
    targ_rd_addr              ,
    targ_rd_addr_vld          ,
    targ_rd_data              ,
    targ_rd_ack               ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_usrIntr                ,
    init_usrIntr_ack            ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_din_vld       ,
    trans_in_fifo_din_rdy       ,
    trans_in_fifo_din           ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_eg_fifo_dout_vld      ,
    trans_eg_fifo_dout_rdy      ,
    trans_eg_fifo_dout
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
	`include "cnn_layer_accel_FAS.svh"
	`include "cnn_layer_accel_trans_fifo.svh"
	`include "cnn_layer_accel_conv1x1_pip.svh"
	`include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    localparam ST_IDLE                              = 8'b00000001;
    localparam ST_LD_1X1_KRN                        = 8'b00000010;
	localparam ST_LD_1X1_KRB                        = 8'b00000100;
    localparam ST_CFG_AWP                           = 8'b00001000;
    localparam ST_START_AWP                         = 8'b00010000;
    localparam ST_ACTIVE                            = 8'b00100000;
    localparam ST_WAIT_LAST_WRITE                   = 8'b01000000;
    localparam ST_SEND_COMPLETE                     = 8'b10000000;
  	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------       
    localparam C_INIT_ID_WTH            = C_NUM_RD_CLIENTS * `INIT_ID_WTH;
    localparam C_INIT_ADDR_WTH          = C_NUM_RD_CLIENTS * `INIT_ADDR_WTH;
    localparam C_INIT_LEN_WTH           = C_NUM_RD_CLIENTS * `INIT_LEN_WTH;  
    localparam C_INIT_DATA_WTH          = C_NUM_RD_CLIENTS * `INIT_DATA_WTH;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_NUM_QUAD_CFG_PKTS                  = 1;
    localparam C_AWP_QUAD_CFG_PKT_TOT               = 1;
    localparam C_INIT_REQ_ID_WTH                    = `MAX_FAS_RD_ID * `MAX_FAS_RD_ID;
    localparam C_INIT_MEM_RD_ADDR_WTH               = `MAX_FAS_RD_ID * `INIT_RD_ADDR_WIDTH;
    localparam C_INIT_MEM_RD_LEN_WTH                = `MAX_FAS_RD_ID * `INIT_RD_LEN_WIDTH;  
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
	localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_RD_DTH);
    localparam C_KRNL_1X1_TRAN_SZ                   = `INIT_RD_DATA_WIDTH / `PIXEL_WIDTH;
    localparam C_KRNL_1X1_SIMD_M1                   = `KRNL_1X1_SIMD - 1;
    localparam C_KN1X1_BM_WR_SEL_DFT                = {{C_KRNL_1X1_SIMD_M1{1'b0}}, 1'b1};
    localparam C_KN1X1_BM_WR_SEL_END                = {1'b1, {C_KRNL_1X1_SIMD_M1{1'b0}}};
    localparam C_KN1X1B_BM_WR_SEL_DFT				= {{C_KRNL_1X1_SIMD_M1{1'b0}}, 1'b1};
    localparam C_KN1X1B_BM_WR_SEL_END				= {1'b1, {C_KRNL_1X1_SIMD_M1{1'b0}}};
	localparam C_CONV_1X1_PIP_EN_CFG_WTH            = `KRNL_1X1_SIMD * `MAX_1X1_KRNL_IT;
    localparam C_CURR_CONV1X1_IT_META_WTH           = `KRNL_1X1_SIMD;
    localparam C_CONV1X1_IT_WTH                     = clog2(`KRNL_1X1_SIMD);	
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CONVMAP_FIFO_CT_WTH                = clog2(`CONVMAP_FIFO_RD_DTH) + 1; 
    localparam C_PARTMAP_FIFO_CT_WTH                = clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_PREVMAP_FIFO_CT_WTH                = clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_RESDMAP_FIFO_CT_WTH                = clog2(`CONVMAP_FIFO_RD_DTH) + 1;  
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_OUTBUF_FIFO_CT_WTH                 = clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_OUTBUF_FIFO_DIN_FACTOR             = floor(`INIT_WR_DATA_WIDTH, `PIXEL_WIDTH);
    localparam C_CONV1X1_DWC_CT_WTH                 = clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_CONV1X1_DWC_DIN_PD                 = `CONV1X1_DWC_FIFO_WR_WTH - `PIXEL_WIDTH;
    localparam C_RES_DWC_FIFO_CT_WTH                = clog2(`CONVMAP_FIFO_RD_DTH) + 1;
 	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
	localparam C_TRANS_IN_FIFO_WR_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    localparam C_TRANS_IN_FIFO_RD_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    localparam C_TRANS_EG_FIFO_WR_WTH               = `TRANS_EG_FIFO_META_WIDTH + `TRANS_EG_FIFO_PYLD_WIDTH;
    localparam C_TRANS_EG_FIFO_RD_WTH               = `TRANS_EG_FIFO_META_WIDTH + `TRANS_EG_FIFO_PYLD_WIDTH;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_VEC_ADD_WIDTH                      = `VECTOR_ADD_SIMD * `PIXEL_WIDTH;
    localparam C_VEC_MULT_WIDTH                     = `VECTOR_MULT_SIMD * `PIXEL_WIDTH;	
    localparam C_VEC_SUM_ARR_SZ                     = `MAX_1X1_KRNL_DEPTH / `VECTOR_ADD_SIMD;
    localparam C_VEC_SUM_ARR_ADDR_WTH               = clog2(C_VEC_SUM_ARR_SZ);


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      clk_intf                   								;
    input  logic                                      clk_FAS                    								;
    input  logic                                      rst                        								;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_req         ;
    output logic [      C_INIT_ID_WTH - 1:0]    init_rd_req_id      ;
    output logic [    C_INIT_ADDR_WTH - 1:0]    init_rd_addr        ;
    output logic [     C_INIT_LEN_WTH - 1:0]    init_rd_len         ;
    input logic [   C_NUM_RD_CLIENTS - 1:0]     init_rd_req_ack     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic [    C_INIT_DATA_WTH - 1:0]    init_rd_data        ;
    input  logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_data_vld    ;
    output logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_data_rdy    ;
    input  logic [   C_NUM_RD_CLIENTS - 1:0]    init_rd_cmpl        ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    output logic [   C_NUM_WR_CLIENTS - 1:0]    init_wr_req         ;
    output logic [       `INIT_ID_WTH - 1:0]    init_wr_req_id      ;
    output logic [     `INIT_ADDR_WTH - 1:0]    init_wr_addr        ;
    output logic [      `INIT_LEN_WTH - 1:0]    init_wr_len         ;
    input  logic                                init_wr_req_ack     ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    output logic [     `INIT_DATA_WTH - 1:0]    init_wr_data        ;
    output logic                                init_wr_data_vld    ;
    input  logic                                init_wr_data_rdy    ;
    input  logic                                init_wr_cmpl  	    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      targ_wr_addr            								;
    input  logic                                      targ_wr_addr_vld        								;
    output logic [         `TARG_WR_DATA_WTH - 1:0]   targ_wr_data            								;
    output logic                                      targ_wr_ack             								;
    input  logic                                      targ_rd_addr             								;
    input  logic                                      targ_rd_addr_vld         								;
    input  logic [         `TARG_RD_DATA_WTH - 1:0]   targ_rd_data             								;
    output logic                                      targ_rd_ack              								;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    output logic                                      init_usrIntr               								;
    input  logic                                      init_usrIntr_ack           								;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      trans_in_fifo_din_vld      								;
    output logic                                      trans_in_fifo_din_rdy      								;
    input  logic [     C_TRANS_IN_FIFO_WR_WTH - 1:0]  trans_in_fifo_din          								;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      trans_eg_fifo_dout_vld     								;
    input  logic                                      trans_eg_fifo_dout_rdy     								;
    output logic [     C_TRANS_IN_FIFO_RD_WTH - 1:0]  trans_eg_fifo_dout         								;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                     31:0]   AWP_meta_Addr_cfg                                       ;
    logic [                                     15:0]   AWP_meta_data_len_cfg                                   ;
    logic [                                     15:0]   krnl1x1Depth_cfg                                        ;
    logic [                                     31:0]   pixelSeqAddr_cfg                                        ;
    logic [                                     31:0]   partMapAddr_cfg                                         ;
    logic [                                     31:0]   resdMapAddr_cfg                                         ;
    logic [                                     31:0]   outMapAddr_cfg                                          ;
    logic [                                     15:0]   pixSeqCfgFetchTotal_cfg                                 ;
    logic [                                     31:0]   inMapAddr_cfg                                           ;
    logic [                                     31:0]   prevMapAddr_cfg                                         ;
    logic [                                     15:0]   inMapFetchTotal_cfg                                     ;
    logic [                                     31:0]   krnl3x3Addr_cfg                                         ;
    logic [                                     31:0]   krnl3x3BiasAddr_cfg                                     ;
    logic [                                     15:0]   krnl3x3FetchTotal_cfg                                   ;
    logic [                                     15:0]   krnl3x3BiasFetchTotal_cfg                               ;
    logic [                                     15:0]   krnl1x1FetchTotal_cfg                                   ;
    logic [                                     15:0]   krnl1x1BiasFetchTotal_cfg                               ;
    logic [                                     15:0]   partMapFetchTotal_cfg                                   ;
    logic [                                     15:0]   resdMapFetchTotal_cfg                                   ;
    logic [                                     15:0]   outMapStoreTotal_cfg                                    ;
    logic [                                     15:0]   prevMapFetchTotal_cfg                                   ;
    logic [                                     15:0]   itN_num_1x1_kernels_cfg[`MAX_1X1_KRNL_IT - 1:0]         ;
    logic [                                     15:0]   num_tot_1x1_kernels_cfg                                 ;
    logic [                                     15:0]   cm_high_watermark_cfg                                   ;
    logic [                                     15:0]   rm_low_watermark_cfg                                    ;
    logic [                                     15:0]   pm_low_watermark_cfg                                    ;
    logic [                                     15:0]   pv_low_watermark_cfg                                    ;
    logic [                                     15:0]   ob_high_watermark_cfg                                   ;    
    logic [                                     15:0]   rm_fetch_amount_cfg                                     ;
    logic [                                     15:0]   pm_fetch_amount_cfg                                     ;
    logic [                                     15:0]   pv_fetch_amount_cfg                                     ;
    logic [                                     15:0]   im_fetch_amount_cfg                                     ;
    logic [                                     15:0]   ob_store_amount_cfg                                     ;    
    logic [                                     17:0]   opcode_cfg                                              ;
    logic [          C_CONV_1X1_PIP_EN_CFG_WTH - 1:0]   conv1x1_pip_en_cfg                                      ;
    logic [                                     15:0]   num_conv1x1_it_cfg                                      ;
    logic [                                     15:0]   krnl1x1_dpth_end_cfg                                    ;
    logic [                                     15:0]   krnl1x1_dpth_tot_cfg                                    ; // host cfg by doing krnl1x1Depth_cfg / krnl_trans_s
    logic [                                     15:0]   krnl_1x1_fetch_total_cfg                                ;
    logic [                                     31:0]   itN_krnl_1x1_addr_cfg[`MAX_1X1_KRNL_IT - 1:0]           ;
    logic [                                     15:0]   itN_krnl_1x1_fetch_amount_cfg[`MAX_1X1_KRNL_IT - 1:0]   ;
    logic [                                     31:0]   itN_krnlbi_1x1_addr_cfg[`MAX_1X1_KRNL_IT - 1:0]         ;
    logic [                                     15:0]   itN_krnlbi_1x1_fetch_amount_cfg[`MAX_1X1_KRNL_IT - 1:0] ;
    logic [										15:0]	krnl1x1B_ld_start_cfg									;
    logic [                                     15:0]   VECTOR_ADD_SIMD_cfg                                     ;
    logic [                                     15:0]   KRNL_1X1_SIMD_cfg                                       ;
	logic [                                     31:0]   inMapAddr                                               ;
    logic [                                     31:0]   partMapAddr                                             ;
    logic [                                     31:0]   prevMapAddr                                             ;
    logic [                                     31:0]   resdMapAddr                                             ;
    logic                                               start_FAS                                               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                      7:0]   state                                                   ;
    logic [         C_CURR_CONV1X1_IT_META_WTH - 1:0]   curr_conv1x1_it_pip_en                                  ;
    logic [                   C_CONV1X1_IT_WTH - 1:0]   conv1x1_it                                              ;       
    logic [                                     15:0]   AWP_ct                                                  ;
    logic [                                     15:0]   QUAD_ct                                                 ;
    logic [                                      7:0]   ret_state                                               ;
    logic                                               start_AWP_done                                          ;
    logic                                               cfg_AWP_done                                            ;
    logic                                               all_AWP_complete                                        ;
    logic [                     `CLOCK_FACTOR - 1:0]    process_cmpl_r                                          ;
    logic                                               process_cmpl_FAS 										;
	logic                                               process_cmpl_intf										;
	logic                                               init_usrIntr_acked                                      ;
    logic                                               last_wrt_r                                              ;
    logic                                               last_wrt                                                ;
    logic                                               last_CO_recvd_r                                         ;
    logic                                               last_CO_recvd                                           ;
    logic                                               state_update_in_prog                                    ;
    logic [                     `CLOCK_FACTOR - 1:0]    init_usrIntr_r                                          ;
    logic                                               FAS_rdy_n                                               ;
    logic                                               FAS_intf_rdy_n                                          ;
    logic [                                    15:0]    kl_ld_count                                             ;	// kernel load counter
    logic                                               all_AWP_complete_r                                      ;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                     15:0]   dpth_count                                              ;
    logic [                                     15:0]   krnl_count                                              ;
    logic [                                     15:0]   tot_krnl_count                                          ;    
	logic												conv1x1_pip_exec										;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                     `MAX_FAS_RD_ID - 1:0]   init_rd_in_prog                                         ;
    logic [                     `MAX_FAS_RD_ID - 1:0]   init_rd_req_acked                                       ;
    logic [                                     15:0]   init_rd_rem[`MAX_FAS_RD_ID - 1:0]                       ;
    logic [                                     15:0]   init_wr_rem                                             ;
    logic                                               init_wr_in_prog                                         ;
    logic                                               init_wr_req_acked                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic												convMap_fifo_wren										;
	logic                                               convMap_fifo_rden                                       ;
    logic [               `CONVMAP_FIFO_RD_WTH - 1:0]   convMap_fifo_dout                                       ;
    logic                                               convMap_fifo_empty                                      ;
    logic                                               convMap_fifo_prog_full                                  ;
    logic [              C_CONVMAP_FIFO_CT_WTH - 1:0]   convMap_fifo_count                                      ;
    logic                                               convMap_fifo_vld                                        ;
    logic                                               convMap_fifo_wr_rst_busy                                ;
    logic                                               convMap_fifo_rd_rst_busy                                ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic  [              `RES_DWC_FIFO_WR_WTH - 1:0]   res_dwc_fifo_din                                        ;
    logic                                               res_dwc_fifo_wren                                       ;
    logic                                               res_dwc_fifo_rden                                       ;
    logic  [              `RES_DWC_FIFO_WR_WTH - 1:0]   res_dwc_fifo_dout                                       ;
    logic                                               res_dwc_fifo_rd_vld                                     ;
    logic                                               res_dwc_fifo_wr_rst_busy                                ;
    logic                                               res_dwc_fifo_rd_rst_busy                                ;
    logic  [             C_RES_DWC_FIFO_CT_WTH - 1:0]   res_dwc_fifo_count                                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               krnl1x1_bram_wren                                       ;
    logic                                               krnl1x1Bias_bram_wren                                   ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   kn1x1_bm_wr_sel                                         ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   kn1x1b_bm_wr_sel                                        ;
    logic                                               conv1x1_pip_start_d[`KRNL_1X1_SIMD - 1:0]               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	logic 												krnl1x1Bias_dwc_fifo_wren								;
	logic 												krnl1x1Bias_dwc_fifo_rden			                    ;
	logic [              `KRNL_1X1_BIAS_RD_WTH - 1:0]	krnl1x1Bias_dwc_fifo_dout                               ;
	logic [	                	  `PIXEL_WIDTH - 1:0] 	krnl1x1Bias_dwc_fifo_dout_w 	                        ;
	logic 												krnl1x1Bias_dwc_fifo_vld		                        ;
	logic 												krnl1x1Bias_dwc_fifo_wr_rst_busy	                    ;
	logic 												krnl1x1Bias_dwc_fifo_rd_rst_busy	                    ;
	// BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               resdMap_fifo_wren                                       ;
    logic                                               resdMap_fifo_rden                                       ;
    logic [               `RESDMAP_FIFO_RD_WTH - 1:0]   resdMap_fifo_dout                                       ;
    logic                                               resdMap_fifo_empty                                      ;
    logic                                               resdMap_fifo_prog_empty                                 ;
    logic                                               resdMap_fifo_wr_rst_busy                                ;
    logic                                               resdMap_fifo_rd_rst_busy                                ;
    logic                                               resdMap_fifo_vld                                        ;
    logic [              C_RESDMAP_FIFO_CT_WTH - 1:0]   resdMap_fifo_count                                      ;
    logic [              C_RESDMAP_FIFO_CT_WTH - 1:0]   resdMapFetchCount                                       ;    
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               partMap_fifo_wren                                       ;
    logic                                               partMap_fifo_rden                                       ;
    logic                                               partMap_fifo_rden_w1                                    ;
    logic [               `PARTMAP_FIFO_RD_WTH - 1:0]   partMap_fifo_dout                                       ;
    logic                                               partMap_fifo_empty                                      ;
    logic                                               partMap_fifo_prog_empty                                 ;
    logic                                               partMap_fifo_wr_rst_busy                                ;
    logic                                               partMap_fifo_rd_rst_busy                                ;
    logic                                               partMap_fifo_vld                                        ;
    logic [                                     15:0]   partMapFetchCount                                       ;
    logic [              C_PARTMAP_FIFO_CT_WTH - 1:0]   partMap_fifo_count                                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               conv1x1_dwc_fifo_wren                                   ;
    logic                                               conv1x1_dwc_fifo_rden                                   ;
    logic [                       `PIXEL_WIDTH - 1:0]   conv1x1_dwc_fifo_din                                    ;
    logic [           `CONV1X1_DWC_FIFO_RD_WTH - 1:0]   conv1x1_dwc_fifo_dout                                   ;
    logic                                               conv1x1_dwc_fifo_vld                                    ;
    logic                                               conv1x1_dwc_fifo_wr_rst_busy                            ;
    logic                                               conv1x1_dwc_fifo_rd_rst_busy                            ;
    logic [               C_CONV1X1_DWC_CT_WTH - 1:0]   conv1x1_dwc_fifo_count                                  ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               prevMap_fifo_wren                                       ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_rden                                       ;
    logic [               `PREVMAP_FIFO_RD_WTH - 1:0]   prevMap_fifo_dout                                       ;
    logic                                               prevMap_fifo_empty                                      ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_prog_empty                                 ;
    logic                                               prevMap_fifo_valid                                      ;
    logic [                                     15:0]   prevMapFetchCount                                       ;
    logic                                               prevMap_fifo_wr_rst_busy                                ;
    logic                                               prevMap_fifo_rd_rst_busy                                ;
    logic [              C_PREVMAP_FIFO_CT_WTH - 1:0]   prevMap_fifo_count                                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               outBuf_fifo_wren                                        ;
    logic                                               outBuf_fifo_rden                                        ;
    logic                                               outBuf_fifo_wren1_d                                     ;
    logic                                               outBuf_fifo_wren2_d                                     ;
    logic                                               outBuf_fifo_wren_pv                                     ;
    logic                                               outBuf_fifo_wren_rm                                     ;
    logic [                `OUTBUF_FIFO_WR_WTH - 1:0]   outBuf_fifo_din                                         ;
    logic [                                     15:0]   outMapStoreCount                                        ;
    logic                                               outBuf_fifo_prog_full                                   ;
    logic                                               outBuf_fifo_vld                                         ;
    logic                                               outBuf_fifo_wr_rst_busy                                 ;
    logic                                               outBuf_fifo_rd_rst_busy                                 ;
    logic [               C_OUTBUF_FIFO_CT_WTH - 1:0]   outBuf_fifo_count                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_in_fifo_wren                                      ;
    logic                                               trans_in_fifo_wren_r                                    ;
    logic                                               trans_in_fifo_rden                                      ;
    logic [ 			C_TRANS_IN_FIFO_RD_WTH - 1:0]	trans_in_fifo_dout										;
	logic                                               trans_in_fifo_vld                                       ;
    logic                                               trans_in_fifo_empty                                     ;
    logic                                               trans_in_fifo_wr_rst_busy                               ;
    logic                                               trans_in_fifo_rd_rst_busy                               ;
	logic [           `TRANS_IN_FIFO_META_WIDTH - 1:0]	trans_in_meta											;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_eg_fifo_wren                                      ;
    logic                                               trans_eg_fifo_rden                                      ;
    logic [             C_TRANS_IN_FIFO_WR_WTH - 1:0]   trans_eg_fifo_din                                       ;
    logic                                               trans_eg_fifo_vld                                       ;
    logic                                               trans_eg_fifo_empty                                     ;
    logic                                               trans_eg_fifo_wr_rst_busy                               ;
    logic                                               trans_eg_fifo_rd_rst_busy                               ;    
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               job_fetch_fifo_wren                                     ;
    logic                                               job_fetch_fifo_rden                                     ;
    logic                                               job_fetch_fifo_empty                                    ;
    logic [                `JB_FTH_FIFO_WR_WTH - 1:0]   job_fetch_fifo_din                                      ;
    logic [                `JB_FTH_FIFO_RD_WTH - 1:0]   job_fetch_fifo_dout                                     ;
    logic                                               job_fetch_fifo_wr_rst_busy                              ;
    logic                                               job_fetch_fifo_rd_rst_busy                              ;
    logic                                               job_fetch_data_vld                                      ;
    logic [                                     15:0]   inMapFetchCount                                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                       `PIXEL_WIDTH - 1:0]   conv1x1_out[`KRNL_1X1_SIMD - 1:0]                       ;                    
    logic [                     `KRNL_1X1_SIMD - 1:0]   conv1x1_vld                                             ;                    
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	logic 												pipe_enable												;	
	logic 												conv1x1_pip_start0										;
	logic 												conv1x1_pip_start1  									;
	logic 												conv1x1_pip_start2  									;
	logic 												vector_add_pm       									;
	logic 												vector_add_rm0      									;
	logic 												vector_add_rm1      									;
	logic       										vector_add_rm_conv  									;
    logic       										vector_add_pv       									;
	logic 												outBuf_fifo_wren1   									;
	logic 												outBuf_fifo_wren2   									;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_pm_sum      									;	 
	logic [                    C_VEC_ADD_WIDTH - 1:0]	vec_add_rm0_sum											;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm1_sum	  										;
 	logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm_conv_sum										;		
	logic [                    C_VEC_ADD_WIDTH - 1:0]	vec_add_pv_sum											;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i6_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( vector_add_pv                 ),
        .data_out   ( outBuf_fifo_wren_pv           )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i7_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm_conv    ),
        .data_out   ( outBuf_fifo_wren_rm   )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + `VEC_ADD_LATENCY )
    )
    i8_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( outBuf_fifo_wren1             ),
        .data_out   ( outBuf_fifo_wren1_d           )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES ( (2 * `FAS_FIFO_LATENCY) + `VEC_ADD_LATENCY  )
    )
    i9_SRL_bit (
        .clk        ( clk_FAS                        ),
        .ce         ( 1'b1                           ),
        .rst        ( rst                            ),
        .data_in    ( outBuf_fifo_wren2              ),
        .data_out   ( outBuf_fifo_wren2_d            )
    );


	krnl1x1Bias_dwc_fifo 
	i0_krnl1x1Bias_dwc_fifo (
	  .srst			( rst								),
	  .wr_clk		( clk_intf							),
	  .rd_clk		( clk_FAS							),
	  .din			( init_rd_data					),
	  .wr_en		( krnl1x1Bias_dwc_fifo_wren			),
	  .rd_en		( krnl1x1Bias_dwc_fifo_rden			),
	  .dout			( krnl1x1Bias_dwc_fifo_dout			),
	  .full			( 									),
	  .empty		( 									),
	  .valid		( krnl1x1Bias_dwc_fifo_vld  		),
	  .wr_rst_busy	( krnl1x1Bias_dwc_fifo_wr_rst_busy	),
	  .rd_rst_busy	( krnl1x1Bias_dwc_fifo_rd_rst_busy	) 
	);


    cnn_layer_accel_trans_in_fifo
    i0_cnn_layer_accel_trans_in_fifo (
        .rst           ( rst                            ),
        .wr_clk        ( clk_intf                       ),
        .rd_clk        ( clk_FAS                        ),
        .din           ( trans_in_fifo_din              ),
        .wr_en         ( trans_in_fifo_wren             ),
        .rd_en         ( trans_in_fifo_rden             ),
        .dout          ( trans_in_fifo_dout             ),
        .full          (                                ),
        .empty         ( trans_in_fifo_empty            ),
        .valid         ( trans_in_fifo_vld              ),
        .wr_rst_busy   ( trans_in_fifo_wr_rst_busy      ),
        .rd_rst_busy   ( trans_in_fifo_rd_rst_busy		)
    );
    

    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    job_fetch_fifo
    i0_job_fetch_fifo (
        .clk                ( clk_FAS                       ),
        .srst               ( rst                           ),
        .din                ( job_fetch_fifo_din            ),
        .wr_en              ( job_fetch_fifo_wren           ),
        .rd_en              ( job_fetch_fifo_rden           ),
        .dout               ( job_fetch_fifo_dout           ),
        .full               (                               ),
        .empty              ( job_fetch_fifo_empty          ),
        .wr_rst_busy        ( job_fetch_fifo_wr_rst_busy    ),
        .rd_rst_busy        ( job_fetch_fifo_rd_rst_busy    )
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    convMap_fifo
    i0_convMap_fifo (
        .srst         ( rst                                                     ),
        .wr_clk       ( clk_intf                                                ),
        .rd_clk       ( clk_FAS                                                 ),
        .din          ( trans_in_fifo_din[`TRANS_IN_FIFO_PYLD_FIELD]    		),
        .wr_en        ( convMap_fifo_wren                                       ),
        .rd_en        ( convMap_fifo_rden                                       ),
        .dout         ( convMap_fifo_dout                                       ),
        .full         (                                                         ),
        .empty        ( convMap_fifo_empty                                      ),
        .valid        ( convMap_fifo_vld                                        ),
        .wr_rst_busy  ( convMap_fifo_wr_rst_busy                                ),
        .rd_rst_busy  ( convMap_fifo_rd_rst_busy                                ) 
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    res_dwc_fifo
    i0_res_dwc_fifo (
        .clk            ( clk_FAS                                       ),
        .srst           ( rst                                           ),
        .din            ( trans_in_fifo_din[`TRANS_IN_FIFO_PYLD_FIELD]  ),
        .wr_en          ( res_dwc_fifo_wren                             ),
        .rd_en          ( res_dwc_fifo_rden                             ),
        .dout           ( res_dwc_fifo_dout                             ),
        .full           (                                               ),
        .empty          (                                               ),
        .wr_rst_busy    ( res_dwc_fifo_wr_rst_busy                      ),
        .rd_rst_busy    ( res_dwc_fifo_rd_rst_busy                      )
    );
    
    
    // WR_WIDTH: 128
    // WR_DPETH: 8192
    // RD_WIDTH: 1024
    // RD_DEPTH: 1024
    conv1x1_dwc_fifo
    i0_conv1x1_dwc_fifo (        
        .clk            ( clk_FAS                                               ),
        .srst           ( rst                                                   ),
        .din            ( {conv1x1_dwc_fifo_din, {C_CONV1X1_DWC_DIN_PD{1'b0}}}  ),
        .wr_en          ( conv1x1_dwc_fifo_wren                                 ),
        .rd_en          ( conv1x1_dwc_fifo_rden                                 ),
        .dout           ( conv1x1_dwc_fifo_dout                                 ),
        .full           (                                                       ),
        .empty          (                                                       ),
        .wr_rst_busy    ( conv1x1_dwc_fifo_wr_rst_busy                          ),
        .rd_rst_busy    ( conv1x1_dwc_fifo_rd_rst_busy                          )
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512    
    partMap_fifo
    i0_partMap_fifo (
        .srst           ( rst                                             ),
        .wr_clk         ( clk_intf                                        ),
        .rd_clk         ( clk_FAS                                         ),
        .din            ( init_rd_data                                  ),
        .wr_en          ( partMap_fifo_wren                               ),
        .rd_en          ( partMap_fifo_rden                               ),
        .dout           ( partMap_fifo_dout                               ),
        .full           (                                                 ),
        .empty          (                                                 ),
        .valid          ( partMap_fifo_vld                                ),
        .wr_rst_busy    ( partMap_fifo_wr_rst_busy                        ),
        .rd_rst_busy    ( partMap_fifo_rd_rst_busy                        ) 
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    prevMap_fifo
    i0_prevMap_fifo (
        .srst           ( rst                                           ),
        .wr_clk         ( clk_intf                                      ),
        .rd_clk         ( clk_FAS                                       ),
        .din            ( init_rd_data                                ),
        .wr_en          ( prevMap_fifo_wren                             ),
        .rd_en          ( prevMap_fifo_rden                             ),
        .dout           ( prevMap_fifo_dout                             ),
        .full           (                                               ),
        .empty          ( prevMap_fifo_empty                            ),
        .valid          ( prevMap_fifo_valid                            ),
        .wr_rst_busy    ( prevMap_fifo_wr_rst_busy                      ),
        .rd_rst_busy    ( prevMap_fifo_rd_rst_busy                      )
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    resdMap_fifo
    i0_resdMap_fifo (
        .srst           ( rst                                           ),
        .wr_clk         ( clk_intf                                      ),
        .rd_clk         ( clk_FAS                                       ),
        .din            ( init_rd_data                                ),
        .wr_en          ( resdMap_fifo_wren                             ),
        .rd_en          ( resdMap_fifo_rden                             ),
        .dout           ( resdMap_fifo_dout                             ),
        .full           (                                               ),
        .empty          (                                               ),
        .valid          ( resdMap_fifo_vld                              ),
        .wr_rst_busy    ( resdMap_fifo_wr_rst_busy                      ),
        .rd_rst_busy    ( resdMap_fifo_rd_rst_busy                      ) 
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    outbuf_fifo
    i0_outBuf_fifo (
        .srst           ( rst                                           ),
        .wr_clk         ( clk_intf                                      ),
        .rd_clk         ( clk_FAS                                       ),
        .din            ( outBuf_fifo_din                               ),
        .wr_en          ( outBuf_fifo_wren                              ),
        .rd_en          ( outBuf_fifo_rden                              ),
        .dout           ( init_wr_data                               ),
        .full           (                                               ),
        .empty          (                                               ),
        .valid          ( outBuf_fifo_vld                               ),
        .wr_rst_busy    ( outBuf_fifo_wr_rst_busy                       ),
        .rd_rst_busy    ( outBuf_fifo_rd_rst_busy                       )
    );
    
    
    cnn_layer_accel_trans_eg_fifo
    i0_cnn_layer_accel_trans_eg_fifo (
        .rst           ( rst                            ),
        .wr_clk        ( clk_FAS                        ),
        .rd_clk        ( clk_intf                       ),
        .din           ( trans_eg_fifo_din              ),
        .wr_en         ( trans_eg_fifo_wren             ),
        .rd_en         ( trans_eg_fifo_rden             ),
        .dout          ( trans_eg_fifo_dout             ),
        .full          (                                ),
        .empty         ( trans_eg_fifo_empty            ),
        .valid         ( trans_eg_fifo_vld              ),
        .wr_rst_busy   ( trans_eg_fifo_wr_rst_busy      ),
        .rd_rst_busy   ( trans_eg_fifo_rd_rst_busy      )
    );
	
	
	cnn_layer_accel_FAS_vec_add
	i0_cnn_layer_accel_FAS_vec_add (
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.rst					( rst 					),
		.clk_FAS				( clk_FAS				),
		.process_cmpl           ( process_cmpl_FAS		),
		.FAS_intf_rdy_n         ( FAS_intf_rdy_n		),
		.FAS_rdy_n              ( FAS_rdy_n				),
		.krnl1x1_dpth_end_cfg   ( krnl1x1_dpth_end_cfg	),
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
		.convMap_fifo_dout		( convMap_fifo_dout		),
		.partMap_fifo_dout      ( partMap_fifo_dout     ),
		.resdMap_fifo_dout      ( resdMap_fifo_dout     ),
		.prevMap_fifo_dout      ( prevMap_fifo_dout     ),
		.conv1x1_dwc_fifo_dout	( conv1x1_dwc_fifo_dout ),
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.vector_add_pm			( vector_add_pm			),
		.vector_add_rm0         ( vector_add_rm0        ),
		.vector_add_rm1         ( vector_add_rm1        ),
		.vector_add_rm_conv     ( vector_add_rm_conv    ),
		.vector_add_pv          ( vector_add_pv         ),
		.pipe_enable            ( pipe_enable           ),
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.vec_add_pm_sum      	( vec_add_pm_sum      	),
		.vec_add_rm0_sum		( vec_add_rm0_sum		),	
		.vec_add_rm1_sum	  	( vec_add_rm1_sum	  	),	
		.vec_add_rm_conv_sum	( vec_add_rm_conv_sum	),		
		.vec_add_pv_sum		    ( vec_add_pv_sum		)   
	);
	
	
	cnn_layer_accel_FAS_pip_ctrl
	i0_cnn_layer_accel_FAS_pip_ctrl (
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.rst					( rst					),
		.clk_FAS             	( clk_FAS 				),
		.FAS_rdy_n           	( FAS_rdy_n				),
		.opcode_cfg				( opcode_cfg			),
		.state 					( state					),
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.convMap_fifo_empty		( convMap_fifo_empty	),
		.partMap_fifo_empty     ( partMap_fifo_empty	),
		.resdMap_fifo_empty     ( resdMap_fifo_empty	),
		.prevMap_fifo_empty     ( prevMap_fifo_empty	),
		.krnl_count				( krnl_count			),
		.conv1x1_dwc_fifo_rden	( conv1x1_dwc_fifo_rden	),	
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
		.pipe_enable			( pipe_enable		 	),
		.conv1x1_pip_start0  	( conv1x1_pip_start0 	),
		.conv1x1_pip_start1		( conv1x1_pip_start1	),
		.conv1x1_pip_start2  	( conv1x1_pip_start2 	),
		.vector_add_pm       	( vector_add_pm      	),
		.vector_add_rm0      	( vector_add_rm0     	),
		.vector_add_rm1      	( vector_add_rm1     	),
		.vector_add_rm_conv  	( vector_add_rm_conv	),
		.vector_add_pv       	( vector_add_pv			),
		.outBuf_fifo_wren1   	( outBuf_fifo_wren1  	),
		.outBuf_fifo_wren2      ( outBuf_fifo_wren2   	)
	);


    genvar g4;
    generate
        for(g4 = 0; g4 < `KRNL_1X1_SIMD; g4 = g4 + 1) begin          
            cnn_layer_accel_conv1x1_pip #(
                .C_CONV1X1_PIP_DLY ( g4 )
            ) 
            iX_cnn_layer_accel_conv1x1_pip (
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------
                .rst                        ( rst                                               ), 
                .clk_FAS                    ( clk_FAS                                           ),
                .clk_intf                   ( clk_intf                                          ),
                .process_cmpl_FAS           ( process_cmpl_FAS                                  ),
				.process_cmpl_intf          ( process_cmpl_intf                                 ),
                .FAS_intf_rdy_n             ( FAS_intf_rdy_n                                    ),
                .FAS_rdy_n                  ( FAS_rdy_n                                       	),
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------    
                .opcode_cfg                 ( opcode_cfg                                     	),
                .krnl1x1Depth_cfg           ( krnl1x1Depth_cfg                                  ),
                .itN_num_1x1_kernels_cfg    ( itN_num_1x1_kernels_cfg[conv1x1_it]               ),
				.conv1x1_it_pip_en			( curr_conv1x1_it_pip_en[g4]						),
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------
                .conv1x1_pip_start0         ( conv1x1_pip_start0                             	),
                .conv1x1_pip_start1         ( conv1x1_pip_start1                                ),
                .conv1x1_pip_start2         ( conv1x1_pip_start2                                ),
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------    
                .vec_add_pm_sum             ( vec_add_pm_sum						        	),    
                .vec_add_rm0_sum            ( vec_add_rm0_sum                                   ),
                .vec_add_rm1_sum            ( vec_add_rm1_sum                                   ),
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------    
                .krnl1x1_bram_din           ( init_rd_data                                    ),
                .krnl1x1Bias_bram_din       ( krnl1x1Bias_dwc_fifo_dout_w                       ),                
                .krnl1x1_bram_wren          ( krnl1x1_bram_wren && kn1x1_bm_wr_sel[g4]      	),
                .krnl1x1Bias_bram_wren      ( krnl1x1Bias_bram_wren && kn1x1b_bm_wr_sel[g4]		),
				.convMap_fifo_dout			( convMap_fifo_dout									),
                // BEGIN ----------------------------------------------------------------------------------------------------------------------------        
                .conv1x1_out                ( conv1x1_out[g4]                                   ),
                .conv1x1_vld                ( conv1x1_vld[g4]                                   )
            );
        end
    endgenerate    


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
        if(trans_in_fifo_rd_rst_busy
            || job_fetch_fifo_wr_rst_busy
            || job_fetch_fifo_rd_rst_busy
            || convMap_fifo_rd_rst_busy
            || res_dwc_fifo_wr_rst_busy
            || res_dwc_fifo_rd_rst_busy
            || conv1x1_dwc_fifo_wr_rst_busy
            || conv1x1_dwc_fifo_rd_rst_busy
            || partMap_fifo_rd_rst_busy
            || prevMap_fifo_rd_rst_busy
            || resdMap_fifo_rd_rst_busy
            || outBuf_fifo_wr_rst_busy
            || trans_eg_fifo_wr_rst_busy
			|| krnl1x1Bias_dwc_fifo_rd_rst_busy)
        begin
            FAS_rdy_n = 1;
        end else begin
            FAS_rdy_n = 0;
        end
    end
    
    always@(*) begin
        if(trans_in_fifo_wr_rst_busy
            || convMap_fifo_wr_rst_busy
            || partMap_fifo_wr_rst_busy
            || prevMap_fifo_wr_rst_busy
            || resdMap_fifo_wr_rst_busy
            || outBuf_fifo_rd_rst_busy
            || trans_eg_fifo_rd_rst_busy
			|| krnl1x1Bias_dwc_fifo_wr_rst_busy)
        begin
            FAS_intf_rdy_n = 1;
        end else begin
            FAS_intf_rdy_n = 0;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign curr_conv1x1_it_pip_en = conv1x1_pip_en_cfg[(`KRNL_1X1_SIMD * conv1x1_it) +: `KRNL_1X1_SIMD];
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            AWP_ct        <= 0;
            QUAD_ct        <= 0;
        end else begin
            if(trans_eg_fifo_dout_vld && trans_eg_fifo_dout_rdy) begin
                if(QUAD_ct == `MAX_QUAD_PER_AWP) begin
                    QUAD_ct          <= 0;
                    if(AWP_ct == `MAX_AWP_PER_FAS) begin
                        AWP_ct      <= 0;
                    end else begin
                        AWP_ct <= AWP_ct + 1;
                    end
                end else begin
                    QUAD_ct <= QUAD_ct + 1;
                end
            end
        end
    end
    
    
    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            targ_rd_ack <= 0;
        end else begin
            targ_rd_ack <= 0;
            if(targ_rd_addr == 0 && targ_rd_addr_vld) begin
                // <= targ_rd_data[];
                targ_rd_ack    <= 1;
            end
        end
    end

	integer i0, i1, i2;
    always@(posedge clk_intf) begin
        if(rst || process_cmpl_intf || FAS_intf_rdy_n) begin
            krnl1x1Depth_cfg                    	<= 0;
            AWP_meta_Addr_cfg                      	<= 0;
            AWP_meta_data_len_cfg                 	<= 0;
            pixelSeqAddr_cfg                    	<= 0;
            partMapAddr_cfg                     	<= 0;
            resdMapAddr_cfg                     	<= 0;
            outMapAddr_cfg                      	<= 0;
            pixSeqCfgFetchTotal_cfg             	<= 0;
            inMapAddr_cfg                       	<= 0;
            prevMapAddr_cfg                     	<= 0;
            inMapFetchTotal_cfg                 	<= 0;
            krnl3x3Addr_cfg                     	<= 0;
            krnl3x3BiasAddr_cfg                 	<= 0;
            krnl3x3FetchTotal_cfg               	<= 0;
            krnl3x3BiasFetchTotal_cfg           	<= 0;
            krnl1x1FetchTotal_cfg               	<= 0;
            krnl1x1BiasFetchTotal_cfg           	<= 0;
            partMapFetchTotal_cfg               	<= 0;
            resdMapFetchTotal_cfg               	<= 0;
            outMapStoreTotal_cfg                	<= 0;
            ob_store_amount_cfg                 	<= 0;
            prevMapFetchTotal_cfg               	<= 0;
            num_tot_1x1_kernels_cfg             	<= 0;
            cm_high_watermark_cfg               	<= 0;
            rm_low_watermark_cfg                	<= 0;
            pm_low_watermark_cfg                	<= 0;
            pv_low_watermark_cfg                	<= 0;
            rm_fetch_amount_cfg                 	<= 0;
            pm_fetch_amount_cfg                 	<= 0;
            pv_fetch_amount_cfg                 	<= 0;
            im_fetch_amount_cfg                 	<= 0;
            ob_high_watermark_cfg               	<= 0;
            opcode_cfg                          	<= 0;
            krnl1x1_dpth_end_cfg                	<= 0;
            conv1x1_pip_en_cfg                  	<= 0;
            VECTOR_ADD_SIMD_cfg                     <= `VECTOR_ADD_SIMD;
            KRNL_1X1_SIMD_cfg                       <= `KRNL_1X1_SIMD;
			for(i0 = 0; i0 < `MAX_1X1_KRNL_IT; i0 = i0 + 1) begin
				itN_num_1x1_kernels_cfg[i0]     	<= 0;			
			end			
			for(i1 = 0; i1 < `MAX_1X1_KRNL_IT; i1 = i1 + 1) begin
				itN_krnl_1x1_addr_cfg[i1]       	<= 0;
			end
			for(i2 = 0; i2 < `MAX_1X1_KRNL_IT; i2 = i2 + 1) begin
				itN_krnl_1x1_fetch_amount_cfg[i2]	<= 0;
			end
            start_FAS                           	<= 0;
            targ_wr_ack                      	<= 0;
            krnl1x1FetchTotal_cfg               	<= 0;
			krnl1x1B_ld_start_cfg					<= 0;
        end else begin
            start_FAS                               <= 0;
            targ_wr_ack                        	<= 0;
            if(targ_wr_addr == 0 && targ_wr_addr_vld) begin
                // <= targ_wr_data[];
                targ_wr_ack    	<= 1;
            end else if(targ_wr_addr == 1 && targ_wr_addr_vld) begin
                start_FAS       	<= 1;
                targ_wr_ack    	<= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
	assign krnl1x1Bias_dwc_fifo_dout_w = krnl1x1Bias_dwc_fifo_dout[`PIXEL_WIDTH - 1:0];
    
    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
			kl_ld_count    				<= 0;
        end else begin
			if(kl_ld_count >= krnl1x1B_ld_start_cfg) begin
			end
            if(init_rd_data_rdy[C_KL_IT_RD_ID] && init_rd_data_vld[C_KL_IT_RD_ID]) begin
                kl_ld_count			<= kl_ld_count + C_KRNL_1X1_TRAN_SZ;
            end
			if(init_rd_cmpl[C_KL_IT_RD_ID]) begin
                kl_ld_count         <= 0;
            end
        end
    end
	
	always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            krnl1x1_bram_wren 	<= 0;
            kn1x1_bm_wr_sel     <= C_KN1X1_BM_WR_SEL_DFT;
        end else begin
			if(init_rd_data_rdy[C_KL_IT_RD_ID] && init_rd_data_vld[C_KL_IT_RD_ID]) begin
                krnl1x1_bram_wren		<= 1;
            end
            if(krnl1x1_bram_wren && kl_ld_count == krnl1x1_dpth_tot_cfg && kn1x1_bm_wr_sel == C_KN1X1_BM_WR_SEL_END) begin
                kn1x1_bm_wr_sel        	<= C_KN1X1_BM_WR_SEL_DFT;
            end else if(krnl1x1_bram_wren && kl_ld_count == krnl1x1_dpth_tot_cfg) begin
                kn1x1_bm_wr_sel        	<= kn1x1_bm_wr_sel << 1;
            end
		end
    end

	always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            krnl1x1Bias_bram_wren 		<= 0;
			krnl1x1Bias_dwc_fifo_wren	<= 0;
            kn1x1b_bm_wr_sel    		<= C_KN1X1B_BM_WR_SEL_DFT;
        end else begin
			krnl1x1Bias_bram_wren 		<= 0;
			krnl1x1Bias_dwc_fifo_wren	<= 0;
			if(init_rd_data_rdy[C_KB_IT_RD_ID] && init_rd_data_vld[C_KB_IT_RD_ID]) begin
				krnl1x1Bias_dwc_fifo_wren <= 1;
			end
			if(krnl1x1Bias_dwc_fifo_vld) krnl1x1Bias_bram_wren <= 1;
            if(krnl1x1Bias_dwc_fifo_vld && kn1x1b_bm_wr_sel == C_KN1X1B_BM_WR_SEL_END) begin
                kn1x1b_bm_wr_sel        <= C_KN1X1B_BM_WR_SEL_DFT;
            end else if(krnl1x1Bias_bram_wren) begin
                kn1x1b_bm_wr_sel        <= kn1x1b_bm_wr_sel << 1;
            end
        end
    end	
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign res_dwc_fifo_rden = res_dwc_fifo_count == C_OUTBUF_FIFO_DIN_FACTOR;
    assign res_dwc_fifo_din     = trans_in_fifo_dout;

    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            res_dwc_fifo_count <= 0;
        end else if(res_dwc_fifo_wren) begin
            res_dwc_fifo_count <= res_dwc_fifo_count + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign convMap_fifo_prog_full = (convMap_fifo_count > cm_high_watermark_cfg);

    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            convMap_fifo_count <= 0;
        end else begin
            if(convMap_fifo_wren && convMap_fifo_rden) begin
                convMap_fifo_count <= convMap_fifo_count;
            end else if(convMap_fifo_wren) begin
                convMap_fifo_count <= convMap_fifo_count + 1;
            end else if(convMap_fifo_rden) begin
                convMap_fifo_count <= convMap_fifo_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign partMap_fifo_prog_empty  = (partMap_fifo_count > pm_low_watermark_cfg);
    assign partMap_fifo_wren        = init_rd_data_vld[C_PM_IT_RD_ID] && init_rd_data_rdy[C_PM_IT_RD_ID];

    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            partMap_fifo_count <= 0;
        end else begin
            if(partMap_fifo_wren && partMap_fifo_rden) begin
                partMap_fifo_count <= partMap_fifo_count;
            end else if(partMap_fifo_wren) begin
                partMap_fifo_count <= partMap_fifo_count + 1;
            end else if(partMap_fifo_rden) begin
                partMap_fifo_count <= partMap_fifo_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign resdMap_fifo_prog_empty  = (resdMap_fifo_count > rm_low_watermark_cfg);
    assign resdMap_fifo_wren        = init_rd_data_vld[C_RM_IT_RD_ID] && init_rd_data_rdy[C_RM_IT_RD_ID];

    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            resdMap_fifo_count <= 0;
        end else begin
            if(resdMap_fifo_wren && resdMap_fifo_rden) begin
                resdMap_fifo_count <= resdMap_fifo_count;
            end else if(resdMap_fifo_wren) begin
                resdMap_fifo_count <= resdMap_fifo_count + 1;
            end else if(resdMap_fifo_rden) begin
                resdMap_fifo_count <= resdMap_fifo_count - 1;
            end
        end
    end
    // END logic -------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign prevMap_fifo_prog_empty  = (prevMap_fifo_count > pv_low_watermark_cfg);
    assign prevMap_fifo_wren        = init_rd_data_vld[C_PV_IT_RD_ID] && init_rd_data_rdy[C_PV_IT_RD_ID];

    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            prevMap_fifo_count <= 0;
        end else begin
            if(prevMap_fifo_wren && prevMap_fifo_rden) begin
                prevMap_fifo_count <= prevMap_fifo_count;
            end else if(prevMap_fifo_wren) begin
                prevMap_fifo_count <= prevMap_fifo_count + 1;
            end else if(prevMap_fifo_rden) begin
                prevMap_fifo_count <= prevMap_fifo_count - 1;
            end
        end
    end
    // END logic -------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign conv1x1_dwc_fifo_wren = |conv1x1_vld;
    assign conv1x1_dwc_fifo_rden = (conv1x1_dwc_fifo_count == C_OUTBUF_FIFO_DIN_FACTOR);
    
    integer i5;
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            conv1x1_dwc_fifo_count <= 0;
        end else if(conv1x1_dwc_fifo_wren) begin
            for(i5 = 0; i5 < `KRNL_1X1_SIMD; i5 = i5 + 1) begin
                if(conv1x1_vld[i5]) begin
                    conv1x1_dwc_fifo_din <= conv1x1_out[i5];
                end
            end
            conv1x1_dwc_fifo_count <= conv1x1_dwc_fifo_count + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_usrIntr 		= |init_usrIntr_r;
    assign process_cmpl_intf 	= |process_cmpl_r;
	assign process_cmpl_FAS	 	= process_cmpl_r[0];
    
    integer i7;
    always@(posedge clk_FAS) begin
        for(int i7 = 1; i7 < `CLOCK_FACTOR; i7 = i7 + 1) begin
            init_usrIntr_r[i7] <= init_usrIntr_r[i7 - 1];
        end
    end

    integer i8;
    always@(posedge clk_FAS) begin
        for(int i8 = 1; i8 < `CLOCK_FACTOR; i8 = i8 + 1) begin
            process_cmpl_r[i8] <= process_cmpl_r[i8 - 1];
        end
    end
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            last_wrt_r          <= 0;
            last_CO_recvd_r     <= 0;
            process_cmpl_r[0]   <= 0;
            init_usrIntr_acked  <= 0;
            init_usrIntr_r[0]   <= 0;
            state                <= ST_IDLE;
        end else begin
            process_cmpl_r[0]   <= 0;
            last_wrt_r          <= (last_wrt)         ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)    ? 1 : last_CO_recvd_r;
            all_AWP_complete_r  <= (all_AWP_complete) ? 1 : all_AWP_complete_r;
            init_usrIntr_r[0]   <= 0;
            case(state)
                ST_IDLE: begin
                    if(start_FAS && (opcode_cfg[`OPCODE_17_FIELD] || opcode_cfg[`OPCODE_14_FIELD] || opcode_cfg[`OPCODE_16_FIELD])) begin    // res only no AWP exe OR // 1x1 only no AWP exe // or 1st it and wrt back
                        state        <= ST_ACTIVE;
                    end else if(start_FAS) begin
                        state        <= ST_LD_1X1_KRN;
                        ret_state    <= ST_CFG_AWP;					
					end
                end
                ST_LD_1X1_KRN: begin
                    if(init_rd_cmpl[C_KL_IT_RD_ID]) begin
                        state <= ST_LD_1X1_KRB;
                    end
                end
				ST_LD_1X1_KRB: begin
                    if(init_rd_cmpl[C_KB_IT_RD_ID]) begin
                        state <= ret_state;
                    end
                end
                ST_CFG_AWP: begin
                    // if(cfg_AWP_done) begin
                        state   <= ST_START_AWP;
                    // end
                end
                ST_START_AWP: begin
                    // if(start_AWP_done) begin
                        inMapAddr       <= inMapAddr_cfg;
                        partMapAddr     <= partMapAddr_cfg;
                        prevMapAddr     <= prevMapAddr_cfg;
                        resdMapAddr     <= resdMapAddr_cfg;
                        state           <= ST_ACTIVE;
                    // end
                end
                ST_ACTIVE: begin
                    if(krnl_count == itN_num_1x1_kernels_cfg[conv1x1_it] && tot_krnl_count < num_tot_1x1_kernels_cfg) begin
                        state       <= ST_LD_1X1_KRN;
                        ret_state   <= ST_ACTIVE;
                    end else if(partMapFetchCount == partMapFetchTotal_cfg
                        && inMapFetchCount == inMapFetchTotal_cfg
                        && resdMapFetchCount == resdMapFetchTotal_cfg
                        && prevMapFetchCount == prevMapFetchTotal_cfg
                        && (last_CO_recvd_r || opcode_cfg[`OPCODE_14_FIELD] || opcode_cfg[`OPCODE_17_FIELD]))
                    begin
                        state <= ST_WAIT_LAST_WRITE;
                    end
                end
                ST_WAIT_LAST_WRITE: begin
                    if(last_wrt_r) begin
                        last_wrt_r          <= 0;
                        last_CO_recvd_r     <= 0;
                        process_cmpl_r[0]   <= 1;
                        state               <= ST_SEND_COMPLETE;
                    end
                end
                ST_SEND_COMPLETE: begin
                    if(all_AWP_complete_r) begin
                        init_usrIntr_r[0]    <= init_usrIntr_ack ? 1'b0 : (~init_usrIntr_acked ? 1'b1 : init_usrIntr_r[0]);
                        init_usrIntr_acked    <= init_usrIntr_ack ? 1'b1 :  init_usrIntr_acked;
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------	
	always@(posedge clk_FAS) begin
        if(rst) begin
            cfg_AWP_done            <= 0;
            start_AWP_done          <= 0;
            trans_eg_fifo_wren      <= 0;
        end else begin
            cfg_AWP_done            <= 0;
            start_AWP_done          <= 0;
            trans_eg_fifo_wren      <= 0;
            case(state)
                // trans_eg_fifo_din                
                ST_CFG_AWP: begin
                    
                end
                ST_START_AWP: begin

                end
                ST_ACTIVE: begin
                
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign trans_in_fifo_din_rdy	= 1;
    assign trans_in_meta 			= trans_in_fifo_dout[`TRANS_IN_FIFO_PYLD_FIELD];
	
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            trans_in_fifo_rden      <= 0;
            all_AWP_complete        <= 0;
            res_dwc_fifo_wren       <= 0;
            job_fetch_fifo_wren     <= 0;
            convMap_fifo_wren       <= 0;
            last_CO_recvd           <= 0;
        end else begin
            if(!trans_in_fifo_empty) begin
                trans_in_fifo_rden <= 1;
            end
            all_AWP_complete        <= 0;
            res_dwc_fifo_wren       <= 0;
            job_fetch_fifo_wren     <= 0;
            last_CO_recvd           <= 0;
            if(trans_in_fifo_rden && (trans_in_meta[`TRANS_RESULT_WRITE] || trans_in_meta[`TRANS_LAST_CO]) && opcode_cfg[`OPCODE_16_FIELD]) begin
                res_dwc_fifo_wren   <= 1;
            end else if(trans_in_fifo_rden && trans_in_meta[`TRANS_RESULT_WRITE]) begin
				convMap_fifo_wren	<= 1;
			end else if(trans_in_fifo_rden && trans_in_meta[`TRANS_JOB_CMPL]) begin
                all_AWP_complete    <= 1;
            end else if(trans_in_fifo_rden && trans_in_meta[`TRANS_JOB_FETCH]) begin
                job_fetch_fifo_wren <= 1;
            end
			if(trans_in_fifo_rden && trans_in_meta[`TRANS_LAST_CO]) begin
                last_CO_recvd		<= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n) begin
            trans_eg_fifo_rden 	<= 0;
        end else begin
            trans_eg_fifo_rden	<= 0;
            if(!trans_eg_fifo_empty && trans_eg_fifo_dout_rdy) begin
                trans_eg_fifo_rden     <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_KL_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_KL_IT_RD_ID;
    
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_KL_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_KL_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_KL_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_KL_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_KL_IT_RD_ID]                                               <= 0;
            init_rd_in_prog[C_KL_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_KL_IT_RD_ID]        <= 0;
            if(init_rd_req_ack[C_KL_IT_RD_ID]) begin
                init_rd_in_prog[C_KL_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_KL_IT_RD_ID]) begin
                init_rd_in_prog[C_KL_IT_RD_ID] <= 0;
            end
            if(state == ST_LD_1X1_KRN && !init_rd_in_prog[C_KL_IT_RD_ID]) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_KL_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= itN_krnl_1x1_addr_cfg[conv1x1_it];
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_KL_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]		<= itN_krnl_1x1_fetch_amount_cfg[conv1x1_it];
                init_rd_req[C_KL_IT_RD_ID]                                
                    <= init_rd_req_ack[C_KL_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_KL_IT_RD_ID] ? 1'b1 : init_rd_req[C_KL_IT_RD_ID]);
                init_rd_req_acked[C_KL_IT_RD_ID]                            
                    <= init_rd_req_ack[C_KL_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_KL_IT_RD_ID];
            end
            if(state == ST_LD_1X1_KRN && init_rd_in_prog[C_KL_IT_RD_ID]) begin
                init_rd_data_rdy[C_KL_IT_RD_ID]    <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_KB_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_KB_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
			krnl1x1Bias_bram_wren															<= 0;
            init_rd_req[C_KB_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_KB_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_KB_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_KB_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_KB_IT_RD_ID]                                               <= 0;
            init_rd_in_prog[C_KB_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_KB_IT_RD_ID]        <= 0;
			krnl1x1Bias_bram_wren					 <= 0;
            if(init_rd_req_ack[C_KB_IT_RD_ID]) begin
                init_rd_in_prog[C_KB_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_KB_IT_RD_ID]) begin
                init_rd_in_prog[C_KB_IT_RD_ID] <= 0;
            end
            if(state == ST_LD_1X1_KRB && !init_rd_in_prog[C_KB_IT_RD_ID]) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_KB_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= itN_krnlbi_1x1_addr_cfg[conv1x1_it];
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_KB_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]		<= itN_krnlbi_1x1_fetch_amount_cfg[conv1x1_it];
                init_rd_req[C_KB_IT_RD_ID]                                
                    <= init_rd_req_ack[C_KB_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_KB_IT_RD_ID] ? 1'b1 : init_rd_req[C_KB_IT_RD_ID]);
                init_rd_req_acked[C_KB_IT_RD_ID]                            
                    <= init_rd_req_ack[C_KB_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_KB_IT_RD_ID];
            end
            if(state == ST_LD_1X1_KRB && init_rd_in_prog[C_KB_IT_RD_ID]) begin
                init_rd_data_rdy[C_KB_IT_RD_ID]    <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_AC_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_AC_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_AC_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_AC_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_AC_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_AC_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_AC_IT_RD_ID]                                               <= 0;
            init_rd_in_prog[C_AC_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_AC_IT_RD_ID]    <= 0;
            if(init_rd_req_ack[C_AC_IT_RD_ID]) begin
                init_rd_in_prog[C_AC_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_AC_IT_RD_ID]) begin
                init_rd_in_prog[C_AC_IT_RD_ID] <= 0;
            end
            if(state == ST_CFG_AWP && !init_rd_in_prog[C_AC_IT_RD_ID]) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_KL_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]      <= AWP_meta_Addr_cfg;
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_AC_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]         <= AWP_meta_data_len_cfg;
                init_rd_req[C_AC_IT_RD_ID]                                       
                    <= init_rd_req_ack[C_AC_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_AC_IT_RD_ID] ? 1'b1 : init_rd_req[C_AC_IT_RD_ID]);
                init_rd_req_acked[C_AC_IT_RD_ID]                                 
                    <= init_rd_req_ack[C_AC_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_AC_IT_RD_ID];
            end
            if(init_rd_in_prog[C_AC_IT_RD_ID]) begin
                init_rd_data_rdy[C_AC_IT_RD_ID]    <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_IM_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_IM_IT_RD_ID;
    assign im_fetch_amount = (init_rd_rem[C_IM_IT_RD_ID] >= im_fetch_amount_cfg) ? im_fetch_amount_cfg : init_rd_rem[C_IM_IT_RD_ID];

    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_IM_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_IM_IT_RD_ID]                                              <= 0;
            inMapFetchCount                                                                 <= 0;
            job_fetch_fifo_rden                                                             <= 0;
            job_fetch_data_vld                                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_IM_IT_RD_ID]                                               <= 0;
            init_rd_in_prog[C_IM_IT_RD_ID]                                                <= 0;
            init_rd_rem[C_IM_IT_RD_ID]                                                    <= 0;
        end else begin
            job_fetch_fifo_rden                     <= 0;
            init_rd_data_rdy[C_IM_IT_RD_ID]        <= 0;
            if(start_FAS) begin
                init_rd_rem[C_IM_IT_RD_ID] <= inMapFetchTotal_cfg;
            end
            if(!job_fetch_fifo_empty && !init_rd_in_prog[C_IM_IT_RD_ID] && !job_fetch_data_vld) begin
                job_fetch_fifo_rden                   <= 1;
                job_fetch_data_vld                    <= 1;
            end
            if(init_rd_req_ack[C_IM_IT_RD_ID]) begin
                init_rd_in_prog[C_IM_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_IM_IT_RD_ID]) begin
                init_rd_in_prog[C_IM_IT_RD_ID] <= 0;
            end
            if(!convMap_fifo_prog_full && job_fetch_data_vld && inMapFetchCount != inMapFetchTotal_cfg) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]	<= inMapAddr;
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_IM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]     <= im_fetch_amount;
                init_rd_req[C_IM_IT_RD_ID]                                     
                    <= init_rd_req_ack[C_IM_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_IM_IT_RD_ID] ? 1'b1 : init_rd_req[C_IM_IT_RD_ID]);
                init_rd_req_acked[C_IM_IT_RD_ID]                                
                    <= init_rd_req_ack[C_IM_IT_RD_ID] ? 1'b1 : init_rd_req_acked[C_IM_IT_RD_ID];
            end
            if(init_rd_in_prog[C_IM_IT_RD_ID]) begin
                init_rd_data_rdy[C_IM_IT_RD_ID]    <= 1;
            end
            if(init_rd_cmpl[C_IM_IT_RD_ID]) begin
                job_fetch_data_vld          <= 0;
                inMapFetchCount             <= inMapFetchCount + im_fetch_amount;
                init_rd_rem[C_IM_IT_RD_ID]  <= init_rd_rem[C_IM_IT_RD_ID] - im_fetch_amount;
                inMapAddr                   <= inMapAddr + im_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_PM_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_PM_IT_RD_ID;
    assign pm_fetch_amount = (init_rd_rem[C_PM_IT_RD_ID] >= pm_fetch_amount_cfg) ? pm_fetch_amount_cfg : init_rd_rem[C_PM_IT_RD_ID];
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_PM_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_PM_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_PM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_PM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_PM_IT_RD_ID]                                               <= 0;
            init_rd_rem[C_PM_IT_RD_ID]                                                    <= 0;
            partMapFetchCount                                                               <= 0;
            init_rd_in_prog[C_PM_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_PM_IT_RD_ID]       <= 0;
            if(start_FAS) begin
                init_rd_rem[C_IM_IT_RD_ID] <= partMapFetchTotal_cfg;
            end
            if(init_rd_req_ack[C_PM_IT_RD_ID]) begin
                init_rd_in_prog[C_PM_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_PM_IT_RD_ID]) begin
                init_rd_in_prog[C_PM_IT_RD_ID] <= 0;
            end
            if(state == ST_ACTIVE && !init_rd_in_prog[C_PM_IT_RD_ID]
                && ((!opcode_cfg[`OPCODE_14_FIELD] && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg[`OPCODE_14_FIELD] || opcode_cfg[`OPCODE_17_FIELD]) && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_PM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]       <= partMapAddr_cfg; 
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_PM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]          <= pm_fetch_amount;
                init_rd_req[C_PM_IT_RD_ID]           
                    <= init_rd_req_ack[C_PM_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_PM_IT_RD_ID] ? 1'b1 : init_rd_req[C_PM_IT_RD_ID]);
                init_rd_req_acked[C_PM_IT_RD_ID]     
                    <= init_rd_req_ack[C_PM_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_PM_IT_RD_ID];
            end
            if(init_rd_in_prog[C_PM_IT_RD_ID]) begin
                init_rd_data_rdy[C_PM_IT_RD_ID]    <= 1;
            end
            if(init_rd_cmpl[C_PM_IT_RD_ID]) begin
                partMapFetchCount           <= partMapFetchCount + pm_fetch_amount;
                init_rd_rem[C_IM_IT_RD_ID]  <= init_rd_rem[C_PM_IT_RD_ID] - pm_fetch_amount;
                partMapAddr                 <= partMapAddr + pm_fetch_amount;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_PV_IT_RD_ID) +: `MAX_FAS_RD_ID] = C_PV_IT_RD_ID;
    assign pv_fetch_amount = (init_rd_rem[C_PV_IT_RD_ID] >= pv_fetch_amount_cfg) ? pv_fetch_amount_cfg : init_rd_rem[C_PV_IT_RD_ID];
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_PV_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_PV_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_PV_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_PV_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_PV_IT_RD_ID]                                               <= 0;
            init_rd_rem[C_PV_IT_RD_ID]                                                    <= 0;
            prevMapFetchCount                                                               <= 0;
            init_rd_in_prog[C_PV_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_PV_IT_RD_ID]        <= 0;
            if(start_FAS) begin
                init_rd_rem[C_PV_IT_RD_ID] <= prevMapFetchTotal_cfg;
            end
            if(init_rd_req_ack[C_PV_IT_RD_ID]) begin
                init_rd_in_prog[C_PV_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_PV_IT_RD_ID]) begin
                init_rd_in_prog[C_PV_IT_RD_ID] <= 0;
            end
            if(!init_rd_in_prog[C_PV_IT_RD_ID] && state == ST_ACTIVE && prevMap_fifo_prog_empty && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_PV_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= prevMapAddr;
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_PV_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= pv_fetch_amount;
                init_rd_req[C_PV_IT_RD_ID]           
                    <= init_rd_req_ack[C_PV_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_PV_IT_RD_ID] ? 1'b1 : init_rd_req[C_PV_IT_RD_ID]);
                init_rd_req_acked[C_PV_IT_RD_ID]     
                    <= init_rd_req_ack[C_PV_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_PV_IT_RD_ID];
            end
            if(init_rd_in_prog[C_PV_IT_RD_ID]) begin
                init_rd_data_rdy[C_PV_IT_RD_ID]    <= 1;
            end            
            if(init_rd_cmpl[C_PV_IT_RD_ID]) begin
                prevMapFetchCount           <= prevMapFetchCount + pv_fetch_amount;
                init_rd_rem[C_PV_IT_RD_ID]  <= init_rd_rem[C_PV_IT_RD_ID] - pv_fetch_amount;
                prevMapAddr                 <= prevMapAddr + pv_fetch_amount;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_rd_req_id[(`MAX_FAS_RD_ID * C_RM_IT_RD_ID) +: `MAX_FAS_RD_ID]  = C_RM_IT_RD_ID;
    assign rm_fetch_amount = (init_rd_rem[C_RM_IT_RD_ID] >= rm_fetch_amount_cfg) ? rm_fetch_amount_cfg : init_rd_rem[C_RM_IT_RD_ID];

    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_rd_req[C_RM_IT_RD_ID]                                                    <= 0;
            init_rd_req_acked[C_RM_IT_RD_ID]                                              <= 0;
            init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_RM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= 0;
            init_rd_len[(`INIT_RD_LEN_WIDTH * C_RM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= 0;
            init_rd_data_rdy[C_RM_IT_RD_ID]                                               <= 0;
            resdMapFetchCount                                                               <= 0;
            init_rd_rem[C_RM_IT_RD_ID]                                                    <= 0;
            init_rd_in_prog[C_RM_IT_RD_ID]                                                <= 0;
        end else begin
            init_rd_data_rdy[C_RM_IT_RD_ID]    <= 0;
            if(start_FAS) begin
                init_rd_rem[C_RM_IT_RD_ID] <= resdMapFetchTotal_cfg;
            end
            if(init_rd_req_ack[C_RM_IT_RD_ID]) begin
                init_rd_in_prog[C_RM_IT_RD_ID] <= 1;
            end else if(init_rd_cmpl[C_RM_IT_RD_ID]) begin
                init_rd_in_prog[C_RM_IT_RD_ID] <= 0;
            end
            if(!init_rd_in_prog[C_RM_IT_RD_ID] && state == ST_ACTIVE && (resdMap_fifo_prog_empty || resdMap_fifo_prog_empty) && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                init_rd_addr[(`INIT_RD_ADDR_WIDTH * C_RM_IT_RD_ID) +: `INIT_RD_ADDR_WIDTH]    <= resdMapAddr_cfg;
                init_rd_len[(`INIT_RD_LEN_WIDTH * C_RM_IT_RD_ID) +: `INIT_RD_LEN_WIDTH]       <= rm_fetch_amount_cfg;
                init_rd_req[C_RM_IT_RD_ID]           
                    <= init_rd_req_ack[C_RM_IT_RD_ID] ? 1'b0 : (~init_rd_req_acked[C_RM_IT_RD_ID] ? 1'b1 : init_rd_req[C_RM_IT_RD_ID]);
                init_rd_req_acked[C_RM_IT_RD_ID]     
                    <= init_rd_req_ack[C_RM_IT_RD_ID] ? 1'b1 :  init_rd_req_acked[C_RM_IT_RD_ID];
            end
            if(init_rd_in_prog[C_RM_IT_RD_ID]) begin
                init_rd_data_rdy[C_RM_IT_RD_ID]    <= 1;
            end
            if(init_rd_cmpl[C_RM_IT_RD_ID]) begin
                resdMapFetchCount           <= resdMapFetchCount + rm_fetch_amount_cfg;
                init_rd_rem[C_RM_IT_RD_ID]  <= init_rd_rem[C_RM_IT_RD_ID] - rm_fetch_amount;
                resdMapAddr                 <= resdMapAddr + rm_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign conv1x1_pip_exec  = (conv1x1_pip_start0 || conv1x1_pip_start2 || conv1x1_pip_start2);
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            dpth_count          <= 0;
            krnl_count          <= 0;
            tot_krnl_count      <= 0;
        end else begin
            if(conv1x1_pip_exec) begin
                if(krnl_count == itN_num_1x1_kernels_cfg[conv1x1_it]) begin
                    tot_krnl_count <= tot_krnl_count + krnl_count;
                end
                if(dpth_count == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WTH)) begin
                    dpth_count          <= 0;
                    if(krnl_count == itN_num_1x1_kernels_cfg[conv1x1_it]) begin
                        krnl_count      <= 0;
                    end else begin
                        krnl_count <= krnl_count + 1;
                    end
                end else begin
                    dpth_count <= dpth_count + `KRNL_1X1_BRAM_RD_WTH;
                end
            end
        end
    end
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            conv1x1_it <= 0;
        end else begin
            if(krnl_count == itN_num_1x1_kernels_cfg[conv1x1_it] && |conv1x1_pip_en_cfg && (state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)) begin
                conv1x1_it <= conv1x1_it + 1;
            end            
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            convMap_fifo_rden       <= 0;
            partMap_fifo_rden       <= 0;
            resdMap_fifo_rden		<= 0;
            prevMap_fifo_rden       <= 0;
        end else begin
            convMap_fifo_rden       <= 0;
            partMap_fifo_rden       <= 0;
            resdMap_fifo_rden       <= 0;
            prevMap_fifo_rden       <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && !convMap_fifo_empty && krnl_count == 0 && (!opcode_cfg[`OPCODE_14_FIELD] && !opcode_cfg[`OPCODE_17_FIELD])) begin
                convMap_fifo_rden       <= 1;
            end
            if(vector_add_pm) begin
                partMap_fifo_rden       <= 1;
            end
            if(vector_add_rm0 || vector_add_rm1 || vector_add_rm_conv) begin
                resdMap_fifo_rden  		<= 1;
            end
            if(vector_add_pv) begin
                prevMap_fifo_rden       <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign outBuf_fifo_prog_full = (outBuf_fifo_count > ob_high_watermark_cfg);
    assign init_wr_req_id     = 0;

    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            outBuf_fifo_count <= 0;
        end else begin
            if(outBuf_fifo_wren && outBuf_fifo_rden) begin
                outBuf_fifo_count <= outBuf_fifo_count;
            end else if(outBuf_fifo_wren) begin
                outBuf_fifo_count <= outBuf_fifo_count + 1;
            end else if(outBuf_fifo_rden) begin
                outBuf_fifo_count <= outBuf_fifo_count - 1;
            end
        end
    end
    
    assign ob_fetch_amount = (init_wr_rem >= ob_store_amount_cfg) ? ob_store_amount_cfg : init_wr_rem;
     
    always@(posedge clk_FAS) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            init_wr_req          <= 0;
            init_wr_addr         <= 0;
            init_wr_len          <= 0;
            init_wr_addr         <= 0;
            init_wr_data_vld     <= 0;
            outMapStoreCount        <= 0;
            init_wr_rem             <= 0;
            last_wrt                <= 0;
        end else begin
            last_wrt                <= 0;
            init_wr_data_vld     <= 0;
            if(start_FAS) begin
                init_wr_rem <= 0;
            end
            if(init_wr_req_ack) begin
                init_wr_in_prog <= 1;
            end else if(init_wr_cmpl) begin
                init_wr_in_prog <= 0;
            end
            if(outBuf_fifo_prog_full && (state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && outMapStoreCount != outMapStoreTotal_cfg) begin
                init_wr_addr          <= outMapAddr_cfg;
                init_wr_len           <= ob_fetch_amount;
                init_wr_req           <= init_wr_req_ack  ? 1'b0 : (~init_wr_req_acked ? 1'b1 : init_wr_req);
                init_wr_req_acked     <= init_wr_req_ack  ? 1'b1 :  init_wr_req_acked;
            end
            if(init_wr_in_prog) begin
                init_wr_data_vld        <= 1;
            end            
            if(init_wr_cmpl) begin
                init_wr_rem      <= init_wr_rem - ob_store_amount_cfg;
                outMapStoreCount <= outMapStoreCount + ob_store_amount_cfg;
            end
            if(state == ST_WAIT_LAST_WRITE && outMapStoreCount == outMapStoreTotal_cfg) begin
                last_wrt    <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(*) begin
        if(conv1x1_dwc_fifo_rden && (opcode_cfg[`OPCODE_4_FIELD] || opcode_cfg[`OPCODE_6_FIELD]
                                    || opcode_cfg[`OPCODE_10_FIELD] || opcode_cfg[`OPCODE_12_FIELD]))
        begin
            outBuf_fifo_wren = 1;
        end else if(outBuf_fifo_wren_rm 
                    || outBuf_fifo_wren_pv 
                    || outBuf_fifo_wren1_d
                    || outBuf_fifo_wren2_d 
                    || res_dwc_fifo_rd_vld) 
        begin
            outBuf_fifo_wren = 1;
        end else begin
            outBuf_fifo_wren = 0;
        end
        if(init_wr_data_vld && init_wr_data_rdy) begin
            outBuf_fifo_rden = 1;
        end else begin
            outBuf_fifo_rden = 0;
        end
    end

    always@(*) begin
        if(opcode_cfg[`OPCODE_0_FIELD]
            || opcode_cfg[`OPCODE_2_FIELD]) 
        begin
            outBuf_fifo_din = vec_add_rm_conv_sum;
        end else if(opcode_cfg[`OPCODE_1_FIELD]
            || opcode_cfg[`OPCODE_3_FIELD]
            || opcode_cfg[`OPCODE_5_FIELD]
            || opcode_cfg[`OPCODE_7_FIELD]
            || opcode_cfg[`OPCODE_11_FIELD]
            || opcode_cfg[`OPCODE_13_FIELD])
        begin
            outBuf_fifo_din = vec_add_pv_sum;
        end else if(opcode_cfg[`OPCODE_8_FIELD]
                   || (opcode_cfg[`OPCODE_9_FIELD]
                   || opcode_cfg[`OPCODE_17_FIELD]))
        begin
            outBuf_fifo_din = vec_add_rm0_sum;
        end else if(opcode_cfg[`OPCODE_8_FIELD]
                   || opcode_cfg[`OPCODE_9_FIELD])
        begin
            outBuf_fifo_din = vec_add_rm1_sum;
        end else if(opcode_cfg[`OPCODE_15_FIELD]) begin
            outBuf_fifo_din = vec_add_pm_sum;
        end else if(opcode_cfg[`OPCODE_16_FIELD]) begin
            outBuf_fifo_din = res_dwc_fifo_dout;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin
        case(state)
            ST_IDLE:                state_s = "ST_IDLE";
            ST_LD_1X1_KRN:          state_s = "ST_LD_1X1_KRN";
			ST_LD_1X1_KRB:          state_s = "ST_LD_1X1_KRB";
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
