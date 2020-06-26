
## Post process the example design

puts "Post processing the example_design"
set_property top example_top [current_fileset]



set_property top sim_tb_top [get_filesets sim_1]




set bd_path [get_files *.bd]
regexp -all {bd_.*\/(bd_.*).bd} $bd_path var var1
set bd_name "./imports/$var1\_lmb_bram_I_0.mem"
set bd_name1 "./imports/$var1\_second_lmb_bram_I_0.mem"
file copy -force ./imports/temp_mem.txt $bd_name 
file copy -force ./imports/temp_second_mem.txt $bd_name1





