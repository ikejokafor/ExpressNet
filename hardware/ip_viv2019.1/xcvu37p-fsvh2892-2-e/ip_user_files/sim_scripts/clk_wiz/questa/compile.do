vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../clk_wiz/clk_wiz_clk_wiz.v" \
"../../../../clk_wiz/clk_wiz.v" \


vlog -work xil_defaultlib \
"glbl.v"

