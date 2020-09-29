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
    parameter C_FC_IT_RD_ID = 0,
    parameter C_AC_IT_RD_ID = 0,
    parameter C_IM_IT_RD_ID = 1,
    parameter C_PM_IT_RD_ID = 2,
    parameter C_RM_IT_RD_ID = 3,
    parameter C_PV_IT_RD_ID = 4
) (
    clk_intf                    ,
    clk_FAS                     ,
    rst                         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_read_req               ,
    init_read_req_id            ,
    init_read_addr              ,
    init_read_len               ,
    init_read_req_ack           ,
    init_read_in_prog           ,
    init_read_data              ,
    init_read_data_vld          ,
    init_read_data_rdy          ,
    init_read_cmpl              ,
    init_write_req              ,
    init_write_req_id           ,
    init_write_addr             ,
    init_write_len              ,
    init_write_req_ack          ,
    init_write_in_prog          ,
    init_write_cmpl             ,
    init_write_data             ,
    init_write_data_vld         ,
    init_write_data_rdy         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    targ_write_addr             ,
    targ_write_addr_vld         ,
    targ_write_data             ,
    targ_write_ack              ,
    targ_read_addr              ,
    targ_read_addr_vld          ,
    targ_read_data              ,
    targ_read_ack               ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_usrIntr                ,
    init_usrIntr_ack            ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_wren          ,
    convMap_fifo_wren           ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_din           ,
    convMap_fifo_din            ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_eg_fifo_dout_vld      ,
    trans_eg_fifo_dout
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
    `include "cnn_layer_accel_defs.vh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE                              = 7'b0000001;
    localparam ST_CFG_FAS                           = 7'b0000010;
    localparam ST_CFG_AWP                           = 7'b0000100;
    localparam ST_START_AWP                         = 7'b0001000;
    localparam ST_ACTIVE                            = 7'b0010000;
    localparam ST_WAIT_LAST_WRITE                   = 7'b0100000;
    localparam ST_SEND_COMPLETE                     = 7'b1000000;

    localparam C_VEC_ADD_WIDTH                      = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_VEC_MULT_WIDTH                     = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_INIT_REQ_ID_WTH                    = `MAX_FAS_RD_ID * `MAX_FAS_RD_ID;
    localparam C_TARG_DATA_WTH                      = 1024;
    localparam C_SYS_MEM_RD_ADDR_WTH                = `MAX_FAS_RD_ID * `INIT_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH                 = `MAX_FAS_RD_ID * `INIT_RD_LEN_WIDTH;
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
    localparam C_OUTBUF_FIFO_DIN_FACTOR             = floor(`INIT_WR_DATA_WIDTH, `PIXEL_WIDTH);
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
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      clk_intf                   ;
    input  logic                                      clk_FAS                    ;
    input  logic                                      rst                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req              ;
    output logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id           ;
    output logic [     C_SYS_MEM_RD_ADDR_WTH - 1:0]   init_read_addr             ;
    output logic [      C_SYS_MEM_RD_LEN_WTH - 1:0]   init_read_len              ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack          ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_in_prog          ;  
    input  logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data             ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld         ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy         ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl             ;
    output logic                                      init_write_req             ;
    output logic                                      init_write_req_id          ;
    output logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr            ;
    output logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len             ;
    input  logic                                      init_write_req_ack         ;
    input  logic                                      init_write_in_prog         ;
    input  logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_write_data            ;
    output logic                                      init_write_data_vld        ;
    input  logic                                      init_write_data_rdy        ;
    input  logic                                      init_write_cmpl            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      targ_write_addr            ;
    input  logic                                      targ_write_addr_vld        ;
    output logic [           C_TARG_DATA_WTH - 1:0]   targ_write_data            ;
    output logic                                      targ_write_ack             ;
    input  logic                                      targ_read_addr             ;
    input  logic                                      targ_read_addr_vld         ;
    input  logic [           C_TARG_DATA_WTH - 1:0]   targ_read_data             ;
    output logic                                      targ_read_ack              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                      trans_in_fifo_wren         ;
    input  logic                                      convMap_fifo_wren          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    output logic                                      init_usrIntr               ;
    input  logic                                      init_usrIntr_ack           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [        C_TRANS_FIFO_WR_WTH - 1:0]  trans_in_fifo_din          ;
    input  logic [      C_CONVMAP_FIFO_WR_WTH - 1:0]  convMap_fifo_din           ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      trans_eg_fifo_dout_vld     ;
    output logic [        C_TRANS_FIFO_WR_WTH - 1:0]  trans_eg_fifo_dout         ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                      31:0]  FAS_cfg_Addr                                                    ;
    logic [                                      15:0]  FAS_cfg_data_len                                                ;
    logic [                                      31:0]  AWP_cfg_Addr                                                    ;
    logic [                                      15:0]  AWP_cfg_data_len                                                ;
    logic [                                      15:0]  krnl1x1Depth_cfg                                                ;
    logic [                                      31:0]  pixelSeqAddr_cfg                                                ;
    logic [                                      31:0]  partMapAddr_cfg                                                 ;
    logic [                                      31:0]  resdMapAddr_cfg                                                 ;
    logic [                                      31:0]  outMapAddr_cfg                                                  ;
    logic [                                      15:0]  pixSeqCfgFetchTotal_cfg                                         ;
    logic [                                      31:0]  inMapAddr_cfg                                                   ;
    logic [                                      31:0]  prevMapAddr_cfg                                                 ;
    logic [                                      15:0]  inMapFetchFactor_cfg                                            ;
    logic [                                      15:0]  inMapFetchTotal_cfg                                             ;
    logic [                                      31:0]  krnl3x3Addr_cfg                                                 ;
    logic [                                      31:0]  krnl3x3BiasAddr_cfg                                             ;
    logic [                                      15:0]  krnl3x3FetchTotal_cfg                                           ;
    logic [                                      15:0]  krnl3x3BiasFetchTotal_cfg                                       ;
    logic [                                      15:0]  krnl1x1FetchTotal_cfg                                           ;
    logic [                                      15:0]  krnl1x1BiasFetchTotal_cfg                                       ;
    logic [                                      15:0]  partMapFetchTotal_cfg                                           ;
    logic [                                      15:0]  resdMapFetchTotal_cfg                                           ;
    logic [                                      15:0]  outMapStoreTotal_cfg                                            ;
    logic [                                      15:0]  outMapStoreFactor_cfg                                           ;
    logic [                                      15:0]  prevMapFetchTotal_cfg                                           ;
    logic [                                      15:0]  num_1x1_kernels_cfg                                             ;
    logic [                                      15:0]  cm_high_watermark_cfg                                           ;
    logic [                                      15:0]  rm_low_watermark_cfg                                            ;
    logic [                                      15:0]  pm_low_watermark_cfg                                            ;
    logic [                                      15:0]  pv_low_watermark_cfg                                            ;
    logic [                                      15:0]  rm_fetch_amount_cfg                                             ;
    logic [                                      15:0]  pm_fetch_amount_cfg                                             ;
    logic [                                      15:0]  pv_fetch_amount_cfg                                             ;
    logic [                                      15:0]  im_fetch_amount_cfg                                             ;
    logic [                                      15:0]  krnl1x1_pding_cfg                                               ;
    logic [                                      15:0]  krnl1x1_pad_bgn_cfg                                             ;
    logic [                                      15:0]  krnl1x1_pad_end_cfg                                             ;
    logic [                                      17:0]  opcode_cfg                                                      ;
    logic [                                      15:0]  res_high_watermark_cfg                                          ;
    logic [                                      15:0]  conv1x1_pip_en_cfg                                              ;
    logic [                                      15:0]  krnl1x1_bram_rdAddr_end_cfg                                     ;
    logic [                                      15:0]  krnl1x1_dpth_end_cfg                                            ;
    logic [                                      15:0]  ob_store_amount_cfg                                             ;
    logic                                               start_FAS                                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                      6:0]   state                                                           ;
    logic                                               start_AWP_done                                                  ;
    logic                                               cfg_AWP_done                                                    ;
    logic                                               all_AWP_complete                                                ;
    logic                                               FAS_complete_acked                                              ;
    logic                                               process_cmpl                                                    ;
    logic                                               init_usrIntr_acked                                              ;
    logic                                               last_wrt_r                                                      ;
    logic                                               last_wrt                                                        ;
    logic                                               last_CO_recvd_r                                                 ;
    logic                                               last_CO_recvd                                                   ;
    logic                                               pipe_enable                                                     ;
    logic                                               pipe_enable_d                                                   ;
    logic                                               state_update_in_prog                                            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                     15:0]   dpth_count_r                                                    ;
    logic [                                     15:0]   krnl_count_r                                                    ;
    logic [                                     15:0]   dpth_count                        [`KRNL_1X1_SIMD - 1:0]        ;
    logic [                                     15:0]   krnl_count                        [`KRNL_1X1_SIMD - 1:0]        ;
    logic                                               adder_tree_datain_valid           [`KRNL_1X1_SIMD - 1:0]        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               vector_add_pm                                                   ;
    logic                                               vector_add_pm_d                                                 ;
    logic                                               vector_add_rm0                                                  ;
    logic                                               vector_add_rm0_d                                                ;
    logic                                               vector_add_rm1                                                  ;
    logic                                               vector_add_rm1_d                                                ;
    logic                                               vector_add_rm_conv                                              ;
    logic                                               vector_add_rm_conv_d                                            ;
    logic                                               vector_add_pv                                                   ;
    logic                                               vector_add_pv_d                                                 ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_pm_arr                  [C_VEC_SUM_ARR_SZ - 1:0]        ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm0_arr                 [C_VEC_SUM_ARR_SZ - 1:0]        ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm1_arr                 [C_VEC_SUM_ARR_SZ - 1:0]        ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm_conv_arr             [C_VEC_SUM_ARR_SZ - 1:0]        ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_pv_arr                  [C_VEC_SUM_ARR_SZ - 1:0]        ;
    logic [             C_VEC_SUM_ARR_ADDR_WTH - 1:0]   vec_add_pm_addr                                                 ; 
    logic [             C_VEC_SUM_ARR_ADDR_WTH - 1:0]   vec_add_rm0_addr                                                ;
    logic [             C_VEC_SUM_ARR_ADDR_WTH - 1:0]   vec_add_rm1_addr                                                ;
    logic [             C_VEC_SUM_ARR_ADDR_WTH - 1:0]   vec_add_rm_conv_addr                                            ;
    logic [             C_VEC_SUM_ARR_ADDR_WTH - 1:0]   vec_add_pv_addr                                                 ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_pv_out                                                  ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm_conv_out                                             ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_pm_out_d                                                ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm0_out_d                                               ;
    logic [                    C_VEC_ADD_WIDTH - 1:0]   vec_add_rm1_out_d                                               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                     `MAX_FAS_RD_ID - 1:0]   init_read_req_acked                                             ;
    logic                                               init_write_req_acked                                            ;
    logic [                 `INIT_RD_ADDR_WIDTH - 1:0]  init_read_addr_arr      [`MAX_FAS_RD_ID - 1:0]                  ;
    logic [                  `INIT_RD_LEN_WIDTH - 1:0]  init_read_len_arr       [`MAX_FAS_RD_ID - 1:0]                  ;
    logic [                      `MAX_FAS_RD_ID - 1:0]  init_read_req_id_arr    [`MAX_FAS_RD_ID - 1:0]                  ;
    genvar g0; `UNPACK_ARRAY_1D(`INIT_RD_ADDR_WIDTH, `MAX_FAS_RD_ID, init_read_addr, init_read_addr_arr, g0);           ;
    genvar g1; `UNPACK_ARRAY_1D(`INIT_RD_LEN_WIDTH, `MAX_FAS_RD_ID, init_read_len, init_read_len_arr, g1);              ;
    genvar g2; `UNPACK_ARRAY_1D(`INIT_RD_LEN_WIDTH, `MAX_FAS_RD_ID, init_read_req_id, init_read_req_id_arr, g2);        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               convMap_fifo_rden                                               ;
    logic [               C_CONVMAP_FIFO_RD_WTH - 1:0]  convMap_fifo_dout                                               ;
    logic                                               convMap_fifo_empty                                              ;
    logic                                               convMap_fifo_prog_full                                          ;
    logic [               C_CONVMAP_FIFO_CT_WTH - 1:0]  convMap_fifo_count                                              ;
    logic                                               convMap_fifo_vld                                                ;
    logic                                               convMap_fifo_wr_rst_busy                                        ;
    logic                                               convMap_fifo_rd_rst_busy                                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic  [              C_RES_DWC_FIFO_WR_WTH - 1:0]  res_dwc_fifo_din                                                ;
    logic                                               res_dwc_fifo_wren                                               ;
    logic                                               res_dwc_fifo_rden                                               ;
    logic  [              C_RES_DWC_FIFO_WR_WTH - 1:0]  res_dwc_fifo_dout                                               ;
    logic                                               res_dwc_fifo_rd_vld                                             ;
    logic                                               res_dwc_fifo_wr_rst_busy                                        ;
    logic                                               res_dwc_fifo_rd_rst_busy                                        ;
    logic  [              C_RES_DWC_FIFO_CT_WTH - 1:0]  res_dwc_fifo_count                                              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               krnl1x1_bram_wren               [`KRNL_1X1_SIMD - 1:0]          ;
    logic [         C_KRNL_1X1_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1_bram_wrAddr             [`KRNL_1X1_SIMD - 1:0]          ;
    logic [         C_KRNL_1X1_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1_bram_rdAddr             [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_bram_rden               [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_bram_rden_w                                             ;
    logic [              C_KRNL_1X1_BRAM_RD_WTH - 1:0]  krnl1x1_bram_dout               [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1Bias_bram_wren           [`KRNL_1X1_SIMD - 1:0]          ;
    logic [    C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1Bias_bram_wrAddr         [`KRNL_1X1_SIMD - 1:0]          ;
    logic [    C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1Bias_bram_rdAddr         [`KRNL_1X1_SIMD - 1:0]          ;
    logic                       [`KRNL_1X1_SIMD - 1:0]  krnl1x1Bias_bram_rden                                           ;
    logic [                        `PIXEL_WIDTH - 1:0]  krnl1x1Bias_bram_dout           [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               kn1x1_bm_wr_sel                 [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               kn1x1b_bm_wr_sel                [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               conv1x1_pip_start_d             [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               conv1x1_pip_start0                                              ;
    logic                                               conv1x1_pip_start1                                              ;
    logic                                               conv1x1_pip_start2                                              ;
    logic                                               conv1x1_pip_start0_d            [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               conv1x1_pip_start1_d            [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               conv1x1_pip_start2_d            [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               resdMap_fifo_wren                                               ;
    logic                                               resdMap_fifo_rden                                               ;
    logic [               C_RESDMAP_FIFO_RD_WTH - 1:0]  resdMap_fifo_dout                                               ;
    logic                                               resdMap_fifo_empty                                              ;
    logic                                               resdMap_fifo_prog_empty                                         ;
    logic                                               resdMap_fifo_wr_rst_busy                                        ;
    logic                                               resdMap_fifo_rd_rst_busy                                        ;
    logic                                               resdMap_fifo_vld                                                ;
    logic [               C_RESDMAP_FIFO_CT_WTH - 1:0]  resdMap_fifo_count                                              ;
    logic [               C_RESDMAP_FIFO_CT_WTH - 1:0]  resdMapFetchCount                                               ;    
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               partMap_fifo_wren                                               ;
    logic                                               partMap_fifo_rden                                               ;
    logic                                               partMap_fifo_rden_w1                                            ;
    logic [              C_PARTMAP_FIFO_RD_WTH - 1:0]   partMap_fifo_dout                                               ;
    logic                                               partMap_fifo_empty                                              ;
    logic                                               partMap_fifo_prog_empty                                         ;
    logic                                               partMap_fifo_wr_rst_busy                                        ;
    logic                                               partMap_fifo_rd_rst_busy                                        ;
    logic                                               partMap_fifo_vld                                                ;
    logic [                                     15:0]   partMapFetchCount                                               ;
    logic [              C_PARTMAP_FIFO_CT_WTH - 1:0]   partMap_fifo_count                                              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               conv1x1_dwc_fifo_wren                                           ;
    logic                                               conv1x1_dwc_fifo_rden                                           ;
    logic [                       `PIXEL_WIDTH - 1:0]   conv1x1_dwc_fifo_din                                            ;
    logic [          C_CONV1X1_DWC_FIFO_RD_WTH - 1:0]   conv1x1_dwc_fifo_dout                                           ;
    logic                                               conv1x1_dwc_fifo_vld                                            ;
    logic                                               conv1x1_dwc_fifo_wr_rst_busy                                    ;
    logic                                               conv1x1_dwc_fifo_rd_rst_busy                                    ;
    logic [               C_CONV1X1_DWC_CT_WTH - 1:0]   conv1x1_dwc_fifo_count                                          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               prevMap_fifo_wren                                               ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_rden                                               ;
    logic                                               prevMap_fifo_rden_r                                             ;
    logic [              C_PREVMAP_FIFO_RD_WTH - 1:0]   prevMap_fifo_dout                                               ;
    logic                                               prevMap_fifo_empty                                              ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_prog_empty                                         ;
    logic                                               prevMap_fifo_valid                                              ;
    logic [                                     15:0]   prevMapFetchCount                                               ;
    logic                                               prevMap_fifo_wr_rst_busy                                        ;
    logic                                               prevMap_fifo_rd_rst_busy                                        ;
    logic [              C_PREVMAP_FIFO_CT_WTH - 1:0]   prevMap_fifo_count                                              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               outBuf_fifo_wren                                                ;
    logic                                               outBuf_fifo_rden                                                ;
    logic                                               outBuf_fifo_wren1                                               ;
    logic                                               outBuf_fifo_wren1_d                                             ;
    logic                                               outBuf_fifo_wren2                                               ;
    logic                                               outBuf_fifo_wren2_d                                             ;
    logic                                               outBuf_fifo_wren_pv                                             ;
    logic                                               outBuf_fifo_wren_rm                                             ;
    logic [              C_OUTBUF_FIFO_WR_WTH - 1:0]    outBuf_fifo_din                                                 ;
    logic [                                     15:0]   outMapStoreCount                                                ;
    logic                                               outBuf_fifo_prog_full                                           ;
    logic                                               outBuf_fifo_vld                                                 ;
    logic                                               outBuf_fifo_wr_rst_busy                                         ;
    logic                                               outBuf_fifo_rd_rst_busy                                         ;
    logic [               C_OUTBUF_FIFO_CT_WTH - 1:0]   outBuf_fifo_count                                               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_in_fifo_rden                                              ;
    logic                                               trans_in_fifo_empty                                             ;
    logic [                C_TRANS_FIFO_WR_WTH - 1:0]   trans_in_fifo_dout                                              ;
    logic                                               trans_in_fifo_vld                                               ;
    logic                                               trans_in_fifo_wr_rst_busy                                       ;
    logic                                               trans_in_fifo_rd_rst_busy                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_eg_fifo_wren                                              ;
    logic                                               trans_eg_fifo_wren_r                                            ;
    logic                                               trans_eg_fifo_rden                                              ;
    logic [                C_TRANS_FIFO_WR_WTH - 1:0]   trans_eg_fifo_din                                               ;
    logic [                C_TRANS_FIFO_WR_WTH - 1:0]   trans_eg_fifo_din_r                                             ;
    logic [                C_TRANS_FIFO_RD_WTH - 1:0]   trans_eg_fifo_data                                              ;
    logic                                               trans_eg_fifo_vld                                               ;
    logic                                               trans_eg_fifo_empty                                             ;
    logic                                               trans_eg_fifo_wr_rst_busy                                       ;
    logic                                               trans_eg_fifo_rd_rst_busy                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               job_fetch_fifo_wren                                             ;
    logic                                               job_fetch_fifo_rden                                             ;
    logic                                               job_fetch_fifo_empty                                            ;
    logic [               C_JB_FTH_FIFO_WR_WTH - 1:0]   job_fetch_fifo_din                                              ;
    logic [               C_JB_FTH_FIFO_RD_WTH - 1:0]   job_fetch_fifo_dout                                             ;
    logic                                               job_fetch_fifo_rd_valid                                         ;
    logic                                               job_fetch_fifo_wr_rst_busy                                      ;
    logic                                               job_fetch_fifo_rd_rst_busy                                      ;
    logic                                               job_fetch_data_vld                                              ;
    logic [                                     15:0]   inMapFetchCount                                                 ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               vec_mult_din_vld                [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               vec_mult_din_vld0               [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               vec_mult_din_vld1               [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               vec_mult_din_vld2               [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                   C_VEC_MULT_WIDTH - 1:0]   vec_mult_din                    [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               vec_mult_dout_vld               [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                   C_VEC_MULT_WIDTH - 1:0]   vec_mult_dout                   [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                     `KRNL_1X1_SIMD - 1:0]   adder_tree_out_vld                                              ;
    logic [                       `PIXEL_WIDTH - 1:0]   adder_tree_out                  [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                       `PIXEL_WIDTH - 1:0]   conv1x1_out                     [`KRNL_1X1_SIMD - 1:0]          ;                    
    logic [                     `KRNL_1X1_SIMD - 1:0]   conv1x1_vld                                                     ;                    
    logic                                               conv1x1_bias_vld                [`KRNL_1X1_SIMD - 1:0]          ;                
    logic [                     `KRNL_1X1_SIMD - 1:0]   conv1x1_bias_vld_d                                              ;                    


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i0_SRL_bit (
        .clk        ( clk_FAS            ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( pipe_enable        ),
        .data_out   ( pipe_enable_d      )
    );   
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i1_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_pm         ),
        .data_out   ( vector_add_pm_d       )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i2_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm0        ),
        .data_out   ( vector_add_rm0_d      )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 2 * `FAS_FIFO_LATENCY + `VEC_ADD_LATENCY )
    )
    i3_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm1        ),
        .data_out   ( vector_add_rm1_d      )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i4_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( vector_add_rm_conv            ),
        .data_out   ( vector_add_rm_conv_d          )
    );
  

    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i5_SRL_bit (
        .clk        ( clk_FAS                 ),
        .ce         ( 1'b1                    ),
        .rst        ( rst                     ),
        .data_in    ( vector_add_pv           ),
        .data_out   ( vector_add_pv_d         )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i6_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( vector_add_pv_d               ),
        .data_out   ( outBuf_fifo_wren_pv           )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i7_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm_conv_d  ),
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

    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    trans_in_fifo
    i0_trans_in_fifo (
        .srst           ( rst                                           ),
        .wr_clk         ( clk_intf                                      ),
        .rd_clk         ( clk_FAS                                       ),
        .din            ( trans_in_fifo_din                             ),
        .wr_en          ( trans_in_fifo_wren                            ),
        .rd_en          ( trans_in_fifo_rden                            ),
        .dout           ( trans_in_fifo_dout                            ),
        .full           (                                               ),
        .empty          (                                               ),
        .valid          ( trans_in_fifo_vld                             ),
        .wr_rst_busy    ( trans_in_fifo_wr_rst_busy                     ),
        .rd_rst_busy    ( trans_in_fifo_rd_rst_busy                     )
    );
    

    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    job_fetch_fifo
    i0_job_fetch_fifo (
        .clk                ( clk_FAS                       ),
        .din                ( job_fetch_fifo_din            ),
        .wr_en              ( job_fetch_fifo_wren           ),
        .rd_en              ( job_fetch_fifo_rden           ),
        .dout               ( job_fetch_fifo_dout           ),
        .full               (                               ),
        .empty              ( job_fetch_fifo_empty          ),
        .valid              ( job_fetch_fifo_rd_valid       ),
        .wr_rst_busy        ( job_fetch_fifo_wr_rst_busy    ),
        .rd_rst_busy        ( job_fetch_fifo_rd_rst_busy    )
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    convMap_fifo
    i0_convMap_fifo (
        .srst         ( rst                                             ),
        .wr_clk       ( clk_intf                                        ),
        .rd_clk       ( clk_FAS                                         ),
        .din          ( trans_in_fifo_din[`TRANS_PYLD_FIELD]            ),
        .wr_en        ( convMap_fifo_wren                               ),
        .rd_en        ( convMap_fifo_rden                               ),
        .dout         ( convMap_fifo_dout                               ),
        .full         (                                                 ),
        .empty        (                                                 ),
        .valid        ( convMap_fifo_vld                                ),
        .wr_rst_busy  ( convMap_fifo_wr_rst_busy                        ),
        .rd_rst_busy  ( convMap_fifo_rd_rst_busy                        ) 
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512
    res_dwc_fifo
    i0_res_dwc_fifo (
        .clk            ( clk_FAS                                       ),
        .srst           ( rst                                           ),
        .din            ( trans_in_fifo_din[`TRANS_PYLD_FIELD]          ),
        .wr_en          ( res_dwc_fifo_wren                             ),
		.rd_en			( res_dwc_fifo_rden								),
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
        .clk            ( clk_FAS                                      ),
        .srst           ( rst                                          ),
        .din            ( conv1x1_dwc_fifo_din                         ),
        .wr_en          ( conv1x1_dwc_fifo_wren                        ),
        .rd_en          ( conv1x1_dwc_fifo_rden                        ),
        .dout           ( conv1x1_dwc_fifo_dout                        ),
        .full           (                                              ),
        .empty          (                                              ),
        .wr_rst_busy    ( conv1x1_dwc_fifo_wr_rst_busy                 ),
        .rd_rst_busy    ( conv1x1_dwc_fifo_rd_rst_busy                 )
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
        .din            ( init_read_data                                  ),
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
        .din            ( init_read_data                                ),
        .wr_en          ( prevMap_fifo_wren                             ),
        .rd_en          ( prevMap_fifo_rden                             ),
        .dout           ( prevMap_fifo_dout                             ),
        .full           (                                               ),
        .empty          (                                               ),
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
        .din            ( init_read_data                                ),
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
        .din            ( init_write_data                               ),
        .wr_en          ( outBuf_fifo_wren                              ),
        .rd_en          ( outBuf_fifo_rden                              ),
        .dout           ( init_write_data                               ),
        .full           (                                               ),
        .empty          (                                               ),
        .valid          ( outBuf_fifo_vld                               ),
        .wr_rst_busy    ( outBuf_fifo_wr_rst_busy                       ),
        .rd_rst_busy    ( outBuf_fifo_rd_rst_busy                       )
    );


    // WR_WIDTH: 1024
    // WR_DPETH: 512
    // RD_WIDTH: 1024
    // RD_DEPTH: 512 
    trans_eg_fifo
    i0_trans_eg_fifo (
        .srst           ( rst                                           ),
        .wr_clk         ( clk_intf                                      ),
        .rd_clk         ( clk_FAS                                       ),
        .din            ( trans_eg_fifo_din                             ),
        .wr_en          ( trans_eg_fifo_wren                            ),
        .rd_en          ( trans_eg_fifo_rden                            ),
        .dout           ( trans_eg_fifo_dout                            ),
        .full           (                                               ),
        .empty          ( trans_eg_fifo_empty                           ),
        .valid          ( trans_eg_fifo_vld                             ),
        .wr_rst_busy    ( trans_eg_fifo_wr_rst_busy                     ),
        .rd_rst_busy    ( trans_eg_fifo_rd_rst_busy                     )
    );


    genvar g4;
    generate
        for(g4 = 0; g4 < `KRNL_1X1_SIMD; g4 = g4 + 1) begin
            localparam C_CONV1X1_PIP_DLY = g4;
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + C_CONV1X1_PIP_DLY )
            )
            i0X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( conv1x1_pip_start0        ),
                .data_out   ( conv1x1_pip_start0_d[g4]  )
            );
            

            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + `VEC_ADD_LATENCY + C_CONV1X1_PIP_DLY )
            )
            i1X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( conv1x1_pip_start1        ),
                .data_out   ( conv1x1_pip_start1_d[g4]  )
            );
            
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + (2 * `VEC_ADD_LATENCY) + C_CONV1X1_PIP_DLY )
            )
            i2X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( conv1x1_pip_start2        ),
                .data_out   ( conv1x1_pip_start2_d[g4]  )
            );


            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + `ADD_BIAS_LATENCY )
            )
            i3X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( conv1x1_bias_vld[g4]      ),
                .data_out   ( conv1x1_bias_vld_d[g4]    )
            );


            SRL_bus #(  
                .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
                .C_DATA_WIDTH    ( `PIXEL_WIDTH        )
            ) 
            i0_SRL_bus (
                .clk        ( clk_FAS                           ),
                .ce         ( 1'b1                              ),
                .rst        ( rst                               ),
                .data_in    ( vec_add_pm_arr[vec_add_pm_addr]   ),
                .data_out   ( vec_add_pm_out_d                  )
            );
            
            
            SRL_bus #(  
                .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
                .C_DATA_WIDTH    ( `PIXEL_WIDTH        )
            ) 
            i1X_SRL_bus (
                .clk        ( clk_FAS                               ),
                .ce         ( 1'b1                                  ),
                .rst        ( rst                                   ),
                .data_in    ( vec_add_rm0_arr[vec_add_rm0_addr]     ),
                .data_out   ( vec_add_rm0_out_d                     )
            );
            
            
            SRL_bus #(  
                .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
                .C_DATA_WIDTH    ( `PIXEL_WIDTH        )
            ) 
            i2X_SRL_bus (
                .clk        ( clk_FAS                               ),
                .ce         ( 1'b1                                  ),
                .rst        ( rst                                   ),
                .data_in    ( vec_add_rm1_arr[vec_add_rm1_addr]     ),
                .data_out   ( vec_add_rm1_out_d                     )
            );


            krnl1x1_bram
            iX_krnl1x1_bram (
                .clka   ( clk_intf                                      ),
                .ena    (                                               ),
                .wea    ( krnl1x1_bram_wren[g4] && kn1x1_bm_wr_sel[g4]  ),
                .addra  ( krnl1x1_bram_wrAddr[g4]                       ),
                .dina   ( init_read_data                                ),
                .clkb   ( clk_FAS                                       ),
                .enb    ( krnl1x1_bram_rden[g4]                         ),
                .addrb  ( krnl1x1_bram_rdAddr[g4]                       ),
                .doutb  ( krnl1x1_bram_dout[g4]                         ) 
            );


            krnl1x1Bias_bram
            iX_krnl1x1Bias_bram (
                .clka   ( clk_intf                                               ),
                .ena    (                                                        ),
                .wea    ( krnl1x1Bias_bram_wren[g4] && kn1x1b_bm_wr_sel[g4]      ),
                .addra  ( krnl1x1Bias_bram_wrAddr[g4]                            ),
                .dina   ( init_read_data                                         ),
                .clkb   ( clk_FAS                                                ),
                .enb    ( krnl1x1Bias_bram_rden[g4]                              ),
                .addrb  ( krnl1x1Bias_bram_rdAddr[g4]                            ),
                .doutb  ( krnl1x1Bias_bram_dout[g4]                              ) 
            );


            vector_multiply
            #(
                .C_OP_WIDTH      ( `PIXEL_WIDTH         ),
                .C_NUM_OPERANDS  ( `VECTOR_MULT_SIMD    )
            )
            i0X_vector_multiply (
                .clk                ( clk_FAS                                       ),
                .rst                ( rst                                           ),
                .datain             ( {vec_mult_din, krnl1x1_bram_dout[g4]}         ),
                .datain_ready       (                                               ),
                .datain_valid       ( vec_mult_din_vld[g4]                          ),
                .dout               ( vec_mult_dout[g4]                             ),
                .dout_ready         ( 1'b1                                          ),
                .dout_valid         ( vec_mult_dout_vld[g4]                         )
            );


            adder_tree #(
                .C_NUM_INPUTS       ( `KRNL_1X1_DEPTH_SIMD     ),
                .C_INPUT_WIDTH      ( `PIXEL_WIDTH             ),
                .C_OUTPUT_WIDTH     ( `PIXEL_WIDTH             )
            )
            i0X_adder_tree (
                .clk                ( clk_FAS                       ),
                .rst                (                               ),
                .datain_ready       ( 					            ),
                .datain_valid       ( vec_mult_dout_vld[g4]         ),
                .datain             ( vec_mult_dout[g4]             ),
                .dataout_ready      ( 1'b1                          ),
                .dataout_valid      ( adder_tree_out_vld[g4]        ),
                .dataout            ( adder_tree_out[g4]            )
            );

            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign convMap_fifo_prog_full = (convMap_fifo_count > cm_high_watermark_cfg);

            always@(posedge clk_FAS) begin
                if(rst) begin
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
            // END logic ---------------------------------------------------------------------------------------------------------------------------- 

 
            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign convMap_fifo_prog_full = (convMap_fifo_count > cm_high_watermark_cfg);

            always@(posedge clk_FAS) begin
                if(rst) begin
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
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign partMap_fifo_prog_empty  = (partMap_fifo_count > pm_low_watermark_cfg);
            assign partMap_fifo_wren        = init_read_data_vld[C_PM_IT_RD_ID] && init_read_data_rdy[C_PM_IT_RD_ID];

            always@(posedge clk_FAS) begin
                if(rst) begin
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
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign resdMap_fifo_prog_empty  = (resdMap_fifo_count > rm_low_watermark_cfg);
            assign resdMap_fifo_wren        = init_read_data_vld[C_RM_IT_RD_ID] && init_read_data_rdy[C_RM_IT_RD_ID];
    
            always@(posedge clk_FAS) begin
                if(rst) begin
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
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign prevMap_fifo_prog_empty  = (prevMap_fifo_count > pv_low_watermark_cfg);
            assign prevMap_fifo_wren        = init_read_data_vld[C_PV_IT_RD_ID] && init_read_data_rdy[C_PV_IT_RD_ID];

            always@(posedge clk_FAS) begin
                if(rst) begin
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
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign vec_mult_din_vld[g4] = vec_mult_din_vld0[g4] || vec_mult_din_vld1[g4] || vec_mult_din_vld2[g4];
            
            always@(posedge clk_FAS) begin
                // - - - - - - - - - - - - - -
                if(conv1x1_pip_start0_d[g4] && (opcode_cfg[`OPCODE_2_FIELD]
                    || opcode_cfg[`OPCODE_3_FIELD]
                    || opcode_cfg[`OPCODE_12_FIELD]
                    || opcode_cfg[`OPCODE_13_FIELD]
                    || opcode_cfg[`OPCODE_14_FIELD]))
                begin
                    vec_mult_din_vld0[g4] = 1;
                end else begin
                    vec_mult_din_vld0[g4] = 0;
                end
                // - - - - - - - - - - - - - -
                if(conv1x1_pip_start1_d[g4]&& opcode_cfg[`OPCODE_0_FIELD]
                    || opcode_cfg[`OPCODE_1_FIELD]
                    || opcode_cfg[`OPCODE_6_FIELD]
                    || opcode_cfg[`OPCODE_7_FIELD]
                    || opcode_cfg[`OPCODE_10_FIELD]
                    || opcode_cfg[`OPCODE_11_FIELD])
                begin
                    vec_mult_din_vld1[g4] = 1;
                end else begin
                    vec_mult_din_vld1[g4] = 0;
                end
                // - - - - - - - - - - - - - -
                if(conv1x1_pip_start2_d[g4] && opcode_cfg[`OPCODE_4_FIELD]
                    || opcode_cfg[`OPCODE_5_FIELD])
                begin
                    vec_mult_din_vld2[g4] = 1;
                end else begin
                    vec_mult_din_vld2[g4] = 0;
                end
                // - - - - - - - - - - - - - -
            end 
            
            always@(*) begin
                if(opcode_cfg[`OPCODE_0_FIELD]
                    || opcode_cfg[`OPCODE_1_FIELD]    
                    || opcode_cfg[`OPCODE_10_FIELD]
                    || opcode_cfg[`OPCODE_11_FIELD])
                begin
                    vec_mult_din[g4] = vec_add_pm_out_d;
                end else if(opcode_cfg[`OPCODE_6_FIELD]
                    || opcode_cfg[`OPCODE_7_FIELD])
                begin
                    vec_mult_din[g4] = vec_add_rm0_out_d;
                end else if(opcode_cfg[`OPCODE_4_FIELD]
                            || opcode_cfg[`OPCODE_5_FIELD])
                begin
                    vec_mult_din[g4] = vec_add_rm1_out_d;
                end else if(opcode_cfg[`OPCODE_2_FIELD]
                            || opcode_cfg[`OPCODE_3_FIELD]
                            || opcode_cfg[`OPCODE_12_FIELD]
                            || opcode_cfg[`OPCODE_13_FIELD]
                            || opcode_cfg[`OPCODE_14_FIELD])
                begin
                    vec_mult_din[g4] = convMap_fifo_dout;
                end
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            always@(posedge clk_FAS) begin
                if(rst) begin
                    krnl1x1_bram_rden[g4] <= 0;
                end else begin
                    krnl1x1_bram_rden[g4] <=    (conv1x1_pip_en_cfg[g4] && 
                                                   (conv1x1_pip_start0_d[g4]
                                                   || conv1x1_pip_start1_d[g4]
                                                   || conv1x1_pip_start2_d[g4])) ? 1
                                                : 0;
                end
            end

            always@(posedge clk_FAS) begin
                if(rst || process_cmpl) begin
                    krnl1x1_bram_rdAddr[g4] <= 0;
                end else if(krnl1x1_bram_rden[g4]) begin
                    if((krnl1x1_bram_rdAddr[g4] == krnl1x1_bram_rdAddr_end_cfg) && conv1x1_pip_en_cfg[g4]) begin
                        krnl1x1_bram_rdAddr[g4] <= 0;
                    end else begin
                        krnl1x1_bram_rdAddr[g4] <= krnl1x1_bram_rdAddr[g4]+ 1;
                    end
                end
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------
          
            
            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------            
            always@(posedge clk_FAS) begin
                if(rst) begin
                    dpth_count[g4]              <= 0;
                    krnl_count[g4]              <= 0;
                    adder_tree_datain_valid[g4] <= 0;
                end else begin
                    adder_tree_datain_valid[g4] <= 0;
                    if(krnl1x1_bram_rden[g4]) begin
                        adder_tree_datain_valid[g4]     <= 1;
                        if(dpth_count[g4] == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WIDTH)) begin
                            dpth_count[g4]         <= 0;
                            if(krnl_count[g4] == (num_1x1_kernels_cfg  - 1)) begin
                                krnl_count[g4]     <= 0;
                            end else begin
                                krnl_count[g4] <= krnl_count[g4] + 1;
                            end
                        end else begin
                            dpth_count[g4] <= dpth_count[g4] + `KRNL_1X1_BRAM_RD_WIDTH;
                        end
                    end
                end
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------
            
            
            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            always@(posedge clk_FAS) begin
                if(rst) begin
                    conv1x1_vld[g4]         <= 0;
                    conv1x1_bias_vld[g4]    <= 0;
                end else begin
                    conv1x1_vld[g4]          <= 0;
                    conv1x1_bias_vld[g4]     <= 0;
                    if(adder_tree_out_vld[g4] && !opcode_cfg[`OPCODE_0_FIELD]
                        && !opcode_cfg[`OPCODE_2_FIELD] && !opcode_cfg[`OPCODE_4_FIELD]
                        && !opcode_cfg[`OPCODE_6_FIELD] && !opcode_cfg[`OPCODE_10_FIELD]
                        && !opcode_cfg[`OPCODE_12_FIELD] && !opcode_cfg[`OPCODE_14_FIELD])
                    begin
                        conv1x1_vld[g4]       <= 1;
                        conv1x1_out[g4]       <= adder_tree_out[g4];
                    end else begin
                        krnl1x1Bias_bram_rden[g4]   <= 1;
                        conv1x1_bias_vld[g4]        <= 1;
                        conv1x1_out[g4]             <= adder_tree_out[g4] + krnl1x1Bias_bram_dout[g4];
                    end
                end
            end
            
            always@(posedge clk_FAS) begin
                if(rst) begin
                    krnl1x1Bias_bram_rdAddr[g4] <= 0;
                end else begin
                    if(krnl1x1Bias_bram_rden[g4] && krnl_count[g4] == num_1x1_kernels_cfg) begin
                        krnl1x1Bias_bram_rdAddr[g4] <= 0;
                    end else if(krnl1x1Bias_bram_rden[g4]) begin
                        krnl1x1Bias_bram_rdAddr[g4] <= krnl1x1Bias_bram_rdAddr[g4] + 1;
                    end
                end
            end            
            // END logic ----------------------------------------------------------------------------------------------------------------------------
        end
    endgenerate    


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            krnl1x1Depth_cfg                <= 0;
            FAS_cfg_Addr                    <= 0;
            FAS_cfg_data_len                <= 0;
            AWP_cfg_Addr                    <= 0;
            AWP_cfg_data_len                <= 0;
            pixelSeqAddr_cfg                <= 0;
            partMapAddr_cfg                 <= 0;
            resdMapAddr_cfg                 <= 0;
            outMapAddr_cfg                  <= 0;
            pixSeqCfgFetchTotal_cfg         <= 0;
            inMapAddr_cfg                   <= 0;
            prevMapAddr_cfg                 <= 0;
            im_fetch_amount_cfg             <= 0;
            inMapFetchTotal_cfg             <= 0;
            krnl3x3Addr_cfg                 <= 0;
            krnl3x3BiasAddr_cfg             <= 0;
            krnl3x3FetchTotal_cfg           <= 0;
            krnl3x3BiasFetchTotal_cfg       <= 0;
            krnl1x1FetchTotal_cfg           <= 0;
            krnl1x1BiasFetchTotal_cfg       <= 0;
            partMapFetchTotal_cfg           <= 0;
            resdMapFetchTotal_cfg           <= 0;
            outMapStoreTotal_cfg            <= 0;
            ob_store_amount_cfg             <= 0;
            prevMapFetchTotal_cfg           <= 0;
            num_1x1_kernels_cfg             <= 0;
            cm_high_watermark_cfg           <= 0;
            rm_low_watermark_cfg            <= 0;
            pm_low_watermark_cfg            <= 0;
            pv_low_watermark_cfg            <= 0;
            rm_fetch_amount_cfg             <= 0;
            pm_fetch_amount_cfg             <= 0;
            pv_fetch_amount_cfg             <= 0;
            im_fetch_amount_cfg             <= 0;
            krnl1x1_pding_cfg               <= 0;
            krnl1x1_pad_bgn_cfg             <= 0;
            krnl1x1_pad_end_cfg             <= 0;
            opcode_cfg                      <= 0;
            res_high_watermark_cfg          <= 0;
            krnl1x1_bram_rdAddr_end_cfg     <= 0;
            krnl1x1_dpth_end_cfg            <= 0;
            start_FAS                       <= 0;
        end else begin
            if(targ_read_addr == 0 && targ_read_addr_vld) begin
                // krnl1x1Depth_cfg                <= targ_write_data[];
                // FAS_cfg_Addr                    <= targ_write_data[];
                // FAS_cfg_fetch_amount            <= targ_write_data[];
                // FAS_cfg_data_len                <= targ_write_data[];
                // AWP_cfg_Addr                    <= targ_write_data[];
                // AWP_cfg_fetch_amount            <= targ_write_data[];
                // AWP_cfg_data_len                <= targ_write_data[];
                // pixelSeqAddr_cfg                <= targ_write_data[];
                // partMapAddr_cfg                 <= targ_write_data[];
                // resdMapAddr_cfg                 <= targ_write_data[];
                // outMapAddr_cfg                  <= targ_write_data[];
                // pixSeqCfgFetchTotal_cfg         <= targ_write_data[];
                // inMapAddr_cfg                   <= targ_write_data[];
                // prevMapAddr_cfg                 <= targ_write_data[];
                // im_fetch_amount_cfg             <= targ_write_data[];
                // inMapFetchTotal_cfg             <= targ_write_data[];
                // krnl3x3Addr_cfg                 <= targ_write_data[];
                // krnl3x3BiasAddr_cfg             <= targ_write_data[];
                // krnl3x3FetchTotal_cfg           <= targ_write_data[];
                // krnl3x3BiasFetchTotal_cfg       <= targ_write_data[];
                // krnl1x1FetchTotal_cfg           <= targ_write_data[];
                // krnl1x1BiasFetchTotal_cfg       <= targ_write_data[];
                // partMapFetchTotal_cfg           <= targ_write_data[];
                // resdMapFetchTotal_cfg           <= targ_write_data[];
                // outMapStoreTotal_cfg            <= targ_write_data[];
                // ob_store_amount_cfg             <= targ_write_data[];
                // prevMapFetchTotal_cfg           <= targ_write_data[];
                // num_1x1_kernels_cfg             <= targ_write_data[];
                // cm_high_watermark_cfg           <= targ_write_data[];
                // rm_low_watermark_cfg            <= targ_write_data[];
                // pm_low_watermark_cfg            <= targ_write_data[];
                // pv_low_watermark_cfg            <= targ_write_data[];
                // rm_fetch_amount_cfg             <= targ_write_data[];
                // pm_fetch_amount_cfg             <= targ_write_data[];
                // pv_fetch_amount_cfg             <= targ_write_data[];
                // im_fetch_amount_cfg             <= targ_write_data[];
                // krnl1x1_pding_cfg               <= targ_write_data[];
                // krnl1x1_pad_bgn_cfg             <= targ_write_data[];
                // krnl1x1_pad_end_cfg             <= targ_write_data[];
                // opcode_cfg                      <= targ_write_data[];
                // res_high_watermark_cfg          <= targ_write_data[];
                // krnl1x1_bram_rdAddr_end_cfg     <= targ_write_data[];   
                // krnl1x1_dpth_end_cfg            <= targ_write_data[];
            end else if(targ_read_addr == 1 && targ_read_addr_vld) begin
                start_FAS                       <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign res_dwc_fifo_rden = res_dwc_fifo_count == C_OUTBUF_FIFO_DIN_FACTOR;

    always@(posedge clk_FAS) begin
        if(rst) begin
            res_dwc_fifo_count <= 0;
        end else if(res_dwc_fifo_wren) begin
            res_dwc_fifo_count <= res_dwc_fifo_count + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i0, i1, i2, i3, i4;
    always@(*) begin
        // - - - - - - - - - - - - - -
        if(vector_add_pm_d) begin
            for(i0 = 0; i0 < `VECTOR_ADD_SIMD; i0 = i0 + 1) begin
                vec_add_pm_arr[vec_add_pm_addr][(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] =
                    convMap_fifo_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    + partMap_fifo_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm0_d) begin
            for(i1 = 0; i1 < `VECTOR_ADD_SIMD; i1 = i1 + 1) begin
                vec_add_rm0_arr[vec_add_rm0_addr][i1 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    convMap_fifo_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    + resdMap_fifo_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm1_d) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1) begin
                vec_add_rm1_arr[vec_add_rm1_addr][i2 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    vec_add_pm_arr[vec_add_pm_addr][(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    + resdMap_fifo_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm_conv_d) begin
            for(i3 = 0; i3 < `VECTOR_ADD_SIMD; i3 = i3 + 1) begin
                vec_add_rm_conv_arr[vec_add_rm_conv_addr][i3 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    conv1x1_dwc_fifo_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    + resdMap_fifo_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_pv_d) begin
            for(i4 = 0; i4 < `VECTOR_ADD_SIMD; i4 = i4 + 1) begin
                vec_add_pv_arr[vec_add_pv_addr][i4 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    conv1x1_dwc_fifo_dout[(i4 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    + prevMap_fifo_dout[(i4 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
    end
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            vec_add_pm_addr         <= 0;
            vec_add_rm0_addr        <= 0;
            vec_add_rm1_addr        <= 0;
            vec_add_rm_conv_addr    <= 0;
            vec_add_pv_addr         <= 0;
        end else begin
            // - - - - - - - - - - - - - -
            if(pipe_enable_d && vec_add_pm_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_pm_addr <= 0;
            end else if(pipe_enable_d) begin
                vec_add_pm_addr <= vec_add_pm_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(pipe_enable_d && vec_add_rm0_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm0_addr <= 0;
            end else if(pipe_enable_d) begin
                vec_add_rm0_addr <= vec_add_rm0_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(pipe_enable_d && vec_add_rm1_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm1_addr <= 0;
            end else if(pipe_enable_d) begin
                vec_add_rm1_addr <= vec_add_rm1_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_rm_conv_d && vec_add_rm_conv_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_rm_conv_addr <= 0;
            end else if(pipe_enable_d) begin
                vec_add_rm_conv_addr <= vec_add_rm_conv_addr + 1;
            end
            // - - - - - - - - - - - - - -
            if(vector_add_pv_d && vec_add_pv_addr == krnl1x1_dpth_end_cfg) begin
                vec_add_pv_addr <= 0;
            end else if(pipe_enable_d) begin
                vec_add_pv_addr <= vec_add_pv_addr + 1;
            end
            // - - - - - - - - - - - - - -
        end
    end

    always@(posedge clk_FAS) begin
        if(rst) begin
            vector_add_rm_conv  <= 0;
            vector_add_pv       <= 0;
        end else begin
            vector_add_rm_conv  <= 0;
            vector_add_pv       <= 0;
            // - - - - - - - - - - - - - -
            if(conv1x1_dwc_fifo_rden && (opcode_cfg[`OPCODE_0_FIELD] || opcode_cfg[`OPCODE_2_FIELD])) begin
                vector_add_rm_conv <= 1;
            end
            // - - - - - - - - - - - - - -
            if(conv1x1_dwc_fifo_rden && (opcode_cfg[`OPCODE_1_FIELD] 
                                        || opcode_cfg[`OPCODE_3_FIELD] 
                                        || opcode_cfg[`OPCODE_5_FIELD] 
                                        || opcode_cfg[`OPCODE_7_FIELD])) 
            begin
                vector_add_pv <= 1;
            end
            // - - - - - - - - - - - - - -
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign conv1x1_dwc_fifo_wren = |conv1x1_vld || |conv1x1_bias_vld_d;
    assign conv1x1_dwc_fifo_rden = (conv1x1_dwc_fifo_count == C_OUTBUF_FIFO_DIN_FACTOR);
    
    integer i5;
    always@(posedge clk_FAS) begin
        if(rst) begin
            conv1x1_dwc_fifo_count <= 0;
        end else if(conv1x1_dwc_fifo_wren) begin
            for(i5 = 0; i5 < `KRNL_1X1_SIMD; i5 = i5 + 1) begin
                if(conv1x1_vld[i5] || conv1x1_bias_vld_d[i5]) begin
                    conv1x1_dwc_fifo_din <= conv1x1_out[i5];
                end
            end
            conv1x1_dwc_fifo_count <= conv1x1_dwc_fifo_count + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            last_wrt_r          <= 0;
            last_CO_recvd_r     <= 0;
            process_cmpl        <= 0;
            init_usrIntr_acked  <= 0;
        end else begin
            process_cmpl        <= 0;
            last_wrt_r          <= (last_wrt)       ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)  ? 1 : last_CO_recvd_r;
            case(state)
                ST_IDLE: begin
                    if(start_FAS) begin
                        state           <= ST_CFG_FAS;
                    end
                end
                ST_CFG_FAS: begin
                    if(opcode_cfg[`OPCODE_14_FIELD] || opcode_cfg[`OPCODE_17_FIELD]) begin
                        state <= ST_ACTIVE;
                    end else begin
                        state <= ST_CFG_AWP;
                    end
                end
                ST_CFG_AWP: begin
                    if(cfg_AWP_done) begin
                        state <= ST_START_AWP;
                    end
                end
                ST_START_AWP: begin
                    if(start_AWP_done) begin
                        state               <= ST_ACTIVE;
                    end
                end
                ST_ACTIVE: begin
                    if(partMapFetchCount == partMapFetchTotal_cfg
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
                        state               <= ST_SEND_COMPLETE;
                    end
                end
                ST_SEND_COMPLETE: begin
                    if(all_AWP_complete) begin
                        init_usrIntr               <= init_usrIntr_ack ? 1'b0 : (~init_usrIntr_acked ? 1'b1 : init_usrIntr);
                        init_usrIntr_ack           <= init_usrIntr_ack ? 1'b1 :  init_usrIntr_acked;
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            trans_in_fifo_rden  <= 0;
            cfg_AWP_done        <= 0;
            start_AWP_done      <= 0;
            all_AWP_complete    <= 0;
            res_dwc_fifo_wren   <= 0;
            job_fetch_fifo_wren <= 0;
        end else begin
            if(!trans_in_fifo_empty) begin
                trans_in_fifo_rden <= 1;
            end
            cfg_AWP_done        <= 0;
            start_AWP_done      <= 0;
            all_AWP_complete    <= 0;
            res_dwc_fifo_wren   <= 0;
            job_fetch_fifo_wren <= 0;
            if(trans_in_fifo_rden && trans_in_fifo_dout[`TRANS_AWP_CFG_ACK]) begin
                cfg_AWP_done        <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dout[`TRANS_AWP_START_ACK]) begin
                start_AWP_done      <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dout[`TRANS_RESULT_WRITE] && opcode_cfg[`OPCODE_16_FIELD]) begin
                res_dwc_fifo_wren   <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dout[`TRANS_JOB_CMPL]) begin
                all_AWP_complete    <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dout[`TRANS_JOB_FETCH]) begin
                job_fetch_fifo_wren <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign trans_eg_fifo_wren = trans_eg_fifo_wren_r || (init_read_data_vld[C_IM_IT_RD_ID] && init_read_data_rdy[C_IM_IT_RD_ID]);
    
    always@(*) begin
        if(state == ST_CFG_AWP || state == ST_START_AWP) begin
            trans_eg_fifo_din = trans_eg_fifo_data;
        end else begin
            trans_eg_fifo_din = init_read_data;
        end
    end
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            trans_eg_fifo_wren_r      <= 0;
            trans_eg_fifo_wren_r      <= 0;
        end else begin
            trans_eg_fifo_wren_r      <= 1;
            trans_eg_fifo_rden        <= 1;        
            if(state == ST_CFG_AWP) begin
                trans_eg_fifo_wren_r   <= 1;
                trans_eg_fifo_din      <= trans_eg_fifo_data;
            end
            if(state == ST_START_AWP && trans_eg_fifo_empty) begin
                trans_eg_fifo_wren_r   <= 1;
                trans_eg_fifo_din_r    <= trans_eg_fifo_data;
            end
            if(!trans_eg_fifo_empty) begin
                trans_eg_fifo_rden      <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_FC_IT_RD_ID] = C_FC_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            init_read_req[C_FC_IT_RD_ID]           <= 0;
            init_read_req_acked[C_FC_IT_RD_ID]     <= 0;
        end else begin
            if(state == ST_CFG_FAS && !init_read_in_prog[C_FC_IT_RD_ID]) begin
                init_read_addr_arr[C_FC_IT_RD_ID]      <= FAS_cfg_Addr;
                init_read_len_arr[C_FC_IT_RD_ID]       <= FAS_cfg_data_len;
                init_read_req[C_FC_IT_RD_ID]           <= init_read_req_ack[C_FC_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_FC_IT_RD_ID] ? 1'b1 : init_read_req[C_FC_IT_RD_ID]);
                init_read_req_acked[C_FC_IT_RD_ID]     <= init_read_req_ack[C_FC_IT_RD_ID] ? 1'b1 :  init_read_req_acked[C_FC_IT_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_AC_IT_RD_ID] = C_AC_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            init_read_req[C_AC_IT_RD_ID]           <= 0;
            init_read_req_acked[C_AC_IT_RD_ID]     <= 0;
        end else begin
            if(state == ST_CFG_AWP && !init_read_in_prog[C_AC_IT_RD_ID]) begin
                init_read_addr_arr[C_AC_IT_RD_ID]      <= AWP_cfg_Addr;
                init_read_len_arr[C_AC_IT_RD_ID]       <= AWP_cfg_data_len;
                init_read_req[C_AC_IT_RD_ID]           <= init_read_req_ack[C_AC_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_AC_IT_RD_ID] ? 1'b1 : init_read_req[C_AC_IT_RD_ID]);
                init_read_req_acked[C_AC_IT_RD_ID]     <= init_read_req_ack[C_AC_IT_RD_ID] ? 1'b1 :  init_read_req_acked[C_AC_IT_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_IM_IT_RD_ID] = C_IM_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            init_read_req[C_IM_IT_RD_ID]           <= 0;
            init_read_req_acked[C_IM_IT_RD_ID]     <= 0;
            inMapFetchCount                        <= 0;
            job_fetch_fifo_rden                    <= 0;
            job_fetch_data_vld                     <= 0;
        end else begin
            job_fetch_fifo_rden                       <= 0;
            if(!job_fetch_fifo_empty && !init_read_in_prog[C_IM_IT_RD_ID] && !job_fetch_data_vld) begin
                job_fetch_fifo_rden                   <= 1;
                job_fetch_data_vld                    <= 1;
            end
            if(!convMap_fifo_prog_full && job_fetch_data_vld && inMapFetchCount != inMapFetchTotal_cfg) begin
                init_read_addr_arr[C_IM_IT_RD_ID]      <= inMapAddr_cfg;
                init_read_len_arr[C_IM_IT_RD_ID]       <= im_fetch_amount_cfg;
                init_read_req[C_IM_IT_RD_ID]           <= init_read_req_ack[C_IM_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_IM_IT_RD_ID] ? 1'b1 : init_read_req[C_IM_IT_RD_ID]);
                init_read_req_acked[C_IM_IT_RD_ID]     <= init_read_req_ack[C_IM_IT_RD_ID] ? 1'b1 : init_read_req_acked[C_IM_IT_RD_ID];
            end
            if(init_read_cmpl[C_IM_IT_RD_ID]) begin
                job_fetch_data_vld  <= 0;
                inMapFetchCount     <= inMapFetchCount + im_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_PM_IT_RD_ID] = C_PM_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            init_read_req[C_PM_IT_RD_ID]           <= 0;
            init_read_req_acked[C_PM_IT_RD_ID]     <= 0;
            partMapFetchCount                      <= 0;
        end else begin
            if(state == ST_ACTIVE && !init_read_in_prog[C_PM_IT_RD_ID]
                && ((!opcode_cfg[`OPCODE_14_FIELD] && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg[`OPCODE_14_FIELD] || opcode_cfg[`OPCODE_17_FIELD]) && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                init_read_addr_arr[C_PM_IT_RD_ID]      <= partMapAddr_cfg;
                init_read_len_arr[C_PM_IT_RD_ID]       <= pm_fetch_amount_cfg;
                init_read_req[C_PM_IT_RD_ID]           <= init_read_req_ack[C_PM_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_PM_IT_RD_ID] ? 1'b1 : init_read_req[C_PM_IT_RD_ID]);
                init_read_req_acked[C_PM_IT_RD_ID]     <= init_read_req_ack[C_PM_IT_RD_ID] ? 1'b1 :  init_read_req_acked[C_PM_IT_RD_ID];
            end
            if(init_read_cmpl[C_PM_IT_RD_ID]) begin
                partMapFetchCount  <= partMapFetchCount + pm_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_PV_IT_RD_ID] = C_PV_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            init_read_req[C_PV_IT_RD_ID]           <= 0;
            init_read_req_acked[C_PV_IT_RD_ID]     <= 0;
            prevMapFetchCount                      <= 0;
        end else begin
            if(!init_read_in_prog[C_PV_IT_RD_ID] && state == ST_ACTIVE && prevMap_fifo_prog_empty && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                init_read_addr_arr[C_PV_IT_RD_ID]      <= prevMapAddr_cfg;
                init_read_len_arr[C_PV_IT_RD_ID]       <= pv_fetch_amount_cfg;
                init_read_req[C_PV_IT_RD_ID]           <= init_read_req_ack[C_PV_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_PV_IT_RD_ID] ? 1'b1 : init_read_req[C_PV_IT_RD_ID]);
                init_read_req_acked[C_PV_IT_RD_ID]     <= init_read_req_ack[C_PV_IT_RD_ID] ? 1'b1 :  init_read_req_acked[C_PV_IT_RD_ID];
            end
            if(init_read_cmpl[C_PV_IT_RD_ID]) begin
                prevMapFetchCount  <= prevMapFetchCount + pv_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign init_read_req_id_arr[C_RM_IT_RD_ID] = C_RM_IT_RD_ID;
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            init_read_req[C_RM_IT_RD_ID]         <= 0;
            init_read_req_acked[C_RM_IT_RD_ID]   <= 0;
            resdMapFetchCount                    <= 0;
        end else begin
            if(!init_read_in_prog[C_RM_IT_RD_ID] && state == ST_ACTIVE && (resdMap_fifo_prog_empty || resdMap_fifo_prog_empty) && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                init_read_addr_arr[C_RM_IT_RD_ID]      <=
                init_read_len_arr[C_RM_IT_RD_ID]       <= rm_fetch_amount_cfg;
                init_read_req[C_RM_IT_RD_ID]           <= init_read_req_ack[C_RM_IT_RD_ID] ? 1'b0 : (~init_read_req_acked[C_RM_IT_RD_ID] ? 1'b1 : init_read_req[C_RM_IT_RD_ID]);
                init_read_req_acked[C_RM_IT_RD_ID]     <= init_read_req_ack[C_RM_IT_RD_ID] ? 1'b1 :  init_read_req_acked[C_RM_IT_RD_ID];
            end
            if(init_read_cmpl[C_PV_IT_RD_ID]) begin
                resdMapFetchCount  <= resdMapFetchCount + rm_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign state_update_in_prog     = pipe_enable;

    // always@(posedge clk) begin
    //     for(i7 = 1; i7 < __; i7 = i7 + 1) begin
    //         state_update_in_prog[i7] = state_update_in_prog[i7 - 1];
    //     end
    // end

    always@(posedge clk_FAS) begin
        if(rst) begin
            pipe_enable                 <= 0;
            conv1x1_pip_start0          <= 0;
            conv1x1_pip_start1          <= 0;
            conv1x1_pip_start2          <= 0;
            vector_add_pm               <= 0;
            vector_add_rm0              <= 0;
            vector_add_rm1              <= 0;
            outBuf_fifo_wren1           <= 0;
            outBuf_fifo_wren2           <= 0; 
        end else begin
            pipe_enable                 <= 0;
            conv1x1_pip_start0          <= 0;
            conv1x1_pip_start1          <= 0;
            conv1x1_pip_start2          <= 0;
            vector_add_pm               <= 0;
            vector_add_rm0              <= 0;
            vector_add_rm1              <= 0;
            outBuf_fifo_wren1           <= 0;
            outBuf_fifo_wren2           <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_0_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_1_FIELD]
                    || opcode_cfg[`OPCODE_11_FIELD])
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|prevMap_fifo_empty)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_2_FIELD]
                    || opcode_cfg[`OPCODE_12_FIELD]
                    || opcode_cfg[`OPCODE_14_FIELD])
                && !convMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                conv1x1_pip_start0          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_3_FIELD]
                    || opcode_cfg[`OPCODE_13_FIELD])
                && !convMap_fifo_empty
                && !(|prevMap_fifo_empty)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                conv1x1_pip_start0          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_4_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                    vector_add_rm1          <= 1;
                end
                conv1x1_pip_start2          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_5_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|prevMap_fifo_empty)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                    vector_add_rm1          <= 1;
                end
                conv1x1_pip_start2          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_6_FIELD]
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_rm0          <= 1;
                end
                conv1x1_pip_start1          <= 1;
                outBuf_fifo_wren2           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_7_FIELD]
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|prevMap_fifo_empty)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(krnl_count_r == 0) begin
                    vector_add_rm0          <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg[`OPCODE_8_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                vector_add_rm1              <= 1;
                outBuf_fifo_wren2           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg[`OPCODE_9_FIELD] || opcode_cfg[`OPCODE_17_FIELD])
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_rm0              <= 1;
                outBuf_fifo_wren1           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_10_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg[`OPCODE_15_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                outBuf_fifo_wren1           <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign krnl1x1_bram_rden_w  = (conv1x1_pip_start0 || conv1x1_pip_start2 || conv1x1_pip_start2);
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            dpth_count_r            <= 0;
            krnl_count_r            <= 0;
        end else begin
            if(krnl1x1_bram_rden_w) begin
                if(dpth_count_r == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WIDTH)) begin
                    dpth_count_r          <= 0;
                    if(krnl_count_r == (num_1x1_kernels_cfg  - 1)) begin
                        krnl_count_r      <= 0;
                    end else begin
                        krnl_count_r <= krnl_count_r + 1;
                    end
                end else begin
                    dpth_count_r <= dpth_count_r + `KRNL_1X1_BRAM_RD_WIDTH;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            convMap_fifo_rden       <= 0;
            partMap_fifo_rden       <= 0;
            resdMap_fifo_rden      <= 0;
            prevMap_fifo_rden       <= 0;
        end else begin
            convMap_fifo_rden       <= 0;
            partMap_fifo_rden       <= 0;
            resdMap_fifo_rden       <= 0;
            prevMap_fifo_rden       <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && krnl_count_r == 0 && (!opcode_cfg[`OPCODE_14_FIELD] && !opcode_cfg[`OPCODE_17_FIELD])) begin
                convMap_fifo_rden       <= 1;
            end
            if(vector_add_pm) begin
                partMap_fifo_rden       <= 1;
            end
            if(vector_add_rm0 || vector_add_rm1 || vector_add_rm_conv_d) begin
                resdMap_fifo_rden  <= 1;
            end
            if(vector_add_pv_d) begin
                prevMap_fifo_rden       <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign outBuf_fifo_prog_full = (outBuf_fifo_count > outMapStoreFactor_cfg);

    always@(posedge clk_FAS) begin
        if(rst) begin
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
    
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            outMapStoreCount <= 0;
        end else begin
            if(outBuf_fifo_prog_full && (state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && outMapStoreCount !=  outMapStoreTotal_cfg) begin
                init_read_addr           <= outMapAddr_cfg;
                init_read_len            <= ob_store_amount_cfg;
                init_write_req           <= init_write_req_ack  ? 1'b0 : (~init_write_req_acked ? 1'b1 : init_write_req);
                init_write_req_acked     <= init_write_req_ack  ? 1'b1 :  init_write_req_acked;
            end
            if(init_write_cmpl) begin
                outMapStoreCount <= outMapStoreCount + ob_store_amount_cfg;
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
        if(init_write_data_vld && init_write_data_rdy) begin
            outBuf_fifo_rden = 1;
        end else begin
            outBuf_fifo_rden = 0;
        end
    end

    always@(*) begin
        if(opcode_cfg[`OPCODE_0_FIELD]
            || opcode_cfg[`OPCODE_2_FIELD]) 
        begin
            outBuf_fifo_din = vec_add_rm_conv_out;
        end else if(opcode_cfg[`OPCODE_1_FIELD]
            || opcode_cfg[`OPCODE_3_FIELD]
            || opcode_cfg[`OPCODE_5_FIELD]
            || opcode_cfg[`OPCODE_7_FIELD]
            || opcode_cfg[`OPCODE_11_FIELD]
            || opcode_cfg[`OPCODE_13_FIELD])
        begin
            outBuf_fifo_din = vec_add_pv_out;
        end else if(opcode_cfg[`OPCODE_8_FIELD]
                   || (opcode_cfg[`OPCODE_9_FIELD]
                   || opcode_cfg[`OPCODE_17_FIELD]))
        begin
            outBuf_fifo_din = vec_add_rm0_arr[vec_add_rm0_addr];
        end else if(opcode_cfg[`OPCODE_8_FIELD]
                   || opcode_cfg[`OPCODE_9_FIELD])
        begin
            outBuf_fifo_din = vec_add_rm1_arr[vec_add_rm1_addr];
        end else if(opcode_cfg[`OPCODE_15_FIELD]) begin
            outBuf_fifo_din = vec_add_pm_arr[vec_add_pm_addr];
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
