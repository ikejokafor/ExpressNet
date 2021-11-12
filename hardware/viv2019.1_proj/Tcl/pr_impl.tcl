#####################################
#### Implement PR Configurations ####
#####################################
proc pr_impl { impl } {
   global part
   global dcpLevel
   global verbose
   global implDir
   global dcpDir
   global configurations 
   global ooc_implementations 

   set top                 [get_config_attribute $impl top]
   set implXDC             [get_config_attribute $impl implXDC]
   set linkXDC             [get_config_attribute $impl linkXDC]
   set cores               [get_config_attribute $impl cores]
   set settings            [get_config_attribute $impl settings]
   set link                [get_config_attribute $impl link]
   set opt                 [get_config_attribute $impl opt]
   set opt.pre             [get_config_attribute $impl opt.pre]
   set opt_options         [get_config_attribute $impl opt_options]
   set opt_directive       [get_config_attribute $impl opt_directive]
   set place               [get_config_attribute $impl place]
   set place.pre           [get_config_attribute $impl place.pre]
   set place_options       [get_config_attribute $impl place_options]
   set place_directive     [get_config_attribute $impl place_directive]
   set phys                [get_config_attribute $impl phys]
   set phys.pre            [get_config_attribute $impl phys.pre]
   set phys_options        [get_config_attribute $impl phys_options]
   set phys_directive      [get_config_attribute $impl phys_directive]
   set route               [get_config_attribute $impl route]
   set route.pre           [get_config_attribute $impl route.pre]
   set route_options       [get_config_attribute $impl route_options]
   set route_directive     [get_config_attribute $impl route_directive]

   #Determine state of Static (import or implement). 
   foreach setting $settings {
      lassign $setting name cell state
      if {[string match $cell $top]} {
         set staticName $name
         if {[string match $state "implement"]} {
            set staticState "implement"
         } elseif {[string match $state "import"]} {
            set staticState "import"
         } else {
            set errMsg "ERROR: Invalid state $state in settings for $name\($impl).\n"
            error $errMsg
         }
      }
   }

   if {![file exists $implDir]} {
     command "file mkdir $implDir"
   }

   set resultDir "$implDir/$impl"
   set reportDir "$resultDir/reports"
   puts "\tWriting results to: $resultDir"
   puts "\tWriting reports to: $reportDir"
   
   ###########################################
   # Linking
   ###########################################
   if {$link} {
      command "file delete -force $resultDir"
      command "file mkdir $resultDir"
      command "file mkdir $reportDir"
   
      #Create in-memory project
      command "create_project -in_memory -part $part" "$resultDir/create_project.log"

      ###########################################
      # Define the Static sources
      # Determine if Static is being implemented 
      # or imported, and add appropriate source
      ###########################################
      if {[string match $staticState "implement"]} {
         set topFile [get_module_file $staticName]
      } elseif {[string match $staticState "import"]} {
         set topFile "$dcpDir/${top}_static.dcp"
      }
      puts "\tAdding file $topFile for $staticName"
      command "add_files $topFile"

      #Read in top-level cores and XDC on first configuration
      if {[string match $staticState "implement"]} { 
         #### Read in IP Netlists 
         if {[llength $cores] > 0} {
            add_cores $cores
         }
         
         #### Read in Static XDC file
         if {[llength $implXDC] > 0} {
            add_xdc $implXDC
         } else {
            puts "\tWARNING: No XDC file specified for $impl"
         }
   
      }

      ################################################
      # Link the Static design with blackboxes for RMs
      ################################################
      set time [clock seconds]
      puts "\t#HD: Running link_design for $top \[[clock format $time -format {%a %b %d %H:%M:%S %Y}]\]"
      command "link_design -mode default -part $part -top $top" "$resultDir/${top}_link_design.log"

      ################################################
      # Fill in RM blackboxes based on config settings 
      ################################################
      foreach setting $settings {
         lassign $setting name cell state
         if {![string match $cell $top]} {
            if {[string match $state "implement"]} {
               set rmFile [get_module_file $name]
            } elseif {[string match $state "import"]} {
               set rmFile "$dcpDir/${name}_route_design.dcp"
            } else {
               set errMsg "ERROR: Invalid state \"$state\" in settings for $name\($impl).\n"
               error $errMsg
            }
            set fileSplit [split $rmFile "."]
            set type [lindex $fileSplit end]
            if {[string match $type "dcp"]} {
               puts "\tReading in checkpoint $rmFile for $name"
               command "read_checkpoint -cell $cell $rmFile -strict" "$resultDir/read_checkpoint_$name.log"
            } elseif {[string match $type "edf"] || [string match $type "edn"]} {
               puts "\tUpdating design with $rmFile for $name"
               command "update_design -cells $cell -from_file $rmFile" "$resultDir/update_design_$name.log"
            } else {
               if {[string match $type "ngc"]} {
                  set errMsg "ERROR: File of type \"$type\" for $rmFile is not supported for RM modules.\nConvert this file to an EDIF or DCP."
               } else {
                  set errMsg "ERROR: Invalid file type \"$type\" for $rmFile.\n RM file type must be DCP, EDN or EDF."
               }
               error $errMsg
            }

            #Read in RM cores and XDC if RM is being implemented
            if {[string match $state "implement"]} { 
               #### Read in IP Netlists 
               #You can't add_files on an in-memory design. Have to do update_design -cell -from_file\
               #Knowing the cell name for every blackbox and it's associate file isn't easy
               #It works better to have all submodule in the DCP or in the same directory as the RM EDIF.
               #if {[llength $rmCores] > 0} { \
                  add_cores $rmCores          \
               }

               ## Read in RM XDC files 
               set implXDC [get_module_attribute $name implXDC]
               if {[llength $implXDC] > 0} {
                  command "read_xdc -cell $cell $implXDC" "$resultDir/read_xdc_$name.log"
               } else {
                  puts "\tINFO: No cell XDC file specified for $cell"
               }
            }

            if {[string match $state "import"]} {
               set time [clock seconds]
               puts "\tLocking $cell \[[clock format $time -format {%a %b %d %H:%M:%S %Y}]\]"
               command "lock_design -level routing $cell" "lock_design_$name.log"
            }
            ##Mark RM with HD.RECONFIGURABLE if first configuration
            if {[string match $staticState "implement"]} {
               command "set_property HD.RECONFIGURABLE 1 \[get_cells $cell]" "$resultDir/set_HD.RECONFIG.log"
            }
         }
      }
   
      ##############################################
      # Bring in OOC module check points on first config
      ##############################################
      if {[llength $ooc_implementations] > 0 && [string match $staticState "implement"]} {
         get_ooc_results $ooc_implementations
      }

      ##############################################
      # Read in any linkXDC files 
      ##############################################
      if {[llength $linkXDC] > 0} {
         readXDC $linkXDC
      }

      ##############################################
      # Write out full logical design checkpoint 
      ##############################################
      puts "\t#HD: Completed link_design"
      puts "\t##########################\n"
      if {$dcpLevel > 0} {
        command "write_checkpoint -force $resultDir/${top}_link_design.dcp" "$resultDir/temp.log"
      }
      if {$verbose > 1} {
         command "report_utilization -file $reportDir/${top}_utilization_link_design.rpt" "$resultDir/temp.log"
      } 
      #Run methodology DRCs and cattch any Critical Warnings or Error (module ruledeck quiet)
      check_drc $top methodology_checks 1
      #Run timing DRCs and cattch any Critical Warnings or Error (module ruledeck quiet)
      check_drc $top timing_checks 1
   }
   
   ############################################################################################
   # Implementation steps: opt_design, place_design, phys_opt_design, route_design
   ############################################################################################
   set impl_start [clock seconds]
   if {$opt} {
      impl_step opt_design $top $opt_options $opt_directive ${opt.pre}
   }
   
   if {$place} {
      impl_step place_design $top $place_options $place_directive ${place.pre}
   }
   
   if {$phys} {
      impl_step phys_opt_design $top $phys_options $phys_directive ${phys.pre}
   }
   
   if {$route} {
      impl_step route_design $top $route_options $route_directive ${route.pre}
   
      #Run report_timing_summary on final design
      command "report_timing_summary -file $reportDir/${top}_timing_summary.rpt" "$resultDir/temp.log"
   
      #Run a final DRC that catches any Critical Warnings (module ruledeck quiet)
      check_drc $top bitstream_checks 0

      #Report PR specific statitics for debug and analysis
      command "debug::report_design_status" "$reportDir/${top}_design_status.rpt"
   }

   #################################################
   # Export cell level checkpoints for each RM
   # Carve out each RM to leave a blackbox in Static
   # Export Static to be used in other configuration 
   #################################################
   if {![file exists $dcpDir]} {
      command "file mkdir $dcpDir"
   }   

   foreach setting $settings {
      lassign $setting name cell state
      if {![string match $cell $top]} {
         command "write_checkpoint -force -cell $cell $resultDir/${name}_route_design.dcp" "$resultDir/temp.log"
         command "file copy -force $resultDir/${name}_route_design.dcp $dcpDir"
         if {[string match $staticState "implement"]} {
            command "update_design -cell $cell -black_box" "$resultDir/carve_$name.log"
         }
      }
   }
   if {[string match $staticState "implement"]} {
      set time [clock seconds]
      puts "\tLocking $top and exporting results \[[clock format $time -format {%a %b %d %H:%M:%S %Y}]\]"
      command "lock_design -level routing" "$resultDir/lock_design_$top.log"
      command "write_checkpoint -force $resultDir/${top}_static.dcp" "$resultDir/temp.log"
      command "file copy -force $resultDir/${top}_static.dcp $dcpDir"
   }


   set impl_end [clock seconds]
   log_time final $impl_start $impl_end 
   log_data $impl $top

   command "close_project"
   command "\n"
}
