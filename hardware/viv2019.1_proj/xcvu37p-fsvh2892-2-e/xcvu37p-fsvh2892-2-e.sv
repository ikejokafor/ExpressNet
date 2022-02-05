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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module xcvu37_fsvh2892_2_e(
   input sysClk,
   input reset
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
    `include "math.svh"
    `include "cnn_layer_accel.svh"
	`include "cnn_layer_accel_FAS.svh"
    `include "cnn_layer_accel_AWP.svh"
	`include "cnn_layer_accel_trans_fifo.svh"
	`include "cnn_layer_accel_conv1x1_pip.svh"
	`include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"	
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------       
    localparam C_INIT_ID_WTH                        = `NUM_RD_CLIENTS * `INIT_ID_WTH;
    localparam C_INIT_ADDR_WTH                      = `NUM_RD_CLIENTS * `INIT_ADDR_WTH;
    localparam C_INIT_LEN_WTH                       = `NUM_RD_CLIENTS * `INIT_LEN_WTH;  
    localparam C_INIT_DATA_WTH                      = `NUM_RD_CLIENTS * `INIT_DATA_WTH;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
	localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = $clog2(`KRNL_1X1_BRAM_RD_DTH);
    localparam C_KRNL_1X1_TRAN_SZ                   = `INIT_DATA_WTH / `PIXEL_WIDTH;
    localparam C_KRNL_1X1_SIMD_M1                   = `KRNL_1X1_SIMD - 1;
    localparam C_KN1X1_BM_WR_SEL_DFT                = {{C_KRNL_1X1_SIMD_M1{1'b0}}, 1'b1};
    localparam C_KN1X1_BM_WR_SEL_END                = {1'b1, {C_KRNL_1X1_SIMD_M1{1'b0}}};
    localparam C_KN1X1B_BM_WR_SEL_DFT				= {{C_KRNL_1X1_SIMD_M1{1'b0}}, 1'b1};
    localparam C_KN1X1B_BM_WR_SEL_END				= {1'b1, {C_KRNL_1X1_SIMD_M1{1'b0}}};
	localparam C_CONV_1X1_PIP_EN_CFG_WTH            = `KRNL_1X1_SIMD * `MAX_1X1_KRNL_IT;
    localparam C_CURR_CONV1X1_IT_META_WTH           = `KRNL_1X1_SIMD;
    localparam C_CONV1X1_IT_WTH                     = $clog2(`KRNL_1X1_SIMD);	
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CONVMAP_FIFO_CT_WTH                = $clog2(`CONVMAP_FIFO_RD_DTH) + 1; 
    localparam C_PARTMAP_FIFO_CT_WTH                = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_PREVMAP_FIFO_CT_WTH                = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_RESDMAP_FIFO_CT_WTH                = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;  
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_OUTBUF_FIFO_CT_WTH                 = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    // localparam C_OUTBUF_FIFO_DIN_FACTOR             = floor(`INIT_DATA_WTH, `PIXEL_WIDTH);
    localparam C_OUTBUF_FIFO_DIN_FACTOR             = 64;    
    localparam C_CONV1X1_DWC_CT_WTH                 = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;
    localparam C_CONV1X1_DWC_DIN_PD                 = `CONV1X1_DWC_FIFO_WR_WTH - `PIXEL_WIDTH;
    localparam C_RES_DWC_FIFO_CT_WTH                = $clog2(`CONVMAP_FIFO_RD_DTH) + 1;
 	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------   
	localparam C_TRANS_IN_FIFO_WR_WTH               = `TRANS_IN_FIFO_META_WTH + `TRANS_IN_FIFO_PYLD_WTH;
    localparam C_TRANS_IN_FIFO_RD_WTH               = `TRANS_IN_FIFO_META_WTH + `TRANS_IN_FIFO_PYLD_WTH;
    localparam C_TRANS_EG_FIFO_WR_WTH               = `TRANS_EG_FIFO_META_WTH + `TRANS_EG_FIFO_PYLD_WTH;
    localparam C_TRANS_EG_FIFO_RD_WTH               = `TRANS_EG_FIFO_META_WTH + `TRANS_EG_FIFO_PYLD_WTH;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    localparam C_VEC_ADD_WIDTH                      = `VECTOR_ADD_SIMD * `PIXEL_WIDTH;
    localparam C_VEC_MULT_WIDTH                     = `VECTOR_MULT_SIMD * `PIXEL_WIDTH;	
    localparam C_VEC_SUM_ARR_SZ                     = `MAX_1X1_KRNL_DEPTH / `VECTOR_ADD_SIMD;
    localparam C_VEC_SUM_ARR_ADDR_WTH               = $clog2(C_VEC_SUM_ARR_SZ);
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
    input  logic sysClk;
    input  logic reset;
	
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                 clk_intf           ;
    logic                                 clk_FAS            ;
    logic                                 rst                ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [   `NUM_RD_CLIENTS - 1:0]     init_rd_req         ;
    logic [      C_INIT_ID_WTH - 1:0]    init_rd_req_id      ;
    logic [    C_INIT_ADDR_WTH - 1:0]    init_rd_addr        ;
    logic [     C_INIT_LEN_WTH - 1:0]    init_rd_len         ;
    logic [   `NUM_RD_CLIENTS - 1:0]      init_rd_req_ack     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [    C_INIT_DATA_WTH - 1:0]    init_rd_data        ;
    logic [    `NUM_RD_CLIENTS - 1:0]    init_rd_data_vld    ;
    logic [    `NUM_RD_CLIENTS - 1:0]    init_rd_data_rdy    ;
    logic [    `NUM_RD_CLIENTS - 1:0]    init_rd_cmpl        ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    logic [    `NUM_WR_CLIENTS - 1:0]    init_wr_req         ;
    logic [       `INIT_ID_WTH - 1:0]    init_wr_req_id      ;
    logic [     `INIT_ADDR_WTH - 1:0]    init_wr_addr        ;
    logic [      `INIT_LEN_WTH - 1:0]    init_wr_len         ;
    logic                                init_wr_req_ack     ;
    // BEGIN ---------------------------------------------------------------------------------------------------------------------------------------- 
    logic [     `INIT_DATA_WTH - 1:0]    init_wr_data        ;
    logic                                init_wr_data_vld    ;
    logic                                init_wr_data_rdy    ;
    logic                                init_wr_cmpl  	     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                targ_wr_addr        ;
    logic                                targ_wr_addr_vld    ;
    logic [`TARG_WR_DATA_WTH - 1:0]      targ_wr_data        ;
    logic                                targ_wr_ack         ;
    logic                                targ_rd_addr        ;
    logic                                targ_rd_addr_vld    ;
    logic [`TARG_RD_DATA_WTH - 1:0]      targ_rd_data        ;
    logic                                targ_rd_ack         ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                init_usrIntr        ;
    logic                                init_usrIntr_ack    ;
    
    
    
    cnn_layer_accel 
    i0_cnn_layer_accel (
        .clk_intf           ( clk_intf          ),
        .clk_FAS            ( clk_FAS           ),
        .rst                ( rst               ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .init_rd_req        ( init_rd_req       ),
        .init_rd_req_id     ( init_rd_req_id    ),
        .init_rd_addr       ( init_rd_addr      ),
        .init_rd_len        ( init_rd_len       ),
        .init_rd_req_ack    ( init_rd_req_ack   ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_rd_data       ( init_rd_data      ),
        .init_rd_data_vld   ( init_rd_data_vld  ),
        .init_rd_data_rdy   ( init_rd_data_rdy  ),
        .init_rd_cmpl       ( init_rd_cmpl      ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------  
        .init_wr_req        ( init_wr_req       ),
        .init_wr_req_id     ( init_wr_req_id    ),
        .init_wr_addr       ( init_wr_addr      ),
        .init_wr_len        ( init_wr_len       ),
        .init_wr_req_ack    ( init_wr_req_ack   ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_wr_cmpl       ( init_wr_cmpl      ),
        .init_wr_data       ( init_wr_data      ),
        .init_wr_data_vld   ( init_wr_data_vld  ),
        .init_wr_data_rdy   ( init_wr_data_rdy  ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .targ_wr_addr       ( targ_wr_addr      ),
        .targ_wr_addr_vld   ( targ_wr_addr_vld  ),
        .targ_wr_data       ( targ_wr_data      ),
        .targ_wr_ack        ( targ_wr_ack       ),
        .targ_rd_addr       ( targ_rd_addr      ),
        .targ_rd_addr_vld   ( targ_rd_addr_vld  ),
        .targ_rd_data       ( targ_rd_data      ),
        .targ_rd_ack        ( targ_rd_ack       ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .init_usrIntr       ( init_usrIntr      ),
        .init_usrIntr_ack   ( init_usrIntr_ack  )     
    );
    
endmodule