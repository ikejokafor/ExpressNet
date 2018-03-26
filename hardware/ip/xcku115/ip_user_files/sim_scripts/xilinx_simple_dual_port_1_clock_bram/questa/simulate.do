onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xilinx_simple_dual_port_1_clock_bram_opt

do {wave.do}

view wave
view structure
view signals

do {xilinx_simple_dual_port_1_clock_bram.udo}

run -all

quit -force
