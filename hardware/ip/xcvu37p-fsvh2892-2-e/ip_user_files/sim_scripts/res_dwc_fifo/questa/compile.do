vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../res_dwc_fifo/sim/res_dwc_fifo.v" \


vlog -work xil_defaultlib \
"glbl.v"

