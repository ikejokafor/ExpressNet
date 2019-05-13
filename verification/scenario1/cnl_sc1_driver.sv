`ifndef	__CNL_SC1_DRIVER__
`define	__CNL_SC1_DRIVER__


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
// Additional Comments:     This class is responsible for receiving test data from agent and passing the test to the DUT
//                              by driving the DUT's appropiate signals
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "driver.sv"
`include "cnl_sc1_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_quad_intf.sv"
`include "cnl_sc1_generator.sv"


class `scX_drvParams_t #(
    parameter C_NUM_QUADS = 1;
) extends drvParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf_arr[C_NUM_QUADS - 1:0];
endclass: `scX_drvParams_t


class `cnl_scX_driver #( 
    parameter C_PERIOD_100MHz   , 
    parameter C_PERIOD_500MHz   ,
    parameter C_NUM_QUADS
) extends driver;
    extern function new(drvParams_t drvParams = null);
    extern task run();
    extern task rnd_delay_clk_if(int delay_amt);
    extern task rnd_delay_clk_core(int delay_amt);
    

    virtual cnn_layer_accel_quad_intf m_quad_intf_arr[C_NUM_QUADS - 1:0];
    virtual cnn_layer_accel_synch_intf m_synch_intf;
endclass: `cnl_scX_driver


function `cnl_scX_driver::new(drvParams_t drvParams = null);
    `scX_drvParams_t `scX_drvParams;

    
    if(drvParams != null) begin
        $cast(`scX_drvParams, drvParams);
        m_quad_intf_arr = `scX_drvParams.quad_intf_arr;
        m_agent2driverMB = `scX_drvParams.agent2driverMB;
        m_num_mon = `scX_drvParams.num_mon;
        m_numTests = `scX_drvParams.numTests;
        m_DUT_rdy = `scX_drvParams.DUT_rdy;
        m_runForever = `scX_drvParams.runForever;
        m_model_delay = `scX_drvParams.model_delay;
        m_test_bi = `scX_drvParams.test_bi;
        m_test_ei = `scX_drvParams.test_ei;       
        m_outputDir = `scX_drvParams.outputDir;
        m_synch_intf = `scX_drvParams.synch_intf;
    end
endfunction: new


task `cnl_scX_driver::run();
    `cnl_scX_generator test;
    int i;
    int j;
    int n;
    int t;
    int kernel_group_cfg;
    int signal;
    int qi;

    for(qi = 0; qi < C_NUM_QUADS; qi = qi + 1) begin
        m_quad_intf_arr[qi].clk_if_cb.job_start             <= 0;
        m_quad_intf_arr[qi].clk_if_cb.job_fetch_ack         <= 0;
        m_quad_intf_arr[qi].clk_if_cb.job_complete_ack      <= 0;
        m_quad_intf_arr[qi].clk_if_cb.job_fetch_complete    <= 0;
        m_quad_intf_arr[qi].clk_core_cb.weight_valid        <= 0;
        m_quad_intf_arr[qi].clk_core_cb.weight_data         <= 0;
        m_quad_intf_arr[qi].clk_if_cb.pixel_valid           <= 0;
        m_quad_intf_arr[qi].clk_if_cb.pixel_data            <= 0;
        m_quad_intf_arr[qi].clk_if_cb.config_data           <= 0;
        m_quad_intf_arr[qi].clk_if_cb.config_valid          <= 0;
        m_quad_intf_arr[qi].job_start                       <= 0;
        m_quad_intf_arr[qi].job_fetch_ack                   <= 0;
        m_quad_intf_arr[qi].job_complete_ack                <= 0;
        m_quad_intf_arr[qi].job_fetch_complete              <= 0;
        m_quad_intf_arr[qi].weight_valid                    <= 0;
        m_quad_intf_arr[qi].weight_data                     <= 0;
        m_quad_intf_arr[qi].pixel_valid                     <= 0;
        m_quad_intf_arr[qi].pixel_data                      <= 0;
        m_quad_intf_arr[qi].config_data                     <= 0;
        m_quad_intf_arr[qi].config_valid                    <= 0;
    end
    
    
    m_synch_intf.rst <= 1;
    #(C_PERIOD_100MHz * 10) m_synch_intf.rst <= 0;    // 10 cycle rst asserted is arbitrairy
    
    
    t = 0;
    m_DUT_rdy.put(signal);
    if(m_test_ei != -1) begin
        m_numTests = (m_test_ei - m_test_bi) + 1;
    end else begin
        m_test_ei = m_numTests - 1;
    end
    while(t < m_numTests) begin
        @(m_synch_intf.clk_if_cb);
        if(m_agent2driverMB.try_get(test)) begin
            $display("// Started Running Test -----------------------------------------");
            $display("// At Time:               %0t", $time                             );       
            $display("// Test Index:            %0d", test.m_ti                         );
            $display("// Started Running Test -----------------------------------------");
            $display("\n");


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            $display("// --------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// Test Index: %0d", test.m_ti                                    );
            $display("// Started Sending Quad Config"                                   ); 
            $display("// --------------------------------------------------------------");
            $display("\n");
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + 1) begin
                m_quad_intf_arr[qi].pix_seq_data_full_count_cfg     = test.m_pix_seq_data_full_count_cfg;
                m_quad_intf_arr[qi].num_output_rows_cfg             = test.m_num_output_rows_cfg;
                m_quad_intf_arr[qi].num_output_cols_cfg             = test.m_num_output_cols_cfg;             
                m_quad_intf_arr[qi].pfb_full_count_cfg              = test.m_pfb_full_count_cfg;         
                m_quad_intf_arr[qi].stride_cfg                      = test.m_stride;
                m_quad_intf_arr[qi].padding_cfg                     = test.m_padding;
                m_quad_intf_arr[qi].upsample_cfg                    = test.m_upsample;
                m_quad_intf_arr[qi].num_expd_input_cols_cfg         = test.m_num_expd_input_cols_cfg;
                m_quad_intf_arr[qi].num_expd_input_rows_cfg         = test.m_num_expd_input_rows_cfg;
                m_quad_intf_arr[qi].crpd_input_col_start_cfg        = test.m_crpd_input_col_start_cfg;
                m_quad_intf_arr[qi].crpd_input_row_start_cfg        = test.m_crpd_input_row_start_cfg;
                m_quad_intf_arr[qi].crpd_input_col_end_cfg          = test.m_crpd_input_col_end_cfg;
                m_quad_intf_arr[qi].crpd_input_row_end_cfg          = test.m_crpd_input_row_end_cfg;
                m_quad_intf_arr[qi].num_kernels_cfg                 = test.m_num_kernels_cfg;
                m_quad_intf_arr[qi].conv_out_fmt_cfg                = test.m_conv_out_fmt;
                m_quad_intf_arr[qi].job_start                       <= 0;
                m_quad_intf_arr[qi].job_fetch_ack                   <= 0;
                m_quad_intf_arr[qi].job_complete_ack                <= 0;
                m_quad_intf_arr[qi].job_fetch_complete              <= 0;
                m_quad_intf_arr[qi].weight_valid                    <= 0;
                m_quad_intf_arr[qi].weight_data                     <= 0;
                m_quad_intf_arr[qi].pixel_valid                     <= 0;
                m_quad_intf_arr[qi].pixel_data                      <= 0;
                m_quad_intf_arr[qi].config_data                     <= 0;
                m_quad_intf_arr[qi].config_valid                    <= 0;
            end
            $display("// --------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// Test Index: %0d", test.m_ti                                    );            
            $display("// Finished Sending Quad Config"                                  ); 
            $display("// --------------------------------------------------------------");
            $display("\n");            
            // END logic ----------------------------------------------------------------------------------------------------------------------------
            

            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + 1) begin
                // send pixel sequence configuration data down for input maps
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                  
                $display("// Started Sending Pixel Sequence Config"                         ); 
                $display("// --------------------------------------------------------------");
                $display("\n"); 
                i = 1;
                @(m_quad_intf_arr[qi].clk_if_cb);
                m_quad_intf_arr[qi].clk_if_cb.config_data[127:112]    <= test.m_pix_seq_data_sim[(0 * 8) + 7]; 
                m_quad_intf_arr[qi].clk_if_cb.config_data[111:96]     <= test.m_pix_seq_data_sim[(0 * 8) + 6];     
                m_quad_intf_arr[qi].clk_if_cb.config_data[95:80]      <= test.m_pix_seq_data_sim[(0 * 8) + 5];     
                m_quad_intf_arr[qi].clk_if_cb.config_data[79:64]      <= test.m_pix_seq_data_sim[(0 * 8) + 4];     
                m_quad_intf_arr[qi].clk_if_cb.config_data[63:48]      <= test.m_pix_seq_data_sim[(0 * 8) + 3];
                m_quad_intf_arr[qi].clk_if_cb.config_data[47:32]      <= test.m_pix_seq_data_sim[(0 * 8) + 2];     
                m_quad_intf_arr[qi].clk_if_cb.config_data[31:16]      <= test.m_pix_seq_data_sim[(0 * 8) + 1];     
                m_quad_intf_arr[qi].clk_if_cb.config_data[15:0]       <= test.m_pix_seq_data_sim[(0 * 8) + 0];
                m_quad_intf_arr[qi].clk_if_cb.config_valid[0]         <= 1;
                while(i < `MAX_NUM_INPUT_COLS) begin
                    @(m_quad_intf_arr[qi].clk_if_cb);
                    if($urandom_range(0, 1) && m_model_delay) begin
                        m_quad_intf_arr[qi].clk_if_cb.config_valid[0]         <= 0;
                        rnd_delay_clk_if(5);
                        m_quad_intf_arr[qi].clk_if_cb.config_data[127:112]    <= test.m_pix_seq_data_sim[(i * 8) + 7]; 
                        m_quad_intf_arr[qi].clk_if_cb.config_data[111:96]     <= test.m_pix_seq_data_sim[(i * 8) + 6];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[95:80]      <= test.m_pix_seq_data_sim[(i * 8) + 5];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[79:64]      <= test.m_pix_seq_data_sim[(i * 8) + 4];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[63:48]      <= test.m_pix_seq_data_sim[(i * 8) + 3];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[47:32]      <= test.m_pix_seq_data_sim[(i * 8) + 2];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[31:16]      <= test.m_pix_seq_data_sim[(i * 8) + 1];     
                        m_quad_intf_arr[qi].clk_if_cb.config_data[15:0]       <= test.m_pix_seq_data_sim[(i * 8) + 0];
                        m_quad_intf_arr[qi].clk_if_cb.config_valid[0]         <= 1;
                    end
                    wait(m_quad_intf_arr[qi].clk_if_cb.config_accept[0])
                    m_quad_intf_arr[qi].clk_if_cb.config_data[127:112]    <= test.m_pix_seq_data_sim[(i * 8) + 7]; 
                    m_quad_intf_arr[qi].clk_if_cb.config_data[111:96]     <= test.m_pix_seq_data_sim[(i * 8) + 6];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[95:80]      <= test.m_pix_seq_data_sim[(i * 8) + 5];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[79:64]      <= test.m_pix_seq_data_sim[(i * 8) + 4];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[63:48]      <= test.m_pix_seq_data_sim[(i * 8) + 3];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[47:32]      <= test.m_pix_seq_data_sim[(i * 8) + 2];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[31:16]      <= test.m_pix_seq_data_sim[(i * 8) + 1];     
                    m_quad_intf_arr[qi].clk_if_cb.config_data[15:0]       <= test.m_pix_seq_data_sim[(i * 8) + 0];
                    i = i + 1;
                end
                @(m_quad_intf_arr[qi].clk_if_cb);
                m_quad_intf_arr[qi].clk_if_cb.config_valid[0]             <= 0;
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                 
                $display("// Finished Sending Pixel Sequence Config"                        ); 
                $display("// --------------------------------------------------------------");
                $display("\n");
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            @(m_quad_intf.clk_core_cb);
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + `NUM_CE_PER_QUAD) begin
                // send kernel data down
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    ); 
                $display("// Quad Index: %0d", qi / `NUM_CE_PER_QUAD                        );
                $display("// Started Sending Kernel Data"                                   ); 
                $display("// --------------------------------------------------------------");
                $display("\n"); 
                i = 1;
                m_quad_intf_arr[qi].clk_core_cb.weight_data[127:112]                <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 7) * `KERNEL_3x3_COUNT_FULL) + 0]; 
                m_quad_intf_arr[qi].clk_core_cb.weight_data[111:96]                 <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 6) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[95:80]                  <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 5) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[79:64]                  <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 4) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[63:48]                  <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 3) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[47:32]                  <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 2) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[31:16]                  <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 1) * `KERNEL_3x3_COUNT_FULL) + 0];     
                m_quad_intf_arr[qi].clk_core_cb.weight_data[15:0]                   <= test.m_kernel_data_sim[(qi * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 0) * `KERNEL_3x3_COUNT_FULL) + 0];
                m_quad_intf_arr[qi].clk_core_cb.weight_valid                        <= 1;      
                kernel_group_cfg                                                    = 0;
                m_quad_intf_arr[qi].clk_if_cb.config_data                           <= 0;
                while(kernel_group_cfg < test.m_num_kernels) begin
                    while(i < `KERNEL_3x3_COUNT_FULL) begin
                        @(m_quad_intf_arr[qi].clk_core_cb);
                        if($urandom_range(0, 1) && m_model_delay) begin
                            m_quad_intf_arr[qi].clk_core_cb.weight_valid            <= 0;
                            rnd_delay_clk_core(5);
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[127:112]    <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 7) * `KERNEL_3x3_COUNT_FULL) + i]; 
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[111:96]     <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 6) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[95:80]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 5) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[79:64]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 4) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[63:48]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 3) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[47:32]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 2) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[31:16]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 1) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[15:0]       <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 0) * `KERNEL_3x3_COUNT_FULL) + i];
                            m_quad_intf_arr[qi].clk_core_cb.weight_valid            <= 1;
                        end
                        wait(m_quad_intf_arr[qi].clk_core_cb.weight_ready) begin
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[127:112]    <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 7) * `KERNEL_3x3_COUNT_FULL) + i]; 
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[111:96]     <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 6) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[95:80]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 5) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[79:64]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 4) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[63:48]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 3) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[47:32]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 2) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[31:16]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 1) * `KERNEL_3x3_COUNT_FULL) + i];     
                            m_quad_intf_arr[qi].clk_core_cb.weight_data[15:0]       <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + ((qi + 0) * `KERNEL_3x3_COUNT_FULL) + i];
                            i = i + 1;
                        end
                    end
                    kernel_group_cfg = kernel_group_cfg + 1;
                    m_quad_intf_arr[qi].clk_if_cb.config_data <=   {   
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg,
                                                                kernel_group_cfg
                                                            };
                    i = 0;
                end
                @(m_quad_intf_arr[qi].clk_core_cb);
                m_quad_intf_arr[qi].clk_core_cb.weight_valid <= 0;  
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi / `NUM_CE_PER_QUAD                        );                
                $display("// Finished Sending kernel Data"                                  ); 
                $display("// --------------------------------------------------------------");
                $display("\n"); 
                // END logic ----------------------------------------------------------------------------------------------------------------------------
            end


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + 1) begin
                // start processing
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                
                $display("// Sent Job Accept"                                               ); 
                $display("// --------------------------------------------------------------");
                $display("\n");   
                @(m_quad_intf_arr[qi].clk_core_cb);
                m_quad_intf_arr[qi].clk_if_cb.job_start <= 1;
                forever begin
                    @(m_quad_intf_arr[qi].clk_if_cb);
                    if(m_quad_intf_arr[qi].clk_if_cb.job_accept) begin
                        break;
                    end
                end
                @(m_quad_intf_arr[qi].clk_if_cb);
                m_quad_intf_arr[qi].clk_if_cb.job_start <= 0;
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                
                $display("// Recieved Job Accept"                                           );
                $display("// --------------------------------------------------------------");
                $display("\n");   
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------

            
            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            $display("// --------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// Test Index: %0d", test.m_ti                                    );
            $display("// Began Sending Pixel Data"                                      ); 
            $display("// --------------------------------------------------------------");
            $display("\n");   
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + `NUM_CE_PER_QUAD) begin
                i = 0; 
                j = 0;
                while(i < (test.m_num_input_rows * test.m_num_input_cols)) begin
                    @(m_quad_intf_arr[qi].clk_if_cb);
                    if(m_quad_intf_arr[qi].clk_if_cb.job_fetch_request) begin
                        $display("// --------------------------------------------------------------");
                        $display("// At Time: %0t", $time                                           );
                        $display("// Test Index: %0d", test.m_ti                                    );
                        $display("// Quad Index: %0d", qi / `NUM_CE_PER_QUAD                        );  
                        $display("// Started Servicing Job Fetch Request"                           ); 
                        $display("// --------------------------------------------------------------");
                        $display("\n");
                        m_quad_intf_arr[qi].clk_if_cb.job_fetch_ack <= 1;                
                        @(m_quad_intf_arr[qi].clk_if_cb);
                        m_quad_intf_arr[qi].clk_if_cb.job_fetch_ack         <= 0;
                        m_quad_intf_arr[qi].clk_if_cb.pixel_valid           <= 1;
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[127:112]   <= test.m_pix_data_sim[((qi + 7) * (test.m_num_input_rows * test.m_num_input_cols)) + i];
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[111:96]    <= test.m_pix_data_sim[((qi + 6) * (test.m_num_input_rows * test.m_num_input_cols)) + i];          
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[95:80]     <= test.m_pix_data_sim[((qi + 5) * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[79:64]     <= test.m_pix_data_sim[((qi + 4) * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[63:48]     <= test.m_pix_data_sim[((qi + 3) * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[47:32]     <= test.m_pix_data_sim[((qi + 2) * (test.m_num_input_rows * test.m_num_input_cols)) + i];            
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[31:16]     <= test.m_pix_data_sim[((qi + 1) * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                        m_quad_intf_arr[qi].clk_if_cb.pixel_data[15:0]      <= test.m_pix_data_sim[((qi + 0) * (test.m_num_input_rows * test.m_num_input_cols)) + i];
                        j = i + 1;
                        n = 1;
                        while(n < test.m_num_input_cols) begin
                            @(m_quad_intf_arr[qi].clk_if_cb);
                            if($urandom_range(0, 1) && m_model_delay) begin
                                m_quad_intf_arr[qi].clk_if_cb.pixel_valid          <= 0;
                                rnd_delay_clk_if(5);
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[127:112]  <= test.m_pix_data_sim[((qi + 7) * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[111:96]   <= test.m_pix_data_sim[((qi + 6) * (test.m_num_input_rows * test.m_num_input_cols)) + j];          
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[95:80]    <= test.m_pix_data_sim[((qi + 5) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[79:64]    <= test.m_pix_data_sim[((qi + 4) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[63:48]    <= test.m_pix_data_sim[((qi + 3) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[47:32]    <= test.m_pix_data_sim[((qi + 2) * (test.m_num_input_rows * test.m_num_input_cols)) + j];            
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[31:16]    <= test.m_pix_data_sim[((qi + 1) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[15:0]     <= test.m_pix_data_sim[((qi + 0) * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                                m_quad_intf_arr[qi].clk_if_cb.pixel_valid          <= 1;
                            end
                            wait(m_quad_intf_arr[qi].clk_if_cb.pixel_ready) begin
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[127:112]  <= test.m_pix_data_sim[((qi + 7) * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[111:96]   <= test.m_pix_data_sim[((qi + 6) * (test.m_num_input_rows * test.m_num_input_cols)) + j];          
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[95:80]    <= test.m_pix_data_sim[((qi + 5) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[79:64]    <= test.m_pix_data_sim[((qi + 4) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[63:48]    <= test.m_pix_data_sim[((qi + 3) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[47:32]    <= test.m_pix_data_sim[((qi + 2) * (test.m_num_input_rows * test.m_num_input_cols)) + j];            
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[31:16]    <= test.m_pix_data_sim[((qi + 1) * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                                m_quad_intf_arr[qi].clk_if_cb.pixel_data[15:0]     <= test.m_pix_data_sim[((qi + 0) * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                                j = j + 1;
                                n = n + 1;
                            end
                        end
                        @(m_quad_intf_arr[qi].clk_if_cb);
                        m_quad_intf_arr[qi].clk_if_cb.job_fetch_complete    <= 1;
                        m_quad_intf_arr[qi].clk_if_cb.pixel_valid           <= 0;
                        @(m_quad_intf_arr[qi].clk_if_cb);
                        m_quad_intf_arr[qi].clk_if_cb.job_fetch_complete    <= 0;
                        i = i + test.m_num_input_cols;
                        $display("// --------------------------------------------------------------");
                        $display("// At Time: %0t", $time                                           );
                        $display("// Test Index: %0d", test.m_ti                                    ); 
                        $display("// Quad Index: %0d", qi / `NUM_CE_PER_QUAD                        );                          
                        $display("// Finished Servicing Job Fetch Request"                          ); 
                        $display("// --------------------------------------------------------------");
                        $display("\n");
                    end
                end
            end
            $display("// --------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// Test Index: %0d", test.m_ti                                    );            
            $display("// Finished Sending Pixel Data"                                   ); 
            $display("// --------------------------------------------------------------");
            $display("\n");
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            $display("// --------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// Test Index: %0d", test.m_ti                                    );
            $display("// Waiting for Job Complete"                                      ); 
            $display("// --------------------------------------------------------------");
            $display("\n");  
            for(qi = 0; qi < C_NUM_QUADS; qi = qi + 1) begin         
                forever begin
                    @(m_quad_intf_arr[qi].clk_if_cb);
                    if(m_quad_intf_arr[qi].clk_if_cb.job_complete) begin
                        m_quad_intf_arr[qi].clk_if_cb.job_complete_ack <= 1;
                        break;
                    end
                end
                $display("// --------------------------------------------------------------");
                $display("// At Time: %0t", $time                                           );
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                    
                $display("// Recieved Job Complete"                                         ); 
                $display("// --------------------------------------------------------------");
                $display("\n");   
                @(m_quad_intf_arr[qi].clk_if_cb);
                m_quad_intf_arr[qi].clk_if_cb.job_complete_ack <= 0;
                $display("// Finished Test ------------------------------------------------");
                $display("// At Time: %0t", $time                                           );            
                $display("// Test Index: %0d", test.m_ti                                    );
                $display("// Quad Index: %0d", qi                                           );                    
                $display("// Finished Test ------------------------------------------------");
                $display("\n");
            end
            m_DUT_rdy.put(signal);
            $display("//---------------------------------------------------------------");
            $display("// At Time: %0t", $time                                           );
            $display("// DUT ready for next test"                                       );
            $display("//---------------------------------------------------------------");
            $display("\n");
            
            if(!m_runForever) begin
                t = t + 1;
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------
        end
    end
endtask: run


task `cnl_scX_driver::rnd_delay_clk_if(int delay_amt);
    repeat($urandom_range(1, delay_amt)) begin
        @(m_quad_intf.clk_if_cb);
    end
endtask: rnd_delay_clk_if


task `cnl_scX_driver::rnd_delay_clk_core(int delay_amt);
    repeat($urandom_range(1, delay_amt)) begin
        @(m_quad_intf.clk_core_cb);
    end
endtask: rnd_delay_clk_core


`endif