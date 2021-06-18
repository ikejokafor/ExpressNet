onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib partMap_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {partMap_fifo.udo}

run -all

quit -force
