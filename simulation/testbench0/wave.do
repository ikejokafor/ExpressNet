onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TOP_TB} /testbench_0/COLS
add wave -noupdate -group {TOP_TB} /testbench_0/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {TOP_TB} /testbench_0/C_PERIOD_100MHz
add wave -noupdate -group {TOP_TB} /testbench_0/C_PERIOD_500MHz
add wave -noupdate -group {TOP_TB} /testbench_0/DEPTH
add wave -noupdate -group {TOP_TB} /testbench_0/KERNEL_SIZE
add wave -noupdate -group {TOP_TB} /testbench_0/NUM_CE_PER_QUAD
add wave -noupdate -group {TOP_TB} /testbench_0/NUM_KERNELS
add wave -noupdate -group {TOP_TB} /testbench_0/NUM_KERNEL_3x3_VALUES
add wave -noupdate -group {TOP_TB} /testbench_0/ROWS
add wave -noupdate -group {TOP_TB} /testbench_0/a
add wave -noupdate -group {TOP_TB} /testbench_0/arr
add wave -noupdate -group {TOP_TB} /testbench_0/arr2
add wave -noupdate -group {TOP_TB} /testbench_0/arr3
add wave -noupdate -group {TOP_TB} /testbench_0/arr4
add wave -noupdate -group {TOP_TB} /testbench_0/arr5
add wave -noupdate -group {TOP_TB} /testbench_0/b
add wave -noupdate -group {TOP_TB} /testbench_0/ce0_pixel_dataout
add wave -noupdate -group {TOP_TB} /testbench_0/ce0_pixel_dataout_valid
add wave -noupdate -group {TOP_TB} /testbench_0/ce1_pixel_dataout
add wave -noupdate -group {TOP_TB} /testbench_0/ce1_pixel_dataout_valid
add wave -noupdate -group {TOP_TB} /testbench_0/clk_100MHz
add wave -noupdate -group {TOP_TB} /testbench_0/clk_500MHz
add wave -noupdate -group {TOP_TB} /testbench_0/config_accept
add wave -noupdate -group {TOP_TB} /testbench_0/config_data
add wave -noupdate -group {TOP_TB} /testbench_0/config_valid
add wave -noupdate -group {TOP_TB} /testbench_0/cycle_counter0
add wave -noupdate -group {TOP_TB} /testbench_0/cycle_counter1
add wave -noupdate -group {TOP_TB} /testbench_0/fd
add wave -noupdate -group {TOP_TB} /testbench_0/fd0
add wave -noupdate -group {TOP_TB} /testbench_0/i
add wave -noupdate -group {TOP_TB} /testbench_0/i0
add wave -noupdate -group {TOP_TB} /testbench_0/j
add wave -noupdate -group {TOP_TB} /testbench_0/job_accept
add wave -noupdate -group {TOP_TB} /testbench_0/job_complete
add wave -noupdate -group {TOP_TB} /testbench_0/job_complete_ack
add wave -noupdate -group {TOP_TB} /testbench_0/job_fetch_ack
add wave -noupdate -group {TOP_TB} /testbench_0/job_fetch_complete
add wave -noupdate -group {TOP_TB} /testbench_0/job_fetch_request
add wave -noupdate -group {TOP_TB} /testbench_0/job_start
add wave -noupdate -group {TOP_TB} /testbench_0/k
add wave -noupdate -group {TOP_TB} /testbench_0/kernel_group_cfg
add wave -noupdate -group {TOP_TB} /testbench_0/n
add wave -noupdate -group {TOP_TB} /testbench_0/n0
add wave -noupdate -group {TOP_TB} /testbench_0/n1
add wave -noupdate -group {TOP_TB} /testbench_0/output_col0
add wave -noupdate -group {TOP_TB} /testbench_0/output_col1
add wave -noupdate -group {TOP_TB} /testbench_0/output_row0
add wave -noupdate -group {TOP_TB} /testbench_0/output_row1
add wave -noupdate -group {TOP_TB} /testbench_0/pixel_data
add wave -noupdate -group {TOP_TB} /testbench_0/pixel_ready
add wave -noupdate -group {TOP_TB} /testbench_0/pixel_valid
add wave -noupdate -group {TOP_TB} /testbench_0/rst
add wave -noupdate -group {TOP_TB} /testbench_0/weight_data
add wave -noupdate -group {TOP_TB} /testbench_0/weight_ready
add wave -noupdate -group {TOP_TB} /testbench_0/weight_valid
add wave -noupdate -group {TOP_TB} /testbench_0/z
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/CE_CYCLE_COUNTER_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_CE_CYCLE_CNT_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_NUM_CE
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_PFB_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_PIXEL_DATAIN_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_PIXEL_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_RELU_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_WHT_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/C_WHT_TBL_ADDR_WIDTH
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ST_AWE_CE_ACTIVE
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ST_IDLE
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ST_JOB_DONE
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ST_WAIT_PFB_LOAD
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_in_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_in_ready
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_in_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_out_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_out_ready
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cascade_out_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce0_pixel_datain
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce0_pixel_dataout
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce0_pixel_dataout_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce0_wht_seq_addr
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce1_pixel_datain
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce1_pixel_dataout
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce1_pixel_dataout_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce1_wht_seq_addr
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce_cycle_counter
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/ce_execute
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/clk_core
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/clk_if
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/config_accept
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/config_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/config_mode
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/config_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/cycle_counter
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/gray_code
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/idx
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/input_col
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/input_row
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_accept
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_accept_r
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_accept_w
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_complete
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_complete_ack
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_fetch_ack
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_fetch_complete
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_fetch_in_progress
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_fetch_request
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_parameters
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/job_start
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/kernel_config_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/kernel_full_count_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/kernel_group_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/last_kernel
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/next_kernel
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/num_input_cols_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/num_input_rows_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_count
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_dataout
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_empty
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_full_count_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_rden
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pfb_wren
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pix_seq_bram_dout
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pix_seq_bram_rdAddr
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pix_seq_bram_rden
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pix_seq_bram_wrAddr
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pixel_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pixel_ready
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/pixel_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/quad_wht_ctrl_state
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/relu_cfg
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/relu_out
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/result_accept
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/result_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/result_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/row_matric_wrAddr
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/rst
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/state
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/state_s
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/weight_data
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/weight_ready
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/weight_valid
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/wht_config_wren
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/wht_table_dout
add wave -noupdate -group {QUAD} /testbench_0/i0_cnn_layer_accel_quad/wht_table_dout_valid
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_NUM_CE
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_IDLE
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_JOB_DONE
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_PFB_LOAD
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute_d
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/clk
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/cycle_counter
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/idx
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_col
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_row
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_accept
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_ack
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_acked
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_ack
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_acked
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_complete
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_in_progress
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_request
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_start
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_awe_ce1_cyc_counter
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_kernel
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_s
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_cols
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_rows
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_cols
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_rows
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_col
add wave -noupdate -group {CTRL} -radix unsigned /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_row
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_count
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_empty
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_full_count
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_rden
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rdAddr
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_r
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_count
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_full_count
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/return_state
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric_wrAddr
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/rst
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state
add wave -noupdate -group {CTRL} /testbench_0/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state_s
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MATRIC_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MATRIC_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE_PIXEL_DOUT_WIDTH}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_SEQ_DATAIN_DELAY}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_JOB_DONE}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_PFB_LOAD}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain_d}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout_valid}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_matric}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain_d}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout_valid}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_matric}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/input_row}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/last_kernel}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/num_input_cols}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_d}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even_d}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_field0}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd_d}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce0_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce1_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_wrAddr}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group {AWE0} -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_CE_PIXEL_DOUT_WIDTH}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/C_SEQ_DATAIN_DELAY}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ST_JOB_DONE}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_PFB_LOAD}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain_d}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout_valid}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_matric}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain_d}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout_valid}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_matric}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/input_row}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/last_kernel}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/num_input_cols}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_d}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even_d}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_field0}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd_d}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce0_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce1_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_wrAddr}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group AWE1 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[1]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_CE_PIXEL_DOUT_WIDTH}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/C_SEQ_DATAIN_DELAY}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ST_JOB_DONE}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_PFB_LOAD}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain_d}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout_valid}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_matric}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain_d}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout_valid}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_matric}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/input_row}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/last_kernel}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/num_input_cols}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_d}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even_d}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_field0}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd_d}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce0_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce1_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_wrAddr}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group AWE2 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[2]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_CE_PIXEL_DOUT_WIDTH}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/C_SEQ_DATAIN_DELAY}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ST_JOB_DONE}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_PFB_LOAD}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain_d}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout_valid}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_matric}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain_d}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout_valid}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_matric}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/input_row}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/last_kernel}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/num_input_cols}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_d}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even_d}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_field0}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd_d}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce0_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce1_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_wrAddr}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group AWE3 -radix unsigned {/testbench_0/i0_cnn_layer_accel_quad/genblk1[3]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5884 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 116
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
WaveRestoreZoom {5763 ns} {5971 ns}
