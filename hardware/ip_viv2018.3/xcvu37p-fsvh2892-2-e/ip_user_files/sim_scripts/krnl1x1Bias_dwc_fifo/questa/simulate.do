onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib krnl1x1Bias_dwc_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {krnl1x1Bias_dwc_fifo.udo}

run -all

quit -force
