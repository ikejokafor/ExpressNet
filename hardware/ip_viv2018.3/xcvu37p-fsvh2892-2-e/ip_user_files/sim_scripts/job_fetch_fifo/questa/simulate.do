onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib job_fetch_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {job_fetch_fifo.udo}

run -all

quit -force
