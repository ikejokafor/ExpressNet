#-------------------------------------------------------------
# Generated Example Tcl script for IP 'ddr4_0' (xilinx.com:ip:ddr4:2.2)
#-------------------------------------------------------------

# Declare source IP directory
set srcIpDir "/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/ddr4_0"

# Create project
puts "INFO: \[open_example_project\] Creating new example project..."
create_project -name ddr4_0_ex -force
set_property part xcvu37p-fsvh2892-2-e [current_project]
set_property target_language verilog [current_project]
set_property simulator_language MIXED [current_project]
set_property coreContainer.enable false [current_project]
# Set up imports directory
set projDir [get_property DIRECTORY [current_project]]
set importDir [file join $projDir imports]
file mkdir $importDir

set returnCode 0

# Set up pre-compilation paths
set_property compxlib.questa_compiled_library_dir {/home/mdl/izo5011/IkennaWorkSpace/vivado_2018.3_sim_libs} [current_project]

# Import the original IP (excluding example files)
puts "INFO: \[open_example_project\] Importing original IP ..."
import_ip -files [list [file join $srcIpDir ddr4_0.xci]] -name ddr4_0
reset_target {open_example} [get_ips ddr4_0]

# Generate the IP
proc _filter_supported_targets {targets ip} {
  set res {}
  set all [get_property SUPPORTED_TARGETS $ip]
  foreach target $targets {
    lappend res {*}[lsearch -all -inline -nocase $all $target]
  }
  return $res
}
puts "INFO: \[open_example_project\] Generating the example project IP ..."
generate_target -quiet [_filter_supported_targets {instantiation_template synthesis simulation implementation shared_logic} [get_ips ddr4_0]] [get_ips ddr4_0]

# Add example synthesis HDL files
puts "INFO: \[open_example_project\] Adding example synthesis HDL files ..."
add_files -quiet -copy_to $importDir -fileset [current_fileset] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_axi_tg_top.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_axi_opcode_gen.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_boot_mode_gen.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_custom_mode_gen.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_prbs_mode_gen.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_axi_wrapper.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_data_chk.sv]] \
  [list [file join $srcIpDir tb/axi_tg/ddr4_v2_2_data_gen.sv]] \
  [list [file join $srcIpDir rtl/ip_top/example_top.sv]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_axi_tg_top.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_axi_opcode_gen.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_boot_mode_gen.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_custom_mode_gen.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_prbs_mode_gen.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_axi_wrapper.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_data_chk.sv]]]
set_property FILE_TYPE SystemVerilog [get_files [list [file join $importDir ddr4_v2_2_data_gen.sv]]]

# Add example XDC files
puts "INFO: \[open_example_project\] Adding example XDC files ..."
add_files -quiet -copy_to $importDir -fileset [current_fileset -constrset] \
  [list [file join $srcIpDir par/example_design.xdc]]
set_property PROCESSING_ORDER late [get_files [list [file join $importDir example_design.xdc]]]

# Add example simulation HDL files
puts "INFO: \[open_example_project\] Adding simulation HDL files ..."
if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
add_files -quiet -copy_to $importDir -fileset [current_fileset -simset] \
  [list [file join $srcIpDir tb/glbl.v]] \
  [list [file join $srcIpDir tb/ddr4_model/arch_defines.v]] \
  [list [file join $srcIpDir tb/ddr4_model/arch_package.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/ddr4_model.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/interface.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/MemoryArray.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/proj_package.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/StateTableCore.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/StateTable.sv]] \
  [list [file join $srcIpDir tb/ddr4_model/timing_tasks.sv]] \
  [list [file join $srcIpDir tb/temp_mem.txt]] \
  [list [file join $srcIpDir tb/temp_second_mem.txt]] \
  [list [file join $srcIpDir tb/ddr4_sdram_model_wrapper.sv]] \
  [list [file join $srcIpDir tb/sim_tb_top.sv]] \
  [list [file join $srcIpDir tb/microblaze_mcs_0.sv]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir glbl.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir arch_defines.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir arch_package.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir ddr4_model.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir interface.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir MemoryArray.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir proj_package.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir StateTableCore.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir StateTable.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir timing_tasks.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir ddr4_sdram_model_wrapper.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir sim_tb_top.sv]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $importDir microblaze_mcs_0.sv]]]

# Tag any include files
set_property file_type {Verilog Header} [get_files [list [file join $importDir arch_defines.v]]]
set_property file_type {Verilog Header} [get_files [list [file join $importDir MemoryArray.sv]]]
set_property file_type {Verilog Header} [get_files [list [file join $importDir StateTableCore.sv]]]
set_property file_type {Verilog Header} [get_files [list [file join $importDir StateTable.sv]]]
set_property file_type {Verilog Header} [get_files [list [file join $importDir timing_tasks.sv]]]

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

puts "INFO: \[open_example_project\] Sourcing example extension scripts ..."
# Source script extension file(s)
if {[catch {source [file join $srcIpDir example_design_post_process.tcl]} errMsg]} {
  puts "ERROR: \[open_example_project\] Open Example Project failed: Error encountered while sourcing custom IP example design script."
  puts "$errorInfo"
  error "ERROR: see log file for details."
  incr returnCode
}

# Update compile order
update_compile_order -fileset [current_fileset]
update_compile_order -fileset [current_fileset -simset]
set tops [list]
foreach tfile [ get_files -filter {name=~"*.xci" || name=~"*.bdj" || name=~"*.bd"}] { if { [lsearch [list_property $tfile] PARENT_COMPOSITE_FILE ] == -1} {lappend tops $tfile} }
puts "INFO: \[open_example_project\] Rebuilding all the top level IPs ..."
generate_target all $tops
export_ip_user_files -force

set dfile [file join $srcIpDir oepdone.txt]
if { [ catch { set doneFile [open $dfile w] } ] } {
} else { 
  puts $doneFile "Open Example Project DONE"
  close $doneFile
}
if { $returnCode != 0 } {
  puts "ERROR: \[open_example_project\] Problems were encountered while executing the example design script, please review the log file."
  error "ERROR: See log file for details."
  incr returnCode
} else {
  puts "INFO: \[open_example_project\] Open Example Project completed"
}
