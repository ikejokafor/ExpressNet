file delete -force -- ./work


vlib work


# Xilinx Lib
vlog -lint -sv -work work $env(GLBL_PATH)/glbl.v


# Verification Files
vlog -lint -sv +define+SIMULATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/defs \
+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/verification/ +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/ \
+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/ \
+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/verification/ +incdir+$env(WORKSPACE_PATH)/verif_lib/ \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/clock_gen.v" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/cnn_layer_accel_quad_intf.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/cnn_layer_accel_synch_intf.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_testbench.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_environment.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_generator.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_monitor.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_scoreboard.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_agent.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_driver.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/verification/scenario2/cnl_sc2_DUTOutput.sv"


# Accel
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/defs \
+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/defs \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_awe_rowbuffers.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_prefetch_buffer.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_quad_bram_ctrl.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_quad.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_table_top.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_sequence_table0.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_sequence_table1.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_awe_dsps.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_dsps.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_macc_0.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_macc_1.sv" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/awe_dsp_input_mux.sv" \



#Accel Inft
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work +incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/rtl \
+incdir+$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/defs \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/verilog/rtl/xilinx_simple_dual_port_no_change_2_clock_ram.v" \
"$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/rtl/xilinx_simple_dual_port_no_change_ram.sv" \
"$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/rtl/SRL_bit.sv" \
"$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/rtl/SRL_bus.sv" \
"$env(WORKSPACE_PATH)/accel_infst_common/hardware/verilog/rtl/xilinx_true_dual_port_no_change_ram.sv"

# Xilinx IP
vlog -lint -sv +define+SIMULATION +define+VERIFICATION -work work \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcku115/pixel_sequence_data_bram/simulation/blk_mem_gen_v8_3.v" \
"$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcku115/pixel_sequence_data_bram/sim/pixel_sequence_data_bram.v"
