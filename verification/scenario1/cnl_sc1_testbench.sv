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
// Additional Comments:     Scenario 1 Checks the convolution output
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module cnl_sc1_testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "cnl_sc1_verif_defs.svh"
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.svh"
    `include "cnl_sc1_generator.sv"
    `include "cnl_sc1_environment.sv"
    `include "cnn_layer_accel_quad_intf.sv"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
    parameter C_NUM_RAND_TESTS = 0;
    parameter C_NUM_QUADS = 2;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic            clk_if                                  ;
    logic            clk_core                                ;
    logic            rst                                     ;

    logic            job_start[C_NUM_QUADS - 1:0]            ;
    logic            job_accept[C_NUM_QUADS - 1:0]           ;
    logic [127:0]    job_parameters[C_NUM_QUADS - 1:0]       ;
    logic            job_fetch_request[C_NUM_QUADS - 1:0]    ;
    logic            job_fetch_ack[C_NUM_QUADS - 1:0]        ;
    logic            job_fetch_complete[C_NUM_QUADS - 1:0]   ;      
    logic            job_complete[C_NUM_QUADS - 1:0]         ;
    logic            job_complete_ack[C_NUM_QUADS - 1:0]     ;
    logic            pip_primed[C_NUM_QUADS - 1:0]           ;
    logic            pips_primed                             ;

    logic            cascade_in_valid[C_NUM_QUADS - 1:0]     ;
    logic            cascade_in_ready[C_NUM_QUADS - 1:0]     ;
    logic [127:0]    cascade_in_data[C_NUM_QUADS - 1:0]      ;

    logic            cascade_out_valid[C_NUM_QUADS - 1:0]    ;
    logic            cascade_out_ready[C_NUM_QUADS - 1:0]    ;
    logic [127:0]    cascade_out_data[C_NUM_QUADS - 1:0]     ;

    logic [  3:0]    config_valid[C_NUM_QUADS - 1:0]         ;
    logic [  3:0]    config_accept[C_NUM_QUADS - 1:0]        ;
    logic [127:0]    config_data[C_NUM_QUADS - 1:0]          ;

    logic            weight_valid[C_NUM_QUADS - 1:0]         ;
    logic            weight_ready[C_NUM_QUADS - 1:0]         ;
    logic [127:0]    weight_data[C_NUM_QUADS - 1:0]          ;

    logic            result_valid[C_NUM_QUADS - 1:0]         ;
    logic            result_accept[C_NUM_QUADS - 1:0]        ;
    logic [15:0]     result_data[C_NUM_QUADS - 1:0]          ;

    logic            pixel_valid[C_NUM_QUADS - 1:0]          ;
    logic            pixel_ready[C_NUM_QUADS - 1:0]          ;
    logic [127:0]    pixel_data[C_NUM_QUADS - 1:0]           ;
    
    logic            fifo_empty[C_NUM_QUADS - 1:0]           ;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Verification Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `cnl_scX_environment #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ),
        .C_NUM_QUADS     ( C_NUM_QUADS     )
    ) env;
    `cnl_scX_generator test;
    `scX_genParams_t `scX_genParams;
    `scX_crtTestParams_t `scX_crtTestParams;
    `cnl_scX_generator crt_test_queue[$];
    int i0;
    int i1;
    int i2;
    int i3;
    int i4;
    int i5;
    int ti;
    int imageSizes_arr[2:0];
    int imageSize;
    int strides_arr[1:0];
    int padding_arr[1:0];
    int numKernels_arr[4:0];
    bool upsampling_arr[1:0];
    int conv_out_fmt_arr[1:0];
    int test_bi;
    int test_ei;
    string outputDir;
    genvar g;
    integer i;
    virtual cnn_layer_accel_quad_intf quad_intf_arr[C_NUM_QUADS];
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    clock_gen #(
        .C_PERIOD(C_PERIOD_100MHz)
    )
    i0_clock_gen(
        .clk_out(clk_if)
    );


    clock_gen #(
        .C_PERIOD(C_PERIOD_500MHz)
    )
    i1_clock_gen(
        .clk_out(clk_core)
    );
    
    
    cnn_layer_accel_synch_intf
    i0_synch_intf (
        .clk_if     ( clk_if    ),
        .clk_core   ( clk_core  ),
        .rst        ( rst       )
    );


    cnn_layer_accel_quad
    i0_cnn_layer_accel_quad (
        .clk_if               ( clk_if                  ),  
        .clk_core             ( clk_core                ),  
        .rst                  ( rst                     ),  

        .job_start            ( job_start[0]            ),  
        .job_accept           ( job_accept[0]           ),  
        .job_parameters       ( job_parameters[0]       ),  
        .job_fetch_request    ( job_fetch_request[0]    ),  
        .job_fetch_ack        ( job_fetch_ack[0]        ), 
        .job_fetch_complete   ( job_fetch_complete[0]   ),
        .job_complete         ( job_complete[0]         ),  
        .job_complete_ack     ( job_complete_ack[0]     ),  

        .cascade_in_valid     ( cascade_in_valid[0]     ),
        .cascade_in_ready     ( cascade_in_ready[0]     ),
        .cascade_in_data      ( cascade_in_data[0]      ),

        .cascade_out_valid    ( cascade_out_valid[0]    ),
        .cascade_out_ready    ( cascade_out_ready[0]    ),
        .cascade_out_data     ( cascade_out_data[0]     ),

        .config_valid         ( config_valid[0]         ),
        .config_accept        ( config_accept[0]        ),
        .config_data          ( config_data[0]          ),

        .weight_valid         ( weight_valid[0]         ),
        .weight_ready         ( weight_ready[0]         ),
        .weight_data          ( weight_data[0]          ),

        .result_valid         ( result_valid[0]         ),
        .result_accept        ( result_accept[0]        ),
        .result_data          ( result_data[0]          ),
 
        .pixel_valid          ( pixel_valid[0]          ),
        .pixel_ready          ( pixel_ready[0]          ),
        .pixel_data           ( pixel_data[0]           )
    );
    
    
    cnn_layer_accel_quad_intf
	i0_quad_intf (
       .clk_if                          ( clk_if                                                ),
       .clk_core                        ( clk_core                                              ),
       .rst                             ( rst                                                   ),

       .job_start                       ( job_start[0]                                          ),
       .job_accept                      ( job_accept[0]                                         ),
       .job_parameters                  ( job_parameters[0]                                     ),
       .job_fetch_request               ( job_fetch_request[0]                                  ),
       .job_fetch_ack                   ( job_fetch_ack[0]                                      ),
       .job_fetch_complete              ( job_fetch_complete[0]                                 ),
       .job_complete                    ( job_complete[0]                                       ),
       .job_complete_ack                ( job_complete_ack[0]                                   ),
       .pip_primed                      ( pip_primed                                            ),
       .pips_primed                     ( pips_primed                                           ),

       .cascade_in_valid                ( cascade_in_valid[0]                                   ),
       .cascade_in_ready                ( cascade_in_ready[0]                                   ),
       .cascade_in_data                 ( cascade_in_data[0]                                    ),

       .cascade_out_valid               ( cascade_out_valid[0]                                  ),
       .cascade_out_ready               ( cascade_out_ready[0]                                  ),
       .cascade_out_data                ( cascade_out_data[0]                                   ),

       .config_valid                    ( config_valid[0]                                       ),
       .config_accept                   ( config_accept[0]                                      ),
       .config_data                     ( config_data[0]                                        ),

       .weight_valid                    ( weight_valid[0]                                       ),
       .weight_ready                    ( weight_ready[0]                                       ),
       .weight_data                     ( weight_data[0]                                        ),

       .result_valid                    ( result_valid[0]                                       ),
       .result_accept                   ( result_accept[0]                                      ),
       .result_data                     ( result_data[0]                                        ),

       .pixel_valid                     ( pixel_valid[0]                                        ),
       .pixel_ready                     ( pixel_ready[0]                                        ),
       .pixel_data                      ( pixel_data[0]                                         ),

       .pfb_full_count_cfg              ( i0_cnn_layer_accel_quad.pfb_full_count_cfg            ),
       .stride_cfg                      ( i0_cnn_layer_accel_quad.stride_cfg                    ),
       .conv_out_fmt_cfg    		    ( i0_cnn_layer_accel_quad.conv_out_fmt_cfg    	        ),
       .padding_cfg                     ( i0_cnn_layer_accel_quad.padding_cfg                   ),
       .upsample_cfg                    ( i0_cnn_layer_accel_quad.upsample_cfg                  ),
       .num_kernels_cfg                 ( i0_cnn_layer_accel_quad.num_kernels_cfg               ),
       .num_output_rows_cfg             ( i0_cnn_layer_accel_quad.num_output_rows_cfg           ),
       .num_output_cols_cfg             ( i0_cnn_layer_accel_quad.num_output_cols_cfg           ),
       .pix_seq_data_full_count_cfg     ( i0_cnn_layer_accel_quad.pix_seq_data_full_count_cfg   ),
       .num_expd_input_cols_cfg         ( i0_cnn_layer_accel_quad.num_expd_input_cols_cfg       ),
       .num_expd_input_rows_cfg         ( i0_cnn_layer_accel_quad.num_expd_input_rows_cfg       ),
       .crpd_input_col_start_cfg        ( i0_cnn_layer_accel_quad.crpd_input_col_start_cfg      ),
       .crpd_input_row_start_cfg        ( i0_cnn_layer_accel_quad.crpd_input_row_start_cfg      ),
       .crpd_input_col_end_cfg          ( i0_cnn_layer_accel_quad.crpd_input_col_end_cfg        ),
       .crpd_input_row_end_cfg          ( i0_cnn_layer_accel_quad.crpd_input_row_end_cfg        ),
       .master_quad_cfg                 ( i0_cnn_layer_accel_quad.master_quad_cfg               ),
       
       .output_row                      ( i0_cnn_layer_accel_quad.output_row                    ),
       .output_col                      ( i0_cnn_layer_accel_quad.output_col                    ),
       .output_depth                    ( i0_cnn_layer_accel_quad.output_depth                  )
	);
    
    assign cnn_layer_accel_quad_intf_arr[0] = cnl_sc0_testbench.i0_quad_intf;
    
    
    for(g = 1; g < C_NUM_QUADS; g = g + 1) begin: QUAD
        fifo_fwft #(
            .C_DATA_WIDTH( `PIXEL_WIDTH ),
            .C_FIFO_DEPTH( 5            )
        ) i0_fifo_fwft (
            .clk            ( clk_core                  ),
            .rst            ( rst                       ),
            .wren           ( cascade_out_valid[g - 1]  ),
            .rden           ( cascade_in_ready[g]       ),
            .datain         ( cascade_out_data[g - 1]   ),
            .dataout        ( cascade_in_data[g]        ),
            .empty          ( fifo_empty[g]             ),
            .full           (                           ),
            .almost_full    (                           )
        );
               
        assign cascade_in_valid[g] = !fifo_empty[g];

        cnn_layer_accel_quad
        i0_cnn_layer_accel_quad (
            .clk_if               ( clk_if                  ),  
            .clk_core             ( clk_core                ),  
            .rst                  ( rst                     ),  

            .job_start            ( job_start[g]            ),  
            .job_accept           ( job_accept[g]           ),  
            .job_parameters       ( job_parameters[g]       ),  
            .job_fetch_request    ( job_fetch_request[g]    ),  
            .job_fetch_ack        ( job_fetch_ack[g]        ), 
            .job_fetch_complete   ( job_fetch_complete[g]   ),
            .job_complete         ( job_complete[g]         ),  
            .job_complete_ack     ( job_complete_ack[g]     ), 
            .pip_primed           ( pip_primed[g]           ),

            .cascade_in_valid     ( cascade_in_valid[g]     ),
            .cascade_in_ready     ( cascade_in_ready[g]     ),
            .cascade_in_data      ( cascade_in_data[g]      ),

            .cascade_out_valid    ( cascade_out_valid[g]    ),
            .cascade_out_ready    ( cascade_out_ready[g]    ),
            .cascade_out_data     ( cascade_out_data[g]     ),

            .config_valid         ( config_valid[g]         ),
            .config_accept        ( config_accept[g]        ),
            .config_data          ( config_data[g]          ),

            .weight_valid         ( weight_valid[g]         ),
            .weight_ready         ( weight_ready[g]         ),
            .weight_data          ( weight_data[g]          ),

            .result_valid         ( result_valid[g]         ),
            .result_accept        ( result_accept[g]        ),
            .result_data          ( result_data[g]          ),
     
            .pixel_valid          ( pixel_valid[g]          ),
            .pixel_ready          ( pixel_ready[g]          ),
            .pixel_data           ( pixel_data[g]           )
        );


        cnn_layer_accel_quad_intf
        i0_quad_intf (
           .clk_if                          ( clk_if                                                ),
           .clk_core                        ( clk_core                                              ),
           .rst                             ( rst                                                   ),

           .job_start                       ( job_start[g]                                          ),
           .job_accept                      ( job_accept[g]                                         ),
           .job_parameters                  ( job_parameters[g]                                     ),
           .job_fetch_request               ( job_fetch_request[g]                                  ),
           .job_fetch_ack                   ( job_fetch_ack[g]                                      ),
           .job_fetch_complete              ( job_fetch_complete[g]                                 ),
           .job_complete                    ( job_complete[g]                                       ),
           .job_complete_ack                ( job_complete_ack[g]                                   ),
           .pip_primed                      ( pip_primed                                            ),
           .pips_primed                     ( pips_primed                                           ),

           .cascade_in_valid                ( cascade_in_valid[g]                                   ),
           .cascade_in_ready                ( cascade_in_ready[g]                                   ),
           .cascade_in_data                 ( cascade_in_data[g]                                    ),

           .cascade_out_valid               ( cascade_out_valid[g]                                  ),
           .cascade_out_ready               ( cascade_out_ready[g]                                  ),
           .cascade_out_data                ( cascade_out_data[g]                                   ),

           .config_valid                    ( config_valid[g]                                       ),
           .config_accept                   ( config_accept[g]                                      ),
           .config_data                     ( config_data[g]                                        ),

           .weight_valid                    ( weight_valid[g]                                       ),
           .weight_ready                    ( weight_ready[g]                                       ),
           .weight_data                     ( weight_data[g]                                        ),

           .result_valid                    ( result_valid[g]                                       ),
           .result_accept                   ( result_accept[g]                                      ),
           .result_data                     ( result_data[g]                                        ),

           .pixel_valid                     ( pixel_valid[g]                                        ),
           .pixel_ready                     ( pixel_ready[g]                                        ),
           .pixel_data                      ( pixel_data[g]                                         ),

           .pfb_full_count_cfg              ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.pfb_full_count_cfg            ),
           .stride_cfg                      ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.stride_cfg                    ),
           .conv_out_fmt_cfg    		    ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.conv_out_fmt_cfg    	      ),
           .padding_cfg                     ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.padding_cfg                   ),
           .upsample_cfg                    ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.upsample_cfg                  ),
           .num_kernels_cfg                 ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.num_kernels_cfg               ),
           .num_output_rows_cfg             ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.num_output_rows_cfg           ),
           .num_output_cols_cfg             ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.num_output_cols_cfg           ),
           .pix_seq_data_full_count_cfg     ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.pix_seq_data_full_count_cfg   ),
           .num_expd_input_cols_cfg         ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.num_expd_input_cols_cfg       ),
           .num_expd_input_rows_cfg         ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.num_expd_input_rows_cfg       ),
           .crpd_input_col_start_cfg        ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.crpd_input_col_start_cfg      ),
           .crpd_input_row_start_cfg        ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.crpd_input_row_start_cfg      ),
           .crpd_input_col_end_cfg          ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.crpd_input_col_end_cfg        ),
           .crpd_input_row_end_cfg          ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.crpd_input_row_end_cfg        ),
           .master_quad_cfg                 ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.master_quad_cfg               ),

           .output_row                      ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.output_row                    ),
           .output_col                      ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.output_col                    ),
           .output_depth                    ( cnl_sc0_testbench.QUAD[g].i0_cnn_layer_accel_quad.output_depth                  )
        );

        assign quad_intf_arr[g] = cnl_sc0_testbench.QUAD[g].i0_quad_intf;
    end
    
    
    // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
       for(i = 0; i < C_NUM_QUADS; i = i + 1) begin
            pips_primed = pip_primed[i] && 1;
       end
    end    
    // END Logic --------------------------------------------------------------------------------------------------------------------------------
 
    
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
        imageSizes_arr[0]   = `MIN_NUM_INPUT_COLS;
        imageSizes_arr[1]   = 20;
        imageSizes_arr[2]   = `MAX_NUM_INPUT_COLS;
        strides_arr[0]      = 1;
        strides_arr[1]      = `MAX_STRIDE;
        padding_arr[0]      = 0;
        padding_arr[1]      = `MAX_PADDING;
        numKernels_arr[0]   = `MIN_BRAM_3x3_KERNELS;
        // numKernels_arr[1]   = `MAX_BRAM_3x3_KERNELS;
        numKernels_arr[1] = 11;
        numKernels_arr[2] = 2;
        numKernels_arr[3] = 3;
        numKernels_arr[4] = 4;
        upsampling_arr[0] = TRUE;
        upsampling_arr[1] = FALSE;
        conv_out_fmt_arr[0] = 0;
        conv_out_fmt_arr[1] = 1;
        `scX_crtTestParams = new();     
        ti = 0;


        // for(i0 = 0; i0 < 2; i0 = i0 + 1) begin // imageSizes_arr
        // // for(i0 = 0; i0 < 3; i0 = i0 + 1) begin // imageSizes_arr
        //     for(i1 = 0; i1 < 2; i1 = i1 + 1) begin // strides_arr
        //         for(i2 = 0; i2 < 2; i2 = i2 + 1) begin // padding_arr
        //             for(i3 = 0; i3 < 5; i3 = i3 + 1) begin // numKernels_arr
        //                 for(i4 = 0; i4 < 2; i4 = i4 + 1) begin // upsampling_arr
        //                     // for(i5 = 0; i5 < 2; i5 = i5 + 1) begin // conv_out_fmt_arr
        //                         if(padding_arr[i2] == 1 && upsampling_arr[i4] == TRUE && imageSizes_arr[i0] == `MAX_NUM_INPUT_COLS) begin
        //                             imageSize = (imageSizes_arr[i0] / 2) - 2;
        //                         end else if(upsampling_arr[i4] == TRUE && imageSizes_arr[i0] == `MAX_NUM_INPUT_COLS) begin
        //                             imageSize = imageSizes_arr[i0] / 2;
        //                         end else if(padding_arr[i2] == 1 && imageSizes_arr[i0] == `MAX_NUM_INPUT_COLS) begin
        //                             imageSize = imageSizes_arr[i0] - 2;
        //                         end else begin
        //                             imageSize = imageSizes_arr[i0];
        //                         end
        //                         `scX_genParams = new();
        //                         `scX_genParams.ti = ti;  
        //                         `scX_crtTestParams.num_input_rows = imageSize;
        //                         `scX_crtTestParams.num_input_cols = imageSize;
        //                         `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        //                         `scX_crtTestParams.num_kernels = numKernels_arr[i3];
        //                         `scX_crtTestParams.stride = strides_arr[i1];
        //                         `scX_crtTestParams.padding = padding_arr[i2];
        //                         `scX_crtTestParams.upsample = upsampling_arr[i4];
        //                         `scX_crtTestParams.kernel_size = 3;
        //                         // `scX_crtTestParams.conv_out_fmt = conv_out_fmt_arr[i5];
        //                         `scX_crtTestParams.conv_out_fmt = 0;                                
        //                         test = new(`scX_genParams);
        //                         test.createTest(`scX_crtTestParams);
        //                         crt_test_queue.push_back(test);
        //                         ti = ti + 1;
        //                      // end
        //                  end
        //             end
        //         end
        //     end
        // end

        
        `scX_genParams = new();
        `scX_genParams.ti = ti;  
        `scX_crtTestParams.num_input_rows = 19;
        `scX_crtTestParams.num_input_cols = 19;
        `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        `scX_crtTestParams.num_kernels = 1;
        `scX_crtTestParams.stride = 1;
        `scX_crtTestParams.padding = 0;
        `scX_crtTestParams.upsample = FALSE;
        `scX_crtTestParams.kernel_size = 3;
        `scX_crtTestParams.conv_out_fmt = 0;
        test = new(`scX_genParams);
        test.createTest(`scX_crtTestParams);
        crt_test_queue.push_back(test);
        ti = ti + 1;
        
        
        if($test$plusargs("test_bi")) begin
            $value$plusargs("test_bi=%d", test_bi);
        end else begin
            test_bi = 0;     
        end
        if($test$plusargs("test_ei")) begin
            $value$plusargs("test_ei=%d", test_ei);
        end else begin
            test_ei = -1;     
        end
        if($test$plusargs("outputDir")) begin
            $value$plusargs("outputDir=%s", outputDir);
        end else begin
            outputDir = "./";
        end

       
        env = new(i0_synch_intf, quad_intf_arr, crt_test_queue.size() + C_NUM_RAND_TESTS, crt_test_queue, 1, FALSE, FALSE, test_bi, test_ei, outputDir);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    