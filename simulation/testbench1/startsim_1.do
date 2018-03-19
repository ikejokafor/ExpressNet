vlib work
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ./testbench_1.sv
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../clock_gen.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/fifo_fwft_prog_full_count_mod.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_awe_rowbuffers.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/xilinx_dual_port_1_clock_ram.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_octo_bram_ctrl.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_octo.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bus.v


vsim +notimingchecks -novopt -t 1ns -L work -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -fsmdebug -c +nowarnTSCALE work.glbl work.testbench_1

do wave.do
