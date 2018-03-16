vlib work
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ./testbench_0.sv
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../clock_gen.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_macc_DSP.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/tile_router/hardware/verilog/ +incdir+$env(SOC_IT_ROOT)/cnn_layer_accel/hardware/verilog/ ../../hardware/verilog/cnn_layer_accel_layer_conv_array.v

vsim +notimingchecks -novopt -t 1ns -L work -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -fsmdebug -c +nowarnTSCALE work.glbl work.testbench_0

do wave.do
