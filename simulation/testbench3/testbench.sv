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
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic                                      clk_intf                   ;
    logic                                      clk_FAS                    ;
    logic                                      rst                        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req              ;
    logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id           ;
    logic [     C_SYS_MEM_RD_ADDR_WTH - 1:0]   init_read_addr             ;
    logic [      C_SYS_MEM_RD_LEN_WTH - 1:0]   init_read_len              ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack          ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_in_prog          ;  
    logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data             ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld         ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy         ;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl             ;
    logic                                      init_write_req             ;
    logic                                      init_write_req_id          ;
    logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr            ;
    logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len             ;
    logic                                      init_write_req_ack         ;
    logic                                      init_write_in_prog         ;
    logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_write_data            ;
    logic                                      init_write_data_vld        ;
    logic                                      init_write_data_rdy        ;
    logic                                      init_write_cmpl            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      targ_write_addr            ;
    logic                                      targ_write_addr_vld        ;
    logic [           C_TARG_DATA_WTH - 1:0]   targ_write_data            ;
    logic                                      targ_write_ack             ;
    logic                                      targ_read_addr             ;
    logic                                      targ_read_addr_vld         ;
    logic [           C_TARG_DATA_WTH - 1:0]   targ_read_data             ;
    logic                                      targ_read_ack              ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_in_fifo_wren         ;
    logic                                      convMap_fifo_wren          ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                      init_usrIntr               ;
    logic                                      init_usrIntr_ack           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [        C_TRANS_FIFO_WR_WTH - 1:0]  trans_in_fifo_din          ;
    logic [      C_CONVMAP_FIFO_WR_WTH - 1:0]  convMap_fifo_din           ;
    // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
    logic                                      trans_eg_fifo_dout_vld     ;
    logic [        C_TRANS_FIFO_WR_WTH - 1:0]  trans_eg_fifo_dout         ;

    
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
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_intf                   ( clk_intf                  ),              
        .clk_FAS                    ( clk_FAS                   ),              
        .rst                        ( rst                       ),              
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
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
        .init_write_req_ack         ( init_write_req_ack        ),
        .init_write_in_prog         ( init_write_in_prog        ),
        .init_write_data            ( init_write_data           ),
        .init_write_data_vld        ( init_write_data_vld       ),
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
        .trans_in_fifo_wren         ( trans_in_fifo_wren        ),
        .convMap_fifo_wren          ( convMap_fifo_wren         ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_usrIntr               ( init_usrIntr              ),
        .init_usrIntr_ack           ( init_usrIntr_ack          ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_din          ( trans_in_fifo_din         ),
        .convMap_fifo_din           ( convMap_fifo_din          ),
        // BEGIN -----------------------------------------------------------------------------------------------------------------------------------------
        .trans_eg_fifo_dout_vld     ( trans_eg_fifo_dout_vld    ),
        .trans_eg_fifo_dout         ( trans_eg_fifo_dout        )
    );
 
    
    initial begin
        rst = 1;
		#(C_PERIOD_400MHz * 10) rst <= 0;    // 10 cycle rst asserted is arbitrairy
    end
    

endmodule
    