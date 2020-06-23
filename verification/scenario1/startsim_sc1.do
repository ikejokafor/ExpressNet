set seed [clock seconds]
set outputDir [pwd]

# vopt -64 +acc=npr \
# 	-L work \
# 	-L xbip_dsp48_mult_v3_0_5 \
# 	-L xbip_dsp48_multacc_v3_0_5 \
# 	-L xbip_dsp48_multadd_v3_0_5 \
# 	-L xbip_dsp48_wrapper_v3_0_4 \
# 	-L xbip_dsp48_acc_v3_0_5 \
# 	-L xbip_dsp48_addsub_v3_0_5 \
# 	-L xbip_dsp48_macro_v3_0_16 \
# 	-L /home/mdl/izo5011/IkennaWorkSpace/simulation/verif_lib \
# 	-work work work.cnl_sc1_testbench work.glbl -o cnl_sc1_testbench_opt


vsim -suppress 12110 -novopt +outputDir=$outputDir +notimingchecks -t 1ns -L work -L /home/mdl/izo5011/IkennaWorkSpace/simulation/verif_lib -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -L blk_mem_gen_v8_3_6 -L xbip_dsp48_mult_v3_0_5 -L xbip_dsp48_multacc_v3_0_5 -L xbip_dsp48_multadd_v3_0_5 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_acc_v3_0_5 -L xbip_dsp48_addsub_v3_0_5 -L xbip_dsp48_macro_v3_0_16 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench


# vsim +outputDir=$outputDir +notimingchecks -novopt -t 1ns -L work -L verif_lib -L secureip -L soc_it_common -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -L blk_mem_gen_v8_3_6 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
# do wave.do


# vsim +outputDir=$outputDir +test_bi=0 +test_ei=100 -sv_seed $seed +notimingchecks -wlfslim 1 -vopt -t 1ns -L work -L verif_lib -L soc_it_common -L soc_it_capi -L secureip -L unisims_ver -L simprims_ver -L unimacro_ver -L unifast_ver -L blk_mem_gen_v8_3_5 -fsmdebug -c +nowarnTSCALE work.glbl work.cnl_sc1_testbench
# run -all
