`timescale 1ns / 1ns
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module (
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
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
    `include "cnn_layer_accel.svh"
	`include "cnn_layer_accel_FAS.svh"
	`include "cnn_layer_accel_trans_fifo.svh"
	`include "cnn_layer_accel_conv1x1_pip.svh"
	`include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"	
	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
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
    output logic                                      init_usrIntr               							;
    input  logic                                      init_usrIntr_ack           							;
	
	
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_in_fifo_din_vld      								;
    logic                                      trans_in_fifo_din_rdy      								;
    logic [     C_TRANS_IN_FIFO_WR_WTH - 1:0]  trans_in_fifo_din          								;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_eg_fifo_dout_vld     								;
    logic                                      trans_eg_fifo_dout_rdy     								;
    logic [     C_TRANS_IN_FIFO_RD_WTH - 1:0]  trans_eg_fifo_dout         								;
	
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    cnn_layer_accel_FAS #(
        .C_FAS_ID      ( 0 ),
        .C_KL_IT_RD_ID ( 0 ),    // mem trans ID for kernels params
        .C_KB_IT_RD_ID ( 1 ),    // mem trans ID for kernel bias params
        .C_AC_IT_RD_ID ( 2 ),    // mem trans ID for AWP cfg params
        .C_IM_IT_RD_ID ( 3 ),    // mem trans ID for input map params
        .C_PM_IT_RD_ID ( 4 ),    // mem trans ID for part maps params
        .C_RM_IT_RD_ID ( 5 ),    // mem trans ID for resd maps params
        .C_PV_IT_RD_ID ( 6 )     // mem trans ID for prev maps params
    ) (
        .clk_intf                    ( clk_intf  ),
        .clk_FAS                     ( clk_FAS   ),
        .rst                         ( rst       ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .init_rd_req                 ( init_rd_req     ),
        .init_rd_req_id              ( init_rd_req_id  ),
        .init_rd_addr                ( init_rd_addr    ),
        .init_rd_len                 ( init_rd_len     ),
        .init_rd_req_ack             ( init_rd_req_ack ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_rd_data                ( init_rd_data     ),
        .init_rd_data_vld            ( init_rd_data_vld ),
        .init_rd_data_rdy            ( init_rd_data_rdy ),
        .init_rd_cmpl                ( init_rd_cmpl     ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------  
        .init_wr_req                 ( init_wr_req     ),
        .init_wr_req_id              ( init_wr_req_id  ),
        .init_wr_addr                ( init_wr_addr    ),
        .init_wr_len                 ( init_wr_len     ),
        .init_wr_req_ack             ( init_wr_req_ack ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_wr_cmpl                ( init_wr_cmpl        ),
        .init_wr_data                ( init_wr_data        ),
        .init_wr_data_vld            ( init_wr_data_vld    ),
        .init_wr_data_rdy            ( init_wr_data_rdy    ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .targ_wr_addr                ( targ_wr_addr        ),
        .targ_wr_addr_vld            ( targ_wr_addr_vld    ),
        .targ_wr_data                ( targ_wr_data        ),
        .targ_wr_ack                 ( targ_wr_ack         ),
        .targ_rd_addr                ( targ_rd_addr        ),
        .targ_rd_addr_vld            ( targ_rd_addr_vld    ),
        .targ_rd_data                ( targ_rd_data        ),
        .targ_rd_ack                 ( targ_rd_ack         ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .init_usrIntr                ( init_usrIntr        ),
        .init_usrIntr_ack            ( init_usrIntr_ack    ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_din_vld       ( trans_in_fifo_din_vld  ),
        .trans_in_fifo_din_rdy       ( trans_in_fifo_din_rdy  ),
        .trans_in_fifo_din           ( trans_in_fifo_din      ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_eg_fifo_dout_vld      ( trans_eg_fifo_dout_vld  ),
        .trans_eg_fifo_dout_rdy      ( trans_eg_fifo_dout_rdy  ),
        .trans_eg_fifo_dout          ( trans_eg_fifo_dout      )
    );
    
    
    genvar g; generate for(g = 0; g < `MAX_AWPS; g = g + 1) begin
        cnn_layer_accel_awp (
            .clk_core                    ( clk_intf               ),             
            .clk_intf                    ( clk_FAS                ),
            .rst                         ( rst                    ),
            .// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
            .trans_in_fifo_din_vld       ( trans_in_fifo_din_vld  ),
            .trans_in_fifo_din_rdy       ( trans_in_fifo_din_rdy  ),
            .trans_in_fifo_din           ( trans_in_fifo_din      ),
            .// BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
            .trans_eg_fifo_dout_vld      ( trans_eg_fifo_dout_vld  ),
            .trans_eg_fifo_dout_rdy      ( trans_eg_fifo_dout_rdy  ),
            .trans_eg_fifo_dout          ( trans_eg_fifo_dout      )
        );
    end endgenerate
	
	
	// // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    // assign ce = sys_rdy;
    // always@(posedge c0_sys_clk_p or sys_rst) begin
    //     if(sys_rst) begin
    //         sys_rdy <= 0;
    //     end else if(c0_init_calib_complete && c0_ddr4_reset_n) begin
    //         sys_rdy <= 1;
    //     end
    // end
	// // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule