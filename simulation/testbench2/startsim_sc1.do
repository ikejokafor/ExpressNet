set seed [clock seconds]
set outputDir [pwd]


vsim +outputDir=$outputDir +notimingchecks -novopt -t 1ns -L work -L $env(SOC_IT_SIMULATION_PATH)/verif_lib -L $env(SOC_IT_SIMULATION_PATH)/soc_it_common -L $env(SOC_IT_SIMULATION_PATH)/soc_it_capi -L $env(SOC_IT_SIMULATION_PATH)/secureip -L $env(SOC_IT_SIMULATION_PATH)/unisims_ver -L $env(SOC_IT_SIMULATION_PATH)/simprims_ver -L $env(SOC_IT_SIMULATION_PATH)/unimacro_ver -L $env(SOC_IT_SIMULATION_PATH)/unifast_ver -L $env(SOC_IT_SIMULATION_PATH)/blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
do wave.do


# vsim +outputDir=$outputDir +test_bi=0 +test_ei=100 -sv_seed $seed +notimingchecks -wlfslim 1 -vopt -t 1ns -L work -L $env(SOC_IT_SIMULATION_PATH)/verif_lib -L $env(SOC_IT_SIMULATION_PATH)/soc_it_common -L $env(SOC_IT_SIMULATION_PATH)/soc_it_capi -L $env(SOC_IT_SIMULATION_PATH)/secureip -L $env(SOC_IT_SIMULATION_PATH)/unisims_ver -L $env(SOC_IT_SIMULATION_PATH)/simprims_ver -L $env(SOC_IT_SIMULATION_PATH)/unimacro_ver -L $env(SOC_IT_SIMULATION_PATH)/unifast_ver -L $env(SOC_IT_SIMULATION_PATH)/blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
# run -all
