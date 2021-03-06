vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/fifo_generator_v13_1_3

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap fifo_generator_v13_1_3 activehdl/fifo_generator_v13_1_3

vlog -work xil_defaultlib  -sv2k12 \
"/home/software/xilinx-2016.4/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/software/xilinx-2016.4/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/software/xilinx-2016.4/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_3 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../prefetch_buffer_fifo/sim/prefetch_buffer_fifo.v" \

vlog -work xil_defaultlib "glbl.v"

