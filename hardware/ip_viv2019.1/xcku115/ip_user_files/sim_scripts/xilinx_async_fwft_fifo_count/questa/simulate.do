onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xilinx_async_fwft_fifo_count_opt

do {wave.do}

view wave
view structure
view signals

do {xilinx_async_fwft_fifo_count.udo}

run -all

quit -force
