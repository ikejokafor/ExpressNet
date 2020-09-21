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
    parameter C_CF_SM_RD_ID = 0,
    parameter C_IM_SM_RD_ID = 1,
    parameter C_PM_SM_RD_ID = 2,
    parameter C_PV_SM_RD_ID = 3,
    parameter C_RM_SM_RD_ID = 4
) (
    clk_intf                    ,
    clk_FAS                     ,
    rst                         ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    start_FAS                   ,
    start_FAS_ack               ,
    send_FAS_complete           ,
    FAS_complete_ack            ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    sys_mem_read_req            ,
    sys_mem_read_addr           ,
    sys_mem_read_len            ,
    sys_mem_read_req_ack        ,
    sys_mem_read_in_prog        ,
    sys_mem_read_data           ,
    sys_mem_read_data_vld       ,
    sys_mem_read_data_rdy       ,
    sys_mem_read_cmpl           ,
    sys_mem_write_req           ,
    sys_mem_write_addr          ,
    sys_mem_write_len           ,
    sys_mem_write_req_ack       ,
    sys_mem_write_in_prog       ,
    sys_mem_write_cmpl          ,
    sys_mem_write_data          ,
    sys_mem_write_data_vld      ,
    sys_mem_write_data_rdy      ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_wren          ,
    convMap_fifo_wren           ,
    resdMap_conv_fifo_wren      ,
    resdMap_conv_bram_wren      ,
    partMap_fifo_wren           ,
    prevMap_fifo_wren           ,
    krnl1x1_bram_wren           ,
    krnl1x1Bias_bram_wren       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    trans_in_fifo_datain        ,
    convMap_fifo_datain         ,
    resdMap_dpth_bram_datain    ,
    resdMap_conv_fifo_datain    ,
    partMap_fifo_datain         ,
    prevMap_fifo_datain         ,
    krnl1x1_bram_datain         ,
    krnl1x1Bias_bram_datain     ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    outBuf_fifo_rden            ,
    outBuf_fifo_dout            ,
    trans_eg_fifo_dout_vld      ,
    trans_eg_fifo_dataout
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
    localparam C_SYS_MEM_RD_ADDR_WTH                = `MAX_FAS_RD_ID * `SYS_RD_ADDR_WIDTH;
    localparam C_SYS_MEM_RD_LEN_WTH                 = `MAX_FAS_RD_ID * `SYS_RD_LEN_WIDTH;
    localparam C_CONVMAP_FIFO_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_CONVMAP_WR_ADDR_WTH                = clog2(`convMap_fifo_WR_DEPTH);
    localparam C_CONVMAP_RD_ADDR_WTH                = clog2(`convMap_fifo_RD_DEPTH);
    localparam C_CONVMAP_CT_WITH                    = clog2(`convMap_fifo_RD_DEPTH);
    localparam C_KRNL_1X1_BRAM_WR_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_WR_DEPTH);
    localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_RD_DEPTH);
    localparam C_KRNL_1X1_BRAM_RD_WTH               = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_WR_DEPTH);
    localparam C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_RD_DEPTH);
    localparam C_KRNL_1X1_BIAS_BRAM_RD_WTH          = `PIXEL_WIDTH;
    localparam C_RESDMAP_BRAM_WR_ADDR_WTH           = clog2(`RESDMAP_BRAM_WR_DEPTH);
    localparam C_RESDMAP_BRAM_RD_ADDR_WTH           = clog2(`RESDMAP_BRAM_RD_DEPTH);
    localparam C_RESDMAP_BRAM_RD_WTH                = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_RESDMAP_BRAM_CT_WTH                = clog2(`RESDMAP_BRAM_RD_DEPTH);
    localparam C_PARTMAP_FIFO_WR_ADDR               = clog2(`partMap_fifo_WR_DEPTH);
    localparam C_PARTMAP_FIFO_RD_ADDR               = clog2(`partMap_fifo_RD_DEPTH);
    localparam C_PARTMAP_FIFO_RD_WTH                = `KRNL_1X1_DEPTH_SIMD * `PIXEL_WIDTH;
    localparam C_PREVMAP_FIFO_RD_WTH                = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_CONV1X1_DWC_FIFO_RD_WTH            = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_DIN                = `KRNL_1X1_SIMD * `PIXEL_WIDTH;
    localparam C_OUTBUF_DWC_FIFO_DOUT               = `PIXEL_WIDTH;
    localparam C_OUTBUF_FIFO_DIN_WTH                = `PIXEL_WIDTH * `OUTBUF_FIFO_DIN_FACTOR;
    localparam C_OUTBUF_FIFO_COUNT                  = clog2(`OUTBUF_FIFO_DEPTH);
    localparam C_VEC_SUM_ARR_SZ                     = `MAX_1X1_KRNL_DEPTH / `KRNL_1X1_DEPTH_SIMD;
    localparam C_VEC_SUM_ARR_ADDR_WTH               = clog2(`MAX_1X1_KRNL_DEPTH / `KRNL_1X1_DEPTH_SIMD);


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                     clk_intf                   ;
    input  logic                                     clk_FAS                    ;
    input  logic                                     rst                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                     start_FAS                  ;
    output logic                                     start_FAS_ack              ;
    input  logic                                     send_FAS_complete          ;
    output logic                                     FAS_complete_ack           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req           ;
    output logic [     C_SYS_MEM_RD_ADDR_WTH - 1:0]  sys_mem_read_addr          ;
    output logic [      C_SYS_MEM_RD_LEN_WTH - 1:0]  sys_mem_read_len           ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_req_ack       ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_in_prog       ;  
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  sys_mem_read_data          ;
    input  logic                                     sys_mem_read_data_vld      ;
    output logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_data_rdy      ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]  sys_mem_read_cmpl          ;
    output logic                                     sys_mem_write_req          ;
    output logic [        `SYS_WR_ADDR_WIDTH - 1:0]  sys_mem_write_addr         ;
    output logic [         `SYS_WR_LEN_WIDTH - 1:0]  sys_mem_write_len          ;
    input  logic                                     sys_mem_write_req_ack      ;
    input  logic                                     sys_mem_write_in_prog      ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  sys_mem_write_data         ;
    output logic                                     sys_mem_write_data_vld     ;
    input  logic                                     sys_mem_write_data_rdy     ;
    input  logic                                     sys_mem_write_cmpl         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                     trans_in_fifo_wren         ;
    input  logic                                     convMap_fifo_wren          ;
    input  logic                                     partMap_fifo_wren          ;
    input  logic                                     resdMap_dpth_bram_wren     ;
    input  logic                                     resdMap_conv_bram_wren     ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  prevMap_fifo_wren          ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1_bram_wren          ;
    input  logic [            `KRNL_1X1_SIMD - 1:0]  krnl1x1Bias_bram_wren      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic [           `TRANS_FIFO_WIH - 1:0]  trans_in_fifo_datain       ;
    input  logic [        `SYS_INTC_DT_WIDTH - 1:0]  convMap_fifo_datain        ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  partMap_fifo_datain        ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  prevMap_fifo_datain        ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  resdMap_dpth_bram_datain   ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  resdMap_conv_bram_datain   ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  krnl1x1_bram_datain        ;
    input  logic [        `SYS_RD_DATA_WIDTH - 1:0]  krnl1x1Bias_bram_datain    ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                     outBuf_fifo_rden           ;
    output logic [        `SYS_WR_DATA_WIDTH - 1:0]  outBuf_fifo_dout           ;
    output logic                                     trans_eg_fifo_dout_vld     ;
    output logic [           `TRANS_FIFO_WIH - 1:0]  trans_eg_fifo_dataout      ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                      31:0]  cfg_data_addr                                                   ;
    logic [                                      15:0]  cfg_data_len                                                    ;    
    logic [                                      15:0]  krnl1x1Depth_cfg                                                ;
    logic [                                      15:0]  krnl1x1Addr_cfg                                                 ;
    logic [                                      15:0]  krnl1x1BiasAddr_cfg                                             ;
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
    logic [                                      15:0]  opcode_cfg                                                      ;
    logic [                                      15:0]  res_high_watermark_cfg                                          ;
    logic [                                      15:0]  krnl1x1_pip_en_cfg                                              ;
    logic [                                      15:0]  krnl1x1_bram_rdAddr_end_cfg                                     ;
    logic [                                      15:0]  krnl1x1_dpth_end_cfg                                            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                      6:0]   state                                                           ;
    logic                                               cfg_AWP_done                                                    ;
    logic                                               all_AWP_complete                                                ;
    logic                                               FAS_complete_acked                                              ;
    logic                                               process_cmpl                                                    ;
    logic                                               last_wrt_r                                                      ;
    logic                                               last_wrt                                                        ;
    logic                                               last_CO_recvd_r                                                 ;
    logic                                               last_CO_recvd                                                   ;
    logic [                                     15:0]   cfgDataFetchCount                                               ;
    logic [                                     15:0]   cfgDataFetchTotal_cfg                                           ;
    logic                                               pipe_enable                                                     ;
    logic                                               pipe_enable_d                                                   ;
    logic                                               state_update_in_prog                                            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                     15:0]   dpth_count_r                                                    ;
    logic [                                     15:0]   krnl_count_r                                                    ;
    logic [                                     15:0]   dpth_count                        [`KRNL_1X1_SIMD - 1:0]        ;
    logic [                                     15:0]   krnl_count                        [`KRNL_1X1_SIMD - 1:0]        ;
    logic                                               next_in_batch                                                   ;     
    logic                                               next_in_batch_r1                                                ;
    logic                                               next_in_batch_r0                                                ;
    logic                                               adder_tree_datain_valid                                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               vector_add_pm                                                   ;
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
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                     `MAX_FAS_RD_ID - 1:0]   sys_mem_read_req_acked                                          ;
    logic                                               sys_mem_write_req_acked                                         ;
    logic [                  `SYS_RD_ADDR_WIDTH - 1:0]  sys_mem_read_addr_arr      [`MAX_FAS_RD_ID - 1:0]               ;
    logic [                   `SYS_RD_LEN_WIDTH - 1:0]  sys_mem_read_len_arr       [`MAX_FAS_RD_ID - 1:0]               ;
    genvar g0; `UNPACK_ARRAY_1D(`SYS_RD_ADDR_WIDTH, `MAX_FAS_RD_ID, sys_mem_read_addr, sys_mem_read_addr_arr, g0);      ;
    genvar g1; `UNPACK_ARRAY_1D(`SYS_RD_LEN_WIDTH, `MAX_FAS_RD_ID, sys_mem_read_len, sys_mem_read_len_arr, g1);         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [               C_CONVMAP_WR_ADDR_WTH - 1:0]  convMap_fifo_wrAddr                                             ;
    logic [               C_CONVMAP_RD_ADDR_WTH - 1:0]  convMap_fifo_rdAddr                                             ;
    logic                                               convMap_fifo_rden                                               ;
    logic [               C_convMap_fifo_RD_WTH - 1:0]  convMap_fifo_dout                                               ;
    logic                                               convMap_fifo_empty                                              ;
    logic                                               convMap_fifo_prog_full                                          ;
    logic                                               convMap_fifo_wr_rst_busy                                        ;
    logic                                               convMap_fifo_rd_rst_busy                                        ;  
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic  [                  `TRANS_PYLD_WIDTH - 1:0]  res_dwc_fifo_din                                                ;
    logic                                               res_dwc_fifo_wren                                               ;
    logic                                               res_dwc_fifo_rden                                               ;
    logic  [              C_OUTBUF_FIFO_DIN_WTH - 1:0]  res_dwc_fifo_dout                                               ;
    logic                                               res_dwc_fifo_rd_vld                                             ;
    logic                                               res_dwc_fifo_wr_rst_busy                                        ;
    logic                                               res_dwc_fifo_rd_rst_busy                                        ;
    logic  [                                     15:0]  res_dwc_fifo_count                                              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [         C_KRNL_1X1_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1_bram_wrAddr             [`KRNL_1X1_SIMD - 1:0]          ;
    logic [         C_KRNL_1X1_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1_bram_rdAddr             [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_bram_rden               [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_pip_start_d0_r                                          ;
    logic                                               krnl1x1_pip_start_d1_r                                          ;
    logic                                               krnl1x1_pip_start_d2_r                                          ;
    logic                                               krnl1x1_pip_start_d0            [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_pip_start_d1            [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_pip_start_d2            [`KRNL_1X1_SIMD - 1:0]          ;
    logic [              C_KRNL_1X1_BRAM_RD_WTH - 1:0]  krnl1x1_bram_dout               [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic [    C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH - 1:0]  krnl1x1Bias_bram_wrAddr         [`KRNL_1X1_SIMD - 1:0]          ;
    logic [    C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH - 1:0]  krnl1x1Bias_bram_rdAddr         [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1Bias_bram_rden           [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                        `PIXEL_WIDTH - 1:0]  krnl1x1Bias_bram_dout           [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               krnl1x1_pip_start_d             [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               resdMap_bram_empty                                              ;  
    logic [                                      15:0]  resdMapFetchCount                                               ;  
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               resdMap_fifo_bram_rden                                          ;
    logic [               C_RESDMAP_BRAM_RD_WTH - 1:0]  resdMap_fifo_bram_dout                                          ;
    logic                                               resdMap_fifo_bram_empty                                         ;
    logic                                               resdMap_fifo_bram_prog_empty                                    ;
    logic                                               resdMap_fifo_wr_rst_busy                                        ;
    logic                                               resdMap_fifo_rd_rst_busy                                        ;  
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               resdMap_conv_bram_rden                                          ;
    logic [              C_RESDMAP_BRAM_RD_WTH - 1:0]   resdMap_conv_bram_dout                                          ;
    logic                                               resdMap_conv_fifo_empty                                         ;
    logic [              C_RESDMAP_BRAM_CT_WTH - 1:0]   resdMap_conv_bram_count                                         ;
    logic                                               resdMap_conv_bram_prog_empty                                    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               partMap_fifo_rden                                               ;
    logic                                               partMap_fifo_rden_w1                                            ;
    logic [              C_partMap_fifo_RD_WTH - 1:0]   partMap_fifo_dout                                               ;
    logic                                               partMap_fifo_empty                                              ;
    logic                                               partMap_fifo_prog_empty                                         ;
    logic [                                     15:0]   partMapFetchCount                                               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               conv1x1_dwc_fifo_wren                                           ;
    logic                                               conv1x1_dwc_fifo_rden                                           ;
    logic [                       `PIXEL_WIDTH - 1:0]   conv1x1_dwc_fifo_din                                            ;
    logic [          C_CONV1X1_DWC_FIFO_RD_WTH - 1:0]   conv1x1_dwc_fifo_dout                                           ;
    logic                                               conv1x1_dwc_fifo_rd_vld                                         ;
    logic                                               conv1x1_dwc_fifo_wr_rst_busy                                    ;
    logic                                               conv1x1_dwc_fifo_rd_rst_busy                                    ;
    logic [                                     15:0]   conv1x1_dwc_fifo_count                                          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_rden                                               ;
    logic                                               prevMap_fifo_rden_r                                             ;
    logic [              C_PREVMAP_FIFO_RD_WTH - 1:0]   prevMap_fifo_dout                                               ;
    logic                                               prevMap_fifo_empty              [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_empty_w                                            ;
    logic [                     `KRNL_1X1_SIMD - 1:0]   prevMap_fifo_prog_empty                                         ;
    logic                                               prevMap_fifo_rd_valid           [`KRNL_1X1_SIMD - 1:0]          ;
    logic [                                     15:0]   prevMapFetchCount                                               ;
    logic                                               prevMap_fifo_wr_rst_busy        [`KRNL_1X1_SIMD - 1:0]          ;
    logic                                               prevMap_fifo_rd_rst_busy        [`KRNL_1X1_SIMD - 1:0]          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               outBuf_fifo_wren                                                ;
    logic                                               outBuf_fifo_wren_r1                                             ;
    logic                                               outBuf_fifo_wren_r1_d                                           ;
    logic                                               outBuf_fifo_wren_r2                                             ;
    logic                                               outBuf_fifo_wren_r2_d                                           ;
    logic                                               outBuf_fifo_wren_w3                                             ;
    logic                                               outBuf_fifo_wren_w3_0                                           ;
    logic                                               outBuf_fifo_wren_w4                                             ;
    logic                                               outBuf_fifo_wren_w4_d                                           ;
    logic [              C_OUTBUF_FIFO_DIN_WTH - 1:0]   outBuf_fifo_datain                                              ;
    logic [                                     15:0]   outMapStoreCount                                                ;
    logic                                               outBuf_fifo_prog_full                                           ;
    logic                                               outBuf_fifo_wr_rst_busy                                         ;
    logic                                               outBuf_fifo_rd_rst_busy                                         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_in_fifo_rden                                              ;
    logic                                               trans_in_fifo_empty                                             ;
    logic [                    `TRANS_FIFO_WIH - 1:0]   trans_in_fifo_dataout                                           ;
    logic                                               trans_in_fifo_rd_valid                                          ;
    logic                                               trans_in_fifo_wr_rst_busy                                       ;
    logic                                               trans_in_fifo_rd_rst_busy                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               trans_eg_fifo_wren                                              ;
    logic                                               trans_eg_fifo_rden                                              ;
    logic [                    `TRANS_FIFO_WIH - 1:0]   trans_eg_fifo_datain                                            ;
    logic [                    `TRANS_FIFO_WIH - 1:0]   trans_eg_fifo_data                                              ;
    logic                                               trans_eg_fifo_empty                                             ;
    logic                                               trans_eg_fifo_wr_rst_busy                                       ;
    logic                                               trans_eg_fifo_rd_rst_busy                                       ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               job_fetch_fifo_wren                                             ;
    logic                                               job_fetch_fifo_rden                                             ;
    logic                                               job_fetch_fifo_empty                                            ;
    logic [             `JOB_FTCH_AWP_ID_WIDTH - 1:0]   job_fetch_fifo_datain                                           ;
    logic [             `JOB_FTCH_AWP_ID_WIDTH - 1:0]   job_fetch_fifo_dataout                                          ;
    logic                                               job_fetch_fifo_rd_valid                                         ;
    logic                                               job_fetch_fifo_wr_rst_busy                                      ;
    logic                                               job_fetch_fifo_rd_rst_busy                                      ;
    logic                                               job_fetch_data_vld                                              ;
    logic [                                     15:0]   inMapFetchCount                                                 ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                               vec_mult_din_vld                [`KRNL_1X1_SIMD - 1:0]          ;
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
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( vector_add_rm_conv            ),
        .data_out   ( vector_add_rm_conv_d          )
    );
  

    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY )
    )
    i2_SRL_bit (
        .clk        ( clk_FAS                 ),
        .ce         ( 1'b1                    ),
        .rst        ( rst                     ),
        .data_in    ( vector_add_pv           ),
        .data_out   ( vector_add_pv_d         )
    );
    
    
        SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i4_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( vector_add_pv_d               ),
        .data_out   ( outBuf_fifo_wren_pv           )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY )
    )
    i5_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm_conv_d  ),
        .data_out   ( outBuf_fifo_wren_rm   )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY + `VEC_ADD_LATENCY )
    )
    i6_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( outBuf_fifo_wren_r1           ),
        .data_out   ( outBuf_fifo_wren_r1_d         )
    );

    
    SRL_bit #(
        .C_CLOCK_CYCLES ( (2 * `FAS_BRAM_LATENCY) + `VEC_ADD_LATENCY  )
    )
    i6_SRL_bit (
        .clk        ( clk_FAS                       ),
        .ce         ( 1'b1                          ),
        .rst        ( rst                           ),
        .data_in    ( outBuf_fifo_wren_r2           ),
        .data_out   ( outBuf_fifo_wren_r2_d         )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY )
    )
    i7_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_pm         ),
        .data_out   ( vector_add_pm_d       )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY )
    )
    i8_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm0        ),
        .data_out   ( vector_add_rm0_d      )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 2 * `FAS_BRAM_LATENCY + `VEC_ADD_LATENCY )
    )
    i9_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm1        ),
        .data_out   ( vector_add_rm1_d      )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY )
    )
    i9_SRL_bit (
        .clk        ( clk_FAS            ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( pipe_enable        ),
        .data_out   ( pipe_enable_d      )
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( `SYS_WR_DATA_WIDTH         ),
        .C_RAM_WR_DEPTH        ( `convMap_fifo_WR_DEPTH     ),
        .C_RAM_RD_WIDTH        (  C_convMap_fifo_RD_WTH     ),
        .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"         )
    )
    convMap_fifo (
        .wr_clk      ( clk_intf                                 ),
        .wrAddr      ( convMap_fifo_wrAddr                      ),
        .wren        ( convMap_fifo_wren                        ),
        .din         ( trans_in_fifo_datain[`TRANS_PYLD_FIELD]  ),
        .rd_clk      ( clk_FAS                                  ),
        .rdAddr      ( convMap_fifo_rdAddr                      ),
        .rden        ( convMap_fifo_rden                        ),
        .rd_mode     ( 1'b1                                     ),
        .fifo_fwft   ( 1'b1                                     ),
        .count       ( convMap_fifo_count                       ),
        .dout        ( convMap_fifo_dout                        )
    );


    res_dwc_fifo #(
        .C_DATA_WIDTH  ( ),
        .C_FIFO_DEPTH  ( )
    )
    i0_res_dwc_fifo (
        .clk                ( clk_FAS                                   ),
        .srst               ( rst                                       ),
        .din                ( trans_in_fifo_datain[`TRANS_PYLD_FIELD]   ),
        .wr_en              ( res_dwc_fifo_wren                         ),
        .rd_en              ( res_dwc_fifo_rden                         ),
        .dout               ( res_dwc_fifo_dout                         ),
        .full               (                                           ),
        .empty              (                                           ),
        .valid              ( res_dwc_fifo_rd_vld                       ),
        .wr_rst_busy        ( res_dwc_fifo_wr_rst_busy                  ),
        .rd_rst_busy        ( res_dwc_fifo_rd_rst_busy                  ),
    );
    
    
    partMap_fifo
    i0_partMap_fifo (
        .srst                ( rst                          ),
        .wr_clk              ( clk_intf                     ),
        .rd_clk              ( clk_FAS                      ),
        .din                 ( partMap_fifo_datain          ),
        .wr_en               ( partMap_fifo_wren            ),
        .rd_en               ( partMap_fifo_rden            ),
        .prog_empty_thresh   ( pm_low_watermark_cfg         ),
        .dout                ( partMap_fifo_dout            ),
        .full                (                              ),
        .wr_ack              (                              ),
        .empty               ( partMap_fifo_empty           ),
        .valid               ( partMap_fifo_rd_valid        ),
        .prog_empty          ( partMap_fifo_prog_empty      ),
        .wr_rst_busy         ( partMap_fifo_wr_rst_busy     ),
        .rd_rst_busy         ( partMap_fifo_rd_rst_busy     )
    );
    

    conv1x1_dwc_fifo
    i0_conv1x1_dwc_fifo (
        .clk                ( clk_FAS                       ),
        .srst               ( rst                           ),
        .din                ( conv1x1_dwc_fifo_din          ),
        .wr_en              ( conv1x1_dwc_fifo_wren         ),
        .rd_en              ( conv1x1_dwc_fifo_rden         ),
        .dout               ( conv1x1_dwc_fifo_dout         ),
        .full               (                               ),
        .empty              (                               ),
        .valid              ( conv1x1_dwc_fifo_rd_vld       ),
        .wr_rst_busy        ( conv1x1_dwc_fifo_wr_rst_busy  ),
        .rd_rst_busy        ( conv1x1_dwc_fifo_rd_rst_busy  )
    );


    prevMap_fifo
    i0_prevMap_fifo (
        .srst                ( rst                          ),
        .wr_clk              ( clk_intf                     ),
        .rd_clk              ( clk_FAS                      ),
        .din                 ( prevMap_fifo_datain          ),
        .wr_en               ( prevMap_fifo_wren            ),
        .rd_en               ( prevMap_fifo_rden            ),
        .prog_empty_thresh   ( pv_low_watermark_cfg         ),
        .dout                ( prevMap_fifo_dout            ),
        .full                (                              ),
        .wr_ack              (                              ),
        .empty               ( prevMap_fifo_empty           ),
        .valid               ( prevMap_fifo_rd_valid        ),
        .prog_empty          ( prevMap_fifo_prog_empty      ),
        .wr_rst_busy         ( prevMap_fifo_wr_rst_busy     ),
        .rd_rst_busy         ( prevMap_fifo_rd_rst_busy     )
    );


    resdMap_dpth_fifo
    i0_resdMap_dpth_fifo (
        .srst                ( rst                              ),
        .wr_clk              ( clk_intf                         ),
        .rd_clk              ( clk_FAS                          ),
        .din                 ( resdMap_dpth_fifo_datain         ),
        .wr_en               ( resdMap_dpth_fifo_wren           ),
        .rd_en               ( resdMap_dpth_fifo_rden           ),
        .prog_empty_thresh   ( rm_low_watermark_cfg             ),
        .dout                ( resdMap_dpth_fifo_dout           ),
        .full                (                                  ),
        .empty               ( resdMap_dpth_fifo_empty          ),
        .prog_empty          ( resdMap_dpth_bram_prog_empty     ),
        .wr_rst_busy         ( resdMap_dpth_fifo_wr_rst_busy    ),
        .rd_rst_busy         ( resdMap_dpth_fifo_rd_rst_busy    )
    );
    
    
    resdMap_conv_fifo
    i0_resdMap_conv_fifo (
        .srst                ( rst                              ),
        .wr_clk              ( clk_intf                         ),
        .rd_clk              ( clk_FAS                          ),
        .din                 ( resdMap_conv_fifo_datain         ),
        .wr_en               ( resdMap_conv_fifo_wren           ),
        .rd_en               ( resdMap_conv_fifo_rden           ),
        .prog_empty_thresh   ( rm_low_watermark_cfg             ),
        .dout                ( resdMap_conv_fifo_dout           ),
        .full                (                                  ),
        .empty               ( resdMap_conv_fifo_empty          ),
        .prog_empty          ( resdMap_conv_bram_prog_empty     ),
        .wr_rst_busy         ( resdMap_conv_fifo_wr_rst_busy    ),
        .rd_rst_busy         ( resdMap_conv_fifo_rd_rst_busy    )
    );
    

    outBuf_fifo
    i0_outBuf_fifo (
        .clk                ( clk_FAS                       ),
        .srst               ( rst                           ),
        .din                ( outBuf_fifo_datain            ),
        .wr_en              ( outBuf_fifo_wren              ),
        .rd_en              ( outBuf_fifo_rden              ),
        .prog_full_thresh   ( outMapStoreFactor_cfg         ),
        .dout               ( outBuf_fifo_dout              ),
        .full               (                               ),
        .empty              (                               ),
        .prog_full          ( outBuf_fifo_prog_full         ),
        .wr_rst_busy        ( outBuf_fifo_wr_rst_busy       ),
        .rd_rst_busy        ( outBuf_fifo_rd_rst_busy       )
    );


    trans_fifo
    i0_trans_in_fifo (
        .srst           ( rst                           ),
        .wr_clk         ( clk_intf                      ),
        .rd_clk         ( clk_FAS                       ),
        .din            ( trans_in_fifo_datain          ),
        .wr_en          ( trans_in_fifo_wren            ),
        .rd_en          ( trans_in_fifo_rden            ),
        .dout           ( trans_in_fifo_dataout         ),
        .full           (                               ),
        .wr_ack         (                               ),
        .empty          ( trans_in_fifo_empty           ),
        .valid          ( trans_in_fifo_rd_valid        ),
        .wr_rst_busy    ( trans_in_fifo_wr_rst_busy     ),
        .rd_rst_busy    ( trans_in_fifo_rd_rst_busy     )
    );


    trans_fifo
    i0_trans_eg_fifo (
        .srst               ( rst                           ),
        .wr_clk             ( clk_FAS                       ),
        .rd_clk             ( clk_intf                      ),
        .din                ( trans_eg_fifo_datain          ),
        .wr_en              ( trans_eg_fifo_wren            ),
        .rd_en              ( trans_eg_fifo_rden            ),
        .dout               ( trans_eg_fifo_dataout         ),
        .full               (                               ),
        .wr_ack             (                               ),
        .empty              ( trans_eg_fifo_empty           ),
        .valid              ( trans_eg_fifo_dout_vld        ),
        .wr_rst_busy        ( trans_eg_fifo_wr_rst_busy     ),
        .rd_rst_busy        ( trans_eg_fifo_rd_rst_busy     ),
    );


    job_fetch_fifo
    i0_job_fetch_fifo (
        .srst               ( rst                           ),
        .wr_clk             ( clk_intf                      ),
        .rd_clk             ( clk_FAS                       ),
        .din                ( job_fetch_fifo_datain         ),
        .wr_en              ( job_fetch_fifo_wren           ),
        .rd_en              ( job_fetch_fifo_rden           ),
        .dout               ( job_fetch_fifo_dataout        ),
        .full               (                               ),
        .wr_ack             (                               ),
        .empty              ( job_fetch_fifo_empty          ),
        .valid              ( job_fetch_fifo_rd_valid       ),
        .wr_rst_busy        ( job_fetch_fifo_wr_rst_busy    ),
        .rd_rst_busy        ( job_fetch_fifo_rd_rst_busy    ),
    );


    genvar g4;
    generate
        for(g4 = 0; g4 < `KRNL_1X1_SIMD; g4 = g4 + 1) begin
            xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
                .C_RAM_WR_WIDTH        ( `SYS_WR_DATA_WIDTH         ),
                .C_RAM_WR_DEPTH        ( `KRNL_1X1_BRAM_WR_DEPTH    ),
                .C_RAM_RD_WIDTH        ( C_KRNL_1X1_BRAM_RD_WTH     ),
                .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"         )
            )
            iX_krnl1x1_bram (
                .wr_clk      ( clk_intf                 ),
                .wrAddr      ( krnl1x1_bram_wrAddr[g4]  ),
                .wren        ( krnl1x1_bram_wren[g4]    ),
                .din         ( krnl1x1_bram_datain      ),
                .rd_clk      ( clk_FAS                  ),
                .rdAddr      ( krnl1x1_bram_rdAddr[g4]  ),
                .rden        ( krnl1x1_bram_rden[g4]    ),
                .rd_mode     ( 1'b1                     ),
                .fifo_fwft   ( 1'b1                     ),
                .count       (                          ),
                .dout        ( krnl1x1_bram_dout[g4]    )
            );


            xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
                .C_RAM_WR_WIDTH        ( `SYS_WR_DATA_WIDTH             ),
                .C_RAM_WR_DEPTH        ( `convMap_fifo_WR_DEPTH         ),
                .C_RAM_RD_WIDTH        ( C_KRNL_1X1_BIAS_BRAM_RD_WTH    ),
                .C_RD_PORT_HIGH_PERF   ( "HIGH_PERFORMANCE"             )
            )
            iX_krnl1x1Bias_bram (
                .wr_clk      ( clk_intf                         ),
                .wrAddr      ( krnl1x1Bias_bram_wrAddr[g4]      ),
                .wren        ( krnl1x1Bias_bram_wren[g4]        ),
                .din         ( krnl1x1Bias_bram_datain          ),
                .rd_clk      ( clk_FAS                          ),
                .rdAddr      ( krnl1x1Bias_bram_rdAddr[g4]      ),
                .rden        ( krnl1x1Bias_bram_rden[g4]        ),
                .rd_mode     ( 1'b1                             ),
                .fifo_fwft   ( 1'b1                             ),
                .count        (                                 ),
                .dout        ( krnl1x1Bias_bram_dout[g4]        )
            );
            
            
            localparam C_CONV1X1_PIP_DLY = g4;
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( C_CONV1X1_PIP_DLY )
            )
            i0X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( krnl1x1_pip_start_d0_r    ),
                .data_out   ( krnl1x1_pip_start_d0[g4]  )
            );
            

            SRL_bit #(
                .C_CLOCK_CYCLES ( `VEC_ADD_LATENCY + C_CONV1X1_PIP_DLY )
            )
            i1X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( krnl1x1_pip_start_d1_r    ),
                .data_out   ( krnl1x1_pip_start_d1[g4]  )
            );
            
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( C_CONV1X1_PIP_DLY )
            )
            i2X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( krnl1x1_pip_start_d2_r    ),
                .data_out   ( krnl1x1_pip_start_d2[g4]  )
            );
            
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY + `VEC_ADD_LATENCY )
            )
            i3X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( vec_mult_din_vld[g4]      ),
                .data_out   ( vec_mult_din_vld_d[g4]    )
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
                .datain_valid       ( vec_mult_din_vld_d[g4]                        ),
                .dout               ( vec_mult_dout[g4]                             ),
                .dout_ready         ( 1'b1                                          ),
                .dout_valid         ( vec_mult_dout_vld[g4]                         )
            );


            adder_tree #(
                .C_NUINPUTS         ( `KRNL_1X1_DEPTH_SIMD     ),
                .C_INPUT_WIDTH      ( `PIXEL_WIDTH             ),
                .C_OUTPUT_WIDTH     ( `PIXEL_WIDTH             )
            )
            i0X_adder_tree (
                .clk                ( clk_FAS                       ),
                .rst                (                               ),
                .datain_ready       ( 1'b1                          ),
                .datain_valid       ( vec_mult_dout_vld[g4]         ),
                .datain             ( vec_mult_dout[g4]             ),
                .dataout_ready      ( 1'b1                          ),
                .dataout_valid      ( adder_tree_out_vld[g4]        ),
                .dataout            ( adder_tree_out[g4]            )
            );
            
            
            SRL_bit #(
                .C_CLOCK_CYCLES ( `FAS_BRAM_LATENCY + `ADD_BIAS_LATENCY )
            )
            i4X_SRL_bit (
                .clk        ( clk_FAS                   ),
                .ce         ( 1'b1                      ),
                .rst        ( rst                       ),
                .data_in    ( conv1x1_bias_vld[g4]      ),
                .data_out   ( conv1x1_bias_vld_d[g4]    )
            );


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            always@(*) begin
                vec_mult_din_vld = vec_mult_din_vld_pm || 
            end 
            
            always@(posedge clk_FAS) begin
                if(rst) begin
                    vec_mult_din_vld_pm <= 0;
                end else begin
                    vec_mult_din_vld_pm <= 0;
                    if(opcode_cfg == `OPCODE_0
                        || opcode_cfg == `OPCODE_1    
                        || opcode_cfg == `OPCODE_10
                        || opcode_cfg == `OPCODE_11)
                    begin
                        vec_mult_din_vld_pm <= 1;
                        vec_mult_din[g4] = vec_add_pm_out;
                    end else if(opcode_cfg == `OPCODE_6
                        || opcode_cfg == `OPCODE_7)
                    begin
                        vec_mult_din_vld_rm0 <= 1;
                        vec_mult_din[g4] = vec_add_rm0_out;
                    end else if(opcode_cfg == `OPCODE_4
                                || opcode_cfg == `OPCODE_5)
                    begin
                        vec_mult_din[g4] = vec_add_rm1_out;
                    end else if(opcode_cfg == `OPCODE_2
                                || opcode_cfg == `OPCODE_3
                                || opcode_cfg == `OPCODE_12
                                || opcode_cfg == `OPCODE_13
                                || opcode_cfg == `OPCODE_14)
                    begin
                        vec_mult_din[g4] = convMap_fifo_dout;
                    end
                end
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            always@(posedge clk_FAS) begin
                if(rst) begin
                    krnl1x1_bram_rden[g4] <= 0;
                end else begin
                    krnl1x1_bram_rden[g4] <=    (krnl1x1_pip_en_cfg[g4]   && krnl1x1_pip_start_d0[g4]) ? 1
                                                : (krnl1x1_pip_en_cfg[g4] && krnl1x1_pip_start_d1[g4]) ? 1
                                                : (krnl1x1_pip_en_cfg[g4] && krnl1x1_pip_start_d2[g4]) ? 1
                                                : 0;
                end
            end

            always@(posedge clk_FAS) begin
                if(rst || process_cmpl) begin
                    krnl1x1_bram_rdAddr[g4] <= 0;
                end else if(krnl1x1_bram_rden[g4]) begin
                    if((krnl1x1_bram_rdAddr[g4] == krnl1x1_bram_rdAddr_end_cfg) && krnl1x1_pip_en_cfg[g4]) begin
                        krnl1x1_bram_rdAddr[g4] <= 0;
                    end else begin
                        krnl1x1_bram_rdAddr[g4] <= krnl1x1_bram_rdAddr[g4]+ 1;
                    end
                end
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------
          
            
            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            assign krnl1x1_bram_rden_w = (krnl1x1_pip_start_d0_r || krnl1x1_bram_rden_1 || krnl1x1_bram_rden_2);
            
            always@(posedge clk_FAS) begin
                if(rst) begin
                    dpth_count[g4]              <= 0;
                    krnl_count[g4]              <= 0;
                    adder_tree_datain_valid[g4] <= 0;
                    vec_mult_din_vld[g4]        <= 0;
                end else begin
                    adder_tree_datain_valid[g4] <= 0;
                    vec_mult_din_vld[g4]        <= 0;
                    if(krnl1x1_bram_rden[g4]) begin
                        adder_tree_datain_valid[g4]     <= 1;
                        vec_mult_din_vld[g4]            <= 1;
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
                    if(adder_tree_out_vld[g4] && opcode_cfg != `OPCODE_0
                        && opcode_cfg != `OPCODE_2 && opcode_cfg == `OPCODE_4
                        && opcode_cfg != `OPCODE_6 && opcode_cfg == `OPCODE_10
                        && opcode_cfg != `OPCODE_12 && opcode_cfg == `OPCODE_14)
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
                    if(krnl1x1Bias_bram_rden[g4] && krnl_count == num_1x1_kernels_cfg) begin
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
            krnl1x1Addr_cfg                 <= 0;
            krnl1x1BiasAddr_cfg             <= 0;
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
            outMapStoreFactor_cfg           <= 0;
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
        end else begin

        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign res_dwc_fifo_rden = res_dwc_fifo_count == `OUTBUF_FIFO_DIN_FACTOR;

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
    always@(posedge clk_FAS) begin
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
                    + resdMap_dpth_bram_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm1_d) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1) begin
                vec_add_rm1_arr[vec_add_rm1_addr][i3 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    vec_add_pm_out[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    + resdMap_dpth_bram_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        // - - - - - - - - - - - - - -
        if(vector_add_rm_conv_d) begin
            for(i3 = 0; i3 < `VECTOR_ADD_SIMD; i3 = i3 + 1) begin
                vec_add_rm_conv_arr[vec_add_rm_conv_addr][i3 * `PIXEL_WIDTH +: `PIXEL_WIDTH] =
                    conv1x1_dwc_fifo_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    + resdMap_conv_bram_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
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
            if(conv1x1_dwc_fifo_rden && (opcode_cfg == `OPCODE_0 || opcode_cfg == `OPCODE_2)) begin
                vector_add_rm_conv <= 1;
            end
            // - - - - - - - - - - - - - -
            if(conv1x1_dwc_fifo_rden && (opcode_cfg == `OPCODE_1 
                                        || opcode_cfg == `OPCODE_3 
                                        || opcode_cfg == `OPCODE_5 
                                        || opcode_cfg == `OPCODE_7)) 
            begin
                vector_add_pv <= 1;
            end
            // - - - - - - - - - - - - - -
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign conv1x1_dwc_fifo_wren = |conv1x1_vld || |conv1x1_bias_vld_d;
    assign conv1x1_dwc_fifo_rden = conv1x1_dwc_fifo_count == `OUTBUF_FIFO_DIN_FACTOR;
    
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
            send_FAS_complete   <= 0;
            FAS_complete_acked  <= 0;
            last_wrt_r          <= 0;
            last_CO_recvd_r     <= 0;
            process_cmpl        <= 0;
            next_in_batch_r1    <= 0;
        end else begin
            start_FAS_ack       <= 0;
            process_cmpl        <= 0;
            last_wrt_r          <= (last_wrt)       ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)  ? 1 : last_CO_recvd_r;
            next_in_batch_r1    <= 0;
            case(state)
                ST_IDLE: begin
                    if(start_FAS) begin
                        start_FAS_ack   <= 1;
                        state           <= ST_CFG_FAS;
                    end
                end
                ST_CFG_FAS: begin
                    if(opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) begin
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
                        next_in_batch_r1    <= 1;
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
                    if(all_AWP_complete) begin
                        send_FAS_complete               <= FAS_complete_ack ? 1'b0 : (~FAS_complete_acked ? 1'b1 : send_FAS_complete);
                        FAS_complete_acked              <= FAS_complete_ack ? 1'b1 :  FAS_complete_acked;
                        if(FAS_complete_acked) begin
                            state                       <= ST_IDLE;
                            process_cmpl                <= 1;
                        end
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
            if(trans_in_fifo_rden && trans_in_fifo_dataout[`TRANS_AWP_CFG_ACK]) begin
                cfg_AWP_done        <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dataout[`TRANS_AWP_START_ACK]) begin
                start_AWP_done      <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dataout[`TRANS_RESULT_WRITE] && opcode_cfg == `OPCODE_16) begin
                res_dwc_fifo_wren   <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dataout[`TRANS_JOB_CMPL]) begin
                all_AWP_complete    <= 1;
            end else if(trans_in_fifo_rden && trans_in_fifo_dataout[`TRANS_JOB_FETCH]) begin
                job_fetch_fifo_wren <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst) begin
            trans_eg_fifo_wren      <= 0;
            trans_eg_fifo_rden      <= 0;
        end else begin
            trans_eg_fifo_wren      <= 1;
            trans_eg_fifo_rden      <= 1;        
            if(state == ST_CFG_AWP) begin
                trans_eg_fifo_wren      <= 1;
                trans_eg_fifo_datain    <= trans_eg_fifo_data;
            end
            if(state == ST_START_AWP && trans_eg_fifo_empty) begin
                trans_eg_fifo_wren      <= 1;
                trans_eg_fifo_datain    <= trans_eg_fifo_data;
            end
            if(!trans_eg_fifo_empty) begin
                trans_eg_fifo_rden      <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            sys_mem_read_req[C_CF_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_CF_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_CF_SM_RD_ID] && state == ST_CFG_AWP && cfgDataFetchCount == cfgDataFetchTotal_cfg) begin
                sys_mem_read_addr_arr[C_CF_SM_RD_ID]      <= cfg_data_addr;
                sys_mem_read_len_arr[C_CF_SM_RD_ID]       <= cfg_data_len;
                sys_mem_read_req[C_CF_SM_RD_ID]           <= sys_mem_read_req_ack[C_CF_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_CF_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_CF_SM_RD_ID]);
                sys_mem_read_req_acked[C_CF_SM_RD_ID]     <= sys_mem_read_req_ack[C_CF_SM_RD_ID] ? 1'b1 : sys_mem_read_req_acked[C_CF_SM_RD_ID];
            end
            if(sys_mem_read_cmpl[C_CF_SM_RD_ID]) begin
                cfgDataFetchCount                         <= cfgDataFetchTotal_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || process_cmpl) begin
            sys_mem_read_req[C_IM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= 0;
            inMapFetchCount                           <= 0;
            job_fetch_fifo_rden                       <= 0;
            job_fetch_data_vld                        <= 0;
        end else begin
            job_fetch_fifo_rden                       <= 0;
            if(!job_fetch_fifo_empty && !sys_mem_read_in_prog[C_IM_SM_RD_ID] && !job_fetch_data_vld) begin
                job_fetch_fifo_rden                   <= 1;
                job_fetch_data_vld                    <= 1;
            end
            if(!convMap_fifo_prog_full && job_fetch_data_vld && inMapFetchCount != inMapFetchTotal_cfg) begin
                sys_mem_read_addr_arr[C_IM_SM_RD_ID]      <= inMapAddr_cfg;
                sys_mem_read_len_arr[C_IM_SM_RD_ID]       <= im_fetch_amount_cfg;
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
            partMapFetchCount                         <= 0;
        end else begin
            if(state == ST_ACTIVE && !sys_mem_read_in_prog[C_PM_SM_RD_ID]
                && ((opcode_cfg != `OPCODE_14 && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) && partMap_fifo_prog_empty && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                sys_mem_read_addr_arr[C_PM_SM_RD_ID]      <= partMapAddr_cfg;
                sys_mem_read_len_arr[C_PM_SM_RD_ID]       <= pm_fetch_amount_cfg;
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
            prevMapFetchCount                         <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_PV_SM_RD_ID] && state == ST_ACTIVE && prevMap_fifo_prog_empty && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                sys_mem_read_addr_arr[C_PV_SM_RD_ID]      <= prevMapAddr_cfg;
                sys_mem_read_len_arr[C_PV_SM_RD_ID]       <= pv_fetch_amount_cfg;
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
            sys_mem_read_req[C_RM_SM_RD_ID]         <= 0;
            sys_mem_read_req_acked[C_RM_SM_RD_ID]   <= 0;
            resdMapFetchCount                       <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_RM_SM_RD_ID] && state == ST_ACTIVE && (resdMap_dpth_bram_prog_empty || resdMap_conv_bram_prog_empty) && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                sys_mem_read_addr_arr[C_RM_SM_RD_ID]      <=
                sys_mem_read_len_arr[C_RM_SM_RD_ID]       <= rm_fetch_amount_cfg;
                sys_mem_read_req[C_RM_SM_RD_ID]           <= sys_mem_read_req_ack[C_RM_SM_RD_ID] ? 1'b0 : (~sys_mem_read_req_acked[C_RM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_RM_SM_RD_ID]);
                sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= sys_mem_read_req_ack[C_RM_SM_RD_ID] ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
            end
            if(sys_mem_read_cmpl[C_PV_SM_RD_ID]) begin
                resdMapFetchCount  <= resdMapFetchCount + rm_fetch_amount_cfg;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i6;
    always@(*) begin
        for(i6 = 0; i6 < `KRNL_1X1_SIMD; i6 = i6 + 1) begin
            prevMap_fifo_empty_w[i5] = prevMap_fifo_empty[i5] & krnl1x1_pip_en_cfg[i5];
        end
    end
    
    assign resdMap_bram_empty       = resdMap_dpth_bram_empty && resdMap_conv_bram_empty;
    assign state_update_in_prog     = pipe_enable;

    // always@(posedge clk) begin
    //     for(i7 = 1; i7 < __; i7 = i7 + 1) begin
    //         state_update_in_prog[i7] = state_update_in_prog[i7 - 1];
    //     end
    // end

    always@(posedge clk_FAS) begin
        if(rst) begin
            pipe_enable             <= 0;
            krnl1x1_pip_start_d0_r  <= 0;
            krnl1x1_pip_start_d1_r  <= 0;
            krnl1x1_pip_start_d2_r  <= 0;
            vector_add_pm           <= 0;
            vector_add_rm0          <= 0;
            vector_add_rm1          <= 0;
            outBuf_fifo_wren_r1     <= 0;
            outBuf_fifo_wren_r2     <= 0; 
        end else begin
            pipe_enable                 <= 0;
            krnl1x1_pip_start_d0_r      <= 0;
            krnl1x1_pip_start_d1_r      <= 0;
            krnl1x1_pip_start_d2_r      <= 0;
            vector_add_pm               <= 0;
            vector_add_rm0              <= 0;
            vector_add_rm1              <= 0;
            outBuf_fifo_wren_r1         <= 0;
            outBuf_fifo_wren_r2         <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_0
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_bram_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                end
                krnl1x1_pip_start_d1_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_11)
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|prevMap_fifo_empty_w)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                end
                krnl1x1_pip_start_d1_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_14)
                && !convMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                krnl1x1_pip_start_d0_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_13)
                && !convMap_fifo_empty
                && !(|prevMap_fifo_empty_w)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                krnl1x1_pip_start_d0_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_4
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_bram_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                    vector_add_rm1          <= 1;
                end
                krnl1x1_pip_start_d2_r      <= 1;
                outBuf_fifo_wren_w3         <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_5
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_bram_empty
                && !(|prevMap_fifo_empty_w)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_pm           <= 1;
                    vector_add_rm1          <= 1;
                end
                krnl1x1_pip_start_d2_r      <= 1;
                outBuf_fifo_wren_w4         <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_6
                && !convMap_fifo_empty
                && !resdMap_bram_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_rm0          <= 1;
                end
                krnl1x1_pip_start_d1_r      <= 1;
                outBuf_fifo_wren_r2         <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_7
                && !convMap_fifo_empty
                && !resdMap_bram_empty
                && !(|prevMap_fifo_empty_w)
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                if(next_in_batch && krnl_count_r == 0) begin
                    vector_add_rm0          <= 1;
                end
                krnl1x1_pip_start_d1_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_8
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_bram_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                vector_add_rm1              <= 1;
                outBuf_fifo_wren_r2         <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg == `OPCODE_9 || opcode_cfg == `OPCODE_17)
                && !convMap_fifo_empty
                && !resdMap_bram_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_rm0              <= 1;
                outBuf_fifo_wren_r1         <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg == `OPCODE_10
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                krnl1x1_pip_start_d1_r      <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_15
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable                 <= 1;
                vector_add_pm               <= 1;
                outBuf_fifo_wren_r1         <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign krnl1x1_bram_rden_w  = (krnl1x1_pip_start_d0_r || krnl1x1_bram_rden_1 || krnl1x1_bram_rden_2);
    assign next_in_batch        = next_in_batch_r1 || next_in_batch_r0;
    
    always@(posedge clk_FAS) begin
        if(rst) begin
            dpth_count_r            <= 0;
            krnl_count_r            <= 0;
            vec_mult_din_vld        <= 0;
        end else begin
            if(krnl1x1_bram_rden_w) begin
                if(dpth_count_r == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WIDTH)) begin
                    dpth_count_r          <= 0;
                    if(krnl_count_r == (num_1x1_kernels_cfg  - 1)) begin
                        krnl_count_r      <= 0;
                        next_in_batch_r0  <= 0;
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
            resdMap_dpth_bram_rden  <= 0;
            prevMap_fifo_rden       <= 0;
        end else begin
            convMap_fifo_rden       <= 0;
            partMap_fifo_rden       <= 0;
            resdMap_dpth_bram_rden  <= 0;
            prevMap_fifo_rden       <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && pipe_enable && (opcode_cfg != `OPCODE_14 && opcode_cfg != `OPCODE_17)) begin
                convMap_fifo_rden       <= 1;
            end
            if(vector_add_pm) begin
                partMap_fifo_rden       <= 1;
            end
            if(vector_add_rm0 || vector_add_rm1) begin
                resdMap_dpth_bram_rden  <= 1;
            end
            if(vector_add_rm_conv_d) begin
                resdMap_conv_bram_rden  <= 1;
            end
            if(vector_add_pv_d) begin
                prevMap_fifo_rden       <= 1;
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


    always@(*) begin
        if(conv1x1_dwc_fifo_rden && (opcode_cfg == `OPCODE_4 || opcode_cfg == `OPCODE_6
                                    || opcode_cfg == `OPCODE_10 || opcode_cfg == `OPCODE_12))
        begin
            outBuf_fifo_wren = 1;
        end else if(outBuf_fifo_wren_rm 
                    || outBuf_fifo_wren_pv 
                    || outBuf_fifo_wren_r1_d
                    || outBuf_fifo_wren_r2_d 
                    || res_dwc_fifo_rd_vld) 
        begin
            outBuf_fifo_wren = 1;
        end else begin
            outBuf_fifo_wren = 0;
        end
    end

    always@(*) begin
        if(opcode_cfg == `OPCODE_0
            || opcode_cfg == `OPCODE_2) 
        begin
            outBuf_fifo_datain = vec_add_rm_conv_out;
        end else if(opcode_cfg == `OPCODE_1
            || opcode_cfg == `OPCODE_3
            || opcode_cfg == `OPCODE_5
            || opcode_cfg == `OPCODE_7
            || opcode_cfg == `OPCODE_11
            || opcode_cfg == `OPCODE_13)
        begin
            outBuf_fifo_datain = vec_add_pv_out;
        end else if(opcode_cfg == `OPCODE_8
                   || (opcode_cfg == `OPCODE_9
                   || opcode_cfg == `OPCODE_17))
        begin
            outBuf_fifo_datain = vec_add_rm_out;
        end else if(opcode_cfg == `OPCODE_15) begin
            outBuf_fifo_datain = vec_add_pm_out;
        end else if(opcode_cfg == `OPCODE_16) begin
            outBuf_fifo_datain = res_dwc_fifo_dout;
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
