vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/gtwizard_ultrascale_v1_7_5
vlib riviera/blk_mem_gen_v8_4_2
vlib riviera/xdma_v4_1_2

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap gtwizard_ultrascale_v1_7_5 riviera/gtwizard_ultrascale_v1_7_5
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2
vmap xdma_v4_1_2 riviera/xdma_v4_1_2

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/software/vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/software/vivado-2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work gtwizard_ultrascale_v1_7_5  -v2k5 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_channel.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtye4_channel_wrapper.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtwizard_gtye4.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtwizard_top.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_cxs_remap.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_16k_int.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_16k.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_32k.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_4k_int.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_msix.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_rep_int.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_rep.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_tph.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gtwizard_top.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_ff_chain.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_pipeline.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_gt_channel.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_gt_common.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_clk.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_rst.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_rxeq.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_txeq.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_sync_cell.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_sync.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_cdr_ctrl_on_eidle.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_receiver_detect_rxterm.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_wrapper.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_top.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_init_ctrl.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_pl_eq.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_vf_decode.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_vf_decode_attr.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_pipe.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_seqnum_fifo.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_sys_clk_gen_ps.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source/xdma_0_pcie4c_ip_pcie4c_uscale_core_top.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/sim/xdma_0_pcie4c_ip.v" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_1/sim/xdma_v4_1_2_blk_mem_64_reg_be.v" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_2/sim/xdma_v4_1_2_blk_mem_64_noreg_be.v" \

vlog -work xdma_v4_1_2  -sv2k12 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../ipstatic/hdl/xdma_v4_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/xdma_v4_1/hdl/verilog/xdma_0_dma_bram_wrap.sv" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/xdma_v4_1/hdl/verilog/xdma_0_core_top.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" "+incdir+/home/software/vivado-2018.3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../xdma_0_ex.srcs/sources_1/ip/xdma_0/sim/xdma_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

