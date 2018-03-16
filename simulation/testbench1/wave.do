onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TOP /testbench_1/rst
add wave -noupdate -group TOP /testbench_1/clk
add wave -noupdate -group TOP /testbench_1/pixel_datain_tag
add wave -noupdate -group TOP /testbench_1/pixel_datain_rdy
add wave -noupdate -group TOP /testbench_1/seq_datain_tag
add wave -noupdate -group TOP /testbench_1/seq_datain_rdy
add wave -noupdate -group TOP -radix unsigned /testbench_1/datain
add wave -noupdate -group TOP /testbench_1/datain_valid
add wave -noupdate -group TOP /testbench_1/fd
add wave -noupdate -group TOP /testbench_1/i
add wave -noupdate -group TOP /testbench_1/j
add wave -noupdate -group TOP /testbench_1/parity0
add wave -noupdate -group TOP /testbench_1/parity1
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/BRAM
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/RAM_DEPTH
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/RAM_WIDTH
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/clk
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/count
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/datain
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/dataout
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/full
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/rdAddr
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/rd_addr_plus_one
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/rd_address
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/rden
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/rst
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/wrAddr
add wave -noupdate -group SEQ /testbench_1/i0_cnn_layer_accel_octo/sequencer/wren
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_BRAM_DEPTH
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/C_NUM_AWE
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_AWE_CE_ACTIVE
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_IDLE
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_PFB
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/ST_LOAD_SEQUENCER
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/clk
add wave -noupdate -group {CTRL
} -radix unsigned /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/col
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/col_d
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/datain_valid
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gc
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/gray_code
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/new_map
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numCols
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numCols_r
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numRows
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/numRows_r
add wave -noupdate -group {CTRL
} -radix unsigned /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_count
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_rden
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_rden_d
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pfb_wren
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_datain_rdy
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/pixel_datain_tag
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_Matric
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/row_d
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/rst
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_count
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_datain_rdy
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_datain_tag
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_full_count
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rdAddr
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_rden
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wrAddr
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/seq_wren
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state
add wave -noupdate -group {CTRL
} /testbench_1/i0_cnn_layer_accel_octo/i0_cnn_layer_accel_octo_bram_ctrl/state_s
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_BRAM_DEPTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_LOG2_BRAM_DEPTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_DATAOUT_WIDTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/C_PIXEL_WIDTH}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_ACTIVE}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER_0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/ST_AWE_CE_PRIM_BUFFER_1}
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
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/col}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/col_d}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/gray_code}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/numCols}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/numRows}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pfb_rden}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_datain_valid}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_dataout}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/pixel_dataout_valid}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_buffer_sav_val1}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_d}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/row_matric}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/rst}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_even}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field0}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_field1}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/seq_datain_odd}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/state_s}
add wave -noupdate -group {ROW_BUFFERS} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/sv_val}
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_BRAM_DEPTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_LOG2_BRAM_DEPTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_LOG2_SEQ_DATA_DEPTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_NUM_AWE
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_DATAOUT_WIDTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_PIXEL_WIDTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_SEQ_DATA_DEPTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/C_SEQ_DATA_WIDTH
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/ST_AWE_CE_PRIM_BUFFER_0
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/ST_AWE_CE_PRIM_BUFFER_1
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrL_seq_rden
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_col
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_col_d
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_gray_code
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_numCols
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_numRows
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_pfb_rden
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_pfb_rden_d
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_pfb_wren
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_row
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_row_d
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_rdAddr
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_wrAddr
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_seq_wren
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/bram_ctrl_state
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/clk
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/datain
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/datain_valid
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/new_map
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pfb_count
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pfb_dataout
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pfb_rden
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pixel_datain_rdy
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pixel_datain_tag
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/pixel_dataout_valid
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/rst
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/seq_count
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/seq_datain_rdy
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/seq_datain_tag
add wave -noupdate -group {OCTO
} /testbench_1/i0_cnn_layer_accel_octo/seq_dataout
add wave -noupdate -group {BRAM0
} -childformat {{{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[9]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[8]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[7]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[6]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[5]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[4]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[3]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[2]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[1]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[0]} -radix unsigned}} -subitemconfig {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[9]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[8]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[7]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[6]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[5]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[4]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[3]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[2]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[1]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM[0]} {-height 15 -radix unsigned}} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/BRAM}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/RAM_DEPTH}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/RAM_WIDTH}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/clk}
add wave -noupdate -group {BRAM0
} -radix unsigned {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/count}
add wave -noupdate -group {BRAM0
} -radix unsigned {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/datain}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/dataout}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/full}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/rdAddr}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/rd_addr_plus_one}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/rd_address}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/rden}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/rst}
add wave -noupdate -group {BRAM0
} -radix unsigned {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/wrAddr}
add wave -noupdate -group {BRAM0
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i0_xilinx_dual_port_1_clock_ram/wren}
add wave -noupdate -group {BRAM1
} -childformat {{{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[521]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[520]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[519]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[518]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[517]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[516]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[515]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[514]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[513]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[512]} -radix unsigned}} -expand -subitemconfig {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[521]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[520]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[519]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[518]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[517]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[516]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[515]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[514]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[513]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM[512]} {-height 15 -radix unsigned}} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/BRAM}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/RAM_DEPTH}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/RAM_WIDTH}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/clk}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/count}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/datain}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/dataout}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/full}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/rdAddr}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/rd_addr_plus_one}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/rd_address}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/rden}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/rst}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/wrAddr}
add wave -noupdate -group {BRAM1
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i1_xilinx_dual_port_1_clock_ram/wren}
add wave -noupdate -group {BRAM2
} -childformat {{{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[521]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[520]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[519]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[518]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[517]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[516]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[515]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[514]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[513]} -radix unsigned} {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[512]} -radix unsigned}} -expand -subitemconfig {{/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[521]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[520]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[519]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[518]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[517]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[516]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[515]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[514]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[513]} {-height 15 -radix unsigned} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM[512]} {-height 15 -radix unsigned}} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/BRAM}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/RAM_DEPTH}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/RAM_WIDTH}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/clk}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/count}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/datain}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/dataout}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/full}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/rdAddr}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/rd_addr_plus_one}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/rd_address}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/rden}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/rst}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/wrAddr}
add wave -noupdate -group {BRAM2
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i2_xilinx_dual_port_1_clock_ram/wren}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/BRAM}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/RAM_DEPTH}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/RAM_WIDTH}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/clk}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/count}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/datain}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/dataout}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/full}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/rdAddr}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/rd_addr_plus_one}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/rd_address}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/rden}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/rst}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/wrAddr}
add wave -noupdate -group {BRAM3
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/i0_cnn_layer_accel_awe_rowbuffers/i3_xilinx_dual_port_1_clock_ram/wren}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_ALMOST_FULL_THRESHOLD}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_DATA_WIDTH}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_FIFO_DEPTH}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_FIFO_DEPTH_ACTUAL}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_LOG2_FIFO_DEPTH}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/C_PROG_FULL_THRESHOLD}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/clk}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/count}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/datain}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/dataout}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/empty}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/empty_delay}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/empty_r}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/fifo_buffer}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/full}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/occupancy}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/prog_full}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/rd_ptr}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/rd_ptr_current}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/rd_ptr_plus1}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/rden}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/read_allow}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/rst}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/wr_ptr}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/wren}
add wave -noupdate -group {PFB
} {/testbench_1/i0_cnn_layer_accel_octo/genblk1[0]/preftechBuffer/write_allow}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {790 ns} 0}
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
WaveRestoreZoom {0 ns} {2111 ns}
