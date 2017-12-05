vlib work
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ./testbench_0.sv
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ./clock_gen.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ../hardware/verilog/cnn_layer_accel_layer_engine_pooler.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ../hardware/verilog/row_buffer.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ../hardware/verilog/SRL_bit.v
vlog -lint -sv +define+simulation +define+SIMULATION -work work +incdir+$env(SOC_IT_ROOT)/soc_it_common/hardware/include +incdir+$env(SOC_IT_ROOT)/pooling_engine/hardware/verilog/ ../hardware/verilog/SRL_bus.v


vsim +notimingchecks -novopt -t 1ns -L work -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -fsmdebug -c +nowarnTSCALE work.glbl work.testbench_0
