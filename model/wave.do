onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/clk
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_AWP_id
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_FAS_id
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_mem_mng
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_next_req_id
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_num_QUADs_cfgd
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_num_trans_in_prog
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_QUADs_cfgd_arr
add wave -noupdate -group AWP /CNN_Layer_Accel/AWP_1/m_trans
add wave -noupdate -group Bus /CNN_Layer_Accel/AWP_1/bus/clk
add wave -noupdate -group Bus /CNN_Layer_Accel/AWP_1/bus/m_QUAD_complt_arr
add wave -noupdate -group Bus /CNN_Layer_Accel/AWP_1/bus/m_req_arr
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/clk
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_cascade_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_conv_out_fmt0_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_crpd_input_row_end_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_crpd_input_row_start_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_ex_start_time
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_input_col
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_input_row
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_krnl_count
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_last_res_wrtn
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_master_QUAD_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_ex_cycles
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_expd_input_cols_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_input_col_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_kernels_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_output_col_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_num_output_rows_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_output_col
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_output_row
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_padding_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_pfb_count
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_pfb_wrtn
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_QUAD_id
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_res_fifo
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_result_QUAD_cfg
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_return_state
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_start
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_state
add wave -noupdate -group QUAD0 /CNN_Layer_Accel/AWP_1/QUAD_0/m_upsmaple_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/clk
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_cascade_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_conv_out_fmt0_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_crpd_input_row_end_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_crpd_input_row_start_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_ex_start_time
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_input_col
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_input_row
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_krnl_count
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_last_res_wrtn
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_master_QUAD_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_ex_cycles
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_expd_input_cols_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_input_col_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_kernels_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_output_col_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_num_output_rows_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_output_col
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_output_row
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_padding_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_pfb_count
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_pfb_wrtn
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_QUAD_id
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_res_fifo
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_result_QUAD_cfg
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_return_state
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_start
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_state
add wave -noupdate -group QUAD1 /CNN_Layer_Accel/AWP_1/QUAD_1/m_upsmaple_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/clk
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_cascade_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_conv_out_fmt0_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_crpd_input_row_end_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_crpd_input_row_start_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_ex_start_time
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_input_col
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_input_row
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_krnl_count
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_last_res_wrtn
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_master_QUAD_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_ex_cycles
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_expd_input_cols_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_input_col_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_kernels_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_output_col_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_num_output_rows_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_output_col
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_output_row
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_padding_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_pfb_count
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_pfb_wrtn
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_QUAD_id
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_res_fifo
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_result_QUAD_cfg
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_return_state
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_start
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_state
add wave -noupdate -group QUAD2 /CNN_Layer_Accel/AWP_1/QUAD_2/m_upsmaple_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/clk
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_cascade_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_conv_out_fmt0_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_crpd_input_row_end_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_crpd_input_row_start_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_ex_start_time
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_input_col
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_input_row
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_krnl_count
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_last_res_wrtn
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_master_QUAD_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_ex_cycles
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_expd_input_cols_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_input_col_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_kernels_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_output_col_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_num_output_rows_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_output_col
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_output_row
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_padding_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_pfb_count
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_pfb_wrtn
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_QUAD_id
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_res_fifo
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_result_QUAD_cfg
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_return_state
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_start
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_state
add wave -noupdate -group QUAD3 /CNN_Layer_Accel/AWP_1/QUAD_3/m_upsmaple_cfg
add wave -noupdate -group FAS2AWP /CNN_Layer_Accel/FAS2AWE_bus/clk
add wave -noupdate -group FAS2AWP /CNN_Layer_Accel/FAS2AWE_bus/m_trans_fifo
add wave -noupdate -group AWP2FAS /CNN_Layer_Accel/AWE2FAS_bus/clk
add wave -noupdate -group AWP2FAS /CNN_Layer_Accel/AWE2FAS_bus/m_trans_fifo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
