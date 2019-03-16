`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Copyright 2016 SiliconScapes, LLC. All Rights Reserved.			
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
// Additional Comments:     Scenario 0 Checks the output of the row buffers
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module cnl_sc0_testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //	Includes
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.sv"
    `include "cnl_sc0_generator.sv"
    `include "cnl_sc0_environment.sv"
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
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_PIXEL_DATAOUT_WIDTH    = `NUM_CE_PER_AWE * `PIXEL_WIDTH;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	// Verification Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    cnl_sc0_environment #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) env;
    cnl_sc0_generator test;
    sc0_crtTestParams_t sc0_crtTestParams;
    cnl_sc0_generator test_queue[$];
    virtual cnn_layer_accel_awe_rowbuffers_intf awe_buf_intf_arr[`NUM_AWE];
    genvar g;

    
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

       .num_input_cols_cfg              ( i0_cnn_layer_accel_quad.num_input_cols_cfg            ),
       .num_input_rows_cfg              ( i0_cnn_layer_accel_quad.num_input_rows_cfg            ),
       .pfb_full_count_cfg              ( i0_cnn_layer_accel_quad.pfb_full_count_cfg            ),
       .kernel_full_count_cfg           ( i0_cnn_layer_accel_quad.kernel_full_count_cfg         ),
       .kernel_group_cfg                ( i0_cnn_layer_accel_quad.kernel_group_cfg              ),
       .convolution_stride_cfg          ( i0_cnn_layer_accel_quad.convolution_stride_cfg        ),
       .kernel_size_cfg    		        ( i0_cnn_layer_accel_quad.kernel_size_cfg    	        ),
       .padding_cfg                     ( i0_cnn_layer_accel_quad.padding_cfg                   ),
       .num_kernel_cfg                  ( i0_cnn_layer_accel_quad.num_kernel_cfg                ),
       .num_output_rows_cfg             ( i0_cnn_layer_accel_quad.num_output_rows_cfg           ),
       .num_output_cols_cfg             ( i0_cnn_layer_accel_quad.num_output_cols_cfg           ),
       .pix_seq_data_full_count_cfg     ( i0_cnn_layer_accel_quad.pix_seq_data_full_count_cfg   ),
        
       .output_row                      ( i0_cnn_layer_accel_quad.output_row                    ),
       .output_col                      ( i0_cnn_layer_accel_quad.output_col                    ),
       .output_depth                    ( i0_cnn_layer_accel_quad.output_depth                  )
	);
  
    
    cnn_layer_accel_quad
    i0_cnn_layer_accel_quad (
        .clk_if               ( clk_if                ),  
        .clk_core             ( clk_core              ),  
        .rst                  ( rst                   ),  

        .job_start            ( job_start             ),  
        .job_accept           ( job_accept            ),  
        .job_parameters       ( job_parameters        ),  
        .job_fetch_request    ( job_fetch_request     ),  
        .job_fetch_ack        ( job_fetch_ack         ), 
        .job_fetch_complete   ( job_fetch_complete    ),
        .job_complete         ( job_complete          ),  
        .job_complete_ack     ( job_complete_ack      ),  

        .cascade_in_valid     ( cascade_in_valid      ),
        .cascade_in_ready     ( cascade_in_ready      ),
        .cascade_in_data      ( cascade_in_data       ),

        .cascade_out_valid    ( cascade_out_valid     ),
        .cascade_out_ready    ( cascade_out_ready     ),
        .cascade_out_data     ( cascade_out_data      ),

        .config_valid         ( config_valid          ),
        .config_accept        ( config_accept         ),
        .config_data          ( config_data           ),

        .weight_valid         ( weight_valid          ),
        .weight_ready         ( weight_ready          ),
        .weight_data          ( weight_data           ),

        .result_valid         ( result_valid          ),
        .result_accept        ( result_accept         ),
        .result_data          ( result_data           ),

        .pixel_valid          ( pixel_valid           ),
        .pixel_ready          ( pixel_ready           ),
        .pixel_data           ( pixel_data            )
    );
    

    // see if bind feature in systemverilog can do this in a less verbose way
    // this example http://www.asic-world.com/systemverilog/assertions22.html can also be used to make the variable names here smaller
    //   instaniate multiple binding_modules then connect them to interface, then create an interface array
    for(g = 0; g < `NUM_AWE; g = g + 1) begin: AWE_RB_INTF
        cnn_layer_accel_awe_rowbuffers_intf
        i_cnn_layer_accel_awe_rowbuffers_intf (
            .clk                         ( clk_core                                                                                         ),          
            .ce0_pixel_dataout           ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce0_pixel_dataout               ),
            .ce1_pixel_dataout           ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce1_pixel_dataout               ),
            .ce0_pixel_dataout_valid     ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce0_pixel_dataout_valid         ),
            .ce1_pixel_dataout_valid     ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce1_pixel_dataout_valid         ),
            .output_row_ce0              ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.output_row_ce0                  ),
            .output_row_ce1              ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.output_row_ce1                  ),
            .output_col_ce0              ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.output_col_ce0                  ),
            .output_col_ce1              ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.output_col_ce1                  ),
            .ce0_last_kernel             ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce0_last_kernel                 ),
            .ce1_last_kernel             ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce1_last_kernel                 ),
            .ce0_cycle_counter           ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce0_cycle_counter               ),         
            .ce1_cycle_counter           ( i0_cnn_layer_accel_quad.AWE[g].i0_cnn_layer_accel_awe_rowbuffers.ce1_cycle_counter               )
        );
        assign awe_buf_intf_arr[g] = cnl_sc0_testbench.AWE_RB_INTF[g].i_cnn_layer_accel_awe_rowbuffers_intf;
    end    


 
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------        
        sc0_crtTestParams = new();
        sc0_crtTestParams.num_input_rows = 512;
        sc0_crtTestParams.num_input_cols = 512;
        sc0_crtTestParams.depth = `NUM_CE_PER_QUAD;
        sc0_crtTestParams.num_kernels = 1;
        sc0_crtTestParams.kernel_size = 3;
        sc0_crtTestParams.stride = 1;
        sc0_crtTestParams.padding = 0;
        test = new();
        test.createTest(sc0_crtTestParams);
        test_queue.push_back(test);
        
        // sc0_crtTestParams = new();
        // sc0_crtTestParams.num_input_rows = 512;
        // sc0_crtTestParams.num_input_cols = 512;
        // sc0_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // sc0_crtTestParams.num_kernels = 64;
        // sc0_crtTestParams.kernel_size = 3;
        // sc0_crtTestParams.stride = 1;
        // sc0_crtTestParams.padding = 0;
        // test = new();
        // test.createTest(sc0_crtTestParams);
        // test_queue.push_back(test);
        // 
        // sc0_crtTestParams = new();
        // sc0_crtTestParams.num_input_rows = 19;
        // sc0_crtTestParams.num_input_cols = 19;
        // sc0_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // sc0_crtTestParams.num_kernels = 1;
        // sc0_crtTestParams.kernel_size = 3;
        // sc0_crtTestParams.stride = 1;
        // sc0_crtTestParams.padding = 0;
        // test = new();
        // test.createTest(sc0_crtTestParams);
        // test_queue.push_back(test);
        // 
        // sc0_crtTestParams = new();
        // sc0_crtTestParams.num_input_rows = 19;
        // sc0_crtTestParams.num_input_cols = 19;
        // sc0_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // sc0_crtTestParams.num_kernels = 64;
        // sc0_crtTestParams.kernel_size = 3;
        // sc0_crtTestParams.stride = 1;
        // sc0_crtTestParams.padding = 0;
        // test = new();
        // test.createTest(sc0_crtTestParams);
        // test_queue.push_back(test);


        // sc0_crtTestParams = new();
        // sc0_crtTestParams.num_input_rows = 25;
        // sc0_crtTestParams.num_input_cols = 25;
        // sc0_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // sc0_crtTestParams.num_kernels = 5;
        // sc0_crtTestParams.kernel_size = 3;
        // sc0_crtTestParams.stride = 1;
        // sc0_crtTestParams.padding = 0;
        // test = new();
        // test.createTest(sc0_crtTestParams);
        // test_queue.push_back(test);
    

        env = new(i0_quad_intf, test_queue.size() + C_NUM_RAND_TESTS, test_queue, awe_buf_intf_arr, `NUM_AWE);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    