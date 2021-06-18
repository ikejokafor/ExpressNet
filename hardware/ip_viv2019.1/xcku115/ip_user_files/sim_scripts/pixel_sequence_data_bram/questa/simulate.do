onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pixel_sequence_data_bram_opt

do {wave.do}

view wave
view structure
view signals

do {pixel_sequence_data_bram.udo}

run -all

quit -force
