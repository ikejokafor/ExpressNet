onerror {resume}
radix fpoint 3
quietly WaveActivateNextPane {} 0
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/CE_CYCLE_COUNTER_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_A_INPUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_B_INPUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_CE_CYCLE_CNT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_CLG2_MAX_BRAM_3x3_KERNELS
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_CLG2_ROW_BUF_BRAM_DEPTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_C_INPUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_DATAIN_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_INPUT_MUX_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_KERNAL_SIZE_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_MODE_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_NUM_CE
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_PACKET_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_PFB_DOUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_PIXEL_DATAIN_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_PIXEL_DOUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_P_INPUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_P_OUTPUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_RELU_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_WEIGHTIN_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_WEIGHT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_WHT_DOUT_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/C_WHT_TBL_ADDR_WIDTH
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_AWE_CE_ACTIVE
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_IDLE
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_SEND_COMPLETE
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_WAIT_JOB_DONE
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ST_WAIT_PFB_LOAD
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/actv_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/actv_out
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_carryout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_cascade_carryout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_cascade_dataout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_cascade_dataout_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_dataout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_dataout_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/awe_last_kernel
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_in_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_in_ready
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_in_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_out_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_out_ready
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cascade_out_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce0_pixel_datain
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce0_pixel_dataout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce0_pixel_dataout_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce1_pixel_datain
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce1_pixel_dataout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce1_pixel_dataout_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce_cycle_counter
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce_execute
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce_wht_table_dout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ce_wht_table_dout_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/clk_core
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/clk_if
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cncl_fetch_req
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/config_accept
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/config_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/config_data_arr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/config_mode
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/config_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/conv_out_fmt_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/crpd_input_col_end_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/crpd_input_col_start_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/crpd_input_row_end_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/crpd_input_row_start_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/ctrl_last_kernel
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/cycle_counter
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/dsp_kernel_size_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/gray_code
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/gray_code_d
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/idx
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/idx0
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/input_col
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/input_row
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_accept
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_accept_r
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_accept_w
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_complete
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_complete_ack
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_ack
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_ack_r
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_ack_w
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_complete
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_complete_r
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_complete_w
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_in_progress
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_request
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_fetch_request_w
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_parameters
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/job_start
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/kernel_config_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/last_kernel
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/move_one_row_down
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/next_kernel
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/next_row
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/next_state_tran
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/num_expd_input_cols_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/num_expd_input_rows_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/num_kernels_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/num_output_cols_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/num_output_rows_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/output_col
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/output_depth
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/output_row
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/padding_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pfb_datain
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pfb_dataout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pfb_full_count_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pfb_rden
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pfb_wren
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pipeline_flushed
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_bram_dout
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_bram_rdAddr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_bram_rden
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_bram_wrAddr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_bram_wren
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pix_seq_data_full_count_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pixel_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pixel_data_arr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pixel_data_r
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pixel_ready
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/pixel_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/quad_wht_ctrl_state
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/result_accept
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/result_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/result_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/row_matric_wrAddr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/rst
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/state
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/state_s
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/stride_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/upsample_cfg
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/weight_data
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/weight_data_arr
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/weight_ready
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/weight_valid
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/wht_config_wren
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/wht_seq_addr0
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/wht_seq_addr1
add wave -noupdate -group QUAD /cnl_sc1_testbench/i0_cnn_layer_accel_quad/wht_sequence_selector
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_CLG2_MAX_BRAM_3x3_KERNELS
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_CLG2_ROW_BUF_BRAM_DEPTH
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/C_NUM_CE
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_IDLE
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_SEND_COMPLETE
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_JOB_DONE
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ST_WAIT_PFB_LOAD
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_execute_w
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_move_one_row_down
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/ce_move_one_row_down_d
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/clk
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/conv_out_fmt
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/cycle_counter
add wave -noupdate -group CTRL -radix binary -childformat {{{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code[1]} -radix binary} {{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code[0]} -radix binary}} -subitemconfig {{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code[1]} {-height 15 -radix binary} {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code[0]} {-height 15 -radix binary}} /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/gray_code
add wave -noupdate -group CTRL -radix binary -childformat {{{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r[1]} -radix binary} {{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r[0]} -radix binary}} -subitemconfig {{/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r[1]} {-height 15 -radix binary} {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r[0]} {-height 15 -radix binary}} /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/graycode_r
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/idx
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_col
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/input_row
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_accept
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_ack
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_complete_acked
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_ack
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_acked
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_complete
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_in_progress
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_fetch_request
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/job_start
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/kernel_group
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_awe_ce1_cyc_counter
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_awe_last_kernel
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel
add wave -noupdate -group CTRL /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel_d
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/last_kernel_w
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/move_one_row_down
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_kernel
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_kernel_w
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_row
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_s
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_tran
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/next_state_tran_r
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_expd_input_cols
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_expd_input_rows
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_kernels
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_cols
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/num_output_rows
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_col
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_row
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/output_stride
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_count
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_full_count
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pfb_rden
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pip_primed
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pipeline_flushed
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_dout_valid
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rdAddr
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rdAddr_ofst
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_d1
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_bram_rden_r
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_count
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/pix_seq_data_full_count
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/return_state
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/row_matric_wrAddr
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/rst
add wave -noupdate -group CTRL -radix binary /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/state_s
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/stride
add wave -noupdate -group CTRL -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_quad_bram_ctrl/wht_sequence_selector
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/C_CLG2_ROW_BUF_BRAM_DEPTH
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/clk
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/gray_code
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/rst
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/seq_data_addr
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/sequence_data0
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/sequence_data1
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/sequence_data2
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/sequence_data3
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/sequence_selector
add wave -noupdate -group {WHT_SEQ0
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table0/wht_data_addr
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/C_CLG2_ROW_BUF_BRAM_DEPTH
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/clk
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/gray_code
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/rst
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/seq_data_addr
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/sequence_data0
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/sequence_data1
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/sequence_data2
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/sequence_data3
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/sequence_selector
add wave -noupdate -group {WHT_SEQ1
} -radix unsigned /cnl_sc1_testbench/i0_cnn_layer_accel_quad/i0_cnn_layer_accel_weight_sequence_table1/wht_data_addr
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/C_CE_WHT_SEQ_ADDR_DELAY}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_A_DEPTH}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_B_DEPTH}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/C_CLG2_MAX_BRAM_3x3_KERNELS}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/C_WHT_DOUT_WIDTH}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/ce_execute}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/clk}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/config_data}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/config_mode}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/conv_out_fmt}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/job_accept}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/kernel_config_valid}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/kernel_count}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/kernel_group}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/last_kernel}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/next_kernel}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/next_kernel_d0}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/next_kernel_d1}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/num_kernels}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/rst}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_config_data}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_config_wren}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr0}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr1}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0_w}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1_w}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA_cfg}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_dout}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_dout0}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_dout1}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_dout_valid}
add wave -noupdate -group WHT_TBL_TOP0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[0]/i0_cnn_layer_accel_weight_table_top/wht_table_rden}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CE_WHT_SEQ_ADDR_DELAY}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_A_DEPTH}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CLG2_BRAM_B_DEPTH}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_CLG2_MAX_BRAM_3x3_KERNELS}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/C_WHT_DOUT_WIDTH}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/ce_execute}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/clk}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/config_data}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/config_mode}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/conv_out_fmt}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/job_accept}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_config_valid}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_count}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/kernel_group}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/last_kernel}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/next_kernel}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/next_kernel_d0}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/next_kernel_d1}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/num_kernels}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/rst}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_config_data}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_config_wren}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr0}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_seq_addr1}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr0_w}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addr1_w}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_addrA_cfg}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout0}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout1}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_dout_valid}
add wave -noupdate -group WHT_TBL_TOP1 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/AWE_BUF_WHT[1]/i0_cnn_layer_accel_weight_table_top/wht_table_rden}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE0_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MATRIC_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_PX_DIN_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE1_ROW_MAT_WR_ADDR_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CE_PIXEL_DOUT_WIDTH}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_CLG2_ROW_BUF_BRAM_DEPTH}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/C_SEQ_DATAIN_DELAY}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_SEND_COMPLETE}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_JOB_DONE}
add wave -noupdate -group AWE_ROW_BUF0 {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_WAIT_PFB_LOAD}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_cycle_counter_incr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_execute_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_last_kernel}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_move_one_row_down}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_datain_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_pixel_dataout_valid}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_rename_condition}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_reset_counters}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_matric}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce0_row_rename_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_cycle_counter_incr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_execute_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_last_kernel}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_move_one_row_down}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_datain_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_pixel_dataout_valid}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_rename_condition}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_reset_counters}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_matric}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/ce1_row_rename_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group AWE_ROW_BUF0 -radix binary {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/input_row}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/last_kernel}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/num_expd_input_cols}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/output_col_ce0}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/output_col_ce1}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/output_row_ce0}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/output_row_ce1}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_even_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_field0}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/pix_seq_datain_odd_d}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce0_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_ce1_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_rename}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_rename_ce0_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/row_rename_ce1_wrAddr}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/rst_addr}
add wave -noupdate -group AWE_ROW_BUF0 -radix binary {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group AWE_ROW_BUF0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/BRAM}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/C_CLG2_RAM_DEPTH}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/C_RAM_DEPTH}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/C_RAM_PERF}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/C_RAM_WIDTH}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/clk}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/datain}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/dataout}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/dout_reg}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/dout_reg0}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/dout_reg1}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/dout_reg2}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/rdAddr}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/rden}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/wrAddr}
add wave -noupdate -group BRAM0 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0/wren}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/BRAM}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/C_CLG2_RAM_DEPTH}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/C_RAM_DEPTH}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/C_RAM_PERF}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/C_RAM_WIDTH}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/clk}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/datain}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/dataout}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/dout_reg}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/dout_reg0}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/dout_reg1}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/dout_reg2}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/rdAddr}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/rden}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/wrAddr}
add wave -noupdate -group BRAM1 -radix unsigned {/cnl_sc1_testbench/i0_cnn_layer_accel_quad/AWE[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1/wren}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12960 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
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
WaveRestoreZoom {32662 ns} {32745 ns}
