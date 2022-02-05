vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/microblaze_v11_0_1
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_16
vlib riviera/blk_mem_gen_v8_4_3
vlib riviera/iomodule_v3_1_4

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap microblaze_v11_0_1 riviera/microblaze_v11_0_1
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 riviera/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 riviera/blk_mem_gen_v8_4_3
vmap iomodule_v3_1_4 riviera/iomodule_v3_1_4

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -93 \
"../../../ipstatic/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_0/sim/bd_c703_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_1/sim/bd_c703_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_2/sim/bd_c703_ilmb_0.vhd" \
"../../../../ddr4/bd_0/ip/ip_3/sim/bd_c703_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -93 \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_4/sim/bd_c703_dlmb_cntlr_0.vhd" \
"../../../../ddr4/bd_0/ip/ip_5/sim/bd_c703_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"../../../../ddr4/bd_0/ip/ip_6/sim/bd_c703_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_7/sim/bd_c703_second_dlmb_cntlr_0.vhd" \
"../../../../ddr4/bd_0/ip/ip_8/sim/bd_c703_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"../../../../ddr4/bd_0/ip/ip_9/sim/bd_c703_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_4 -93 \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../ddr4/bd_0/ip/ip_10/sim/bd_c703_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"../../../../ddr4/bd_0/sim/bd_c703.v" \
"../../../../ddr4/ip_0/sim/ddr4_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ddr4/ip_1/rtl/map" "+incdir+../../../../ddr4/rtl/ip_top" "+incdir+../../../../ddr4/rtl/cal" \
"../../../../ddr4/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../ddr4/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../ddr4/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../ddr4/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../ddr4/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../ddr4/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../ddr4/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../ddr4/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../ddr4/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../ddr4/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../ddr4/ip_1/rtl/phy/ddr4_phy_ddr4.sv" \
"../../../../ddr4/ip_1/rtl/ip_top/ddr4_phy.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../ddr4/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../ddr4/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../ddr4/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../ddr4/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../ddr4/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../../ddr4/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../../ddr4/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../../ddr4/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../ddr4/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../ddr4/rtl/ip_top/ddr4.sv" \
"../../../../ddr4/rtl/ip_top/ddr4_ddr4.sv" \
"../../../../ddr4/rtl/ip_top/ddr4_ddr4_mem_intfc.sv" \
"../../../../ddr4/rtl/cal/ddr4_ddr4_cal_riu.sv" \
"../../../../ddr4/tb/microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

