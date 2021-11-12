######################################
####Synthesize Modules (Bottom-Up)####
######################################
proc synth { module } {
   global part 
   global synthDir
   global srcDir
   global verbose
   
   set moduleName  [get_module_attribute $module moduleName]
   set topLevel    [get_module_attribute $module top_level]
   set prj         [get_module_attribute $module prj]
   set includes    [get_module_attribute $module includes]
   set generics    [get_module_attribute $module generics]
   set vlogHeaders [get_module_attribute $module vlog_headers]
   set vlogDefines [get_module_attribute $module vlog_defines]
   set sysvlog     [get_module_attribute $module sysvlog]
   set vlog        [get_module_attribute $module vlog]
   set vhdl        [get_module_attribute $module vhdl]
   set ip          [get_module_attribute $module ip]
   set ipRepo      [get_module_attribute $module ipRepo]
   set bd          [get_module_attribute $module bd]
   set cores       [get_module_attribute $module cores]
   set xdc         [get_module_attribute $module synthXDC]
   set options     [get_module_attribute $module synth_options]

   # Make the synthesis directory if needed
   if {![file exists $synthDir]} {
      command "file mkdir $synthDir"
   }
   
   # Clean-out and re-make the synthesis directory for this module
   set resultDir "$synthDir/$module"
   command "file delete -force $resultDir"
   command "file mkdir $resultDir"
   puts "\tWriting results to: $resultDir"
   
   #Create in-memory project
   command "create_project -in_memory -part $part" "$resultDir/create_project.log"

   #### Setup any IP Repositories 
   if {$ipRepo != ""} {
      puts "\tLoading IP Repositories:\n\t+ [join $ipRepo "\n\t+ "]"
      command "set_property IP_REPO_PATHS \{$ipRepo\} \[current_fileset\]" "$resultDir/temp.log"
   }
   
   if {[llength $prj] > 0} {
      add_prj $prj
   } else {
      #### Read in System Verilog
      if {[llength $sysvlog] > 0} {
         add_sysvlog $sysvlog
      }
   
      #### Read in Verilog
      if {[llength $vlog] > 0} {
         add_vlog $vlog
      }
   
      #### Read in VHDL
      if {[llength $vhdl] > 0} {
         add_vhdl $vhdl
      }
   }
      
   #### Read IP from Catalog
   if {[llength $ip] > 0} {
      add_ip $ip
   }

   #### Read IPI systems
   if {[llength $bd] > 0} {
      add_bd $bd
   }
   
   #### Read in IP Netlists 
   if {[llength $cores] > 0} {
      add_cores $cores
   }
   
   #### Read in XDC file
   if {[llength $xdc] > 0} {
      add_xdc $xdc
   } else {
      puts "\tWARNING: No XDC file specified for $module"
   }

   #### Set Verilog Headers 
   if {[llength $vlogHeaders] > 0} {
      foreach file $vlogHeaders {
         command "set_property file_type {Verilog Header} \[get_files $file\]"
      }
   }
   
   #### Set Verilog Defines
   if {$vlogDefines != ""} {
      command "set_property verilog_define $vlogDefines \[current_fileset\]"
   }
   
   #### Set Include Directories
   if {$includes != ""} {
      command "set_property include_dirs \"$includes\" \[current_fileset\]"
   }
   
   #### Set Generics
   if {$generics != ""} {
      command "set_property generic $generics \[current_fileset\]"
   }
   
   #### synthesis
   set synth_start [clock seconds]
   if {$topLevel} {
      command "synth_design -mode default $options -top $moduleName -part $part" "$resultDir/${moduleName}_synth_design.rds"
   } else {
      command "synth_design -mode out_of_context $options -top $moduleName -part $part" "$resultDir/${moduleName}_synth_design.rds"
   }
   
   command "write_checkpoint -force $resultDir/${moduleName}_synth.dcp" "$resultDir/temp.log"
   
   if {$verbose >= 1} {
      command "report_utilization -file $resultDir/${moduleName}_utilization_synth.rpt" "$resultDir/temp.log"
   }
   
   set synth_end [clock seconds]
   log_time synth_design $synth_start $synth_end
   command "close_project"
   command "\n"
}
