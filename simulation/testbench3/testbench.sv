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
//-----------------------------------------------------------------------------------------------------------------------------------------------
//  Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"
`include "testbench.svh"
`include "cnn_layer_accel_FAS.svh"
`include "cnn_layer_accel_trans_fifo.svh"
`include "cnn_layer_accel_conv1x1_pip.svh"
`include "cnn_layer_accel_FAS_pip_ctrl.svh"
`include "cnn_layer_accel_QUAD.svh"


//-----------------------------------------------------------------------------------------------------------------------------------------------
//    Global Variables
//-----------------------------------------------------------------------------------------------------------------------------------------------
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
typedef logic[15:0] acclprm_t[];
typedef bit [63:0] mem_bus_t;
typedef mem_bus_t mem_queue_t[$];
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
typedef struct {
    acclprm_t krnl1x1;
    acclprm_t krnl1x1b;
    acclprm_t convMap;
    acclprm_t inMap;
    acclprm_t partMap;
    acclprm_t resdMap;
    acclprm_t prevMap;
} acclprm_tup_t;
acclprm_tup_t apt;
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
typedef struct {
    int num_input_rows;
    int num_input_cols;
    int depth;
    int num_kernels;
    int stride;
    int padding;
    int kernel_size;
    bool conv_out_fmt;
    bool cascade;
    bool upsample;
    bool master_quad;
    int actv;
} AWP_cfg_tup_t;
AWP_cfg_tup_t AWPCt[];
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
typedef struct {
    int                             krnl1x1Depth                                            ;
    int                             pixelSeqAddr                                            ;
    int                             partMapAddr                                             ;
    int                             resdMapAddr                                             ;
    int                             outMapAddr                                              ;
    int                             pixSeqCfgFetchTotal                                     ;
    int                             inMapAddr                                               ;
    int                             prevMapAddr                                             ;
    int                             im_fetch_amount                                         ;
    int                             AWP_meta_Addr                                           ;
    int                             AWP_meta_data_len                                       ;
    int                             inMapFetchTotal                                         ;
    int                             krnl3x3FetchTotal                                       ;
    int                             krnl3x3BiasFetchTotal                                   ;
    int                             krnl1x1FetchTotal                                       ;
    int                             krnl1x1BiasFetchTotal                                   ;
    int                             partMapFetchTotal                                       ;
    int                             resdMapFetchTotal                                       ;
    int                             outMapStoreTotal                                        ;
    int                             prevMapFetchTotal                                       ;
    int                             num_tot_1x1_kernels                                     ;
    int                             cm_high_watermark                                       ;
    int                             rm_low_watermark                                        ;
    int                             pm_low_watermark                                        ;
    int                             pv_low_watermark                                        ;
    int                             ob_high_watermark                                       ;
    int                             rm_fetch_amount                                         ;
    int                             pm_fetch_amount                                         ;
    int                             pv_fetch_amount                                         ;
    int                             ob_store_amount                                         ;
    logic	[                17:0]	opcode                                                  ;
    int                             krnl1x1_dpth_end                                        ;
    logic	[`KRNL_1X1_SIMD - 1:0]  conv1x1_pip_en                                          ;
    int                             itN_num_1x1_kernels         [`MAX_1X1_KRNL_IT - 1:0]    ;
    int                             itN_num_act_conv1x1_pip     [`MAX_1X1_KRNL_IT - 1:0]    ;
    int                             itN_krnl_1x1_addr           [`MAX_1X1_KRNL_IT - 1:0]    ;
    int                             itN_krnl_1x1_fetch_amount	[`MAX_1X1_KRNL_IT - 1:0]    ;
    int                             convMap_d                                               ;
    int                             convMap_h                                               ;
    int                             convMap_w                                               ;
    int                             inMap_h                                                 ;
    int                             inMap_w                                                 ;
    int                             inMap_d                                                 ;
} testParams_t;
testParams_t tp;
bool model_delay = FALSE;


module testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //    Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_PERIOD_100MHz                      = 10;
    localparam C_PERIOD_400MHz                      = 2.5;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_NUM_QUAD_CFG_PKTS                  = 1;
    localparam C_INIT_REQ_ID_WTH                    = `MAX_FAS_RD_ID * `MAX_FAS_RD_ID;
    localparam C_INIT_MEM_RD_ADDR_WTH               = `MAX_FAS_RD_ID * `INIT_RD_ADDR_WIDTH;
    localparam C_INIT_MEM_RD_LEN_WTH                = `MAX_FAS_RD_ID * `INIT_RD_LEN_WIDTH;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_TRANS_IN_FIFO_WR_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    localparam C_TRANS_IN_FIFO_RD_WTH               = `TRANS_IN_FIFO_META_WIDTH + `TRANS_IN_FIFO_PYLD_WIDTH;
    parameter C_KL_IT_RD_ID                         = 0;    // mem trans ID for kernels params
	parameter C_KB_IT_RD_ID                         = 1;    // mem trans ID for kernel bias params
    parameter C_AC_IT_RD_ID                         = 2;    // mem trans ID for AWP cfg params
    parameter C_IM_IT_RD_ID                         = 3;    // mem trans ID for input map params
    parameter C_PM_IT_RD_ID                         = 4;    // mem trans ID for part maps params
    parameter C_RM_IT_RD_ID                         = 5;    // mem trans ID for resd maps params
    parameter C_PV_IT_RD_ID                         = 6;    // mem trans ID for prev maps params


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic                                      clk_intf                 ;
    logic                                      clk_FAS                  ;
    logic                                      rst                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req            ;
    logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id         ;
    logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   init_read_addr           ;
    logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   init_read_len            ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack        ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_in_prog        ;
    logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data           ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld       ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy       ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl           ;
    logic                                      init_write_req           ;
    logic                                      init_write_req_id        ;
    logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr          ;
    logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len           ;
    logic                                      init_write_req_ack       ;
    logic                                      init_write_in_prog       ;
    logic [       `INIT_WR_DATA_WIDTH - 1:0]   init_write_data          ;
    logic                                      init_write_data_vld      ;
    logic                                      init_write_data_rdy      ;
    logic                                      init_write_cmpl          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      targ_write_addr          ;
    logic                                      targ_write_addr_vld      ;
    logic [         `TARG_WR_DATA_WTH - 1:0]   targ_write_data          ;
    logic                                      targ_write_ack           ;
    logic                                      targ_read_addr           ;
    logic                                      targ_read_addr_vld       ;
    logic [         `TARG_RD_DATA_WTH - 1:0]   targ_read_data           ;
    logic                                      targ_read_ack            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      init_usrIntr             ;
    logic                                      init_usrIntr_ack         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_in_fifo_din_vld    ;
    logic                                      trans_in_fifo_din_rdy    ;
    logic [     C_TRANS_IN_FIFO_WR_WTH - 1:0]  trans_in_fifo_din        ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_eg_fifo_dout_vld   ;
    logic                                      trans_eg_fifo_dout_rdy   ;
    logic [     C_TRANS_IN_FIFO_RD_WTH - 1:0]  trans_eg_fifo_dout       ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    clock_gen #(
        .C_PERIOD( C_PERIOD_100MHz )
    )
    i0_clock_gen(
        .clk_out(clk_intf)
    );


    clock_gen #(
        .C_PERIOD( C_PERIOD_400MHz )
    )
    i1_clock_gen(
        .clk_out(clk_FAS)
    );


    cnn_layer_accel_FAS #(
        .C_KL_IT_RD_ID              ( C_KL_IT_RD_ID             ),    // mem trans ID for kernels params
        .C_KB_IT_RD_ID              ( C_KB_IT_RD_ID             ),    // mem trans ID for kernel bias params
        .C_AC_IT_RD_ID              ( C_AC_IT_RD_ID             ),    // mem trans ID for AWP cfg params
        .C_IM_IT_RD_ID              ( C_IM_IT_RD_ID             ),    // mem trans ID for input map params
        .C_PM_IT_RD_ID              ( C_PM_IT_RD_ID             ),    // mem trans ID for part maps params
        .C_RM_IT_RD_ID              ( C_RM_IT_RD_ID             ),    // mem trans ID for resd maps params
        .C_PV_IT_RD_ID              ( C_PV_IT_RD_ID             )     // mem trans ID for prev maps params
    )
    i0_cnn_layer_accel_FAS (
        .clk_intf                   ( clk_intf                  ),
        .clk_FAS                    ( clk_FAS                   ),
        .rst                        ( rst                       ),
        // BEGIN ------------------------------------------------------------------------------------------------------------------------------------
        .init_read_req              ( init_read_req             ),
        .init_read_req_id           ( init_read_req_id          ),
        .init_read_addr             ( init_read_addr            ),
        .init_read_len              ( init_read_len             ),
        .init_read_req_ack          ( init_read_req_ack         ),
        .init_read_in_prog          ( init_read_in_prog         ),
        .init_read_data             ( init_read_data            ),
        .init_read_data_vld         ( init_read_data_vld        ),
        .init_read_data_rdy         ( init_read_data_rdy        ),
        .init_read_cmpl             ( init_read_cmpl            ),
        .init_write_req             ( init_write_req            ),
        .init_write_req_id          ( init_write_req_id         ),
        .init_write_addr            ( init_write_addr           ),
        .init_write_len             ( init_write_len            ),
        .init_write_req_ack         ( init_write_req_ack		),
        .init_write_in_prog         ( init_write_in_prog        ),
        .init_write_data            ( init_write_data           ),
        .init_write_data_vld		( init_write_data_vld       ),
        .init_write_data_rdy        ( init_write_data_rdy       ),
        .init_write_cmpl            ( init_write_cmpl           ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .targ_write_addr            ( targ_write_addr           ),
        .targ_write_addr_vld        ( targ_write_addr_vld       ),
        .targ_write_data            ( targ_write_data           ),
        .targ_write_ack             ( targ_write_ack            ),
        .targ_read_addr             ( targ_read_addr            ),
        .targ_read_addr_vld         ( targ_read_addr_vld        ),
        .targ_read_data             ( targ_read_data            ),
        .targ_read_ack              ( targ_read_ack             ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .init_usrIntr               ( init_usrIntr              ),
        .init_usrIntr_ack           ( init_usrIntr_ack          ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_din_vld      ( trans_in_fifo_din_vld     ),
        .trans_in_fifo_din_rdy      ( trans_in_fifo_din_rdy     ),
        .trans_in_fifo_din          ( trans_in_fifo_din         ),
        // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
        .trans_eg_fifo_dout_vld     ( trans_eg_fifo_dout_vld    ),
        .trans_eg_fifo_dout_rdy     ( trans_eg_fifo_dout_rdy    ),
        .trans_eg_fifo_dout         ( trans_eg_fifo_dout        )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin

    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_intf) begin

    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    initial begin
        createTest();
        genAcclParamTup();
        rst                             = 1;
        init_read_req_ack               = 0;
        init_read_in_prog               = 0;
        init_read_data_vld              = 0;
        init_read_cmpl                  = 0;
        init_write_req_ack              = 0;
        init_write_in_prog              = 0;
        init_write_data_rdy             = 0;
        init_write_cmpl                 = 0;
        targ_write_addr                 = 0;
        targ_write_addr_vld             = 0;
        targ_read_addr                  = 0;
        targ_read_addr_vld              = 0;
        trans_in_fifo_din_vld           = 0;
        trans_eg_fifo_dout_rdy          = 0;
        init_usrIntr_ack                = 0;
        #(C_PERIOD_100MHz * 10) rst     = 0;    // 10 cycle rst asserted is arbitrairy
        trans_eg_fifo_dout_rdy          = 1;
        cfgDUT                          ();
        fork
            initTransHandle();
            waitComplete();
        join_none
        // start FAS
        repeat(2) @(posedge clk_intf);
        targ_write_addr      = 1;
        targ_write_addr_vld  = 1;
        @(posedge clk_intf);
        targ_write_addr      = 0;
        targ_write_addr_vld  = 0;
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
endmodule


function int szAlgn(int value, int algnm);
    return ($ceil(value / algnm) * algnm);
endfunction: szAlgn


function automatic void createTest();
    tp.convMap_d                        = 64;
    tp.convMap_h                        = 32;
    tp.convMap_w                        = 32;    
    tp.inMap_d                          = 64;
    tp.inMap_h                          = 64;
    tp.inMap_w                          = 64;     
    tp.krnl1x1Depth                     = tp.convMap_d;
    tp.AWP_meta_Addr                    = 0;
    tp.AWP_meta_data_len                = 0;
    tp.pixelSeqAddr                     = 0;
    tp.partMapAddr                      = 0;
    tp.resdMapAddr                      = 0;
    tp.outMapAddr                       = 0;
    tp.pixSeqCfgFetchTotal              = szAlgn(131072, `INIT_WR_DATA_WIDTH);
    tp.inMapAddr                        = 0;
    tp.prevMapAddr                      = 0;
    tp.inMapFetchTotal                  = 0;
    tp.krnl3x3FetchTotal                = 0;
    tp.krnl3x3BiasFetchTotal            = 0;
    tp.krnl1x1FetchTotal                = 0;
    tp.krnl1x1BiasFetchTotal            = 0;
    tp.partMapFetchTotal                = 0;
    tp.resdMapFetchTotal                = 0;
    tp.prevMapFetchTotal                = 0;
    tp.num_tot_1x1_kernels              = 0;
    tp.cm_high_watermark                = 0;
    tp.rm_low_watermark                 = 0;
    tp.pm_low_watermark                 = 0;
    tp.pv_low_watermark                 = 0;
    tp.ob_high_watermark                = 0;
    tp.rm_fetch_amount                  = 0;
    tp.pm_fetch_amount                  = 0;
    tp.pv_fetch_amount                  = 0;
    tp.im_fetch_amount                  = 0;
    tp.ob_store_amount                  = 0;
    tp.opcode                           = `OPCODE_16;
    tp.krnl1x1_dpth_end                 = 0;
    tp.conv1x1_pip_en                   = 0;
    tp.itN_num_1x1_kernels[0]           = 0;
    tp.itN_num_1x1_kernels[1]           = 0;
    tp.itN_num_1x1_kernels[2]           = 0;
    tp.itN_num_1x1_kernels[3]           = 0;
    tp.itN_num_act_conv1x1_pip[0]       = 0;
    tp.itN_num_act_conv1x1_pip[1]       = 0;
    tp.itN_num_act_conv1x1_pip[2]       = 0;
    tp.itN_num_act_conv1x1_pip[3]       = 0;
    tp.itN_krnl_1x1_addr[0]             = 0;
    tp.itN_krnl_1x1_addr[1]             = 0;
    tp.itN_krnl_1x1_addr[2]             = 0;
    tp.itN_krnl_1x1_addr[3]             = 0;
    tp.itN_krnl_1x1_fetch_amount[0]		= 0;
    tp.itN_krnl_1x1_fetch_amount[1]     = 0;
    tp.itN_krnl_1x1_fetch_amount[2]     = 0;
    tp.itN_krnl_1x1_fetch_amount[3]     = 0;
    if(tp.opcode == `OPCODE_16) begin
        tp.ob_high_watermark            = tp.convMap_d * `OB_HIGH_WATERMARK_FACTOR;
        tp.ob_store_amount              = tp.convMap_d * `OB_STORE_FACTOR;    
        tp.outMapStoreTotal             = szAlgn(tp.convMap_h * tp.convMap_w * tp.convMap_d, `NUM_PIX_PER_BUS) * `BYTES_PER_PIXEL;       
    end
endfunction: createTest


function acclprm_tup_t genAcclParamTup();
    genAcclInMap();
    genAcclConvMap();
    if(tp.num_tot_1x1_kernels > 0) begin
        genAcclKrnl1x1();
    end
    return apt;
endfunction: genAcclParamTup


function automatic void genAcclInMap();
    int numInMapVal;
    int inMapSz;

    numInMapVal     = tp.inMap_d * tp.inMap_h * tp.inMap_w;
    inMapSz         = szAlgn(numInMapVal, `NUM_PIX_PER_BUS) * `BYTES_PER_PIXEL;
    apt.inMap = genAcclParam(
        inMapSz
    );
endfunction: genAcclInMap


function automatic void genAcclConvMap();
    int numConvMapVal;
    int convMapSz;

    numConvMapVal     = tp.convMap_d * tp.convMap_h * tp.convMap_w;
    convMapSz         = szAlgn(numConvMapVal, `NUM_PIX_PER_BUS) * `BYTES_PER_PIXEL;
    apt.convMap = genAcclParam(
        convMapSz
    );
endfunction: genAcclConvMap


function automatic void genAcclKrnl1x1();
    int numkrnl1x1_val;
    int numkrnl1x1b_val;
    int krnl1x1_prm_sz;
    int krnl1x1b_prm_sz;
    numkrnl1x1_val      = tp.itN_num_1x1_kernels[0] * tp.krnl1x1Depth;
    numkrnl1x1b_val     = tp.itN_num_1x1_kernels[0];
    krnl1x1_prm_sz      = szAlgn(numkrnl1x1_val, `NUM_PIX_PER_BUS);
    krnl1x1b_prm_sz     = szAlgn(numkrnl1x1b_val, `NUM_PIX_PER_BUS);
    apt.krnl1x1 = genAcclParam(
        krnl1x1_prm_sz
    );
    apt.krnl1x1b = genAcclParam(
        krnl1x1b_prm_sz
    );
endfunction: genAcclKrnl1x1


function acclprm_t genAcclParam(int acclprm_sz);
    int i;
    acclprm_t acclprm;
    acclprm = new[acclprm_sz];
    for(i = 0; i < acclprm_sz; i = i + 1) begin
        acclprm[i] = $urandom_range(1, 16);
    end
    return acclprm;
endfunction: genAcclParam


task cfgDUT();
    testbench.i0_cnn_layer_accel_FAS.krnl1x1Depth_cfg                   = tp.krnl1x1Depth                   ;   
    testbench.i0_cnn_layer_accel_FAS.AWP_meta_Addr_cfg                  = tp.AWP_meta_Addr                  ;
    testbench.i0_cnn_layer_accel_FAS.AWP_meta_data_len_cfg              = tp.AWP_meta_data_len              ;
    testbench.i0_cnn_layer_accel_FAS.pixelSeqAddr_cfg                   = tp.pixelSeqAddr                   ;
    testbench.i0_cnn_layer_accel_FAS.partMapAddr_cfg                    = tp.partMapAddr                    ;
    testbench.i0_cnn_layer_accel_FAS.resdMapAddr_cfg                    = tp.resdMapAddr                    ;
    testbench.i0_cnn_layer_accel_FAS.outMapAddr_cfg                     = tp.outMapAddr                     ;
    testbench.i0_cnn_layer_accel_FAS.pixSeqCfgFetchTotal_cfg            = tp.pixSeqCfgFetchTotal            ;
    testbench.i0_cnn_layer_accel_FAS.inMapAddr_cfg                      = tp.inMapAddr                      ;
    testbench.i0_cnn_layer_accel_FAS.prevMapAddr_cfg                    = tp.prevMapAddr                    ;
    testbench.i0_cnn_layer_accel_FAS.inMapFetchTotal_cfg                = tp.inMapFetchTotal                ;
    testbench.i0_cnn_layer_accel_FAS.krnl3x3FetchTotal_cfg              = tp.krnl3x3FetchTotal              ;
    testbench.i0_cnn_layer_accel_FAS.krnl3x3BiasFetchTotal_cfg          = tp.krnl3x3BiasFetchTotal          ;
    testbench.i0_cnn_layer_accel_FAS.krnl1x1FetchTotal_cfg              = tp.krnl1x1FetchTotal              ;
    testbench.i0_cnn_layer_accel_FAS.krnl1x1BiasFetchTotal_cfg          = tp.krnl1x1BiasFetchTotal          ;
    testbench.i0_cnn_layer_accel_FAS.partMapFetchTotal_cfg              = tp.partMapFetchTotal              ;
    testbench.i0_cnn_layer_accel_FAS.resdMapFetchTotal_cfg              = tp.resdMapFetchTotal              ;
    testbench.i0_cnn_layer_accel_FAS.prevMapFetchTotal_cfg              = tp.prevMapFetchTotal              ;
    testbench.i0_cnn_layer_accel_FAS.num_tot_1x1_kernels_cfg            = tp.num_tot_1x1_kernels            ;
    testbench.i0_cnn_layer_accel_FAS.cm_high_watermark_cfg              = tp.cm_high_watermark              ;
    testbench.i0_cnn_layer_accel_FAS.rm_low_watermark_cfg               = tp.rm_low_watermark               ;
    testbench.i0_cnn_layer_accel_FAS.pm_low_watermark_cfg               = tp.pm_low_watermark               ;
    testbench.i0_cnn_layer_accel_FAS.pv_low_watermark_cfg               = tp.pv_low_watermark               ;
    testbench.i0_cnn_layer_accel_FAS.ob_high_watermark_cfg              = tp.ob_high_watermark              ;
    testbench.i0_cnn_layer_accel_FAS.rm_fetch_amount_cfg                = tp.rm_fetch_amount                ;
    testbench.i0_cnn_layer_accel_FAS.pm_fetch_amount_cfg                = tp.pm_fetch_amount                ;
    testbench.i0_cnn_layer_accel_FAS.pv_fetch_amount_cfg                = tp.pv_fetch_amount                ;
    testbench.i0_cnn_layer_accel_FAS.im_fetch_amount_cfg                = tp.im_fetch_amount                ;
    testbench.i0_cnn_layer_accel_FAS.ob_store_amount_cfg                = tp.ob_store_amount                ;
    testbench.i0_cnn_layer_accel_FAS.opcode_cfg                         = tp.opcode                         ;
    testbench.i0_cnn_layer_accel_FAS.krnl1x1_dpth_end_cfg               = tp.krnl1x1_dpth_end               ;
    testbench.i0_cnn_layer_accel_FAS.conv1x1_pip_en_cfg                 = tp.conv1x1_pip_en                 ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_1x1_kernels_cfg[0]         = tp.itN_num_1x1_kernels[0]         ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_1x1_kernels_cfg[1]         = tp.itN_num_1x1_kernels[1]         ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_1x1_kernels_cfg[2]         = tp.itN_num_1x1_kernels[2]         ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_1x1_kernels_cfg[3]         = tp.itN_num_1x1_kernels[3]         ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_act_conv1x1_pip_cfg[0]     = tp.itN_num_act_conv1x1_pip[0]     ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_act_conv1x1_pip_cfg[1]     = tp.itN_num_act_conv1x1_pip[1]     ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_act_conv1x1_pip_cfg[2]     = tp.itN_num_act_conv1x1_pip[2]     ;
    testbench.i0_cnn_layer_accel_FAS.itN_num_act_conv1x1_pip_cfg[3]     = tp.itN_num_act_conv1x1_pip[3]     ;
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_addr_cfg[0]           = tp.itN_krnl_1x1_addr[0]           ;
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_addr_cfg[1]           = tp.itN_krnl_1x1_addr[1]           ;
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_addr_cfg[2]           = tp.itN_krnl_1x1_addr[2]           ;
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_addr_cfg[3]           = tp.itN_krnl_1x1_addr[3]           ; 
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_fetch_amount_cfg[0]   = tp.itN_krnl_1x1_fetch_amount[0]   ;		
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_fetch_amount_cfg[1]   = tp.itN_krnl_1x1_fetch_amount[1]   ; 
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_fetch_amount_cfg[2]   = tp.itN_krnl_1x1_fetch_amount[2]   ; 
    testbench.i0_cnn_layer_accel_FAS.itN_krnl_1x1_fetch_amount_cfg[3]   = tp.itN_krnl_1x1_fetch_amount[3]   ;
endtask: cfgDUT


task initTransHandle();
    int arb;
    
    arb = 0;
    forever begin
        @(posedge testbench.clk_intf);
        case(|testbench.init_read_req)
            `KL_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.KL_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.KL_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.KL_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.KL_IT_RD_ID);
                join_none        
            end
            `KB_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.KB_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.KB_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.KB_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.KB_IT_RD_ID);
                join_none                
            end
            `AC_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.AC_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.AC_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.AC_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.AC_IT_RD_ID);
                join_none                
            end
            `IM_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.IM_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.IM_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.IM_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.IM_IT_RD_ID);
                join_none
            end
            `PM_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.PM_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.PM_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.PM_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.PM_IT_RD_ID);
                join_none                
            end
            `RM_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.RM_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.RM_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.RM_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.RM_IT_RD_ID);
                join_none
            end
            `PV_IT_RD_ID: begin
                testbench.init_read_req_ack[testbench.PV_IT_RD_ID] <= 1;
                @(posedge testbench.clk_intf);
                testbench.init_read_req_ack[testbench.PV_IT_RD_ID] <= 0;
                testbench.init_read_in_prog[testbench.PV_IT_RD_ID] <= 1;
                fork
                    rd_data_hndl(testbench.PV_IT_RD_ID);
                join_none
            end
        endcase
        if(testbench.init_write_req) begin
            fork
                wr_data_hndl();
            join_none
        end
        arb = ((arb + 1) % 8);
    end
endtask: initTransHandle


function mem_queue_t getInitRdData(int init_i);
    mem_queue_t mem_queue;
    int addr;
    int len;
    int i;
    int j;
    acclprm_t mem_arr[];
    mem_bus_t mem_bus;
    
    len  = testbench.init_read_len[init_i]; 
    addr = testbench.init_read_addr[init_i];
    case(init_i)
        testbench.KL_IT_RD_ID: begin
            mem_arr = apt.krnl1x1;
        end
        testbench.KB_IT_RD_ID: begin
            mem_arr = apt.krnl1x1b;
        end
        testbench.AC_IT_RD_ID: begin
            // mem_arr = 
        end
        testbench.IM_IT_RD_ID: begin
            mem_arr = apt.inMap;
        end
        testbench.PM_IT_RD_ID: begin
            mem_arr = apt.partMap;
        end
        testbench.RM_IT_RD_ID: begin
            mem_arr = apt.resdMap;
        end
        testbench.PV_IT_RD_ID: begin
            mem_arr = apt.prevMap;
        end
    endcase
    for(i = 0; i < len; i = i + (`BYTES_PER_PIXEL * `NUM_PIX_PER_BUS)) begin
        for(j = 0; j < `NUM_PIX_PER_BUS; j = j + 1) begin
            mem_bus[(j * `PIXEL_WIDTH) +: `PIXEL_WIDTH] = mem_arr[addr];
            addr = addr + 1;
        end
        mem_queue.push_back(mem_bus);
    end
    return mem_queue;
endfunction: getInitRdData


task rd_data_hndl(int init_i);
    mem_queue_t mem_queue;
    logic[63:0] datum;
    int len;
    int i;

    len = testbench.init_read_len;
    mem_queue = getInitRdData(init_i);
    @(posedge testbench.clk_intf);
    testbench.init_read_data[init_i] = mem_queue.pop_front();
    testbench.init_read_data_vld[init_i] = 1;
    datum = mem_queue[0];
    for(i = (`BYTES_PER_PIXEL * `NUM_PIX_PER_BUS); i < len; i = i + (`BYTES_PER_PIXEL * `NUM_PIX_PER_BUS)) begin
        @(posedge testbench.clk_intf);
        if($urandom_range(0, 1) && model_delay) begin
            testbench.init_read_data_vld[init_i]  = 0;
            rnd_delay(5);
            testbench.init_read_data[init_i]  = datum; 
            testbench.init_read_data_vld[init_i]  = 1;
        end
        wait(testbench.init_read_data_rdy[init_i]) begin
            testbench.init_read_data[init_i] = datum; 
            datum = mem_queue.pop_front();
        end
    end
    @(posedge testbench.clk_intf);
    testbench.init_read_data_vld[init_i] = 0;
    @(posedge testbench.clk_intf);
    testbench.init_read_cmpl[init_i]  = 1;
    @(posedge testbench.clk_intf);
    testbench.init_read_cmpl[init_i]  = 0;   
endtask: rd_data_hndl


task wr_data_hndl(); 
    mem_queue_t mem_queue;
    int len;
    int i;

    len = testbench.init_write_len;
    @(posedge testbench.clk_intf);
    for(i = (`BYTES_PER_PIXEL * `NUM_PIX_PER_BUS); i < len; i = i + (`BYTES_PER_PIXEL * `NUM_PIX_PER_BUS)) begin
        @(posedge testbench.clk_intf);
        if($urandom_range(0, 1) && model_delay) begin
            testbench.init_write_data_rdy  = 0;
            rnd_delay(5);
            mem_queue.push_back(testbench.init_write_data);
            testbench.init_write_data_rdy  = 1;
        end
        wait(testbench.init_write_data_vld) begin
            mem_queue.push_back(testbench.init_write_data);
        end
    end
    @(posedge testbench.clk_intf);
    testbench.init_write_data_rdy = 0;
    @(posedge testbench.clk_intf);
    testbench.init_write_cmpl  = 1;
    @(posedge testbench.clk_intf);
    testbench.init_write_cmpl  = 0;
    setInitWrData(mem_queue);
endtask: wr_data_hndl


function void setInitWrData(mem_queue_t mem_queue);
endfunction: setInitWrData


task rnd_delay(int mx_dly_amt);
    repeat($urandom_range(1, mx_dly_amt)) begin
        @(posedge testbench.clk_if);
    end
endtask: rnd_delay


task waitComplete();
    forever begin
        @(posedge testbench.clk_intf);
        if(testbench.init_usrIntr) begin
            testbench.init_usrIntr_ack = 1;
            break;
        end
    end
endtask: waitComplete
