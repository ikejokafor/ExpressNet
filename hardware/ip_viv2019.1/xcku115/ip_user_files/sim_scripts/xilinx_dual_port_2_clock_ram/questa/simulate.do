onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xilinx_dual_port_2_clock_ram_opt

do {wave.do}

view wave
view structure
view signals

do {xilinx_dual_port_2_clock_ram.udo}

run -all

quit -force
