proc impl_step {phase instance {options none} {directive none} {pre none} } {
   global dcpLevel
   global verbose
   upvar  resultDir resultDir
   upvar  reportDir reportDir

   #Make sure $phase is valid and set checkpoint in case no design is open
   if {[string match $phase "opt_design"]} {
      set checkpoint1 "$resultDir/${instance}_link_design.dcp"
   } elseif {[string match $phase "place_design"]} {
      set checkpoint1 "$resultDir/${instance}_opt_design.dcp"
   } elseif {[string match $phase "phys_opt_design"]} {
      set checkpoint1 "$resultDir/${instance}_place_design.dcp"
   } elseif {[string match $phase "route_design"]} {
      set checkpoint1 "$resultDir/${instance}_phys_opt_design.dcp"
      set checkpoint2 "$resultDir/${instance}_place_design.dcp"
   } elseif {[string match $phase "write_bitstream"]} {
      set checkpoint1 "$resultDir/${instance}_route_design.dcp"
   } else {
      puts "\tERROR: Value $phase is not a recognized step of implementation. Valid values are \"opt_design\", \"place_design\", \"phys_opt_design\", or \"route_design\".\n\n"
      exit
   }
   #If no design is open
   if { [catch {current_instance > $resultDir/temp.log}] } {
      puts "\tNo open design" 
      if {[info exists checkpoint1] || [info exists checkpoint2]} {
         if {[file exists $checkpoint1]} {
            puts "\tOpening checkpoint $checkpoint1 for $instance"
            command "open_checkpoint $checkpoint1" "$resultDir/open_checkpoint_${instance}_$phase.log"
            if { [catch {current_instance > $resultDir/temp.log}] } {
               command "link_design"
            }
         } elseif {[file exists $checkpoint2]} {
            puts "\tOpening checkpoint $checkpoint2 for $instance"
            command "open_checkpoint $checkpoint2" "$resultDir/open_checkpoint_${instance}_$phase.log"
            if { [catch {current_instance > $resultDir/temp.log}] } {
               command "link_design"
            }
         } else {
            set errMsg "ERROR: Checkpoint file not found. Please rerun necessary steps.\n"
            error $errMsg
         }
      } else {
        set errMsg "ERROR: No checkpoint defined.\n"
        error $errMsg
      }
   }
  
   #Run any specified pre-phase scripts
   if {![string match $pre "none"] && ![string match $pre ""] } {
      foreach script $pre {
         if {[file exists $script]} {
            puts "\t#HD: Running pre-$phase script $script"
            command "source $script" "$resultDir/pre_${phase}_script.log"
         } else {
            set errMsg "ERROR: Script $script specified for pre-${phase} does not exist"
            error $errMsg
         }
      }
   }
 
   #Run the specified Implementation phase
   set start_time [clock seconds]
   puts "\n\t#HD: Running $phase for $instance \[[clock format $start_time -format {%a %b %d %H:%M:%S %Y}]\]"
   set log "$resultDir/${instance}_$phase.log"
   puts "\tWriting Results to $log"
   if {[string match $phase "write_bitstream"]} {
      set impl_step "$phase -file $resultDir/$instance"
   } else {
      set impl_step $phase
   }

   if {[string match $options "none"]==0 && [string match $options ""]==0} {
      append impl_step " $options"
   }
   if {[string match $directive "none"]==0 && [string match $directive ""]==0} {
      append impl_step " -directive $directive"
   }
   command "$impl_step" "$log"
   command "puts \"\t#HD: Completed: $phase\""
   puts "\t#########################\n"

   if {($dcpLevel > 0 || [string match $phase "route_design"]) && ![string match $phase "write_bitstream"]} {
      command "write_checkpoint -force $resultDir/${instance}_$phase.dcp" "$resultDir/temp.log"
   }
      
   if {$verbose > 1} {
      command "report_utilization -file $reportDir/${instance}_utilization_${phase}.rpt" "$resultDir/temp.log"
   }

   set end_time [clock seconds]
   log_time $phase $start_time $end_time 
}

