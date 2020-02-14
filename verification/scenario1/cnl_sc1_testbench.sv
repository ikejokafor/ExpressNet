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
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Connection Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic            clk_if                                  ;
    logic            clk_core                                ;
    logic            rst                                     ;

    logic            job_start[`NUM_QUADS - 1:0]            ;
    logic            job_accept[`NUM_QUADS - 1:0]           ;
    logic [127:0]    job_parameters[`NUM_QUADS - 1:0]       ;
    logic            job_parameters_valid[`NUM_QUADS - 1:0] ;
    logic            job_fetch_request[`NUM_QUADS - 1:0]    ;
    logic            job_fetch_ack[`NUM_QUADS - 1:0]        ;
    logic            job_fetch_complete[`NUM_QUADS - 1:0]   ;      
    logic            job_complete[`NUM_QUADS - 1:0]         ;
    logic            job_complete_ack[`NUM_QUADS - 1:0]     ;
    logic            pip_primed[`NUM_QUADS - 1:0]           ;
    logic            all_pip_primed_arr[`NUM_QUADS - 1:0]   ;
    logic            all_pip_primed                         ;
    logic            pfb_loaded[`NUM_QUADS - 1:0]           ;
    logic            all_pfb_loaded_arr[`NUM_QUADS - 1:0]   ;
    logic            all_pfb_loaded                         ; 

    logic            cascade_in_valid[`NUM_QUADS - 1:0]     ;
    logic            cascade_in_ready[`NUM_QUADS - 1:0]     ;
    logic [15:0]     cascade_in_data[`NUM_QUADS - 1:0]      ;

    logic            cascade_out_valid[`NUM_QUADS - 1:0]    ;
    logic            cascade_out_ready[`NUM_QUADS - 1:0]    ;
    logic [15:0]      cascade_out_data[`NUM_QUADS - 1:0]     ;

    logic [  3:0]    config_valid[`NUM_QUADS - 1:0]         ;
    logic [  3:0]    config_accept[`NUM_QUADS - 1:0]        ;
    logic [127:0]    config_data[`NUM_QUADS - 1:0]          ;

    logic            weight_valid[`NUM_QUADS - 1:0]         ;
    logic            weight_ready[`NUM_QUADS - 1:0]         ;
    logic [127:0]    weight_data[`NUM_QUADS - 1:0]          ;

    logic            result_valid[`NUM_QUADS - 1:0]         ;
    logic            result_accept[`NUM_QUADS - 1:0]        ;
    logic [15:0]     result_data[`NUM_QUADS - 1:0]          ;

    logic            pixel_valid[`NUM_QUADS - 1:0]          ;
    logic            pixel_ready[`NUM_QUADS - 1:0]          ;
    logic [127:0]    pixel_data[`NUM_QUADS - 1:0]           ;
    
    logic            fifo_empty[`NUM_QUADS - 1:0]           ;


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
    genvar i;
    integer i6;
    integer i7;
    virtual cnn_layer_accel_quad_intf quad_intf_arr[0:`NUM_QUADS - 1];
    
    
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
    
    
    for(i = 0; i < `NUM_QUADS; i = i + 1) begin: QUAD
        cnn_layer_accel_quad
        i0_cnn_layer_accel_quad (
            .clk_if               ( clk_if                  ),  
            .clk_core             ( clk_core                ),  
            .rst                  ( rst                     ),  

            .job_start            ( job_start[i]            ),  
            .job_accept           ( job_accept[i]           ),  
            .job_parameters       ( job_parameters[i]       ),
            .job_parameters_valid ( job_parameters_valid[i] ),
            .job_fetch_request    ( job_fetch_request[i]    ),  
            .job_fetch_ack        ( job_fetch_ack[i]        ), 
            .job_fetch_complete   ( job_fetch_complete[i]   ),
            .job_complete         ( job_complete[i]         ),  
            .job_complete_ack     ( job_complete_ack[i]     ), 
            .pip_primed           ( pip_primed[i]           ),
            .all_pip_primed       ( all_pip_primed_arr[i]   ),
            .pfb_loaded           ( pfb_loaded[i]           ),
            .all_pfb_loaded       ( all_pfb_loaded_arr[i]   ),

            .cascade_in_valid     ( cascade_in_valid[i]     ),
            .cascade_in_ready     ( cascade_in_ready[i]     ),
            .cascade_in_data      ( cascade_in_data[i]      ),

            .cascade_out_valid    ( cascade_out_valid[i]    ),
            .cascade_out_ready    ( cascade_out_ready[i]    ),
            .cascade_out_data     ( cascade_out_data[i]     ),

            .config_valid         ( config_valid[i]         ),
            .config_accept        ( config_accept[i]        ),
            .config_data          ( config_data[i]          ),

            .weight_valid         ( weight_valid[i]         ),
            .weight_ready         ( weight_ready[i]         ),
            .weight_data          ( weight_data[i]          ),

            .result_valid         ( result_valid[i]         ),
            .result_accept        ( result_accept[i]        ),
            .result_data          ( result_data[i]          ),
     
            .pixel_valid          ( pixel_valid[i]          ),
            .pixel_ready          ( pixel_ready[i]          ),
            .pixel_data           ( pixel_data[i]           )
        );


        cnn_layer_accel_quad_intf
        i0_quad_intf (
           .clk_if                          ( clk_if                                                ),
           .clk_core                        ( clk_core                                              ),

           .job_start                       ( job_start[i]                                          ),
           .job_accept                      ( job_accept[i]                                         ),
           .job_parameters                  ( job_parameters[i]                                     ),
           .job_parameters_valid            ( job_parameters_valid[i]                               ),
           .job_fetch_request               ( job_fetch_request[i]                                  ),
           .job_fetch_ack                   ( job_fetch_ack[i]                                      ),
           .job_fetch_complete              ( job_fetch_complete[i]                                 ),
           .job_complete                    ( job_complete[i]                                       ),
           .job_complete_ack                ( job_complete_ack[i]                                   ),

           .config_valid                    ( config_valid[i]                                       ),
           .config_accept                   ( config_accept[i]                                      ),
           .config_data                     ( config_data[i]                                        ),

           .weight_valid                    ( weight_valid[i]                                       ),
           .weight_ready                    ( weight_ready[i]                                       ),
           .weight_data                     ( weight_data[i]                                        ),

           .result_valid                    ( result_valid[i]                                       ),
           .result_accept                   ( result_accept[i]                                      ),
           .result_data                     ( result_data[i]                                        ),

           .pixel_valid                     ( pixel_valid[i]                                        ),
           .pixel_ready                     ( pixel_ready[i]                                        ),
           .pixel_data                      ( pixel_data[i]                                         ),

           .output_row                      ( cnl_sc1_testbench.QUAD[i].i0_cnn_layer_accel_quad.output_row                    ),
           .output_col                      ( cnl_sc1_testbench.QUAD[i].i0_cnn_layer_accel_quad.output_col                    ),
           .output_depth                    ( cnl_sc1_testbench.QUAD[i].i0_cnn_layer_accel_quad.output_depth                  )
        );
        
        assign quad_intf_arr[i] = cnl_sc1_testbench.QUAD[i].i0_quad_intf;
        if(i == 0) begin
            assign all_pip_primed_arr[i] = all_pip_primed;
            assign all_pfb_loaded_arr[i] = all_pfb_loaded;
            assign cascade_in_valid[i]   = 1;
            assign cascade_in_data[i]    = 0;
        end else begin
            assign all_pip_primed_arr[i] = 0;
            assign all_pfb_loaded_arr[i] = 0;
        end

        if(i != (`NUM_QUADS - 1)) begin
            fifo_fwft #(
                .C_DATA_WIDTH( `PIXEL_WIDTH ),
                .C_FIFO_DEPTH( 5            )
            ) i0_fifo_fwft (
                .clk            ( clk_core                  ),
                .rst            ( rst                       ),
                .wren           ( cascade_out_valid[i]      ),
                .rden           ( cascade_in_ready[i + 1]   ),
                .datain         ( cascade_out_data[i]       ),
                .dataout        ( cascade_in_data[i + 1]    ),
                .empty          ( fifo_empty[i]             ),
                .full           (                           ),
                .almost_full    (                           )
            );
            
            assign cascade_in_valid[i + 1] = !fifo_empty[i];
        end
    end
    
    
    // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
    always@(*) begin
       for(i6 = 0; i6 < `NUM_QUADS; i6 = i6 + 1) begin
            all_pip_primed = pip_primed[i6] && 1;
       end
       for(i7 = 0; i7 < `NUM_QUADS; i7 = i7 + 1) begin
            all_pfb_loaded = pfb_loaded[i7] && 1;
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
        `scX_crtTestParams.num_kernels = 2;
        `scX_crtTestParams.stride = 1;
        `scX_crtTestParams.padding = 0;
        `scX_crtTestParams.upsample = FALSE;
        `scX_crtTestParams.kernel_size = 3;
        `scX_crtTestParams.conv_out_fmt = 1;
        `scX_crtTestParams.cascade = 0;
        test = new(`scX_genParams);
        test.createTest(`scX_crtTestParams);
        crt_test_queue.push_back(test);
        ti = ti + 1;
        
        // `scX_genParams = new();
        // `scX_genParams.ti = ti;  
        // `scX_crtTestParams.num_input_rows = 19;
        // `scX_crtTestParams.num_input_cols = 19;
        // `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // `scX_crtTestParams.num_kernels = 4;
        // `scX_crtTestParams.stride = 1;
        // `scX_crtTestParams.padding = 0;
        // `scX_crtTestParams.upsample = FALSE;
        // `scX_crtTestParams.kernel_size = 3;
        // `scX_crtTestParams.conv_out_fmt = 0;
        // `scX_crtTestParams.cascade = 0;
        // test = new(`scX_genParams);
        // test.createTest(`scX_crtTestParams);
        // crt_test_queue.push_back(test);
        // ti = ti + 1;
        
        
        // `scX_genParams = new();
        // `scX_genParams.ti = ti;  
        // `scX_crtTestParams.num_input_rows = 19;
        // `scX_crtTestParams.num_input_cols = 19;
        // `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        // `scX_crtTestParams.num_kernels = 4;
        // `scX_crtTestParams.stride = 1;
        // `scX_crtTestParams.padding = 0;
        // `scX_crtTestParams.upsample = FALSE;
        // `scX_crtTestParams.kernel_size = 3;
        // `scX_crtTestParams.conv_out_fmt = 1;
        // `scX_crtTestParams.cascade = 1;
        // test = new(`scX_genParams);
        // test.createTest(`scX_crtTestParams);
        // crt_test_queue.push_back(test);
        // ti = ti + 1;
        
        
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
    