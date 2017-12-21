onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TOP
} /testbench_0/clk
add wave -noupdate -group {TOP
} /testbench_0/count_init
add wave -noupdate -group {TOP
} /testbench_0/dataout
add wave -noupdate -group {TOP
} /testbench_0/dataout_valid
add wave -noupdate -group {TOP
} /testbench_0/i_filter_datain
add wave -noupdate -group {TOP
} /testbench_0/i_filter_init
add wave -noupdate -group {TOP
} /testbench_0/i_img_datain
add wave -noupdate -group {TOP
} /testbench_0/img_datain_valid
add wave -noupdate -group {TOP
} /testbench_0/rst
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/clk
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/count_init
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/dataout
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/dataout_valid
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/down_counter
add wave -noupdate -group {CONV_ARRAY
} -radix hexadecimal /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_dsp_filter_datain
add wave -noupdate -group {CONV_ARRAY
} -radix hexadecimal /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_dsp_out
add wave -noupdate -group {CONV_ARRAY
} -radix hexadecimal /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_filter_bank
add wave -noupdate -group {CONV_ARRAY
} -radix hexadecimal /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_filter_datain
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_filter_init
add wave -noupdate -group {CONV_ARRAY
} -radix hexadecimal /testbench_0/i0_cnn_layer_accel_layer_conv_array/i_img_datain
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/img_datain_valid
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/pipeline_active
add wave -noupdate -group {CONV_ARRAY
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/rst
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/a
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/a_delay_reg
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/accum
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/b
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/b_delay_reg
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/clk
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/idx
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/m_reg
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/m_reg_u
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/pcin
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/pout
add wave -noupdate -group {DSP0
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i0_cnn_layer_accel_macc_DSP/rst
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/a
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/a_delay_reg
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/accum
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/b
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/b_delay_reg
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/clk
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/idx
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/m_reg
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/m_reg_u
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/pcin
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/pout
add wave -noupdate -group {DSP1
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i1_cnn_layer_accel_macc_DSP/rst
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/a
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/a_delay_reg
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/accum
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/b
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/b_delay_reg
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/clk
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/idx
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/m_reg
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/m_reg_u
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/pcin
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/pout
add wave -noupdate -group {DSP2
} -radix unsigned /testbench_0/i0_cnn_layer_accel_layer_conv_array/i2_cnn_layer_accel_macc_DSP/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {225 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 115
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
WaveRestoreZoom {86 ns} {298 ns}
