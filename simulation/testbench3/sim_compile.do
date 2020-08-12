vlib work


# Xilinx Lib
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v

# Accel Infastructure
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ $env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/fifo_fwft_prog_full_count.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ $env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/fifo_fwft.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ $env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/SRL_bit.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ $env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/SRL_bus.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ $env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/clock_gen.v


# Design Files
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/cnn_layer_accel_FAS.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/ ./testbench.sv


# Xilinx IP
