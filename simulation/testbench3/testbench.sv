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
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
	`include "cnn_layer_accel_FAS.svh"
	`include "cnn_layer_accel_trans_fifo.svh"
	`include "cnn_layer_accel_conv1x1_pip.svh"
	`include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_QUAD.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
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


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic                                      clk_intf                 ;
    logic                                      clk_FAS                  ;
    logic                                      rst                      ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req        	;
    logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id     	;
    logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   init_read_addr       	;
    logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   init_read_len        	;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack    	;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_in_prog    	;  
    logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data       	;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld   	;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy		;
    logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl       	;
    logic                                      init_write_req       	;
    logic                                      init_write_req_id    	;
    logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr      	;
    logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len       	;
    logic                                      init_write_req_ack   	;
    logic                                      init_write_in_prog   	;
    logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_write_data      	;
    logic                                      init_write_data_vld  	;
    logic                                      init_write_data_rdy  	;
    logic                                      init_write_cmpl      	;
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
    logic                                      trans_in_fifo_din_vld	;
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
    
    
    cnn_layer_accel_FAS
    i0_cnn_layer_accel_FAS (
        .clk_intf               	( clk_intf                  ),              
        .clk_FAS                	( clk_FAS                   ),              
        .rst                    	( rst                       ),              
        // BEGIN ------------------------------------------------------------------------------------------------------------------------------------
		.init_read_req        		( init_read_req        		),
		.init_read_req_id     		( init_read_req_id     	    ),
		.init_read_addr       		( init_read_addr       	    ),
		.init_read_len        		( init_read_len        	    ),
		.init_read_req_ack    		( init_read_req_ack    	    ),
		.init_read_in_prog    		( init_read_in_prog    	    ),
		.init_read_data       		( init_read_data       	    ),
		.init_read_data_vld			( init_read_data_vld		),
		.init_read_data_rdy	  		( init_read_data_rdy	  	),
		.init_read_cmpl       		( init_read_cmpl       	    ),
		.init_write_req       		( init_write_req       	    ),
		.init_write_req_id    		( init_write_req_id    	    ),
		.init_write_addr      		( init_write_addr      	    ),
		.init_write_len       		( init_write_len       	    ),
		.init_write_req_ack   		( init_write_req_ack   	    ),
		.init_write_in_prog   		( init_write_in_prog   	    ),
		.init_write_data      		( init_write_data      	    ),
		.init_write_data_vld  		( init_write_data_vld  	    ),
		.init_write_data_rdy  		( init_write_data_rdy  	    ),
		.init_write_cmpl      		( init_write_cmpl      	    ),
		// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
		.targ_write_addr        	( targ_write_addr           ),
		.targ_write_addr_vld    	( targ_write_addr_vld       ),
		.targ_write_data        	( targ_write_data           ),
		.targ_write_ack         	( targ_write_ack            ),
		.targ_read_addr         	( targ_read_addr            ),
		.targ_read_addr_vld     	( targ_read_addr_vld        ),
		.targ_read_data         	( targ_read_data            ),
		.targ_read_ack          	( targ_read_ack             ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
        .init_usrIntr               ( init_usrIntr       		),
        .init_usrIntr_ack           ( init_usrIntr_ack          ),
        // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
        .trans_in_fifo_din_vld		( trans_in_fifo_din_vld		),
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
        rst 															= 1;
        init_read_req_ack         										= 0;
        init_read_in_prog         										= 0;
        init_read_data_vld        										= 0;
        init_read_cmpl            										= 0;
        init_write_req_ack        										= 0;
        init_write_in_prog        										= 0;
        init_write_data_rdy       										= 0;
        init_write_cmpl           										= 0;
        targ_write_addr           										= 0;
        targ_write_addr_vld       										= 0;
        targ_read_addr            										= 0;
        targ_read_addr_vld        										= 0;
        trans_in_fifo_din_vld      										= 0;
        trans_eg_fifo_dout_rdy     										= 0;
        init_usrIntr_ack          										= 0;
        // testbench.i0_cnn_layer_accel_FAS.FAS_cfg_data_len               = ;
        // testbench.i0_cnn_layer_accel_FAS.AWP_cfg_data_len               = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1Depth_cfg               = ;
        // testbench.i0_cnn_layer_accel_FAS.pixSeqCfgFetchTotal_cfg        = ;
        // testbench.i0_cnn_layer_accel_FAS.inMapFetchFactor_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.inMapFetchTotal_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl3x3FetchTotal_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl3x3BiasFetchTotal_cfg      = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1FetchTotal_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1BiasFetchTotal_cfg      = ;
        // testbench.i0_cnn_layer_accel_FAS.partMapFetchTotal_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.resdMapFetchTotal_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.outMapStoreTotal_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.outMapStoreFactor_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.prevMapFetchTotal_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.num_1x1_kernels_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.cm_high_watermark_cfg          = ;
        // testbench.i0_cnn_layer_accel_FAS.rm_low_watermark_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.pm_low_watermark_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.pv_low_watermark_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.rm_fetch_amount_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.pm_fetch_amount_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.pv_fetch_amount_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.im_fetch_amount_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1_pding_cfg              = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1_pad_bgn_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1_pad_end_cfg            = ;
        // testbench.i0_cnn_layer_accel_FAS.opcode_cfg                     = ;
        // testbench.i0_cnn_layer_accel_FAS.res_high_watermark_cfg         = ;
        // testbench.i0_cnn_layer_accel_FAS.conv1x1_pip_en_cfg             = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1_bram_rdAddr_end_cfg    = ;
        // testbench.i0_cnn_layer_accel_FAS.krnl1x1_dpth_end_cfg           = ;
        // testbench.i0_cnn_layer_accel_FAS.ob_store_amount_cfg            = ;
		#(C_PERIOD_100MHz * 10) rst                                     = 0;    // 10 cycle rst asserted is arbitrairy
		trans_eg_fifo_dout_rdy											= 1;
		
		repeat(2) @(posedge clk_intf);
		targ_write_addr      = 1;
        targ_write_addr_vld  = 1;
		@(posedge clk_intf);
		targ_write_addr_vld  = 0;
		
        forever begin
            @(posedge clk_intf);
            if(init_usrIntr) begin
				init_usrIntr_ack = 1;
                break;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    

endmodule
    