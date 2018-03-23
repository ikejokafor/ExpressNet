# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xcku115-flva1517-3-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/managed_ip_project/managed_ip_project.cache/wt [current_project]
set_property parent.project_path /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/managed_ip_project/managed_ip_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip -quiet /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram.xci
set_property is_locked true [get_files /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top xilinx_dual_port_2_clock_ram -part xcku115-flva1517-3-e -mode out_of_context

rename_ref -prefix_all xilinx_dual_port_2_clock_ram_

write_checkpoint -force -noxdef xilinx_dual_port_2_clock_ram.dcp

catch { report_utilization -file xilinx_dual_port_2_clock_ram_utilization_synth.rpt -pb xilinx_dual_port_2_clock_ram_utilization_synth.pb }

if { [catch {
  file copy -force /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/managed_ip_project/managed_ip_project.runs/xilinx_dual_port_2_clock_ram_synth_1/xilinx_dual_port_2_clock_ram.dcp /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/ip_user_files/ip/xilinx_dual_port_2_clock_ram]} {
  catch { 
    file copy -force /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_stub.v /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/ip_user_files/ip/xilinx_dual_port_2_clock_ram
  }
}

if {[file isdir /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/ip_user_files/ip/xilinx_dual_port_2_clock_ram]} {
  catch { 
    file copy -force /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/xilinx_dual_port_2_clock_ram/xilinx_dual_port_2_clock_ram_stub.vhdl /home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/ip_user_files/ip/xilinx_dual_port_2_clock_ram
  }
}