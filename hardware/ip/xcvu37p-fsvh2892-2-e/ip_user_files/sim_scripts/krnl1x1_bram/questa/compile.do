vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../krnl1x1_bram/sim/krnl1x1_bram.v" \


vlog -work xil_defaultlib \
"glbl.v"
