onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib res_dwc_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {res_dwc_fifo.udo}

run -all

quit -force
