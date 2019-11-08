`ifndef	__CNL_SC2_DRIVER__
`define	__CNL_SC2_DRIVER__


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
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"
`include "cnn_layer_accel_quad_intf.sv"
`include "cnn_layer_accel_synch_intf.sv"
`include "cnl_sc2_generator.sv"


class `scX_drvParams_t extends drvParams_t;
    virtual cnn_layer_accel_quad_intf quad_intf;
    virtual cnn_layer_accel_synch_intf synch_intf;
endclass: `scX_drvParams_t


class `cnl_scX_driver #(parameter C_PERIOD_100MHz, parameter C_PERIOD_500MHz) extends driver;
    extern function new(drvParams_t drvParams = null);
    extern task run();
    extern task cfg_accel_slv_reg(`cnl_scX_generator test);
    extern task cfg_accel_pix_seq(`cnl_scX_generator test);
    extern task cfg_accel_krn(`cnl_scX_generator test);
    extern task slv_intf_stim(`cnl_scX_generator test);
    extern task rnd_delay_clk_if(int delay_amt);
    extern task rnd_delay_clk_core(int delay_amt);

    virtual cnn_layer_accel_quad_intf m_quad_intf;
    virtual cnn_layer_accel_synch_intf m_synch_intf;
endclass: `cnl_scX_driver


function `cnl_scX_driver::new(drvParams_t drvParams = null);
    `scX_drvParams_t `scX_drvParams;

    
    if(drvParams != null) begin
        $cast(`scX_drvParams, drvParams);
        m_quad_intf = `scX_drvParams.quad_intf;
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
    int t;
    int signal;

    
    m_quad_intf_arr.clk_if_cb.job_start                <= 0;
    m_quad_intf_arr.clk_if_cb.job_fetch_ack            <= 0;
    m_quad_intf_arr.clk_if_cb.job_complete_ack         <= 0;
    m_quad_intf_arr.clk_if_cb.job_fetch_complete       <= 0;
    m_quad_intf_arr.clk_if_cb.pixel_valid              <= 0;
    m_quad_intf_arr.clk_if_cb.pixel_data               <= 0;
    m_quad_intf_arr.clk_if_cb.config_data              <= 0;
    m_quad_intf_arr.clk_if_cb.config_valid             <= 0;
    m_quad_intf_arr.clk_if_cb.job_parameters           <= 128'b0;
    m_quad_intf_arr.clk_if_cb.job_parameters_valid     <= 0;
    m_quad_intf_arr.clk_core_cb.weight_valid           <= 0;
    m_quad_intf_arr.clk_core_cb.weight_data            <= 0; 
    
    
    m_quad_intf.rst <= 1;
    #(C_PERIOD_100MHz * 10) m_quad_intf.rst <= 0;    // 10 cycle rst asserted is arbitrairy
    
    
    t = 0;
    m_DUT_rdy.put(signal);
    while(t < m_numTests) begin
        @(m_quad_intf.clk_if_cb);
        if(m_agent2driverMB.try_get(test)) begin
            $display("// Started Running Test -----------------------------------------");
            $display("// At Time:               %0t", $time                             );       
            $display("// Test Index:            %0d", test.m_ti                         );
            $display("// Started Running Test -----------------------------------------");
            $display("\n");
            cfg_accel_slv_reg(test);
            cfg_accel_pix_seq(test);
            cfg_accel_krn(test);
            slv_intf_stim(test);
            if(!m_runForever) begin
                t = t + 1;
            end
            // END logic ----------------------------------------------------------------------------------------------------------------------------
        end
    end
endtask: run


task `cnl_scX_driver::cfg_accel_slv_reg(`cnl_scX_generator test);
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );          
    $display("// Sent Job Parameters"                                           ); 
    $display("// --------------------------------------------------------------");
    $display("\n");               
    m_quad_intf_arr.clk_if_cb.job_parameters[`PFB_FULL_COUNT_FIELD]              <= test.m_pfb_full_count_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`STRIDE_FIELD]                      <= test.m_stride_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CONV_OUT_FMT_FIELD]                <= test.m_conv_out_fmt_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`PADDING_FIELD]                     <= test.m_padding_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`NUM_OUTPUT_COLS_FIELD]             <= test.m_num_output_cols_cfg; 
    m_quad_intf_arr.clk_if_cb.job_parameters[`NUM_OUTPUT_ROWS_FIELD]             <= test.m_num_output_rows_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`PIX_SEQ_DATA_FULL_COUNT_FIELD]     <= test.m_pix_seq_data_full_count_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`UPSAMPLE_FIELD]                    <= test.m_upsample_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`NUM_EXPD_INPUT_COLS_FIELD]         <= test.m_num_expd_input_cols_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`NUM_EXPD_INPUT_ROWS_FIELD]         <= test.m_num_expd_input_rows_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CRPD_INPUT_COL_START_FIELD]        <= test.m_crpd_input_col_start_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CRPD_INPUT_ROW_START_FIELD]        <= test.m_crpd_input_row_start_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CRPD_INPUT_COL_END_FIELD]          <= test.m_crpd_input_col_end_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CRPD_INPUT_ROW_END_FIELD]          <= test.m_crpd_input_row_end_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`NUM_KERNELS_FIELD]                 <= test.m_num_kernels_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`MASTER_QUAD_FIELD]                 <= test.m_master_quad_cfg;
    m_quad_intf_arr.clk_if_cb.job_parameters[`CASCADE_FIELD]                     <= test.m_cascade_cfg;                                                                     
    m_quad_intf_arr.clk_if_cb.job_parameters[`ACTV_FIELD]                        <= test.m_actv_cfg;    
    @(m_quad_intf_arr.clk_if_cb);                                                
    m_quad_intf_arr.clk_if_cb.job_parameters_valid                               <= 1;    
    @(m_quad_intf_arr.clk_if_cb);                                                
    m_quad_intf_arr.clk_if_cb.job_parameters_valid                               <= 0;
    m_quad_intf_arr.clk_if_cb.job_parameters                                     <= 128'b0;
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );
    $display("// Finished Sending Quad Config"                                  );
    $display("// --------------------------------------------------------------");
    $display("\n");           
endtask: cfg_accel_slv_reg


task `cnl_scX_driver::cfg_accel_pix_seq(`cnl_scX_generator test);
    int i;
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );            
    $display("// Started Sending Pixel Sequence Config"                         ); 
    $display("// --------------------------------------------------------------");
    $display("\n");    
    i = 1;
    @(m_quad_intf.clk_if_cb);
    m_quad_intf.clk_if_cb.config_data[127:112]              <= test.m_pix_seq_data_sim[(0 * 8) + 7]; 
    m_quad_intf.clk_if_cb.config_data[111:96]               <= test.m_pix_seq_data_sim[(0 * 8) + 6];     
    m_quad_intf.clk_if_cb.config_data[95:80]                <= test.m_pix_seq_data_sim[(0 * 8) + 5];     
    m_quad_intf.clk_if_cb.config_data[79:64]                <= test.m_pix_seq_data_sim[(0 * 8) + 4];     
    m_quad_intf.clk_if_cb.config_data[63:48]                <= test.m_pix_seq_data_sim[(0 * 8) + 3];
    m_quad_intf.clk_if_cb.config_data[47:32]                <= test.m_pix_seq_data_sim[(0 * 8) + 2];     
    m_quad_intf.clk_if_cb.config_data[31:16]                <= test.m_pix_seq_data_sim[(0 * 8) + 1];     
    m_quad_intf.clk_if_cb.config_data[15:0]                 <= test.m_pix_seq_data_sim[(0 * 8) + 0];
    m_quad_intf.clk_if_cb.config_valid[0]                   <= 1;
    while(i < `MAX_NUM_INPUT_COLS) begin
        @(m_quad_intf.clk_if_cb);
        if($urandom_range(0, 1) && m_model_delay) begin
            m_quad_intf.clk_if_cb.config_valid[0]           <= 0;
            rnd_delay_clk_if(5);
            m_quad_intf.clk_if_cb.config_data[127:112]      <= test.m_pix_seq_data_sim[(i * 8) + 7]; 
            m_quad_intf.clk_if_cb.config_data[111:96]       <= test.m_pix_seq_data_sim[(i * 8) + 6];     
            m_quad_intf.clk_if_cb.config_data[95:80]        <= test.m_pix_seq_data_sim[(i * 8) + 5];     
            m_quad_intf.clk_if_cb.config_data[79:64]        <= test.m_pix_seq_data_sim[(i * 8) + 4];     
            m_quad_intf.clk_if_cb.config_data[63:48]        <= test.m_pix_seq_data_sim[(i * 8) + 3];     
            m_quad_intf.clk_if_cb.config_data[47:32]        <= test.m_pix_seq_data_sim[(i * 8) + 2];     
            m_quad_intf.clk_if_cb.config_data[31:16]        <= test.m_pix_seq_data_sim[(i * 8) + 1];     
            m_quad_intf.clk_if_cb.config_data[15:0]         <= test.m_pix_seq_data_sim[(i * 8) + 0];
            m_quad_intf.clk_if_cb.config_valid[0]           <= 1;
        end
        wait(m_quad_intf.clk_if_cb.config_accept[0])
        m_quad_intf.clk_if_cb.config_data[127:112]          <= test.m_pix_seq_data_sim[(i * 8) + 7]; 
        m_quad_intf.clk_if_cb.config_data[111:96]           <= test.m_pix_seq_data_sim[(i * 8) + 6];     
        m_quad_intf.clk_if_cb.config_data[95:80]            <= test.m_pix_seq_data_sim[(i * 8) + 5];     
        m_quad_intf.clk_if_cb.config_data[79:64]            <= test.m_pix_seq_data_sim[(i * 8) + 4];     
        m_quad_intf.clk_if_cb.config_data[63:48]            <= test.m_pix_seq_data_sim[(i * 8) + 3];     
        m_quad_intf.clk_if_cb.config_data[47:32]            <= test.m_pix_seq_data_sim[(i * 8) + 2];     
        m_quad_intf.clk_if_cb.config_data[31:16]            <= test.m_pix_seq_data_sim[(i * 8) + 1];     
        m_quad_intf.clk_if_cb.config_data[15:0]             <= test.m_pix_seq_data_sim[(i * 8) + 0];
        i = i + 1;
    end
    @(m_quad_intf.clk_if_cb);
    m_quad_intf.clk_if_cb.config_valid[0]                 <= 0;
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );            
    $display("// Finished Sending Pixel Sequence Config"                        ); 
    $display("// --------------------------------------------------------------");
    $display("\n");
endtask: cfg_accel_pix_seq


task `cnl_scX_driver::cfg_accel_krn(`cnl_scX_generator test);
    int i;
    int kernel_idx;
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );
    $display("// Started Sending Kernel Data"                                   );
    $display("// --------------------------------------------------------------");
    $display("\n");      
    i               = 1;
    kernel_idx      = 0;    
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
    while(kernel_idx < test.m_num_kernels) begin
        while(i < `KERNEL_3x3_COUNT_FULL) begin
            @(m_quad_intf.clk_core_cb);
            if($urandom_range(0, 1) && m_model_delay) begin
                m_quad_intf.clk_core_cb.weight_valid            <= 0;
                rnd_delay_clk_core(5);
                m_quad_intf.clk_core_cb.weight_data[127:112]    <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (7 * `KERNEL_3x3_COUNT_FULL) + i]; 
                m_quad_intf.clk_core_cb.weight_data[111:96]     <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (6 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[95:80]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (5 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[79:64]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (4 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[63:48]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (3 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[47:32]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (2 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[31:16]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (1 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[15:0]       <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (0 * `KERNEL_3x3_COUNT_FULL) + i];
                m_quad_intf.clk_core_cb.weight_valid            <= 1;
            end
            wait(m_quad_intf.clk_core_cb.weight_ready) begin
                m_quad_intf.clk_core_cb.weight_data[127:112]    <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (7 * `KERNEL_3x3_COUNT_FULL) + i]; 
                m_quad_intf.clk_core_cb.weight_data[111:96]     <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (6 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[95:80]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (5 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[79:64]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (4 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[63:48]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (3 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[47:32]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (2 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[31:16]      <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (1 * `KERNEL_3x3_COUNT_FULL) + i];     
                m_quad_intf.clk_core_cb.weight_data[15:0]       <= test.m_kernel_data_sim[(kernel_idx * `KERNEL_3x3_COUNT_FULL * test.m_depth) + (0 * `KERNEL_3x3_COUNT_FULL) + i];
                i = i + 1;
            end
        end
        kernel_idx = kernel_idx + 1;
        i = 0;
    end
    @(m_quad_intf.clk_core_cb);
    m_quad_intf.clk_core_cb.weight_valid <= 0;  
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );           
    $display("// Finished Sending kernel Data"                                  ); 
    $display("// --------------------------------------------------------------");
    $display("\n");
endtask: cfg_accel_krn


task `cnl_scX_driver::slv_intf_stim(`cnl_scX_generator test);
    int i;
    int numAddresses;
    logic [15:0] slv_addr_sim[];
     $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );
    $display("// Started Slave Intferface Stimulation"                          );
    $display("// --------------------------------------------------------------");
    $display("\n");   
    i = 0;
    numAddresses = test.slv_addr.size();
    slv_addr_sim = test.slv_addr_sim;
    m_quad_intf.slv_dbg_rdAddr <= slv_addr_sim[0];
    m_quad_intf.clk_if_cb.slv_dbg_rdAddr_valid <= 1;    
    while(i < numAddresses) begin
        @(m_quad_intf.clk_if_cb);
        if($urandom_range(0, 1) && m_model_delay) begin
            m_quad_intf.clk_if_cb.slv_dbg_rdAddr_valid <= 0;
            rnd_delay_clk_if(5);
            m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= slv_addr_sim[i];
            m_quad_intf.clk_if_cb.slv_dbg_rdAddr_valid <= 1;
        end
        wait(m_quad_intf.clk_if_cb.slv_dbg_rdAck) begin
            m_quad_intf.clk_if_cb.slv_dbg_rdAddr <= slv_addr_sim[i];
        end
        i = i + 1;
    end
    @(m_quad_intf.clk_if_cb);
    m_quad_intf.clk_if_cb.slv_dbg_rdAddr_valid <= 0;
    $display("// --------------------------------------------------------------");
    $display("// At Time: %0t", $time                                           );
    $display("// Test Index: %0d", test.m_ti                                    );
    $display("// Finished Slave Intferface Stimulation"                         );
    $display("// --------------------------------------------------------------");
    $display("\n");
endtask: slv_intf_stim


task `cnl_scX_driver::rnd_delay_clk_if(int delay_amt);
    repeat($urandom_range(1, delay_amt)) begin
        @(m_synch_intf.clk_if_cb);
    end
endtask: rnd_delay_clk_if


task `cnl_scX_driver::rnd_delay_clk_core(int delay_amt);
    repeat($urandom_range(1, delay_amt)) begin
        @(m_synch_intf.clk_core_cb);
    end
endtask: rnd_delay_clk_core


`endif