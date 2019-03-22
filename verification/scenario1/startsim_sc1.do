vlib work

# Xilinx Lib
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v


# Verification Files
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ../clock_gen.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ../cnn_layer_accel_quad_intf.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_testbench.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_environment.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_generator.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_monitor.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_scoreboard.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_agent.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_driver.sv
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/verification/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/verif_lib/ ./cnl_sc1_DUTOutput.sv


# Accel
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_awe_rowbuffers.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/xilinx_simple_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/xilinx_true_dual_port_no_change_ram.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_quad_bram_ctrl.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_quad.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bus.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_table_top.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_sequence_table0.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_weight_sequence_table1.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_awe_dsps.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_dsps.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_macc_0.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_ce_macc_1.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/awe_dsp_input_mux.v

# Xilinx IP
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/simulation/fifo_generator_vlog_beh.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/sim/prefetch_buffer_fifo.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/prefetch_buffer_fifo/hdl/fifo_generator_v13_1_rfs.v
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/ip/xcku115/pixel_sequence_data_bram/sim/pixel_sequence_data_bram.v


vsim +notimingchecks -novopt -t 1ns -L work -L $env(SOC_IT_SIMULATION_PATH)/verif_lib -L $env(SOC_IT_SIMULATION_PATH)/soc_it_common -L $env(SOC_IT_SIMULATION_PATH)/soc_it_capi -L $env(SOC_IT_SIMULATION_PATH)/secureip -L $env(SOC_IT_SIMULATION_PATH)/unisims_ver -L $env(SOC_IT_SIMULATION_PATH)/simprims_ver -L $env(SOC_IT_SIMULATION_PATH)/unimacro_ver -L $env(SOC_IT_SIMULATION_PATH)/unifast_ver -L $env(SOC_IT_SIMULATION_PATH)/blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
#vsim +notimingchecks -vopt -t 1ns -L work -L $env(SOC_IT_SIMULATION_PATH)/verif_lib -L $env(SOC_IT_SIMULATION_PATH)/soc_it_common -L $env(SOC_IT_SIMULATION_PATH)/soc_it_capi -L $env(SOC_IT_SIMULATION_PATH)/secureip -L $env(SOC_IT_SIMULATION_PATH)/unisims_ver -L $env(SOC_IT_SIMULATION_PATH)/simprims_ver -L $env(SOC_IT_SIMULATION_PATH)/unimacro_ver -L $env(SOC_IT_SIMULATION_PATH)/unifast_ver -L $env(SOC_IT_SIMULATION_PATH)/blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
do wave.do