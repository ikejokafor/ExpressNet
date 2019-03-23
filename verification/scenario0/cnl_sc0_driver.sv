`ifndef	__CNL_SC0_DRIVER__
`define	__CNL_SC0_DRIVER__


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
`include "cnl_sc0_generator.sv"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "cnn_layer_accel_quad_intf.sv"


class sc0_drvParams_t extends drvParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    int numTests;
endclass: sc0_drvParams_t


class cnl_sc0_driver extends driver;
    extern function new(drvParams_t drvParams = null);
    extern task run();

    virtual cnn_layer_accel_quad_intf m_quad_intf;
    int m_numTests;
endclass: cnl_sc0_driver


function cnl_sc0_driver::new(drvParams_t drvParams = null);
    sc0_drvParams_t sc0_drvParams;

    
    if(drvParams != null) begin
        $cast(sc0_drvParams, drvParams);
        m_quad_intf = sc0_drvParams.quad_intf;
        m_agent2driverMB = sc0_drvParams.agent2driverMB;
        m_mon_rdy_arr = sc0_drvParams.mon_rdy_arr;
        m_num_mon = sc0_drvParams.num_mon;
        m_numTests = sc0_drvParams.numTests;
    end
endfunction: new


task cnl_sc0_driver::run();
    cnl_sc0_generator test;
    int i;
    int j;
    int n;
    int t;
    int kernel_group_cfg;
    int signal;
    shortreal tmp_m_num_input_cols;
    shortreal tmp_pix_seq_data_full_count_cfg;


    m_quad_intf.clk_if_cb.job_start             <= 0;
    m_quad_intf.clk_if_cb.job_fetch_ack         <= 0;
    m_quad_intf.clk_if_cb.job_complete_ack      <= 0;
    m_quad_intf.clk_if_cb.job_fetch_complete    <= 0;
    m_quad_intf.clk_core_cb.weight_valid        <= 0;
    m_quad_intf.clk_core_cb.weight_data         <= 0;
    m_quad_intf.clk_if_cb.pixel_valid           <= 0;
    m_quad_intf.clk_if_cb.pixel_data            <= 0;
    m_quad_intf.clk_if_cb.config_data           <= 0;
    m_quad_intf.clk_if_cb.config_valid          <= 0;
    m_quad_intf.job_start                       <= 0;
    m_quad_intf.job_fetch_ack                   <= 0;
    m_quad_intf.job_complete_ack                <= 0;
    m_quad_intf.job_fetch_complete              <= 0;
    m_quad_intf.weight_valid                    <= 0;
    m_quad_intf.weight_data                     <= 0;
    m_quad_intf.pixel_valid                     <= 0;
    m_quad_intf.pixel_data                      <= 0;
    m_quad_intf.config_data                     <= 0;
    m_quad_intf.config_valid                    <= 0;
    
    
    t = 0;
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2driverMB.try_get(test)) begin
            tmp_m_num_input_cols              = test.m_num_input_cols;
            tmp_pix_seq_data_full_count_cfg   = `WINDOW_3x3_NUM_CYCLES * $ceil(tmp_m_num_input_cols / 2);   
            @(m_quad_intf.clk_if_cb);
            while(i < m_num_mon) begin
                @(m_quad_intf.clk_core_cb);
                if(m_mon_rdy_arr[i].try_get(signal)) begin
                    i = i + 1;
                end
            end
            $display("// Running Test -------------------------------------------------");
            $display("// Num Input Rows:        %0d", test.m_num_input_rows             );
            $display("// Num Input Cols:        %0d", test.m_num_input_cols             );
            $display("// Input Depth:           %0d", test.m_depth                      );
            $display("// Num kernels:           %0d", test.m_num_kernels                );
            $display("// Num Kernel size:       %0d", test.m_kernel_size                );
            $display("// Stride                 %0d", test.m_stride                     );
            $display("// Padding:               %0d", test.m_padding                    );
            $display("// Num Output Rows:       %0d", test.m_num_output_rows            );
            $display("// Num Output Cols:       %0d", test.m_num_output_cols            );
            $display("// Num Sim Output Rows:   %0d", test.m_num_sim_output_rows        );
            $display("// Num Sim Output Cols:   %0d", test.m_num_sim_output_cols        ); 
            $display("// Running Test -------------------------------------------------");
            $display("\n");
            // BEGIN logic -------------------------------------------------------------------------------------------------------------------------- 
            m_quad_intf.pix_seq_data_full_count_cfg                                   = (test.m_stride == 1) ? (`WINDOW_3x3_NUM_CYCLES * test.m_num_input_cols) : (test.m_stride == 2) ? tmp_pix_seq_data_full_count_cfg : 0;
            m_quad_intf.kernel_full_count_cfg                                         = `KERNEL_3x3_COUNT_FULL;
            m_quad_intf.num_input_rows_cfg                                            = test.m_num_input_rows - 1;
            m_quad_intf.num_input_cols_cfg                                            = test.m_num_input_cols - 1;
            m_quad_intf.num_output_rows_cfg                                           = test.m_num_output_rows_cfg;
            m_quad_intf.num_output_cols_cfg                                           = test.m_num_output_cols_cfg;             
            m_quad_intf.pfb_full_count_cfg                                            = test.m_num_input_cols;         
            m_quad_intf.convolution_stride_cfg                                        = test.m_stride;
            m_quad_intf.kernel_size_cfg    		                                      = test.m_kernel_size;
            m_quad_intf.padding_cfg                                                   = test.m_padding;
            m_quad_intf.num_kernel_cfg                                                = test.m_num_kernels;
            m_quad_intf.job_start                                                     <= 0;
            m_quad_intf.job_fetch_ack                                                 <= 0;
            m_quad_intf.job_complete_ack                                              <= 0;
            m_quad_intf.job_fetch_complete                                            <= 0;
            m_quad_intf.weight_valid                                                  <= 0;
            m_quad_intf.weight_data                                                   <= 0;
            m_quad_intf.pixel_valid                                                   <= 0;
            m_quad_intf.pixel_data                                                    <= 0;
            m_quad_intf.config_data                                                   <= 0;
            m_quad_intf.config_valid                                                  <= 0;
            // END logic ----------------------------------------------------------------------------------------------------------------------------
            

            // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
            // send pixel sequence configuration data down for input maps
            i = 1;
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.config_data[127:112]    <= test.m_pix_seq_data_sim[(0 * 8) + 7]; 
            m_quad_intf.clk_if_cb.config_data[111:96]     <= test.m_pix_seq_data_sim[(0 * 8) + 6];     
            m_quad_intf.clk_if_cb.config_data[95:80]      <= test.m_pix_seq_data_sim[(0 * 8) + 5];     
            m_quad_intf.clk_if_cb.config_data[79:64]      <= test.m_pix_seq_data_sim[(0 * 8) + 4];     
            m_quad_intf.clk_if_cb.config_data[63:48]      <= test.m_pix_seq_data_sim[(0 * 8) + 3];     
            m_quad_intf.clk_if_cb.config_data[47:32]      <= test.m_pix_seq_data_sim[(0 * 8) + 2];     
            m_quad_intf.clk_if_cb.config_data[31:16]      <= test.m_pix_seq_data_sim[(0 * 8) + 1];     
            m_quad_intf.clk_if_cb.config_data[15:0]       <= test.m_pix_seq_data_sim[(0 * 8) + 0];
            m_quad_intf.clk_if_cb.config_valid[0]         <= 1;
            while(i < `MAX_NUM_INPUT_COLS) begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.config_accept[0]) begin
                    m_quad_intf.clk_if_cb.config_data[127:112]    <= test.m_pix_seq_data_sim[(i * 8) + 7]; 
                    m_quad_intf.clk_if_cb.config_data[111:96]     <= test.m_pix_seq_data_sim[(i * 8) + 6];     
                    m_quad_intf.clk_if_cb.config_data[95:80]      <= test.m_pix_seq_data_sim[(i * 8) + 5];     
                    m_quad_intf.clk_if_cb.config_data[79:64]      <= test.m_pix_seq_data_sim[(i * 8) + 4];     
                    m_quad_intf.clk_if_cb.config_data[63:48]      <= test.m_pix_seq_data_sim[(i * 8) + 3];     
                    m_quad_intf.clk_if_cb.config_data[47:32]      <= test.m_pix_seq_data_sim[(i * 8) + 2];     
                    m_quad_intf.clk_if_cb.config_data[31:16]      <= test.m_pix_seq_data_sim[(i * 8) + 1];     
                    m_quad_intf.clk_if_cb.config_data[15:0]       <= test.m_pix_seq_data_sim[(i * 8) + 0];
                    i = i + 1;
                end
            end
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.config_valid[0]                 <= 0;
            // END logic ------------------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            // send configuration data down for kernels
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.config_valid[1]         <= 1;        
            m_quad_intf.clk_if_cb.config_data[127:112]    <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[111:96]     <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[95:80]      <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[79:64]      <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[63:48]      <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[47:32]      <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[31:16]      <= test.m_num_kernels - 1;
            m_quad_intf.clk_if_cb.config_data[15:0]       <= test.m_num_kernels - 1;
            forever begin
                @(m_quad_intf.clk_core_cb);
                if(m_quad_intf.clk_if_cb.config_accept[1]) begin
                    break;
                end
            end
            @(m_quad_intf.clk_core_cb);
            m_quad_intf.clk_if_cb.config_valid[1]         <= 0;
            m_quad_intf.clk_if_cb.config_data[127:112]    <= 0;
            m_quad_intf.clk_if_cb.config_data[111:96]     <= 0;
            m_quad_intf.clk_if_cb.config_data[95:80]      <= 0;
            m_quad_intf.clk_if_cb.config_data[79:64]      <= 0;
            m_quad_intf.clk_if_cb.config_data[63:48]      <= 0;
            m_quad_intf.clk_if_cb.config_data[47:32]      <= 0;
            m_quad_intf.clk_if_cb.config_data[31:16]      <= 0;
            m_quad_intf.clk_if_cb.config_data[15:0]       <= 0;
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            // send kernel data down
            i = 1;
            @(m_quad_intf.clk_core_cb);
            m_quad_intf.clk_core_cb.weight_data[127:112]                <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (7 * `KERNEL_3x3_COUNT_FULL) + 0]; 
            m_quad_intf.clk_core_cb.weight_data[111:96]                 <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (6 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[95:80]                  <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (5 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[79:64]                  <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (4 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[63:48]                  <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (3 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[47:32]                  <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (2 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[31:16]                  <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (1 * `KERNEL_3x3_COUNT_FULL) + 0];     
            m_quad_intf.clk_core_cb.weight_data[15:0]                   <= test.m_kernel_data_sim[(0 * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (0 * `KERNEL_3x3_COUNT_FULL) + 0];
            m_quad_intf.clk_core_cb.weight_valid                        <= 1;      
            kernel_group_cfg                                             = 0;
            m_quad_intf.clk_if_cb.config_data                           <= 0;
            while(kernel_group_cfg < test.m_num_kernels) begin
                while(i < `KERNEL_3x3_COUNT_FULL) begin
                    @(m_quad_intf.clk_core_cb);
                    if(m_quad_intf.clk_core_cb.weight_ready) begin
                        m_quad_intf.clk_core_cb.weight_data[127:112]    <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (7 * `KERNEL_3x3_COUNT_FULL) + i]; 
                        m_quad_intf.clk_core_cb.weight_data[111:96]     <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (6 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[95:80]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (5 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[79:64]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (4 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[63:48]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (3 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[47:32]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (2 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[31:16]      <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (1 * `KERNEL_3x3_COUNT_FULL) + i];     
                        m_quad_intf.clk_core_cb.weight_data[15:0]       <= test.m_kernel_data_sim[(kernel_group_cfg * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (0 * `KERNEL_3x3_COUNT_FULL) + i];
                        i = i + 1;
                    end
                end
                kernel_group_cfg = kernel_group_cfg + 1;
                m_quad_intf.clk_if_cb.config_data <=   {   
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
            @(m_quad_intf.clk_core_cb);
            m_quad_intf.clk_core_cb.weight_valid <= 0;  
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            // start processing
            @(m_quad_intf.clk_core_cb);
            m_quad_intf.clk_if_cb.job_start <= 1;
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.job_accept) begin
                    break;
                end
            end
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.job_start <= 0; 


            i = 0; 
            j = 0;
            while(i < (test.m_num_input_rows * test.m_num_input_cols)) begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.job_fetch_request) begin
                    m_quad_intf.clk_if_cb.job_fetch_ack <= 1;                
                    @(m_quad_intf.clk_if_cb);
                    m_quad_intf.clk_if_cb.job_fetch_ack         <= 0;
                    m_quad_intf.clk_if_cb.pixel_valid           <= 1;
                    m_quad_intf.clk_if_cb.pixel_data[127:112]   <= test.m_pix_data_sim[(7 * (test.m_num_input_rows * test.m_num_input_cols)) + i];
                    m_quad_intf.clk_if_cb.pixel_data[111:96]    <= test.m_pix_data_sim[(6 * (test.m_num_input_rows * test.m_num_input_cols)) + i];          
                    m_quad_intf.clk_if_cb.pixel_data[95:80]     <= test.m_pix_data_sim[(5 * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                    m_quad_intf.clk_if_cb.pixel_data[79:64]     <= test.m_pix_data_sim[(4 * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                    m_quad_intf.clk_if_cb.pixel_data[63:48]     <= test.m_pix_data_sim[(3 * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                    m_quad_intf.clk_if_cb.pixel_data[47:32]     <= test.m_pix_data_sim[(2 * (test.m_num_input_rows * test.m_num_input_cols)) + i];            
                    m_quad_intf.clk_if_cb.pixel_data[31:16]     <= test.m_pix_data_sim[(1 * (test.m_num_input_rows * test.m_num_input_cols)) + i];           
                    m_quad_intf.clk_if_cb.pixel_data[15:0]      <= test.m_pix_data_sim[(0 * (test.m_num_input_rows * test.m_num_input_cols)) + i];
                    j = i + 1;
                    n = 1;
                    while(n < test.m_num_input_cols) begin
                        @(m_quad_intf.clk_if_cb);
                        if(m_quad_intf.clk_if_cb.pixel_ready) begin
                            m_quad_intf.clk_if_cb.pixel_data[127:112]  <= test.m_pix_data_sim[(7 * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                            m_quad_intf.clk_if_cb.pixel_data[111:96]   <= test.m_pix_data_sim[(6 * (test.m_num_input_rows * test.m_num_input_cols)) + j];          
                            m_quad_intf.clk_if_cb.pixel_data[95:80]    <= test.m_pix_data_sim[(5 * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                            m_quad_intf.clk_if_cb.pixel_data[79:64]    <= test.m_pix_data_sim[(4 * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                            m_quad_intf.clk_if_cb.pixel_data[63:48]    <= test.m_pix_data_sim[(3 * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                            m_quad_intf.clk_if_cb.pixel_data[47:32]    <= test.m_pix_data_sim[(2 * (test.m_num_input_rows * test.m_num_input_cols)) + j];            
                            m_quad_intf.clk_if_cb.pixel_data[31:16]    <= test.m_pix_data_sim[(1 * (test.m_num_input_rows * test.m_num_input_cols)) + j];           
                            m_quad_intf.clk_if_cb.pixel_data[15:0]     <= test.m_pix_data_sim[(0 * (test.m_num_input_rows * test.m_num_input_cols)) + j];
                            j = j + 1;
                            n = n + 1;
                        end
                    end
                    @(m_quad_intf.clk_if_cb);
                    m_quad_intf.clk_if_cb.job_fetch_complete    <= 1;
                    m_quad_intf.clk_if_cb.pixel_valid           <= 0;
                    @(m_quad_intf.clk_if_cb);
                    m_quad_intf.clk_if_cb.job_fetch_complete    <= 0;
                    i = i + test.m_num_input_cols;
                end
            end 
            // END logic ----------------------------------------------------------------------------------------------------------------------------


            // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
            forever begin
                @(m_quad_intf.clk_if_cb);
                if(m_quad_intf.clk_if_cb.job_complete) begin
                    m_quad_intf.clk_if_cb.job_complete_ack <= 1;
                    break;
                end
            end
            @(m_quad_intf.clk_if_cb);
            m_quad_intf.clk_if_cb.job_complete_ack <= 0;
            t = t + 1;
            // END logic ----------------------------------------------------------------------------------------------------------------------------
        end
    end
endtask: run


`endif