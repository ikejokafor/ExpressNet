rm -r work


vlib work


# Xilinx Lib
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v


# Design Files
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/cnn_layer_accel_FAS.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/ ./testbench.sv


# Xilinx IP
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/convMap_fifo/sim/convMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/partMap_fifo/sim/partMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/resdMap_fifo/sim/resdMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/conv1x1_dwc_fifo/sim/conv1x1_dwc_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/outbuf_fifo/sim/outbuf_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/prevMap_fifo/sim/prevMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/job_fetch_fifo/sim/job_fetch_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/res_dwc_fifo/sim/res_dwc_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/trans_in_fifo/sim/trans_in_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/trans_eg_fifo/sim/trans_eg_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/krnl1x1_bram/sim/krnl1x1_bram.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/krnl1x1Bias_bram/sim/krnl1x1Bias_bram.v
