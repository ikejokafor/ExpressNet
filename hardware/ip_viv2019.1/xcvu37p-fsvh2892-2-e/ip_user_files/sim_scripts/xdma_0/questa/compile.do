vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" \
"../../../../xdma_0/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_channel.v" \
"../../../../xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtye4_channel_wrapper.v" \
"../../../../xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtwizard_gtye4.v" \
"../../../../xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt_gtwizard_top.v" \
"../../../../xdma_0/ip_0/ip_0/sim/xdma_0_pcie4c_ip_gt.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_cxs_remap.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_16k_int.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_16k.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_32k.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_4k_int.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_msix.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_rep_int.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_rep.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram_tph.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_bram.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gtwizard_top.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_ff_chain.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_pipeline.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_gt_channel.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_gt_common.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_clk.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_rst.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_rxeq.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_txeq.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_sync_cell.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_sync.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_cdr_ctrl_on_eidle.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_receiver_detect_rxterm.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_gt_phy_wrapper.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_phy_top.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_init_ctrl.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_pl_eq.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_vf_decode.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_vf_decode_attr.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_pipe.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_seqnum_fifo.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_sys_clk_gen_ps.v" \
"../../../../xdma_0/ip_0/source/xdma_0_pcie4c_ip_pcie4c_uscale_core_top.v" \
"../../../../xdma_0/ip_0/sim/xdma_0_pcie4c_ip.v" \
"../../../../xdma_0/ip_1/sim/xdma_v4_1_2_blk_mem_64_reg_be.v" \
"../../../../xdma_0/ip_2/sim/xdma_v4_1_2_blk_mem_64_noreg_be.v" \

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" \
"../../../../xdma_0/xdma_v4_1/hdl/verilog/xdma_0_dma_bram_wrap.sv" \
"../../../../xdma_0/xdma_v4_1/hdl/verilog/xdma_0_core_top.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../xdma_0/ip_0/source" "+incdir+../../../ipstatic/hdl/verilog" \
"../../../../xdma_0/sim/xdma_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

