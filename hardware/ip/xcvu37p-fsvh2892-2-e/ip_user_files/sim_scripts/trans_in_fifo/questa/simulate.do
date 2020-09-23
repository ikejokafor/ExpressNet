onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib trans_in_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {trans_in_fifo.udo}

run -all

quit -force
