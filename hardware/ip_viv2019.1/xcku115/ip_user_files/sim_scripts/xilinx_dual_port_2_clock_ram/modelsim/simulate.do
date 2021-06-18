onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L blk_mem_gen_v8_3_2 -lib xil_defaultlib xil_defaultlib.xilinx_dual_port_2_clock_ram xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {xilinx_dual_port_2_clock_ram.udo}

run -all

quit -force
