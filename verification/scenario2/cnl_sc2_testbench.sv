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
    
    logic [`SLV_DBG_RDADDR_WIDTH - 1:0]   slv_dbg_rdAddr                     ;
    logic                                 slv_dbg_rdAddr_valid               ;
    logic                                 slv_dbg_rdAck                      ;
    logic [31:0]                          slv_dbg_data                       ;


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
        
        .slv_dbg_rdAddr                  ( slv_dbg_rdAddr                                        ),  
        .slv_dbg_rdAddr_valid            ( slv_dbg_rdAddr_valid                                  ),
        .slv_dbg_rdAck                   ( slv_dbg_rdAck                                         ),
        .slv_dbg_data                    ( slv_dbg_data                                          ),
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

        .slv_dbg_rdAddr                  ( slv_dbg_rdAddr                                        ),  
        .slv_dbg_rdAddr_valid            ( slv_dbg_rdAddr_valid                                  ),
        .slv_dbg_rdAck                   ( slv_dbg_rdAck                                         ),
        .slv_dbg_data                    ( slv_dbg_data                                          ),
        
        .output_row                      (                                                       ),
        .output_col                      (                                                       ),
        .output_depth                    (                                                       )
    );


    
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
        `scX_genParams = new();
        `scX_genParams.ti = ti;  
        `scX_crtTestParams.num_input_rows = 19;
        `scX_crtTestParams.num_input_cols = 19;
        `scX_crtTestParams.depth = `NUM_CE_PER_QUAD;
        `scX_crtTestParams.num_kernels = 4;
        `scX_crtTestParams.stride = 1;
        `scX_crtTestParams.padding = 0;
        `scX_crtTestParams.upsample = FALSE;
        `scX_crtTestParams.kernel_size = 3;
        `scX_crtTestParams.conv_out_fmt = 0;
        `scX_crtTestParams.cascade = 0;
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

       
        env = new(i0_synch_intf, i0_quad_intf, crt_test_queue.size() + C_NUM_RAND_TESTS, crt_test_queue, awe_buf_intf_arr, `NUM_AWE, FALSE, FALSE, test_bi, test_ei, outputDir);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    