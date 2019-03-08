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
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnl_sc0_generator.sv"
`include "cnl_sc0_environment.sv"
`include "cnn_layer_accel_quad_intf.sv"


function cnl_sc0_generator createTest(int num_input_rows, int num_input_cols, int depth, int num_kernels, int kernel_size, int stride, int padding);
    cnl_sc0_generator   test        ;
    int i                           ;
    int j                           ;
    int k                           ;
    
    
    test = new();
    test.m_num_input_rows = num_input_rows;
    test.m_num_input_cols = num_input_cols;
    test.m_depth = depth;
    test.m_num_kernels = num_kernels;
    test.m_kernel_size = kernel_size;
    test.m_stride = stride;
    test.m_padding = padding;
    
    
    test.m_pix_data = new[depth * num_input_rows * num_input_cols];
    for(k = 0; k < depth; k = k + 1) begin
        for(i = 0; i < num_input_rows; i = i + 1) begin
            for(j = 0; j < num_input_cols; j = j + 1) begin
                test.m_pix_data[(k * num_input_rows + i) * num_input_cols + j] = $urandom_range(1, 10);
            end
        end
    end

    
    test.m_kernel_data = new[num_kernels * depth * `KERNEL_3x3_COUNT_FULL_CFG];
    for(k = 0; k < num_kernels; k = k + 1) begin
        for(i = 0; i < depth; i = i + 1) begin
            for(j = 0; j < `KERNEL_3x3_COUNT_FULL_CFG; j = j + 1) begin
                if (j != `KERNEL_3x3_COUNT_FULL_CFG -1 ) begin
                    test.m_kernel_data[(k * depth + i) * `KERNEL_3x3_COUNT_FULL_CFG + j] = $urandom_range(1, 10);
                end else begin
                    test.m_kernel_data[(k * depth + i) * `KERNEL_3x3_COUNT_FULL_CFG + j] =  0;
                end
            end
        end
    end


    $display("// Created Test ----------------------------------------------");
    $display("// Num Rows:            %d", test.m_num_input_rows             );
    $display("// Num Cols:            %d", test.m_num_input_cols             );
    $display("// Num Depth:           %d", test.m_depth                      );
    $display("// Num kernels:         %d", test.m_num_kernels                );
    $display("// Num Kernel size:     %d", test.m_kernel_size                );
    $display("// Stride               %d", test.m_stride                     );
    $display("// Padding:             %d", test.m_padding                    );
    $display("// Pixel data size:     %d", test.m_pix_data.size()            );
    $display("// Kernel data size     %d", test.m_kernel_data.size()         );
    $display("// Created Test ----------------------------------------------");
    $display("\n");
    
    
    return test;
endfunction: createTest


module testbench;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    parameter C_PERIOD_100MHz = 10;    
    parameter C_PERIOD_500MHz = 2; 
    parameter C_NUM_TESTS = 1;
    

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
    cnl_sc0_environment #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) env;
    cnl_sc0_generator test;
    sc0_genParams_t genParams;
    cnl_sc0_generator test_queue[$];

    
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
        test = createTest(20, 20, `NUM_CE_PER_QUAD, 5, 3, 1, 0);
        test_queue.push_back(test);
        test = createTest(25, 25, `NUM_CE_PER_QUAD, 5, 3, 1, 0);
        test_queue.push_back(test);
        env = new(i0_quad_intf, test_queue.size() + C_NUM_TESTS, test_queue);
        env.build();
        fork
            env.run();
        join_none
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    