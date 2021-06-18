if {[file exist work]} {
    vdel -all -lib work
}


vlib work


# Xilinx Lib
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v


# Design Files
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_conv1x1_pip.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS_pip_ctrl.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS_vec_add.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_trans_eg_fifo.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_trans_in_fifo.v
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs/ ./testbench.sv


# Xilinx IP
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/convMap_fifo/sim/convMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/partMap_fifo/sim/partMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/resdMap_fifo/sim/resdMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/conv1x1_dwc_fifo/sim/conv1x1_dwc_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/outbuf_fifo/sim/outbuf_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/prevMap_fifo/sim/prevMap_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/job_fetch_fifo/sim/job_fetch_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/res_dwc_fifo/sim/res_dwc_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/trans_in_meta_fifo/sim/trans_in_meta_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/trans_in_pyld_fifo/sim/trans_in_pyld_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/trans_eg_meta_fifo/sim/trans_eg_meta_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/trans_eg_pyld_fifo/sim/trans_eg_pyld_fifo.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/krnl1x1_bram/sim/krnl1x1_bram.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/krnl1x1Bias_bram/sim/krnl1x1Bias_bram.v
vlog -lint -sv +define+SIMULATION -work work $env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/krnl1x1Bias_dwc_fifo/sim/krnl1x1Bias_dwc_fifo.v
