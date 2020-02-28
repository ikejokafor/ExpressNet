vdel -lib work


vlib work


vcom -64 -93 -work work  \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_0/sim/bd_9054_microblaze_I_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_1/sim/bd_9054_rst_0_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_2/sim/bd_9054_ilmb_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_3/sim/bd_9054_dlmb_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_4/sim/bd_9054_dlmb_cntlr_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_5/sim/bd_9054_ilmb_cntlr_0.vhd


vlog -64 -incr -work work \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_6/sim/bd_9054_lmb_bram_I_0.v 


vcom -64 -93 -work work  \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_7/sim/bd_9054_second_dlmb_cntlr_0.vhd \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_8/sim/bd_9054_second_ilmb_cntlr_0.vhd 


vlog -64 -incr -work work \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_9/sim/bd_9054_second_lmb_bram_I_0.v


vcom -64 -93 -work work \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/ip/ip_10/sim/bd_9054_iomodule_0_0.vhd


vlog -64 -incr -work work \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/bd_0/sim/bd_9054.v \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_0/sim/ddr4_0_microblaze_mcs.v


vlog -64 -incr -sv -work work \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_0_phy_ddr4.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/ip_top/ddr4_0_phy.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_wtr.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ref.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_periodic.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_group.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ctl.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_cmd.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_fifo.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_a_upsizer.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_and.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_carry_or.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_command_fifo.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_r_upsizer.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi/ddr4_v2_2_w_upsizer.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/clocking/ddr4_v2_2_infrastructure.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_write.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_sync.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_read.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_pi.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_top.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_dp_AB9.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4_mem_intfc.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal/ddr4_0_ddr4_cal_riu.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/tb/microblaze_mcs_0.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/arch_package.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/proj_package.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_model.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_axi_opcode_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_axi_tg_top.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_axi_wrapper.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_boot_mode_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_custom_mode_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_data_chk.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_data_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/ddr4_v2_2_prbs_mode_gen.sv \
	$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports/interface.sv


#sccom -DMODELSIM -I $env(WORKSPACE_PATH)/cnn_layer_accel/model/inc/ -I $env(WORKSPACE_PATH)/util/inc/ \
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/AWP.cpp \
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/AWPBus.cpp \
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/FAS.cpp \
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/Interconnect.cpp	\
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/QUAD.cpp \
#	$env(WORKSPACE_PATH)/cnn_layer_accel/model/src/CNN_layer_accel.cpp
#sccom -link


# compile glbl module
vlog -work work glbl.v


# vlog -64 -incr -sv -work work \
# 	+incdir+./ \
# 	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
# 	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
# 	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
# 	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
# 	+incdir+$env(WORKSPACE_PATH)/uvm-1.2/src \
# 	$env(WORKSPACE_PATH)/uvm-1.2/src/uvm_pkg.sv \
# 	./example_top.sv \
# 	./testbench.sv


vlog -64 -incr -sv -work work \
	+incdir+./ \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map \
	+incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
	./example_top.sv \
	./testbench.sv


# vlog -64 -incr -sv -work work  +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/ip_top +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/rtl/cal +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/ddr4_0_ex.srcs/sources_1/ip/ddr4_0/ip_1/rtl/map +incdir+$env(WORKSPACE_PATH)/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0_ex/imports \
# 	example_top.sv \
# 	testbench.sv
