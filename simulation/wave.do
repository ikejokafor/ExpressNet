onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_DATAIN_WIDTH
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_DATAOUT_WIDTH
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_MAX_IMG_WIDTH
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_NUM_ROW_BUF
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_OPCODE_WIDTH
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_PIXEL_WIDTH
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/C_POOL_WINDOW_SZ
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_ACTIVE
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_BUSY
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_DECODE_OPCODE
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_FLUSH_PIPELINE
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_IDLE_0
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_IDLE_1
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_LOAD_OPCODE
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/ST_LOAD_ROW_BUFFERS
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/clk
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/datain
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/datain_ready
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/datain_valid
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/dataout
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/dataout_ready
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/dataout_valid
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_count
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_datain
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_dataout
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_full
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_rden
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_wr_addr
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_wr_addr_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_wren
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer_wren_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_count
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_dataout
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_full
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_rden
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_wr_addr
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_wr_addr_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_wren
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer_wren_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i2_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i2_SRL_bus_out_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i3_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i4_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i5_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i5_SRL_bus_out_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i6_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i7_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i8_SRL_bus_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i8_SRL_bus_out_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/img_col_count
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/img_row_count
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/init_pipeline
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_buffer_dataout
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_buffer_empty
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_buffer_full
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_buffer_rden
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_img_col
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/input_img_row
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/map_count
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/num_maps
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/num_output_pixels
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/opcode
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/opcode_accept
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/opcode_complete
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/opcode_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/opcode_valid
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/output_buffer_datain
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/output_buffer_full
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/output_buffer_wren
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/pad_amt
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max0_0
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max0_1
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max0_2
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max1_1
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max1_2
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max1_3
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max1_3_r
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/partial_max2
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/pool_out
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/pool_out_valid
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/row_buffer_select
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/rst
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/state_0
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/state_0_s
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/state_1
add wave -noupdate -group POOL /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/state_1_s
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/BUFFER
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/C_IMAGE_WIDTH
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/C_PIXEL_WIDTH
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/clk
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/count
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/din
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/dout
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/full
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/i
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/rden
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/rst
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/wr_addr
add wave -noupdate -group {ROW_BUF0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i0_row_buffer/wren
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/BUFFER
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/C_IMAGE_WIDTH
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/C_PIXEL_WIDTH
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/clk
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/count
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/din
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/dout
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/full
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/i
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/rden
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/rst
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/wr_addr
add wave -noupdate -group ROW_BUF1 -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_engine_pooler/i1_row_buffer/wren
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{End of window 0
} {320 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 265
configure wave -valuecolwidth 196
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
WaveRestoreZoom {378 ns} {698 ns}
