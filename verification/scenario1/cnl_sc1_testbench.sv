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


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnl_sc1_generator.sv"
`include "cnl_sc1_environment.sv"
`include "cnn_layer_accel_quad_intf.sv"


module testbench;
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
    cnl_sc1_environment #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) env;
    cnl_sc1_generator test;
    sc1_crtTestParams_t sc1_crtTestParams;
    cnl_sc1_generator test_queue[$];

    
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
       .clk_if              ( clk_if                ),
       .clk_core            ( clk_core              ),
       .rst                 ( rst                   ),

       .job_start           ( job_start             ),
       .job_accept          ( job_accept            ),
       .job_parameters      ( job_parameters        ),
       .job_fetch_request   ( job_fetch_request     ),
       .job_fetch_ack       ( job_fetch_ack         ),
       .job_fetch_complete  ( job_fetch_complete    ),
       .job_complete        ( job_complete          ),
       .job_complete_ack    ( job_complete_ack      ),

       .cascade_in_valid    ( cascade_in_valid      ),
       .cascade_in_ready    ( cascade_in_ready      ),
       .cascade_in_data     ( cascade_in_data       ),

       .cascade_out_valid   ( cascade_out_valid     ),
       .cascade_out_ready   ( cascade_out_ready     ),
       .cascade_out_data    ( cascade_out_data      ),

       .config_valid        ( config_valid          ),
       .config_accept       ( config_accept         ),
       .config_data         ( config_data           ),

       .weight_valid        ( weight_valid          ),
       .weight_ready        ( weight_ready          ),
       .weight_data         ( weight_data           ),

       .result_valid        ( result_valid          ),
       .result_accept       ( result_accept         ),
       .result_data         ( result_data           ),

       .pixel_valid         ( pixel_valid           ),
       .pixel_ready         ( pixel_ready           ),
       .pixel_data          ( pixel_data            )
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

    
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
        sc1_crtTestParams = new();
        
        
        sc1_crtTestParams.num_input_rows = 20;
        sc1_crtTestParams.num_input_cols = 20;
        sc1_crtTestParams.depth = `NUM_CE_PER_QUAD;
        sc1_crtTestParams.num_kernels = 5;
        sc1_crtTestParams.kernel_size = 3;
        sc1_crtTestParams.stride = 1;
        sc1_crtTestParams.padding = 0;
        test = new();
        test.createTest(sc1_crtTestParams);
        test_queue.push_back(test);
        
        
        sc1_crtTestParams.num_input_rows = 25;
        sc1_crtTestParams.num_input_cols = 25;
        sc1_crtTestParams.depth = `NUM_CE_PER_QUAD;
        sc1_crtTestParams.num_kernels = 5;
        sc1_crtTestParams.kernel_size = 3;
        sc1_crtTestParams.stride = 1;
        sc1_crtTestParams.padding = 0;
        test = new();
        test.createTest(sc1_crtTestParams);
        test_queue.push_back(test);
        
        
        env = new(i0_quad_intf, test_queue.size() + C_NUM_RAND_TESTS, test_queue);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    