onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TOP_TB} /testbench_1/COLS
add wave -noupdate -group {TOP_TB} /testbench_1/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {TOP_TB} /testbench_1/C_PERIOD
add wave -noupdate -group {TOP_TB} /testbench_1/KERNEL_SIZE
add wave -noupdate -group {TOP_TB} /testbench_1/ROWS
add wave -noupdate -group {TOP_TB} /testbench_1/arr
add wave -noupdate -group {TOP_TB} /testbench_1/arr2
add wave -noupdate -group {TOP_TB} /testbench_1/clk
add wave -noupdate -group {TOP_TB} /testbench_1/datain
add wave -noupdate -group {TOP_TB} /testbench_1/datain_valid
add wave -noupdate -group {TOP_TB} /testbench_1/fd
add wave -noupdate -group {TOP_TB} /testbench_1/i
add wave -noupdate -group {TOP_TB} /testbench_1/j
add wave -noupdate -group {TOP_TB} /testbench_1/parity0
add wave -noupdate -group {TOP_TB} /testbench_1/parity1
add wave -noupdate -group {TOP_TB} /testbench_1/pixel_datain_rdy
add wave -noupdate -group {TOP_TB} /testbench_1/pixel_datain_tag
add wave -noupdate -group {TOP_TB} /testbench_1/rst
add wave -noupdate -group {TOP_TB} /testbench_1/seq_datain_rdy
add wave -noupdate -group {TOP_TB} /testbench_1/seq_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_BRAM_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_NUM_AWE
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_SEQ_DATA_DEPTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/C_SEQ_DATA_WIDTH
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_AWE_CE_ACTIVE
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_AWE_CE_PRIM_BUFFER_0
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_AWE_CE_PRIM_BUFFER_1
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_FIN_ROW_MATRIC
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_IDLE
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_LOAD_PFB
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/ST_LOAD_SEQUENCER
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_pfb_rden
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/clk
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/cycle_counter
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/datain
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/datain_valid
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/gray_code
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/input_col
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/input_col_d
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/input_row_d
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/new_map
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/num_input_cols
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_count
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_dataout
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_rden
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_rden_d
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pfb_wren
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_datain_rdy
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout_valid
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/row_matric
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/row_matric_done
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/rst
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_count
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_count_rst
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_count_set
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_count_set_value
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_datain_rdy
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_datain_tag
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_dataout
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_rdAddr
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_rden
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_wrAddr
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/seq_wren
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/state
add wave -noupdate -group {OCTO} /testbench_1/i0_cnn_layer_accel_octo/state_s
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/BRAM
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/C_RAM_DEPTH
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/C_RAM_WIDTH
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/C_SEQ_ACCESS
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/clk
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/count
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/count_rst
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/count_set
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/count_set_value
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/datain
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/dataout
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/full
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/rdAddr
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/rd_addr_plus_one
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/rd_address
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/rden
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/rst
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/wrAddr
add wave -noupdate -group {SEQ} /testbench_1/i0_cnn_layer_accel_octo/sequencer/wren
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_BRAM_DEPTH
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_NUM_AWE
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_PRIM_BUFFER_0
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_PRIM_BUFFER_1
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_FIN_ROW_MATRIC
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_IDLE
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_PFB
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_SEQUENCER
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/clk
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/cycle_counter
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/datain_valid
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gc
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gray_code
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/input_col
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/input_col_d
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/input_row
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/input_row_d
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/new_map
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/num_input_cols
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/num_input_cols_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/num_input_rows_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/num_output_cols_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/num_output_rows_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/output_col
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/output_row
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_count
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_rden
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_rden_d
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_wren
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_datain_rdy
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_datain_tag
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_dataout_valid
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_dataout_valid_r
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_matric
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_matric_count
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_matric_done
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_matric_done_count_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/rst
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count_rst
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count_set
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count_set_value
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_datain_rdy
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_datain_tag
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_full_count_cfg
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rdAddr
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rden
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wrAddr
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wren
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/start_count_delay
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state
add wave -noupdate -group {CTRL} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state_s
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_BRAM_DEPTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_WIDTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER_0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER_1}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_FIN_ROW_MATRIC}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_IDLE}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_LOAD_PFB}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_LOAD_SEQUENCER}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rdAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wrAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram0_wren}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rdAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wrAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram1_wren}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rdAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wrAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram2_wren}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rdAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wrAddr}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/bram3_wren}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/clk}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/cycle_counter}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/input_col}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/input_col_d}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/input_row_d}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/num_input_cols}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_datain_valid}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric_done}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_even}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field1}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_odd}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4613 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
configure wave -valuecolwidth 191
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
WaveRestoreZoom {4509 ns} {4721 ns}
