onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib krnl1x1_bram_opt

do {wave.do}

view wave
view structure
view signals

do {krnl1x1_bram.udo}

run -all

quit -force
