onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib conv1_1x1_dwc_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {conv1_1x1_dwc_fifo.udo}

run -all

quit -force
