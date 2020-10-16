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
//	Global Variables
//-----------------------------------------------------------------------------------------------------------------------------------------------
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
typedef logic[15:0] acclprm_t[];
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
typedef struct {
	acclprm_t krnl1x1;
	acclprm_t krnl1x1b;
	acclprm_t convMap;
} acclprm_tup_t;
// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
typedef struct {
	int 						    krnl1x1Depth											;
	int 							pixelSeqAddr											;
	int 							partMapAddr                                             ;
	int 							resdMapAddr                                             ;
	int 							outMapAddr                                              ;
	int 							pixSeqCfgFetchTotal                                     ;
	int 							prevMapAddr                                             ;
	int 							im_fetch_amount                                         ;
	int 							inMapFetchTotal                                         ;
	int 							krnl3x3FetchTotal                                       ;
	int 							krnl3x3BiasFetchTotal                                   ;
	int 							krnl1x1FetchTotal                                       ;
	int 							krnl1x1BiasFetchTotal                                   ;
	int 							partMapFetchTotal                                       ;
	int 							resdMapFetchTotal                                       ;
	int 							outMapStoreTotal                                        ;
	int 							ob_store_amount                                         ;
	int 							prevMapFetchTotal                                       ;
	int 							num_tot_1x1_kernels                                     ;
	int 							cm_high_watermark                                       ;
	int 							rm_low_watermark                                        ;
	int 							pm_low_watermark                                        ;
	int 							pv_low_watermark                                        ;
	int 							rm_fetch_amount                                         ;
	int 							pm_fetch_amount                                         ;
	int 							pv_fetch_amount                                         ;
	logic 	[                17:0]  opcode                                                  ;
	int 							res_high_watermark                                      ;
	int 							krnl1x1_dpth_end                                        ;
	logic	[`KRNL_1X1_SIMD - 1:0]	conv1x1_pip_en                                          ;
	int 							ob_high_watermark										;
	int 							itN_num_1x1_kernels 		[`MAX_1X1_KRNL_IT - 1:0]	;
	int 							itN_krnl_1x1_addr			[`MAX_1X1_KRNL_IT - 1:0]	;
	int 							itN_krnl_1x1_fetch_amount 	[`MAX_1X1_KRNL_IT - 1:0]	;
	int								convMap_h												;
	int 							convMap_w												;
} testParams_t;


module testbench;
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
    logic [       `INIT_WR_DATA_WIDTH - 1:0]   init_write_data      	;
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
	testParams_t tp;
	initial begin
		createTest						(tp);
        rst 							= 1;
        init_read_req_ack         		= 0;
        init_read_in_prog         		= 0;
        init_read_data_vld        		= 0;
        init_read_cmpl            		= 0;
        init_write_req_ack        		= 0;
        init_write_in_prog        		= 0;
        init_write_data_rdy       		= 0;
        init_write_cmpl           		= 0;
        targ_write_addr           		= 0;
        targ_write_addr_vld       		= 0;
        targ_read_addr            		= 0;
        targ_read_addr_vld        		= 0;
        trans_in_fifo_din_vld      		= 0;
        trans_eg_fifo_dout_rdy     		= 0;
        init_usrIntr_ack          		= 0;
		#(C_PERIOD_100MHz * 10) rst		= 0;    // 10 cycle rst asserted is arbitrairy
		trans_eg_fifo_dout_rdy			= 1;
		cfgDUT							(tp);



		fork
			initTransHandle();
            waitComplete();
        join_none


		// start FAS
		repeat(2) @(posedge clk_intf);
		targ_write_addr      = 1;
        targ_write_addr_vld  = 1;
		@(posedge clk_intf);
		targ_write_addr_vld  = 0;
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
endmodule


function int ftchSzAlgn(int value, int algnm);
	return (ceil(value, algnm) * algnm);
endfunction: ftchSzAlgn


function automatic void createTest(ref testParams_t tp);
	tp.krnl1x1Depth 					= 64;
	tp.pixelSeqAddr						= 0;
	tp.partMapAddr                     	= 0;
	tp.resdMapAddr                     	= 0;
	tp.outMapAddr                      	= 0;
	tp.pixSeqCfgFetchTotal             	= 0;
	tp.prevMapAddr                     	= 0;
	tp.im_fetch_amount                 	= 0;
	tp.inMapFetchTotal                 	= 0;
	tp.krnl3x3FetchTotal               	= 0;
	tp.krnl3x3BiasFetchTotal           	= 0;
	tp.krnl1x1FetchTotal               	= 0;
	tp.krnl1x1BiasFetchTotal           	= 0;
	tp.partMapFetchTotal               	= 0;
	tp.resdMapFetchTotal               	= 0;
	tp.outMapStoreTotal                	= ;
	tp.ob_store_amount                 	= ;
	tp.prevMapFetchTotal               	= 0;
	tp.num_tot_1x1_kernels             	= 0;
	tp.cm_high_watermark               	= 0;
	tp.rm_low_watermark                	= 0;
	tp.pm_low_watermark                	= 0;
	tp.pv_low_watermark                	= 0;
	tp.rm_fetch_amount                 	= 0;
	tp.pm_fetch_amount                 	= 0;
	tp.pv_fetch_amount                 	= 0;
	tp.tp.opcode 						= `OPCODE_16;
	tp.res_high_watermark      			= 0;
	tp.krnl1x1_dpth_end               	= 0;
	tp.conv1x1_pip_en 					= 1'b0;
	tp.ob_high_watermark				= 
	tp.itN_num_1x1_kernels[0] 			= 0;
	tp.itN_num_1x1_kernels[1] 			= 0;
	tp.itN_num_1x1_kernels[2] 			= 0;
	tp.itN_num_1x1_kernels[3] 			= 0;
	tp.itN_krnl_1x1_addr[0] 			= 0;
	tp.itN_krnl_1x1_addr[1] 			= 0;
	tp.itN_krnl_1x1_addr[2] 			= 0;
	tp.itN_krnl_1x1_addr[3] 			= 0;
	tp.itN_krnl_1x1_fetch_amount[0]		= 0;
	tp.itN_krnl_1x1_fetch_amount[1]		= 0;
	tp.itN_krnl_1x1_fetch_amount[2]		= 0;
	tp.itN_krnl_1x1_fetch_amount[3] 	= 0;
endfunction: createTest


function acclprm_tup_t genAcclParamTup(testParams_t tp);
	int numkrnl1x1_val;
	int numkrnl1x1b_val;
	int krnl1x1_prm_sz;
	int krnl1x1b_prm_sz;
	acclprm_tup_t apt;

	genAcclConvMap(tp, apt);

	if(tp.num_tot_1x1_kernels > 0) begin
		genAcclKrnl1x1(tp, apt);
	end

	return apt;
endfunction: genAcclParamTup


function automatic void genAcclConvMap(testParams_t tp, ref acclprm_tup_t krnl1x1);
	int numConvMapVal;
	int convMapSz;

	numConvMapVal 	= tp.krnl1x1Depth * tp.convMap_h * tp.convMap_w;
	convMapSz 		= ftchSzAlgn(numConvMapVal, `PIX_FETCH_SZ);
	apt.convMap = genAcclParam(
		convMapSz
	);
endfunction: genAcclConvMap



function automatic void genAcclKrnl1x1(testParams_t tp, ref acclprm_tup_t apt);
	int numkrnl1x1_val;
	int numkrnl1x1b_val;
	int krnl1x1_prm_sz;
	int krnl1x1b_prm_sz;

	numkrnl1x1_val 	= tp.itN_num_1x1_kernels[0] * tp.krnl1x1Depth;
	numkrnl1x1b_val = tp.itN_num_1x1_kernels[0];
	krnl1x1_prm_sz 	= ftchSzAlgn(numkrnl1x1_val, `PIX_FETCH_SZ);
	krnl1x1b_prm_sz = ftchSzAlgn(numkrnl1x1b_val, `PIX_FETCH_SZ);
	apt.krnl1x1 = genAcclParam(
		krnl1x1_prm_sz
	);
	apt.krnl1x1b = genAcclParam(
		krnl1x1b_prm_sz
	);
endfunction: genAcclKrnl1x1


function acclprm_t genAcclParam(int acclprm_sz);
	int i;
	int arr_sz;
	acclprm_t acclprm;

	acclprm = new[acclprm_sz];
	for(i = 0; i < acclprm_sz; i = i + 1) begin
		acclprm[i] = $urandom_range(1, 16);
	end

	return acclprm;
endfunction: genAcclParam


task cfgDUT(testParams_t tp);
	testbench.i0_cnn_layer_accel_FAS.krnl1x1Depth_cfg               = tp.krnl1x1Depth;
	testbench.i0_cnn_layer_accel_FAS.pixSeqCfgFetchTotal_cfg        = ftchSzAlgn(131072, `INIT_WR_DATA_WIDTH);
	testbench.i0_cnn_layer_accel_FAS.inMapFetchTotal_cfg            = 0;
	// testbench.i0_cnn_layer_accel_FAS.krnl3x3FetchTotal_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.krnl3x3BiasFetchTotal_cfg      = ;
	// testbench.i0_cnn_layer_accel_FAS.krnl1x1FetchTotal_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.krnl1x1BiasFetchTotal_cfg      = ;
	// testbench.i0_cnn_layer_accel_FAS.partMapFetchTotal_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.resdMapFetchTotal_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.outMapStoreTotal_cfg           = ;
	// testbench.i0_cnn_layer_accel_FAS.outMapStoreFactor_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.prevMapFetchTotal_cfg          = ;
	// testbench.i0_cnn_layer_accel_FAS.num_1x1_kernels_cfg            = tp.num_1x1_kernels;
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
endtask: cfgDUT


task initTransHandle();
	forever begin
		@(posedge testbench.clk_intf);
		case(testbench.init_read_req)
			`KL_IT_RD_ID: begin

			end
			`KB_IT_RD_ID: begin

			end
			`AC_IT_RD_ID: begin

			end
			`IM_IT_RD_ID: begin

			end
			`PM_IT_RD_ID: begin

			end
			`RM_IT_RD_ID: begin

			end
			`PV_IT_RD_ID: begin

			end
		endcase
	end
endtask: initTransHandle


task waitComplete();
	forever begin
		@(posedge testbench.clk_intf);
		if(testbench.init_usrIntr) begin
			testbench.init_usrIntr_ack = 1;
			break;
		end
	end
endtask: waitComplete
