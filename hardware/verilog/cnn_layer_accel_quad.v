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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_quad  (
    clk_if                  ,
    clk_core                ,
    rst                     ,

    job_start               ,    // Asserted by main SM to request a new convolution/pool operation
    job_accept              ,    // Asserted by quad to accept the job request
    job_parameters          ,    // Parameters associated with operation being requested
    job_fetch_request       ,    // Asserted by quad to notify main SM to fetch another row of data
    job_fetch_ack           ,    // Asserted by main SM to acknowledge the row fetch request
    job_fetch_complete      ,
    job_complete            ,    // Asserted by quad to signify completion of the operation
    job_complete_ack        ,    // Asserted by main SM to acknowledge completion
    pip_primed              ,
    all_pip_primed          ,

    cascade_in_data         ,
    cascade_in_valid        ,
    cascade_in_ready        ,

    cascade_out_data        ,
    cascade_out_valid       ,
    cascade_out_ready       ,

    config_valid            ,
    config_accept           ,
    config_data             ,
    
    weight_valid            ,
    weight_ready            ,
    weight_data             ,

    result_valid            ,
    result_accept           ,
    result_data             ,
    
    pixel_valid             ,
    pixel_ready             ,
    pixel_data  
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"
    `include "awe.vh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_CLG2_ROW_BUF_BRAM_DEPTH    = clog2(`ROW_BUF_BRAM_DEPTH); 
    localparam C_PIXEL_DATAOUT_WIDTH        = `NUM_CE_PER_AWE * `PIXEL_WIDTH;
    localparam C_PIXEL_DATAIN_WIDTH         = `NUM_AWE * `PIXEL_WIDTH;    
    localparam C_NUM_CE                     = `NUM_CE_PER_AWE * `NUM_AWE;
    localparam C_PIXEL_DOUT_WIDTH           = C_NUM_CE * `PIXEL_WIDTH;
    localparam C_PFB_DOUT_WIDTH             = C_NUM_CE * `PIXEL_WIDTH;
    localparam CE_CYCLE_COUNTER_WIDTH       = `NUM_AWE * 6;
    localparam C_WHT_DOUT_WIDTH             = `WEIGHT_WIDTH * `NUM_DSP_PER_CE;
    localparam C_CE_CYCLE_CNT_WIDTH         = C_NUM_CE * 3;
    localparam C_WHT_TBL_ADDR_WIDTH         = C_NUM_CE * 4;
    localparam C_RELU_WIDTH                 = C_NUM_CE * `PIXEL_WIDTH;
    localparam C_CLG2_MAX_BRAM_3x3_KERNELS  = clog2(`MAX_BRAM_3x3_KERNELS);
    localparam C_ACTV_WIDTH                 = `PIXEL_WIDTH * 2;
    `define    ACTV_NUM_FRAC_BITS             14
    `define    ACTV_WIDTH                     16
    `define    ACTV_WIDTH_LOW                 `ACTV_NUM_FRAC_BITS
    `define    ACTV_WIDTH_HIGH                (`ACTV_WIDTH + `ACTV_WIDTH - 1)
    `define    ACTV_WIDTH_FIELD               (`ACTV_WIDTH_HIGH):(`ACTV_WIDTH_LOW)
    

    localparam ST_IDLE                      = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER        = 6'b000010;
    localparam ST_WAIT_PFB_LOAD             = 6'b000100;
    localparam ST_AWE_CE_ACTIVE             = 6'b001000;
    localparam ST_WAIT_JOB_DONE             = 6'b010000;
    localparam ST_SEND_COMPLETE             = 6'b100000;
 
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic            clk_if              ;
    input  logic            clk_core            ;
    input  logic            rst                 ;

    input  logic            job_start           ;
    output logic            job_accept          ;
    input  logic [127:0]    job_parameters      ;
    output logic            job_fetch_request   ;
    input  logic            job_fetch_ack       ;
    input  logic            job_fetch_complete  ;
    output logic            job_complete        ;
    input  logic            job_complete_ack    ;
    output logic            pip_primed          ;
    input  logic            all_pip_primed      ;
    
    input  logic            cascade_in_valid    ;
    output logic            cascade_in_ready    ;
    input  logic [15:0]     cascade_in_data    ;
    
    output logic            cascade_out_valid   ;
    input  logic            cascade_out_ready   ;
    output logic [15:0]     cascade_out_data    ;
    
    input  logic [  3:0]    config_valid        ;
    output logic [  3:0]    config_accept       ;
    input  logic [127:0]    config_data         ;
    
    input  logic            weight_valid        ;
    output logic            weight_ready        ;
    input  logic [127:0]    weight_data         ;
    
    output logic            result_valid        ;
    input  logic            result_accept       ;
    output logic [15:0]     result_data         ;

    input  logic            pixel_valid         ;
    output logic            pixel_ready         ;
    input  logic [127:0]    pixel_data          ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------      
    logic [`PIXEL_WIDTH - 1:0] pixel_data_arr[7:0];
        genvar g0; `UNPACK_ARRAY_1D(`PIXEL_WIDTH, 8, pixel_data, pixel_data_arr, g0);
    logic [`PIXEL_WIDTH - 1:0] config_data_arr[7:0];
        genvar g1; `UNPACK_ARRAY_1D(`PIXEL_WIDTH, 8, config_data, config_data_arr, g1);   
    logic [`WEIGHT_WIDTH - 1:0] weight_data_arr[7:0];
        genvar g2; `UNPACK_ARRAY_1D(`WEIGHT_WIDTH, 8, weight_data, weight_data_arr, g2); 
    logic                                       job_fetch_request_w                             ;
    logic                                       job_fetch_ack_r                                 ;
    logic                                       job_fetch_ack_w                                 ;
    logic                                       job_fetch_in_progress           	            ;
    logic                                       job_fetch_complete_w                            ;
    logic                                       job_fetch_complete_r                            ;
    logic                                       job_accept_w                    	            ;
    logic    [                            4:0]  job_accept_r                    	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic    [                            1:0]  gray_code                       	            ;
	logic    [                            1:0]  gray_code_d                       	            ;
    (* keep = "true" *)                                                                         ;
    logic    [    C_PIXEL_DATAOUT_WIDTH - 1:0]  ce0_pixel_dataout[`NUM_AWE - 1:0]	            ;
	(* keep = "true" *)                                                                         ;
    logic    [    C_PIXEL_DATAOUT_WIDTH - 1:0]  ce1_pixel_dataout[`NUM_AWE - 1:0]	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic    [             `PIXEL_WIDTH - 1:0]  ce0_pixel_datain[`NUM_AWE - 1:0]	            ;
    logic    [             `PIXEL_WIDTH - 1:0]  ce1_pixel_datain[`NUM_AWE - 1:0]	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic                                       pfb_wren                        	            ;
    logic                                       pfb_rden                        	            ;
    logic    [             `PIXEL_WIDTH - 1:0]  pfb_dataout[C_NUM_CE - 1:0]     	            ;
    logic    [             `PIXEL_WIDTH - 1:0]  pfb_datain[C_NUM_CE - 1:0]     	                ;
    logic                                       cncl_fetch_req[C_NUM_CE - 1:0]                  ;   
    logic    [             `PIXEL_WIDTH - 1:0]  pixel_data_r[C_NUM_CE - 1:0]                    ;
    logic    [                 C_NUM_CE - 1:0]  ce_execute                       	            ;
    logic    [                            2:0]  ce_cycle_counter[C_NUM_CE - 1:0] 	            ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  input_row                        	            ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  input_col                        	            ;   
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 2:0]  row_matric_wrAddr                	            ;
    genvar                                      i                                	            ;
    genvar                                      j                                	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic    [                            9:0]  pfb_full_count_cfg                              ;
	(* mark_debug = "true" *)                                                                   ;
	(* mark_debug = "true" *)                                                                   ;
	(* mark_debug = "true" *)                                                                   ;
    logic    [                            6:0]  stride_cfg    		                            ;
    logic                                       conv_out_fmt_cfg                                ;
	logic    [                            4:0]  dsp_kernel_size_cfg    		 		            ;
    logic    [                            4:0]  padding_cfg                                     ;
    logic    [                            9:0]  num_output_rows_cfg                             ;
    logic    [                            9:0]  num_output_cols_cfg                             ;
    logic    [                           11:0]  pix_seq_data_full_count_cfg                     ;
    logic                                       upsample_cfg                                    ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  num_expd_input_cols_cfg                         ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  num_expd_input_rows_cfg                         ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_start_cfg                        ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_start_cfg                        ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_col_end_cfg                          ;
    logic    [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]  crpd_input_row_end_cfg                          ;
    logic    [C_CLG2_MAX_BRAM_3x3_KERNELS - 1:0]  num_kernels_cfg                               ;
    logic                                       master_quad_cfg                                 ;
    logic                                       cascade_cfg                                     ;

    logic                                       pix_seq_bram_rden               	            ;
    logic    [                            8:0]  pix_seq_bram_wrAddr             	            ;
    logic    [                           11:0]  pix_seq_bram_rdAddr             	            ;
    logic    [                           15:0]  pix_seq_bram_dout               	            ;
    logic                                       pix_seq_bram_wren                               ;

    logic                                       kernel_config_valid             	            ;
    logic                                       config_mode                     	 	        ;

    logic   [                            2:0]   cycle_counter                   	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic   [                 `NUM_AWE - 1:0]   ce0_pixel_dataout_valid         	            ;
	(* mark_debug = "true" *)                                                                   ;
    logic   [                 `NUM_AWE - 1:0]   ce1_pixel_dataout_valid         	            ;

    logic   [                 C_NUM_CE - 1:0]   next_kernel                     	            ;
	logic   [                 C_NUM_CE - 1:0]   move_one_row_down              	                ;
	(* mark_debug = "true" *)                                                                   ;
    logic   [                 C_NUM_CE - 1:0]   last_kernel                     	            ;
    logic                                       awe_last_kernel                                 ;
    logic                                       ctrl_last_kernel                                ;

    logic   [                            5:0]   state                           	            ;

    logic   [                            3:0]   wht_seq_addr0                                   ;
    logic   [                            3:0]   wht_seq_addr1                                   ;
    logic   [         C_WHT_DOUT_WIDTH - 1:0]   ce_wht_table_dout[C_NUM_CE - 1:0]               ;
    logic   [                 C_NUM_CE - 1:0]   ce_wht_table_dout_valid                         ;
    logic                                       wht_config_wren                                 ;
    logic   [             C_ACTV_WIDTH - 1:0]   actv_out[C_NUM_CE - 1:0]                        ;
    logic                                       actv_cfg                                        ;
    integer                                     idx                                             ;
    integer                                     idx0                                            ;
    logic                                       pipeline_flushed                                ;
	(* mark_debug = "true" *)                                                                   ;
	logic                                       wht_sequence_selector				            ;

	logic  								        awe_cascade_dataout_valid[`NUM_AWE - 1:0]	    ;
	logic                                	    awe_cascade_carryout[`NUM_AWE - 1:0]            ;
	logic     [          C_P_OUTPUT_WIDTH-1:0]  awe_cascade_dataout	[`NUM_AWE - 1:0]	        ;
	logic  								        awe_dataout_valid[`NUM_AWE - 1:0]			    ;
	logic                                	    awe_carryout[`NUM_AWE - 1:0]        		    ;
	logic     [          C_P_OUTPUT_WIDTH-1:0]  awe_dataout	[`NUM_AWE - 1:0]	    	        ;
    logic                                       next_state_tran                                 ;
    logic                                       next_row                                        ;
    logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]     output_row                                      ;
    logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]     output_col                                      ;
    logic [C_CLG2_ROW_BUF_BRAM_DEPTH - 1:0]     output_depth                                    ;
    logic                                       result_valid_w                                  ;
    logic [             `PIXEL_WIDTH - 1:0]     result_data_w                                   ;
    

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    pixel_sequence_data_bram
    i0_pixel_sequence_data_bram (
        .clka     ( clk_if                  ),
        .wea      ( pix_seq_bram_wren       ),
        .addra    ( pix_seq_bram_wrAddr     ),    
        .dina     ( config_data             ),
        .clkb     ( clk_core                ),
        .enb      ( pix_seq_bram_rden       ),
        .addrb    ( pix_seq_bram_rdAddr     ),
        .doutb    ( pix_seq_bram_dout       )
    );
    

    cnn_layer_accel_weight_sequence_table0
    i0_cnn_layer_accel_weight_sequence_table0 (
        .clk                ( clk_core              ),
        .rst                ( rst                   ),
        .gray_code          ( gray_code             ),
		.sequence_selector  ( wht_sequence_selector ), 
        .seq_data_addr      ( cycle_counter         ),
        .wht_data_addr      ( wht_seq_addr0         )
    );

    
    cnn_layer_accel_weight_sequence_table1
    i0_cnn_layer_accel_weight_sequence_table1 (
        .clk                ( clk_core              ),
        .rst                ( rst                   ),
        .gray_code          ( gray_code             ),
		.sequence_selector  ( wht_sequence_selector ),
        .seq_data_addr      ( cycle_counter         ),
        .wht_data_addr      ( wht_seq_addr1         )
    );
    
    
    // synch with clk_if
    SRL_bit #(
        .C_CLOCK_CYCLES( 1 )
    ) 
    i0_SRL_bit (
        .clk        ( clk_core          ),
        .rst        ( rst               ),
        .ce         ( 1'b1              ),
        .data_in    ( result_valid_w    ),
        .data_out   ( result_valid      )
    );
    
    
    // synch with clk_if
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1            ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH )
    ) 
    i0_SRL_bus (
        .clk        ( clk_core          ),
        .ce         ( 1'b1              ),
        .rst        ( rst               ),
        .data_in    ( result_data_w     ),
        .data_out   ( result_data       )
    );

    
    generate
        for(i = 0; i < `NUM_AWE; i = i + 1) begin: AWE
            for(j = 0; j < `NUM_CE_PER_AWE; j = j + 1) begin: AWE_BUF_WHT

                cnn_layer_accel_prefetch_buffer
                i0_cnn_layer_accel_prefetch_buffer (
                    .wr_clk                   ( clk_if                                    ),
                    .rd_clk                   ( clk_core                                  ),
                    .rst                      ( rst                                       ),
                    .din                      ( pixel_data_arr[i * `NUM_CE_PER_AWE + j]   ),
                    .wr_en                    ( pfb_wren                                  ),
                    .rd_en                    ( pfb_rden                                  ),
                    .dout                     ( pfb_dataout[i * `NUM_CE_PER_AWE + j]      ),
                    .padding                  ( padding_cfg                               ),
                    .upsample                 ( upsample_cfg                              ),
                    .input_col                ( input_col                                 ),
                    .input_row                ( input_row                                 ),
                    .crpd_input_col_start     ( crpd_input_col_start_cfg                  ),
                    .crpd_input_row_start     ( crpd_input_row_start_cfg                  ),
                    .crpd_input_col_end       ( crpd_input_col_end_cfg                    ),
                    .crpd_input_row_end       ( crpd_input_row_end_cfg                    ),
                    .job_fetch_ack            ( job_fetch_ack                             ),
                    .job_complete_ack         ( job_complete_ack                          ),
                    .rst_addr                 ( next_state_tran                           ),
                    .cncl_fetch_req           ( cncl_fetch_req[i * `NUM_CE_PER_AWE + j]   ),
                    .next_row                 ( next_row                                  ),
                    .state                    ( state                                     )
                );
                

                cnn_layer_accel_weight_table_top #(
                    .C_CE_WHT_SEQ_ADDR_DELAY   ( ((i * `NUM_CE_PER_AWE + j) + 3) )
                )
                i0_cnn_layer_accel_weight_table_top (
                    .clk                        ( clk_core                                          ),
                    .rst                        ( rst                                               ),
                    .config_mode                ( config_mode                                       ),
                    .job_accept                 ( job_accept_w                                      ),
                    .next_kernel                ( next_kernel[i * `NUM_CE_PER_AWE + j]              ),
					.last_kernel                ( last_kernel[i * `NUM_CE_PER_AWE + j]              ),
                    .kernel_config_valid        ( config_valid[1]                                   ),
                    .config_data                ( config_data_arr[i * `NUM_CE_PER_AWE + j]          ), 
                    .wht_config_wren            ( wht_config_wren                                   ),
                    .wht_config_data            ( weight_data_arr[i * `NUM_CE_PER_AWE + j]          ),
                    .wht_seq_addr0              ( wht_seq_addr0                                     ),
                    .wht_seq_addr1              ( wht_seq_addr1                                     ),
                    .ce_execute                 ( ce_execute[i * `NUM_CE_PER_AWE + j]               ),
                    .wht_table_dout             ( ce_wht_table_dout[i * `NUM_CE_PER_AWE + j]        ),
                    .wht_table_dout_valid       ( ce_wht_table_dout_valid[i * `NUM_CE_PER_AWE + j]  ),
                    .conv_out_fmt               ( conv_out_fmt_cfg                                  ),
                    .num_kernels                ( num_kernels_cfg                                   )
                ); 
                
                // assign actv_out[i * `NUM_CE_PER_AWE + j] = pfb_dataout[i * `NUM_CE_PER_AWE + j][`PIXEL_WIDTH - 1] ? pfb_dataout[i * `NUM_CE_PER_AWE + j] * 16'h0666 : pfb_dataout[i * `NUM_CE_PER_AWE + j];
                assign actv_out[i * `NUM_CE_PER_AWE + j] = 0;
            end

            
            cnn_layer_accel_awe_rowbuffers #(
                .C_SEQ_DATAIN_DELAY             ( (i * 2)                          ),
                .C_CE0_ROW_MATRIC_DELAY         ( (i * `NUM_CE_PER_AWE + 3/*3*/)   ),      
                .C_CE1_ROW_MATRIC_DELAY         ( (i * `NUM_CE_PER_AWE + 4/*4*/)   ),
                .C_CE0_ROW_MAT_WR_ADDR_DELAY    ( (i * `NUM_CE_PER_AWE + 3/*4*/)   ),
                .C_CE1_ROW_MAT_WR_ADDR_DELAY    ( (i * `NUM_CE_PER_AWE + 4/*5*/)   ),
                .C_CE0_ROW_MAT_PX_DIN_DELAY     ( (i * `NUM_CE_PER_AWE + 2)        ), 
                .C_CE1_ROW_MAT_PX_DIN_DELAY     ( (i * `NUM_CE_PER_AWE + 3)        )       
            ) 
            i0_cnn_layer_accel_awe_rowbuffers (
                .clk                        ( clk_core                                              ),
                .rst                        ( rst                                                   ),
                .input_row                  ( input_row                                             ),
                .input_col                  ( input_col                                             ),
                .num_expd_input_cols        ( num_expd_input_cols_cfg                               ),
                .state                      ( state                                                 ),
                .gray_code                  ( gray_code                                             ),
                .pix_seq_datain             ( pix_seq_bram_dout                                     ),     
                .pfb_rden                   ( pfb_rden                                              ),
                .last_kernel                ( last_kernel[C_NUM_CE - 1]                             ),
                .row_matric                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_MATRIC_FIELD]     ),
				.row_rename                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_RENAME_FIELD]     ),
                .ce0_pixel_datain           ( ce0_pixel_datain[i]                                   ),
                .ce1_pixel_datain           ( ce1_pixel_datain[i]                                   ),
                .ce0_execute                ( ce_execute[i * `NUM_CE_PER_AWE + 0]                   ),
                .ce1_execute                ( ce_execute[i * `NUM_CE_PER_AWE + 1]                   ),
                .ce0_pixel_dataout          ( ce0_pixel_dataout[i]                                  ),
                .ce1_pixel_dataout          ( ce1_pixel_dataout[i]                                  ),
                .ce0_cycle_counter          ( ce_cycle_counter[i * `NUM_CE_PER_AWE + 0]             ),
                .ce1_cycle_counter          ( ce_cycle_counter[i * `NUM_CE_PER_AWE + 1]             ),                      
                .row_matric_wrAddr          ( row_matric_wrAddr                                     ),
				.ce0_move_one_row_down      ( move_one_row_down[i * `NUM_CE_PER_AWE + 0]            ),
				.ce1_move_one_row_down      ( move_one_row_down[i * `NUM_CE_PER_AWE + 1]            ),
                .ce0_pixel_dataout_valid    ( ce0_pixel_dataout_valid[i]                            ),
                .ce1_pixel_dataout_valid    ( ce1_pixel_dataout_valid[i]                            ),
                .rst_addr                   ( next_state_tran                                       ),
                .conv_out_fmt               ( conv_out_fmt_cfg                                      ),
                .num_kernels                ( num_kernels_cfg                                       )
`ifdef SIMULATION
                ,
                .ce0_last_kernel            ( last_kernel[i * `NUM_CE_PER_AWE + 0]                  ),
                .ce1_last_kernel            ( last_kernel[i * `NUM_CE_PER_AWE + 1]                  )
`endif
            );
			
            
			if (i == 0 ) begin: AWE_DSP
				cnn_layer_accel_awe_dsps #(
					.C_DATAIN_DELAY				(	(i * 2)							)
				)
				i0_cnn_layer_accel_awe_dsps (	
					.rst						( rst													    	),
					.clk						( clk_if														), 
					.clk_5x					    ( clk_core														),
					.new_map				    ( job_accept_w													),
					.kernal_window_size			( dsp_kernel_size_cfg    								        ),
					.mode						( 2'b00													        ),	
					.cascade_datain			    ( 0  															),    
					.cascade_carryin			( 1'b0 															),
					.cascade_datain_valid	    ( 0 															),
					.ce0_pixel_valid		    ( ce0_pixel_dataout_valid[i]                                    ),
					.ce0_pixel_datain		    ( ce0_pixel_dataout[i]											),
					.ce1_pixel_valid	    	( ce1_pixel_dataout_valid[i]									),
					.ce1_pixel_datain 			( ce1_pixel_dataout[i]											),
					.ce0_weight_valid			( ce_wht_table_dout_valid[i * `NUM_CE_PER_AWE + 0]				), 
					.ce0_weight_datain		    ( ce_wht_table_dout[i * `NUM_CE_PER_AWE + 0]					),
					.ce1_weight_valid			( ce_wht_table_dout_valid[i * `NUM_CE_PER_AWE + 1]				), 
					.ce1_weight_datain		    ( ce_wht_table_dout[i * `NUM_CE_PER_AWE + 1]					),
					.dataout_valid				( awe_dataout_valid[i]											),
					.dataout_p					( awe_dataout[i]												),
					.dataout_c					( awe_carryout[i]		 										),
					.cascade_dataout			( awe_cascade_dataout[i]										),
					.cascade_carryout			( awe_cascade_carryout[i]										),
					.cascade_dataout_valid		( awe_cascade_dataout_valid[i]									)
				);
			end else begin: AWE_DSP 
				cnn_layer_accel_awe_dsps #(
					.C_DATAIN_DELAY				(	(i * 2)							)
				)
				i0_cnn_layer_accel_awe_dsps (	
					.rst						( rst													    	),
					.clk						( clk_if														), 
					.clk_5x					    ( clk_core														),
					.new_map				    ( job_accept_w													),
					.kernal_window_size			( dsp_kernel_size_cfg									        ),
					.mode						( 2'b00													        ),	
					.cascade_datain			    ( awe_cascade_dataout[i - 1]          				            ),    
					.cascade_carryin			( awe_cascade_carryout[i - 1]       							),
					.cascade_datain_valid	    ( awe_cascade_dataout_valid[i - 1]  	                		),
					.ce0_pixel_valid		    ( ce0_pixel_dataout_valid[i]                                    ),
					.ce0_pixel_datain		    ( ce0_pixel_dataout[i]											),
					.ce1_pixel_valid	    	( ce1_pixel_dataout_valid[i]									),
					.ce1_pixel_datain 			( ce1_pixel_dataout[i]											),
					.ce0_weight_valid			( ce_wht_table_dout_valid[i * `NUM_CE_PER_AWE + 0]				), 
					.ce0_weight_datain		    ( ce_wht_table_dout[i * `NUM_CE_PER_AWE + 0]					),
					.ce1_weight_valid			( ce_wht_table_dout_valid[i * `NUM_CE_PER_AWE + 1]				), 
					.ce1_weight_datain		    ( ce_wht_table_dout[i * `NUM_CE_PER_AWE + 1]					),
					.dataout_valid				( awe_dataout_valid[i]											),
					.dataout_p					( awe_dataout[i]												),
					.dataout_c					( awe_carryout[i]		 										),
					.cascade_dataout			( awe_cascade_dataout[i]										),
					.cascade_carryout			( awe_cascade_carryout[i]										),
					.cascade_dataout_valid		( awe_cascade_dataout_valid[i]									)
				);
			end	
            
            // assign ce0_pixel_datain[i] = (actv_cfg) ? actv_out[i * `NUM_CE_PER_AWE + 0][(`ACTV_FIELD - 1): C_ACTV_WIDTH] : pfb_dataout[i * `NUM_CE_PER_AWE + 0];
            // assign ce1_pixel_datain[i] = (actv_cfg) ? actv_out[i * `NUM_CE_PER_AWE + 1][(`ACTV_FIELD - 1): C_ACTV_WIDTH] : pfb_dataout[i * `NUM_CE_PER_AWE + 1];
            assign ce0_pixel_datain[i] = (actv_cfg) ? actv_out[i * `NUM_CE_PER_AWE + 0] : pfb_dataout[i * `NUM_CE_PER_AWE + 0];
            assign ce1_pixel_datain[i] = (actv_cfg) ? actv_out[i * `NUM_CE_PER_AWE + 0] : pfb_dataout[i * `NUM_CE_PER_AWE + 1];
            
        end
		
		assign cascade_out_data = awe_cascade_dataout[`NUM_AWE - 1];
		assign cascade_out_valid = awe_cascade_dataout_valid[`NUM_AWE - 1];
		
		assign result_valid_w = awe_dataout_valid[`NUM_AWE - 1] ;
		assign result_data_w  = awe_dataout      [`NUM_AWE - 1][15:0] ;
    endgenerate
    
    
    cnn_layer_accel_quad_bram_ctrl
    i0_cnn_layer_accel_quad_bram_ctrl (
        .clk                        ( clk_core                                              ),
        .rst                        ( rst                                                   ),
        .job_start                  ( job_start                                             ),
        .job_accept                 ( job_accept_w                                          ),
        .job_fetch_request          ( job_fetch_request_w                                   ),
        .job_fetch_in_progress      ( job_fetch_in_progress                                 ),
        .job_fetch_ack              ( job_fetch_ack_w                                       ),
        .job_fetch_complete         ( job_fetch_complete_w                                  ),
        .job_complete               ( job_complete                                          ),
        .job_complete_ack           ( job_complete_ack                                      ),
        .state                      ( state                                                 ),
        .input_row                  ( input_row                                             ),
        .input_col                  ( input_col                                             ),
        .num_expd_input_cols        ( num_expd_input_cols_cfg                               ),
        .num_expd_input_rows        ( num_expd_input_rows_cfg                               ),
        .num_output_rows            ( num_output_rows_cfg                                   ),
        .num_output_cols            ( num_output_cols_cfg                                   ),        
		.stride                     ( stride_cfg                                            ),
		.conv_out_fmt               ( conv_out_fmt_cfg							            ),
        .row_matric                 ( pix_seq_bram_dout[`PIX_SEQ_DATA_ROW_MATRIC_FIELD]     ),
        .gray_code                  ( gray_code                                             ),
        .pfb_rden                   ( pfb_rden                                              ),
        .pfb_full_count             ( pfb_full_count_cfg                                    ),
        .row_matric_wrAddr          ( row_matric_wrAddr                                     ),
        .ce_execute                 ( ce_execute                                            ),
        .last_awe_ce1_cyc_counter   ( ce_cycle_counter[C_NUM_CE - 1]                        ),
        .cycle_counter              ( cycle_counter                                         ),
        .pix_seq_bram_rden          ( pix_seq_bram_rden                                     ),
        .pix_seq_bram_rdAddr        ( pix_seq_bram_rdAddr                                   ),
        .pix_seq_data_full_count    ( pix_seq_data_full_count_cfg                           ),
        .next_kernel                ( next_kernel                                           ),
		.move_one_row_down          ( move_one_row_down                                     ),
        .last_awe_last_kernel       ( last_kernel[C_NUM_CE - 1]                             ),
        .ctrl_last_kernel           ( ctrl_last_kernel                                      ),
		.pipeline_flushed           ( pipeline_flushed                                      ),
        .wht_sequence_selector      ( wht_sequence_selector                                 ),
        .next_state_tran            ( next_state_tran                                       ),
        .next_row                   ( next_row                                              ),
        .num_kernels                ( num_kernels_cfg                                       ),
        .master_quad                ( master_quad_cfg                                       ),
        .cascade_in_valid           ( cascade_in_valid                                      ),
        .cascade_in_ready           ( cascade_in_ready                                      ),
        .pip_primed                 ( pip_primed                                            ),
        .all_pip_primed             ( all_pip_primed                                        ),
        .cascade                    ( cascade_cfg                                           )
    );
    
    
    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------      
    assign pipeline_flushed = output_row == num_output_rows_cfg || state == ST_IDLE;
    assign awe_last_kernel = (conv_out_fmt_cfg == `CONV_OUT_FMT0) ? last_kernel[C_NUM_CE - 1] : (conv_out_fmt_cfg == `CONV_OUT_FMT1) ? ctrl_last_kernel : 0;
    
    always@(posedge clk_core) begin
        if(rst) begin
            output_row      <= 0;
            output_col      <= 0;
            output_depth    <= 0;
        end else begin
            if(job_accept || job_complete_ack) begin
                output_row      <= 0;
                output_col      <= 0;
                output_depth    <= 0;
            end
            if(conv_out_fmt_cfg == `CONV_OUT_FMT0) begin
                if(result_valid) begin
                    if(output_col == (num_output_cols_cfg - 1)) begin
                        output_col <= 0;
                        if(output_depth == num_kernels_cfg) begin
                            output_depth <= 0;
                            output_row   <= output_row + 1;
                        end else begin
                            output_depth  <= output_depth + 1;
                        end
                    end else begin
                        output_col <= output_col + 1;
                    end
                end
            end else if(conv_out_fmt_cfg == `CONV_OUT_FMT1) begin
                if(result_valid) begin
                    if(output_depth == num_kernels_cfg) begin
                        output_depth <= 0;
                        if(output_col == (num_output_cols_cfg - 1)) begin
                            output_col  <= 0;
                            output_row  <= output_row + 1;
                        end else begin
                            output_col  <= output_col + 1;
                        end
                    end else begin
                        output_depth <= output_depth + 1;
                    end
                end        
            end
        end    
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------
   

    // BEGIN Logic ----------------------------------------------------------------------------------------------------------------------------------      
    assign job_fetch_request = job_fetch_request_w && !cncl_fetch_req[0];
    assign job_fetch_ack_w = job_fetch_ack_r || job_fetch_ack;
    assign job_fetch_complete_w = job_fetch_complete || job_fetch_complete_r;
    
    always@(posedge clk_if) begin
        if(rst) begin
            job_fetch_complete_r    <= 0;
            job_fetch_ack_r         <= 0;
        end else begin
            job_fetch_complete_r    <= 0;
            job_fetch_ack_r         <= 0;
            if((padding_cfg || upsample_cfg) && job_fetch_request_w && cncl_fetch_req[0]) begin
                job_fetch_ack_r <= 1;
            end
            if(job_fetch_in_progress && cncl_fetch_req[0]) begin
                job_fetch_complete_r <= 1;
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------     
    assign job_accept = |job_accept_r;

    always@(*) begin
        job_accept_r[0] = job_accept_w;
    end
    
    always@(posedge clk_core) begin
        if(rst) begin
            actv_cfg <= 0;
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= 0;
            end              
        end else begin
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= job_accept_r[idx - 1];
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------  

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign wht_config_wren  = weight_ready && weight_valid;
    assign weight_ready     = weight_valid;
    assign config_mode      = state[0];
    assign config_accept[2] = 0;
    assign config_accept[3] = 0;
    
    always@(posedge clk_core) begin
        if(rst) begin
            config_accept[1] <= 0;
        end else begin
            config_accept[1] <= 0;
            if(config_valid[1]) begin
                config_accept[1] <= 1;
            end
        end
    end
    // END Logic ------------------------------------------------------------------------------------------------------------------------------------

  
    // BEGIN Network Output Data Logic --------------------------------------------------------------------------------------------------------------
    assign pixel_ready          = job_fetch_in_progress;
    assign pfb_wren             = pixel_valid && pixel_ready;
    assign config_accept[0]     = config_valid[0];
    assign pix_seq_bram_wren    = config_accept[0] && config_valid[0];

    always@(posedge clk_if) begin
        if(rst) begin
`ifndef VERIFICATION        
            num_expd_input_cols_cfg         <= 0;
            num_expd_input_rows_cfg         <= 0;
            pfb_full_count_cfg              <= 0;
            stride_cfg                      <= 0;
            padding_cfg                     <= 0;
            num_kernels_cfg                 <= 0;
            num_output_rows_cfg             <= 0;
            num_output_cols_cfg             <= 0;
            pix_seq_data_full_count_cfg     <= 0;
            upsample_cfg                    <= 0;
            crpd_input_col_start_cfg        <= 0;
            crpd_input_row_start_cfg        <= 0;
            crpd_input_col_end_cfg          <= 0;
            crpd_input_row_end_cfg          <= 0;
            conv_out_fmt_cfg                <= 0;
            master_quad_cfg                 <= 0;
            cascade_cfg                     <= 0;
`endif            
            dsp_kernel_size_cfg             <= 3;
            pix_seq_bram_wrAddr             <= 0;
        end else begin
            if(pix_seq_bram_wren) begin
                pix_seq_bram_wrAddr <= pix_seq_bram_wrAddr + 1;
            end            
        end
    end
    // END Network Output Data Logic ----------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
            ST_IDLE:                    state_s = "ST_IDLE";              
            ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
            ST_WAIT_PFB_LOAD:           state_s = "ST_WAIT_PFB_LOAD";           
            ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
            ST_WAIT_JOB_DONE:           state_s = "ST_WAIT_JOB_DONE";
            ST_SEND_COMPLETE:           state_s = "ST_SEND_COMPLETE";
        endcase
    end
`endif
    
endmodule