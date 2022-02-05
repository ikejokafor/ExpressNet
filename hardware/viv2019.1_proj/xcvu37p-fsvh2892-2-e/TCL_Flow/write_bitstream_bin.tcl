cd C:/ReALM_CAPI/hardware/Projects/AIM_HMAX_STREAM/vivado/build
open_checkpoint Implement/psl_fpga/psl_fpga_route_design.dcp
# SelectMap port must not persist after configuration
set_property BITSTREAM.CONFIG.PERSIST {No} [ current_design ]
set_property BITSTREAM.GENERAL.COMPRESS {True} [ current_design]
# Configuration from G18 Flash as per XAPP587
set_property BITSTREAM.STARTUP.STARTUPCLK {Cclk} [ current_design ]
set_property BITSTREAM.CONFIG.BPI_1ST_READ_CYCLE {1} [ current_design ]
set_property BITSTREAM.CONFIG.BPI_PAGE_SIZE {1} [ current_design ]
set_property BITSTREAM.CONFIG.BPI_SYNC_MODE {Type1} [ current_design ]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {div-1} [ current_design ]
# Set CFGBVS to GND to match schematics
set_property CFGBVS {GND} [ current_design ]

# Set CONFIG_VOLTAGE to 1.8V to match schematics
set_property CONFIG_VOLTAGE {1.8} [ current_design ]
write_bitstream -force psl_fpga.bit
write_cfgmem -format bin -loadbit "up 0x0 psl_fpga.bit" -file psl_fpga_flash -size 128 -interface  BPIx16 -force
write_debug_probes debug.ltx -force
