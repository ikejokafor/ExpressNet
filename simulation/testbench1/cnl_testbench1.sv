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
module cnl_testbench1;
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    `include "cnl_tb1_defs.svh"
    `include "cnn_layer_accel_defs.vh"
    `include "cnn_layer_accel_verif_defs.svh"
    `include "cnl_tb1_generator.sv"
    `include "cnl_tb1_driver.sv"
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
    logic            job_parameters_valid   ;

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
    `cnl_tbX_generator test;
    `tbX_genParams_t `scX_genParams;
    `tbX_testParams_t `scX_testParams;
    int test_bi;
    int test_ei;
    string outputDir;
    `tbX_drvParams_t drvParams;
    `cnl_scX_driver #(
        .C_PERIOD_100MHz ( C_PERIOD_100MHz ), 
        .C_PERIOD_500MHz ( C_PERIOD_500MHz ) 
    ) m_driver;    
    mailbox agent2driverMB; 
    mailbox DUT_rdy;
    
    
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
        .job_parameters_valid ( job_parameters_valid    ),
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
        .clk_if                          ( clk_if                  ),
        .clk_core                        ( clk_core                ),

        .job_start                       ( job_start               ),
        .job_accept                      ( job_accept              ),
        .job_parameters                  ( job_parameters          ),
        .job_parameters_valid            ( job_parameters_valid    ),
        .job_fetch_request               ( job_fetch_request       ),
        .job_fetch_ack                   ( job_fetch_ack           ),
        .job_fetch_complete              ( job_fetch_complete      ),
        .job_complete                    ( job_complete            ),
        .job_complete_ack                ( job_complete_ack        ),

        .config_valid                    ( config_valid            ),
        .config_accept                   ( config_accept           ),
        .config_data                     ( config_data             ),

        .weight_valid                    ( weight_valid            ),
        .weight_ready                    ( weight_ready            ),
        .weight_data                     ( weight_data             ),

        .result_valid                    ( result_valid            ),
        .result_accept                   ( result_accept           ),
        .result_data                     ( result_data             ),

        .pixel_valid                     ( pixel_valid             ),
        .pixel_ready                     ( pixel_ready             ),
        .pixel_data                      ( pixel_data              )
    );


    
    initial begin
        // BEGIN Logic ------------------------------------------------------------------------------------------------------------------------------
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
        
        `tb_genParams = new();
        `tb_genParams.ti = 0;
        `tb_testParams = new();
        `tb_testParams.num_input_rows = 19;
        `tb_testParams.num_input_cols = 19;
        `tb_testParams.depth = `NUM_CE_PER_QUAD;
        `tb_testParams.num_kernels = 4;
        `tb_testParams.stride = 1;
        `tb_testParams.padding = 0;
        `tb_testParams.upsample = FALSE;
        `tb_testParams.kernel_size = 3;
        `tb_testParams.conv_out_fmt = 0;
        `tb_testParams.cascade = 0;
        `tb_testParams.master_quad = 1;
        `tb_testParams.cascade = 0;
        `tb_testParams.actv = 0;
        test = new(`scX_genParams);
        test.createTest(`scX_testParams);
  
        agent2driverMB = new();
        DUT_rdy = new();
        drvParams.agent2driverMB = agent2driverMB;
        drvParams.quad_intf = i0_quad_intf;
        drvParams.num_mon = 1;
        drvParams.numTests = 1;
        drvParams.runForever = FALSE;
        drvParams.DUT_rdy = DUT_rdy;
        drvParams.model_delay = FALSE;
        drvParams.test_bi = test_bi;
        drvParams.test_ei = test_ei;
        drvParams.synch_intf = m_synch_intf;
        drvParams.outputDir = m_outputDir;
        fork
            driver = new(drvParams);
        join_none
        agent2driverMB.put(test);
        // END Logic --------------------------------------------------------------------------------------------------------------------------------
    end
    
    
endmodule
    