onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib prevMap_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {prevMap_fifo.udo}

run -all

quit -force
