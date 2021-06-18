vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/fifo_generator_v13_1_0

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap fifo_generator_v13_1_0 activehdl/fifo_generator_v13_1_0

vlog -work xil_defaultlib -v2k5 -sv \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_1_0 -v2k5 \
"../../../ipstatic/fifo_generator_v13_1_0/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_0 -93 \
"../../../ipstatic/fifo_generator_v13_1_0/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_0 -v2k5 \
"../../../ipstatic/fifo_generator_v13_1_0/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work xil_defaultlib -v2k5 \
"../../../../xilinx_async_fwft_fifo_count/sim/xilinx_async_fwft_fifo_count.v" \

vlog -work xil_defaultlib "glbl.v"

