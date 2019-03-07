vlib work
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ./testbench.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ./test_0_wrapper.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../clock_gen.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_awe_rowbuffers.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/xilinx_simple_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/xilinx_true_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_quad_bram_ctrl.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_quad.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bus.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_table_top.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_sequence_table0.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_sequence_table1.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_awe_dsps.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_dsps.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_macc_0.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_macc_1.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/awe_dsp_input_mux.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/fifo_generator_v13_1_0/hdl/fifo_generator_v13_1_rfs.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/fifo_generator_v13_1_0/simulation/fifo_generator_vlog_beh.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/sim/prefetch_buffer_fifo.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/pixel_sequence_data_bram/sim/pixel_sequence_data_bram.v


#vsim +notimingchecks -novopt -t 1ns -L work -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver  -L blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.testbench
vsim +notimingchecks -novopt -L work -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver  -L blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.testbench
do wave.do
