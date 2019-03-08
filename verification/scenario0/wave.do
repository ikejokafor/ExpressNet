onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/CE_CYCLE_COUNTER_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_A_INPUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_B_INPUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_CE_CYCLE_CNT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_C_INPUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_DATAIN_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_INPUT_MUX_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_KERNAL_SIZE_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_LOG2_BRAM_DEPTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_MODE_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_NUM_CE
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_PACKET_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_PFB_DOUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_PIXEL_DATAIN_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_PIXEL_DOUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_P_INPUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_P_OUTPUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_RELU_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_WEIGHTIN_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_WEIGHT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_WHT_DOUT_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/C_WHT_TBL_ADDR_WIDTH
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_AWE_CE_ACTIVE
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_IDLE
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_SEND_COMPLETE
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_WAIT_JOB_DONE
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ST_WAIT_PFB_LOAD
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_carryout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_cascade_carryout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_cascade_dataout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_cascade_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_dataout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/awe_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_in_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_in_ready
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_in_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_out_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_out_ready
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cascade_out_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce0_pixel_datain
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce0_pixel_dataout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce0_pixel_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce1_pixel_datain
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce1_pixel_dataout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce1_pixel_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce_cycle_counter
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce_execute
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce_wht_table_dout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/ce_wht_table_dout_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/clk_core
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/clk_if
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/config_accept
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/config_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/config_data_arr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/config_mode
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/config_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/convolution_stride_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/cycle_counter
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/gray_code
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/gray_code_d
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/idx
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/input_col
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/input_row
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_accept
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_accept_r
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_accept_w
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_complete
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_complete_ack
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_fetch_ack
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_fetch_complete
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_fetch_in_progress
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_fetch_request
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_parameters
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/job_start
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/kernel_config_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/kernel_full_count_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/kernel_group_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/kernel_size_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/last_kernel
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/move_one_row_down
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/next_kernel
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/num_input_cols_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/num_input_rows_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/output_stride
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_count
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_dataout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_empty
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_full_count_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_rden
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pfb_wren
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pipeline_flushed
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pix_seq_bram_dout
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pix_seq_bram_rdAddr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pix_seq_bram_rden
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pix_seq_bram_wrAddr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pixel_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pixel_data_arr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pixel_ready
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/pixel_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/quad_wht_ctrl_state
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/relu_cfg
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/relu_out
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/result_accept
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/result_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/result_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/row_matric_wrAddr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/rst
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/state
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/state_d
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/state_s
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/weight_data
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/weight_data_arr
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/weight_ready
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/weight_valid
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/wht_config_wren
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/wht_seq_addr0
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/wht_seq_addr1
add wave -noupdate -group QUAD /testbench/i0_cnn_layer_accel_quad/wht_sequence_selector
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_NUM_CE
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_IDLE
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_SEND_COMPLETE
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_JOB_DONE
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_PFB_LOAD
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute_d
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute_w
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_move_one_row_down
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_move_one_row_down_d
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/clk
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/convolution_stride
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/cycle_counter
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/cycle_counter_d
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/idx
add wave -noupdate -group CTRL -radix unsigned /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_col
add wave -noupdate -group CTRL -radix unsigned /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_row
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_accept
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_ack
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_acked
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_ack
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_acked
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_complete
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_in_progress
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_request
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_start
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/kernel_size
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_awe_ce1_cyc_counter
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/move_one_row_down
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_kernel
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_s
add wave -noupdate -group CTRL -radix unsigned /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_cols
add wave -noupdate -group CTRL -radix unsigned /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_rows
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_cols
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_rows
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_col
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_col_d
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_row
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_stride
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_count
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_empty
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_full_count
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_rden
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pipeline_flushed
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rdAddr
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d1
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_r
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_count
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_full_count
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/return_state
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric_wrAddr
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/rst
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state_s
add wave -noupdate -group CTRL /testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/wht_sequence_selector
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CE_WHT_SEQ_ADDR_DELAY}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_A_DEPTH}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_B_DEPTH}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_WHT_DOUT_WIDTH}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/ce_cycle_counter}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/ce_execute}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/clk}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/config_mode}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/job_accept}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_config_valid}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_count}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_full_count}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_full_count_cfg}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_group}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/last_kernel}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/next_kernel}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/next_kernel_d}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/output_stride}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/rst}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_config_data}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_config_wren}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr0}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr1}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0_w}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1_w}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA_cfg}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout0}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout1}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout_valid}
add wave -noupdate -group WHT_TBL_TOP {/testbench/i0_cnn_layer_accel_quad/AWE[3]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_rden}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {44153114 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {174098400 ps}
