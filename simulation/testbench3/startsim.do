vsim +outputDir=$outputDir +notimingchecks -novopt -t 1ns 
	-L work \
	-L $env(VIVADO_2018_3_SIM_LIBS)/secureip \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unisims_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/simprims_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unimacro_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unifast_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.testbench
# do wave.do
