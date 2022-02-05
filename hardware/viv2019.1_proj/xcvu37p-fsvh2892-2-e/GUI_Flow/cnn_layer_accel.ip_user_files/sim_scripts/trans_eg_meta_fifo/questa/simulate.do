onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib trans_eg_meta_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {trans_eg_meta_fifo.udo}

run -all

quit -force
