onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TOP} /testbench_1/COLS
add wave -noupdate -group {TOP} /testbench_1/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {TOP} /testbench_1/C_PERIOD
add wave -noupdate -group {TOP} /testbench_1/ROWS
add wave -noupdate -group {TOP} /testbench_1/arr
add wave -noupdate -group {TOP} /testbench_1/arr2
add wave -noupdate -group {TOP} /testbench_1/clk
add wave -noupdate -group {TOP} /testbench_1/datain
add wave -noupdate -group {TOP} /testbench_1/datain_valid
add wave -noupdate -group {TOP} /testbench_1/fd
add wave -noupdate -group {TOP} /testbench_1/i
add wave -noupdate -group {TOP} /testbench_1/j
add wave -noupdate -group {TOP} /testbench_1/parity0
add wave -noupdate -group {TOP} /testbench_1/parity1
add wave -noupdate -group {TOP} /testbench_1/pixel_datain_tag
add wave -noupdate -group {TOP} /testbench_1/rst
add wave -noupdate -group {TOP} /testbench_1/seq_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_BRAM_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_NUM_AWE
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_SEQ_DATA_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrL_pfb_rden
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrL_seq_rden
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_col
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_gray_code
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_numCols
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_numRows
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_pfb_wren
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_row
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_rdAddr
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_wrAddr
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_wren
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_state
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bran_ctrl_wrAddr
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/clk
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/datain
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/datain_valid
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/new_map
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_dataout
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_full
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout_valid
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/rst
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_count
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_datain
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_dataout
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_BRAM_DEPTH
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_NUM_AWE
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_PRIM_BUFFER
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_IDLE
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_PFB
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_SEQUENCER
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/clk
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/col
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/datain_valid
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gc
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gray_code
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/new_map
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numCols
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numCols_r
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numRows
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numRows_r
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_full
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_rden
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_wren
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_datain_tag
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_Matric
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/rst
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_datain_tag
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rdAddr
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rden
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wrAddr
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wren
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state_s
add wave -noupdate -group CTRL /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/wrAddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {567 ns}
