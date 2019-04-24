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


module cnl_sc2_testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "cnl_sc2_verif_defs.svh"
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.svh"
    `include "cnl_sc2_generator.sv"
    `include "cnl_sc2_environment.sv"
    `include "cnn_layer_accel_quad_intf.sv"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
    parameter C_NUM_RAND_TESTS = 0;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic            clk_if                 ;
    logic            clk_core               ;
    logic            rst                    ;

    logic            job_start              ;
    logic            job_accept             ;
    logic [127:0]    job_parameters         ;
    logic            job_fetch_request      ;
    logic            job_fetch_ack          ;
    logic            job_fetch_complete     ;       
    logic            job_complete           ;
    logic            job_complete_ack       ;

    logic            cascade_in_valid       ;
    logic            cascade_in_ready       ;
    logic [127:0]    cascade_in_data        ;

    logic            cascade_out_valid      ;
    logic            cascade_out_ready      ;
    logic [127:0]    cascade_out_data       ;

    logic [  3:0]    config_valid           ;
    logic [  3:0]    config_accept          ;
    logic [127:0]    config_data            ;

    logic            weight_valid           ;
    logic            weight_ready           ;
    logic [127:0]    weight_data            ;

    logic            result_valid           ;
    logic            result_accept          ;
    logic [15:0]     result_data            ;

    logic            pixel_valid            ;
    logic            pixel_ready            ;
    logic [127:0]    pixel_data             ;


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Verification Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `cnl_scX_environment #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) env;
    `cnl_scX_generator test;
    `scX_genParams_t `scX_genParams;
    `scX_crtTestParams_t `scX_crtTestParams;
    `cnl_scX_generator test_queue[$];
    int i0;
    int i1;
    int i2;
    int i3;
    int i4;
    int ti;
    int imageSizes_arr[2:0];
    int imageSize;
    int strides_arr[1:0];
    int padding_arr[1:0];
    int numKernels_arr[4:0];
    // bool upsampling[1:0];
    
    
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


    cnn_layer_accel_quad_intf
	i0_quad_intf (
       .clk_if                          ( clk_if                                                ),
       .clk_core                        ( clk_core                                              ),
       .rst                             ( rst                                                   ),

       .job_start                       ( job_start                                             ),
       .job_accept                      ( job_accept                                            ),
       .job_parameters                  ( job_parameters                                        ),
       .job_fetch_request               ( job_fetch_request                                     ),
       .job_fetch_ack                   ( job_fetch_ack                                         ),
       .job_fetch_complete              ( job_fetch_complete                                    ),
       .job_complete                    ( job_complete                                          ),
       .job_complete_ack                ( job_complete_ack                                      ),

       .cascade_in_valid                ( cascade_in_valid                                      ),
       .cascade_in_ready                ( cascade_in_ready                                      ),
       .cascade_in_data                 ( cascade_in_data                                       ),

       .cascade_out_valid               ( cascade_out_valid                                     ),
       .cascade_out_ready               ( cascade_out_ready                                     ),
       .cascade_out_data                ( cascade_out_data                                      ),

       .config_valid                    ( config_valid                                          ),
       .config_accept                   ( config_accept                                         ),
       .config_data                     ( config_data                                           ),

       .weight_valid                    ( weight_valid                                          ),
       .weight_ready                    ( weight_ready                                          ),
       .weight_data                     ( weight_data                                           ),

       .result_valid                    ( result_valid                                          ),
       .result_accept                   ( result_accept                                         ),
       .result_data                     ( result_data                                           ),

       .pixel_valid                     ( pixel_valid                                           ),
       .pixel_ready                     ( pixel_ready                                           ),
       .pixel_data                      ( pixel_data                                            ),

       .pfb_full_count_cfg              ( i0_cnn_layer_accel_quad.pfb_full_count_cfg            ),
       .kernel_full_count_cfg           ( i0_cnn_layer_accel_quad.kernel_full_count_cfg         ),
       .kernel_group_cfg                ( i0_cnn_layer_accel_quad.kernel_group_cfg              ),
       .convolution_stride_cfg          ( i0_cnn_layer_accel_quad.convolution_stride_cfg        ),
       .kernel_size_cfg    		        ( i0_cnn_layer_accel_quad.kernel_size_cfg    	        ),
       .padding_cfg                     ( i0_cnn_layer_accel_quad.padding_cfg                   ),
       .upsample_cfg                    ( i0_cnn_layer_accel_quad.upsample_cfg                  ),
       .num_kernel_cfg                  ( i0_cnn_layer_accel_quad.num_kernel_cfg                ),
       .num_output_rows_cfg             ( i0_cnn_layer_accel_quad.num_output_rows_cfg           ),
       .num_output_cols_cfg             ( i0_cnn_layer_accel_quad.num_output_cols_cfg           ),
       .pix_seq_data_full_count_cfg     ( i0_cnn_layer_accel_quad.pix_seq_data_full_count_cfg   ),
       .num_expd_input_cols_cfg         ( i0_cnn_layer_accel_quad.num_expd_input_cols_cfg       ),
       .num_expd_input_rows_cfg         ( i0_cnn_layer_accel_quad.num_expd_input_rows_cfg       ),
       .crpd_input_col_start_cfg        ( i0_cnn_layer_accel_quad.crpd_input_col_start_cfg      ),
       .crpd_input_row_start_cfg        ( i0_cnn_layer_accel_quad.crpd_input_row_start_cfg      ),
       .crpd_input_col_end_cfg          ( i0_cnn_layer_accel_quad.crpd_input_col_end_cfg        ),
       .crpd_input_row_end_cfg          ( i0_cnn_layer_accel_quad.crpd_input_row_end_cfg        ),
       
       .output_row                      ( i0_cnn_layer_accel_quad.output_row                    ),
       .output_col                      ( i0_cnn_layer_accel_quad.output_col                    ),
       .output_depth                    ( i0_cnn_layer_accel_quad.output_depth                  )
	);
  
    
    cnn_layer_accel_quad
    i0_cnn_layer_accel_quad (
        .clk_if               ( clk_if                  ),  
        .clk_core             ( clk_core                ),  
        .rst                  ( rst                     ),  

        .job_start            ( job_start               ),  
        .job_accept           ( job_accept              ),  
        .job_parameters       ( job_parameters          ),  
        .job_fetch_request    ( job_fetch_request       ),  
        .job_fetch_ack        ( job_fetch_ack           ), 
        .job_fetch_complete   ( job_fetch_complete      ),
        .job_complete         ( job_complete            ),  
        .job_complete_ack     ( job_complete_ack        ),  

        .cascade_in_valid     ( cascade_in_valid        ),
        .cascade_in_ready     ( cascade_in_ready        ),
        .cascade_in_data      ( cascade_in_data         ),

        .cascade_out_valid    ( cascade_out_valid       ),
        .cascade_out_ready    ( cascade_out_ready       ),
        .cascade_out_data     ( cascade_out_data        ),

        .config_valid         ( config_valid            ),
        .config_accept        ( config_accept           ),
        .config_data          ( config_data             ),

        .weight_valid         ( weight_valid            ),
        .weight_ready         ( weight_ready            ),
        .weight_data          ( weight_data             ),

        .result_valid         ( result_valid            ),
        .result_accept        ( result_accept           ),
        .result_data          ( result_data             ),

        .pixel_valid          ( pixel_valid             ),
        .pixel_ready          ( pixel_ready             ),
        .pixel_data           ( pixel_data              )
    );

    
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
        imageSizes_arr[0]   = `MIN_NUM_INPUT_COLS;
        imageSizes_arr[1]   = 20;
        // imageSizes_arr[2]   = `MAX_NUM_INPUT_COLS;
        strides_arr[0]      = 1;
        strides_arr[1]      = `MAX_STRIDE;
        padding_arr[0]      = 0;
        padding_arr[1]      = `MAX_PADDING;
        numKernels_arr[0]   = `MIN_BRAM_3x3_KERNELS;
        // numKernels_arr[1]   = `MAX_BRAM_3x3_KERNELS;
        numKernels_arr[1]   = 11;
        numKernels_arr[2]   = 2;
        numKernels_arr[3]   = 3;
        numKernels_arr[4]   = 4;        
        `scX_crtTestParams = new();     
        ti = 0;


        for(i0 = 0; i0 < 2; i0 = i0 + 1) begin // imageSizes_arr
            for(i1 = 0; i1 < 2; i1 = i1 + 1) begin // strides_arr
                for(i2 = 0; i2 < 2; i2 = i2 + 1) begin // padding_arr
                    for(i3 = 0; i3 < 5; i3 = i3 + 1) begin // numKernels_arr
                        if(padding_arr[i2] == 1 && imageSizes_arr[i0] == `MAX_NUM_INPUT_COLS) begin
                            imageSize = imageSizes_arr[i0] - 2;
                        end else begin
                            imageSize = imageSizes_arr[i0];
                        end
                        `scX_genParams = new();
                        `scX_genParams.ti = ti;  
                        `scX_crtTestParams.num_input_rows = imageSize;
                        `scX_crtTestParams.num_input_cols = imageSize;
                        `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
                        `scX_crtTestParams.num_kernels = numKernels_arr[i3];
                        `scX_crtTestParams.kernel_size = `MAX_KERNEL_SIZE;
                        `scX_crtTestParams.stride = strides_arr[i1];
                        `scX_crtTestParams.padding = padding_arr[i2];
                        `scX_crtTestParams.upsample = FALSE;
                        test = new(`scX_genParams);
                        test.createTest(`scX_crtTestParams);
                        test_queue.push_back(test);
                        ti = ti + 1;
                    end
                end
            end
        end
        
         
        // `scX_genParams = new();
        // `scX_genParams.ti = ti;  
        // `scX_crtTestParams.num_input_rows = 19;
        // `scX_crtTestParams.num_input_cols = 19;
        // `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // `scX_crtTestParams.num_kernels = 1;
        // `scX_crtTestParams.kernel_size = `MAX_KERNEL_SIZE;
        // `scX_crtTestParams.stride = 1;
        // `scX_crtTestParams.padding = 0;
        // `scX_crtTestParams.upsample = TRUE;
        // test = new(`scX_genParams);
        // test.createTest(`scX_crtTestParams);
        // test_queue.push_back(test);
        // ti = ti + 1;   


        env = new(i0_quad_intf, test_queue.size() + C_NUM_RAND_TESTS, test_queue, 1, FALSE);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    