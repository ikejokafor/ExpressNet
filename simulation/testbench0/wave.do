onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/COLS
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/C_LOG2_BRAM_DEPTH
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/C_PERIOD_100MHz
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/C_PERIOD_500MHz
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/DEPTH
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/KERNEL_SIZE
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/NUM_CE_PER_QUAD
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/NUM_KERNELS
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/NUM_KERNEL_3x3_VALUES
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/ROWS
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/a
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/b
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/ce0_pixel_dataout
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/ce0_pixel_dataout_valid
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/ce1_pixel_dataout
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/ce1_pixel_dataout_valid
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/clk_100MHz
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/clk_500MHz
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/config_accept
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/config_data
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/config_valid
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/cycle_counter0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/cycle_counter1
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/fd
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/fd0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/i
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/i0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/j
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_accept
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_complete
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_complete_ack
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_fetch_ack
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_fetch_complete
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_fetch_request
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/job_start
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/k
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/kernel_data_sim
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/kernel_group_cfg
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/n
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/n0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/n1
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/output_col0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/output_col1
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/output_row0
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/output_row1
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pix_data_result
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pix_data_sim
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pix_data_sol
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pix_seq_data_sim
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pixel_data
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pixel_ready
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/pixel_valid
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/rst
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/weight_data
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/weight_ready
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/weight_valid
add wave -noupdate -group TOP /testbench/i0_test_0_wrapper/z
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/clk_if
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/clk_core
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/rst
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_start
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_accept
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_parameters
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_fetch_request
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_fetch_ack
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_fetch_complete
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_complete
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_complete_ack
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_in_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_in_ready
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_in_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_out_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_out_ready
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cascade_out_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/config_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/config_accept
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/config_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/weight_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/weight_ready
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/weight_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/result_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/result_accept
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/result_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pixel_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pixel_ready
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pixel_data
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_fetch_in_progress
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_accept_w
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/job_accept_r
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/gray_code
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pfb_wren
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pfb_rden
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pfb_empty
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pfb_count
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/ce_execute
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/input_row
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/input_col
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/row_matric_wrAddr
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/num_input_cols_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/num_input_rows_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pfb_full_count_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/kernel_full_count_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/kernel_group_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pix_seq_bram_rden
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pix_seq_bram_wrAddr
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pix_seq_bram_rdAddr
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pix_seq_bram_dout
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/kernel_config_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/config_mode
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/cycle_counter
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/ce0_pixel_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/ce1_pixel_dataout_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/next_kernel
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/last_kernel
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/state
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/wht_seq_addr0
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/wht_seq_addr1
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/ce_wht_table_dout_valid
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/wht_config_wren
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/relu_cfg
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/idx
add wave -noupdate -group QUAD /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/pipeline_flushed
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_NUM_CE
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_IDLE
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_SEND_COMPLETE
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_JOB_DONE
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_PFB_LOAD
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute_d
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/clk
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/cycle_counter
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/idx
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_col
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_row
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_accept
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_ack
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_acked
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_ack
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_acked
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_complete
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_in_progress
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_request
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_start
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_awe_ce1_cyc_counter
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_kernel
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_s
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_cols
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_input_rows
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_cols
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_rows
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_col
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_row
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_count
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_empty
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_full_count
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_rden
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pipeline_flushed
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rdAddr
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_r
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_count
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_full_count
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/return_state
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric_wrAddr
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/rst
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state
add wave -noupdate -group CTRL /testbench/i0_test_0_wrapper/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4053000 ps} 0}
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
WaveRestoreZoom {0 ps} {69831 ns}
