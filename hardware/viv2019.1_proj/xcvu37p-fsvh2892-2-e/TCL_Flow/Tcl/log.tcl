###############################################################
### Log time of various commands to run log
###############################################################
proc log_time {phase start_time end_time} {
   global rfh

   if {[string match $phase "phys_opt_design"]} {
      set phase "phys_design"
   }

   set total_seconds [expr $end_time - $start_time]
   set total_minutes [expr $total_seconds / 60]
   set total_hours [expr $total_minutes / 60]

   if {[string match $phase final]} {
      puts $rfh "\t-------------------------\t\t--------"
      puts $rfh "\tTotal Implemenation time:\t\t[format %02d [expr $total_hours]]h:[format %02d [expr $total_minutes-($total_hours*60)]]m:[format %02d [expr $total_seconds-($total_minutes*60)]]s"
      puts $rfh "\n"
   } elseif {[string match $phase synth_design]} {
      puts $rfh "\tTime in $phase:     \t[format %02d [expr $total_hours]]h:[format %02d [expr $total_minutes-($total_hours*60)]]m:[format %02d [expr $total_seconds-($total_minutes*60)]]s\t\[[clock format $start_time -format {%a %b %d %H:%M:%S %Y}]]"
      puts $rfh "\t-------------------------\t--------"
      puts $rfh "\tTotal Synthesis time:\t\t[format %02d [expr $total_hours]]h:[format %02d [expr $total_minutes-($total_hours*60)]]m:[format %02d [expr $total_seconds-($total_minutes*60)]]s"
      puts $rfh "\n"
   } else {
      puts $rfh "\tTime in $phase:        \t[format %02d [expr $total_hours]]h:[format %02d [expr $total_minutes-($total_hours*60)]]m:[format %02d [expr $total_seconds-($total_minutes*60)]]s\t\[[clock format $start_time -format {%a %b %d %H:%M:%S %Y}]]"
   } 
   flush $rfh
}

###############################################################
### Log data from command logs to run log
###############################################################
proc log_data {impl instance} {
   global implDir
   global rfh
   
   set resultDir $implDir/$impl
      
   set route_log $resultDir/${instance}_route_design.log
   if {[file exists $route_log]} {
      set log_fh [open $route_log r]
      set log_data [read $log_fh]
      close $log_fh
      set log_lines [split $log_data "\n" ]
      foreach line $log_lines {
         if {[string match "*Route 35-20*" $line]} {
            puts $rfh "\t$line"
         }
         if {[string match "*WireLength*" $line]} {
            puts $rfh " $line"
         }
      }
   } else {
      puts $rfh "Could not find route_design log file \"$route_log\"."
   }
   puts $rfh "\n"
   flush $rfh
}

###############################################################
### Log any commands to command log file
### Check for errors
### Print command to STDOUT if verbose > 1 
###############################################################
proc command { command  {log ""}} {
   global verbose
   global cfh
   
   puts $cfh $command
   flush $cfh

   #ignore new-line or comments
   if {[string match "\n" $command] || [string match "#*" $command]} {
      return 0
   }

   if {$verbose > 1} {
      puts "\tCOMMAND: $command"
   }

   set commandName [lindex [split $command] 0]
   if {[llength $log] > 0} {
      if {[catch "$command > $log"]} {
         parse_log $log
         regexp {(\.*.*)(\..*)} $log matched logName logType
         puts "#HD: Writing checkpoint ${logName}_error.dcp for debug."
         command "write_checkpoint -force ${logName}_error.dcp"
         set errMsg "ERROR: $commandName command failed.\n\t$command\nSee log file $log for more details."
         error $errMsg
      }
      parse_log $log
   } else {
      if {[catch $command]} {
         set errMsg "ERROR: $commandName command failed.\n\t$command\n"
         error $errMsg
      }
   }
}

###############################################################
### Log any commands to command log file
### Check for errors
### Print command to STDOUT if verbose > 1 
###############################################################
proc parse_log { log } {
   global wfh rfh

   if {[file exists $log]} {
      set lfh [open $log r]
      set log_data [read $lfh]
      close $lfh
      set log_lines [split $log_data "\n" ]
      puts $wfh "#Parsing log file \"$log\":"
      foreach line $log_lines {
         if {[string match "CRITICAL WARNING*" $line]} {
            puts $wfh "\t$line"
         }
         if {[string match "ERROR:*" $line]} {
            puts $rfh $line
            puts $line
         }
      }
   } else {
      puts $wfh "ERROR: Could not find specified log file \"$log\"."
   }
   puts $wfh "\n"
   flush $wfh
}
