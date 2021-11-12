###############################################################
###   Main flow - Do Not Edit
###############################################################
set runLog "run"
set commandLog "command"
set criticalLog "critical"
set logs [list $runLog $commandLog $criticalLog]
foreach log $logs {
   if {[file exists ${log}.log]} {
      file copy -force $log.log ${log}_prev.log
   }
}
set rfh [open "$runLog.log" w]
set cfh [open "$commandLog.log" w]
set wfh [open "$criticalLog.log" w]

#### Set Tcl Params
if {[info exists tclParams] && [llength $tclParams] > 0} {
   puts "#HD: Setting Tcl Params:"
   puts $rfh "#HD: Setting Tcl Params:"
   foreach   {name value} $tclParams   {
      puts "\t$name == $value"
      puts $rfh "\t$name == $value"
      command "set_param $name $value"
   }
}

#### Run Synthesis on any modules requiring synthesis
if {[llength $modules] > 0} {
   foreach module $modules {
      if {[get_module_attribute $module synth]} {
       puts $rfh "\n#HD: Running synthesis for block $module"
       command "puts \"#HD: Running synthesis for block $module\""
       synth $module
       puts "#HD: Synthesis of module $module complete\n"
    }
  }
}

#### Run Top-Down implementation before OOC
if {[llength $implementations] > 0} {
   foreach impl $implementations {
      if {[get_impl_attribute $impl impl] && [get_impl_attribute $impl td.impl]} {
         #Override directives if directive file is specified
         if {[info exists useDirectives]} {
            puts "#HD: Overriding directives for implementation $impl"
            set_impl_directives $impl
         }
         puts $rfh "#HD: Running implementation $impl"
         command "puts \"#HD: Running implementation $impl\""
         impl $impl
         puts "#HD: Implementation $impl complete\n"
      }
   }
}
#### Run OOC Implementations
if {[llength $ooc_implementations] > 0} {
   foreach ooc_impl $ooc_implementations {
      if {[get_ooc_attribute $ooc_impl impl]} {
         #Override directives if directive file is specified
         if {[info exists useDirectives]} {
            puts "#HD: Overriding directives for implementation $ooc_impl"
            set_ooc_directives $ooc_impl
         }
         puts $rfh "#HD: Running ooc implementation $ooc_impl (OUT-OF-CONTEXT)"
         command "puts \"#HD: Running OOC implementation $ooc_impl (OUT-OF-CONTEXT)\""
         ooc_impl $ooc_impl
         puts "#HD: OOC implementation of $ooc_impl complete\n"
      }
   }
}

#### Run PR configurations
if {[llength $configurations] > 0} {
   sort_configurations
   foreach config $configurations {
      if {[get_config_attribute $config impl]} {
         #Override directives if directive file is specified
         if {[info exists useDirectives]} {
            puts "#HD: Overriding directives for configuration $config"
            set_config_directives $config
         }
         puts $rfh "#HD: Running PR implementation $config (Partial Reconfiguration)" 
         command "puts \"#HD: Running PR implementation $config (Partial Reconfiguration)\"" 
         pr_impl $config
         puts "#HD: PR implementation of $config complete\n"
      }
   }
}

#### Run Assembly and Flat implementations
if {[llength $implementations] > 0} {
   foreach impl $implementations {
      if {[get_impl_attribute $impl impl] && ![get_impl_attribute $impl td.impl]} {
         #Override directives if directive file is specified
         if {[info exists useDirectives]} {
            puts "#HD: Overriding directives for implementation $impl"
            set_impl_directives $impl
         }
         puts $rfh "#HD: Running implementation $impl"
         command "puts \"#HD: Running implementation $impl\""
         impl $impl
         puts "#HD: Implementation $impl complete\n"
      }
   }
}

#### Run PR verify 
if {[llength $configurations] > 1} {
   puts $rfh "#HD: Running pr_verify on all configurations([llength $configurations])" 
   command "puts \"#HD: Running pr_verify on all configurations([llength $configurations])\""
   verify_configs $configurations
}

#### Genearte PR bitstreams 
if {[llength $configurations] > 0} {
   puts $rfh "#HD: Running write_bitstream on all configurations([llength $configurations])" 
   command "puts \"#HD: Running write_bitstream on all configurations([llength $configurations])\""
   generate_pr_bitstreams $configurations
}

close $rfh
close $cfh
close $wfh
