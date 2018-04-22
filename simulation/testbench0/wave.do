onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TOP_TB
} /testbench0/COLS
add wave -noupdate -group {TOP_TB
} /testbench0/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {TOP_TB
} /testbench0/C_PERIOD_100MHz
add wave -noupdate -group {TOP_TB
} /testbench0/C_PERIOD_500MHz
add wave -noupdate -group {TOP_TB
} /testbench0/DEPTH
add wave -noupdate -group {TOP_TB
} /testbench0/KERNEL_SIZE
add wave -noupdate -group {TOP_TB
} /testbench0/NUM_CE_PER_QUAD
add wave -noupdate -group {TOP_TB
} /testbench0/NUM_KERNELS
add wave -noupdate -group {TOP_TB
} /testbench0/NUM_KERNEL_3x3_VALUES
add wave -noupdate -group {TOP_TB
} /testbench0/ROWS
add wave -noupdate -group {TOP_TB
} /testbench0/a
add wave -noupdate -group {TOP_TB
} /testbench0/b
add wave -noupdate -group {TOP_TB
} /testbench0/ce0_pixel_dataout
add wave -noupdate -group {TOP_TB
} /testbench0/ce0_pixel_dataout_valid
add wave -noupdate -group {TOP_TB
} /testbench0/ce1_pixel_dataout
add wave -noupdate -group {TOP_TB
} /testbench0/ce1_pixel_dataout_valid
add wave -noupdate -group {TOP_TB
} /testbench0/clk_100MHz
add wave -noupdate -group {TOP_TB
} /testbench0/clk_500MHz
add wave -noupdate -group {TOP_TB
} /testbench0/config_accept
add wave -noupdate -group {TOP_TB
} /testbench0/config_data
add wave -noupdate -group {TOP_TB
} /testbench0/config_valid
add wave -noupdate -group {TOP_TB
} /testbench0/cycle_counter0
add wave -noupdate -group {TOP_TB
} /testbench0/cycle_counter1
add wave -noupdate -group {TOP_TB
} /testbench0/fd
add wave -noupdate -group {TOP_TB
} /testbench0/fd0
add wave -noupdate -group {TOP_TB
} /testbench0/i
add wave -noupdate -group {TOP_TB
} /testbench0/i0
add wave -noupdate -group {TOP_TB
} /testbench0/j
add wave -noupdate -group {TOP_TB
} /testbench0/job_accept
add wave -noupdate -group {TOP_TB
} /testbench0/job_complete
add wave -noupdate -group {TOP_TB
} /testbench0/job_complete_ack
add wave -noupdate -group {TOP_TB
} /testbench0/job_fetch_ack
add wave -noupdate -group {TOP_TB
} /testbench0/job_fetch_complete
add wave -noupdate -group {TOP_TB
} /testbench0/job_fetch_request
add wave -noupdate -group {TOP_TB
} /testbench0/job_start
add wave -noupdate -group {TOP_TB
} /testbench0/k
add wave -noupdate -group {TOP_TB
} /testbench0/kernel_data_sim
add wave -noupdate -group {TOP_TB
} /testbench0/kernel_group_cfg
add wave -noupdate -group {TOP_TB
} /testbench0/n
add wave -noupdate -group {TOP_TB
} /testbench0/n0
add wave -noupdate -group {TOP_TB
} /testbench0/n1
add wave -noupdate -group {TOP_TB
} /testbench0/output_col0
add wave -noupdate -group {TOP_TB
} /testbench0/output_col1
add wave -noupdate -group {TOP_TB
} /testbench0/output_row0
add wave -noupdate -group {TOP_TB
} /testbench0/output_row1
add wave -noupdate -group {TOP_TB
} /testbench0/pix_data_result
add wave -noupdate -group {TOP_TB
} /testbench0/pix_data_sim
add wave -noupdate -group {TOP_TB
} /testbench0/pix_data_sol
add wave -noupdate -group {TOP_TB
} /testbench0/pix_seq_data_sim
add wave -noupdate -group {TOP_TB
} /testbench0/pixel_data
add wave -noupdate -group {TOP_TB
} /testbench0/pixel_ready
add wave -noupdate -group {TOP_TB
} /testbench0/pixel_valid
add wave -noupdate -group {TOP_TB
} /testbench0/rst
add wave -noupdate -group {TOP_TB
} /testbench0/weight_data
add wave -noupdate -group {TOP_TB
} /testbench0/weight_ready
add wave -noupdate -group {TOP_TB
} /testbench0/weight_valid
add wave -noupdate -group {TOP_TB
} /testbench0/z
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/CE_CYCLE_COUNTER_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_CE_CYCLE_CNT_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_NUM_CE
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_PFB_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_PIXEL_DATAIN_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_PIXEL_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_RELU_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_WHT_DOUT_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/C_WHT_TBL_ADDR_WIDTH
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_AWE_CE_ACTIVE
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_IDLE
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_SEND_COMPLETE
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_WAIT_JOB_DONE
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ST_WAIT_PFB_LOAD
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_in_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_in_ready
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_in_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_out_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_out_ready
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cascade_out_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce0_pixel_datain
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce0_pixel_dataout
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce0_pixel_dataout_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce1_pixel_datain
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce1_pixel_dataout
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce1_pixel_dataout_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce_cycle_counter
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce_execute
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce_wht_table_dout
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/ce_wht_table_dout_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/clk_core
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/clk_if
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/config_accept
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/config_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/config_data_arr
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/config_mode
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/config_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/cycle_counter
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/gray_code
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/idx
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/input_col
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/input_row
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_accept
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_accept_r
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_accept_w
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_complete
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_complete_ack
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_fetch_ack
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_fetch_complete
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_fetch_in_progress
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_fetch_request
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_parameters
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/job_start
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/kernel_config_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/kernel_full_count_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/kernel_group_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/last_kernel
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/next_kernel
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/num_input_cols_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/num_input_rows_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_count
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_dataout
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_empty
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_full_count_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_rden
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pfb_wren
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pipeline_flushed
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pix_seq_bram_dout
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pix_seq_bram_rdAddr
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pix_seq_bram_rden
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pix_seq_bram_wrAddr
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pixel_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pixel_data_arr
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pixel_ready
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/pixel_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/quad_wht_ctrl_state
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/relu_cfg
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/relu_out
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/result_accept
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/result_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/result_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/row_matric_wrAddr
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/rst
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/state
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/state_s
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/weight_data
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/weight_ready
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/weight_valid
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/wht_config_wren
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/wht_seq_addr0
add wave -noupdate -group {QUAD} /testbench0/i0_cnn_layer_accel_quad/wht_seq_addr1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9092 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 107
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
WaveRestoreZoom {423 ns} {9978 ns}
