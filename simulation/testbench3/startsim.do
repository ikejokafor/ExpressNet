set outputDir [pwd]
vsim +outputDir=$outputDir +notimingchecks -t 1ns \
	-L work \
	-L $env(WORKSPACE_PATH)/accel_infst_common/simulation/build/ \
	-L $env(VIVADO_2018_3_SIM_LIBS)/secureip \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unisims_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/simprims_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unimacro_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/unifast_ver \
	-L $env(VIVADO_2018_3_SIM_LIBS)/blk_mem_gen_v8_4_2 \
    -L $env(VIVADO_2018_3_SIM_LIBS)/fifo_generator_v13_2_3 \
    -fsmdebug -c +nowarnTSCALE work.glbl work.testbench
# do wave.do
