##############################
#### Implement OOC Module ####
##############################
proc ooc_impl { impl } {
   global part
   global dcpLevel
   global verbose
   global xdcDir
   global implDir
   global dcpDir

   set ooc_module          [get_ooc_attribute $impl module]
   set ooc_inst            [get_ooc_attribute $impl inst]
   set ooc_xdc             [get_ooc_attribute $impl implXDC]
   set cores               [get_ooc_attribute $impl cores]
   set hd.isolated         [get_ooc_attribute $impl hd.isolated]
   set budget.create       [get_ooc_attribute $impl budget.create]
   set budget.percent      [get_ooc_attribute $impl budget.percent]
   set link                [get_ooc_attribute $impl link]
   set opt                 [get_ooc_attribute $impl opt]
   set opt.pre             [get_ooc_attribute $impl opt.pre]
   set opt_options         [get_ooc_attribute $impl opt_options]
   set opt_directive       [get_ooc_attribute $impl opt_directive]
   set place               [get_ooc_attribute $impl place]
   set place.pre           [get_ooc_attribute $impl place.pre]
   set place_options       [get_ooc_attribute $impl place_options]
   set place_directive     [get_ooc_attribute $impl place_directive]
   set phys                [get_ooc_attribute $impl phys]
   set phys.pre            [get_ooc_attribute $impl phys.pre]
   set phys_options        [get_ooc_attribute $impl phys_options]
   set phys_directive      [get_ooc_attribute $impl phys_directive]
   set route               [get_ooc_attribute $impl route]
   set route.pre           [get_ooc_attribute $impl route.pre]
   set route_options       [get_ooc_attribute $impl route_options]
   set route_directive     [get_ooc_attribute $impl route_directive]
   set bitstream           [get_ooc_attribute $impl bitstream]
   set bitstream.pre       [get_ooc_attribute $impl bitstream.pre]
   set bitstream_options   [get_ooc_attribute $impl bitstream_options]


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
      # Define the OOC Module source
      ###########################################
      set topFile [get_module_file $ooc_module]
      puts "\tAdding $topFile for $ooc_module"
      command "add_files $topFile"

      #### Read in IP Netlists 
      if {[llength $cores] > 0} {
         add_cores $cores
      }
      
      #### Read in XDC file
      if {[llength $ooc_xdc] > 0} {
         add_xdc $ooc_xdc
      } else {
         puts "\tWARNING: No XDC file specified for $impl"
      }
   
   
      ##############################################
      # Link the OOC design 
      ##############################################
      set time [clock seconds]
      puts "\t#HD: Running link_design for $ooc_module \[[clock format $time -format {%a %b %d %H:%M:%S %Y}]\]"
      command "link_design -mode out_of_context -part $part -top [get_module_attribute $ooc_module moduleName]" "$resultDir/${ooc_inst}_link_design.log"
      if {${hd.isolated}} {
         command "set_property HD.ISOLATED 1 \[current_design]"
      } else {
         command "set_property HD.PARTITION 1 \[current_design]"
      }
   
      puts "\t#HD: Completed link_design"
      puts "\t##########################\n"
      if {$dcpLevel > 0} {
         command "write_checkpoint -force $resultDir/${ooc_inst}_link_design.dcp" "$resultDir/temp.log"
      }
      if {$verbose > 1} {
         command "report_utilization -file $reportDir/${ooc_inst}_utilization_link_design.rpt" "$resultDir/temp.log"
      } 
      #Run methodology DRCs and cattch any Critical Warnings or Error (module ruledeck quiet)
      check_drc $ooc_inst methodology_checks 1
      #Run timing DRCs and cattch any Critical Warnings or Error (module ruledeck quiet)
      check_drc $ooc_inst timing_checks 1
   }
   
   ############################################################################################
   # Implementation steps: opt_design, place_design, phys_opt_design, route_design
   ############################################################################################
   #Create timing budget constraints for the interface ports based on a percentage of the full period
   if {${budget.create}} {
      set budgetXDC "${ooc_inst}_ooc_budget.xdc"
      puts "\tWriting inteface budgets constraints to XDC file \"$xdcDir/$budgetXDC\"."
      command "::debug::gen_hd_timing_constraints -percent ${budget.percent} -file $xdcDir/$budgetXDC"
      puts "\tReading XDC file $xdcDir/$budgetXDC"
      command "read_xdc -mode out_of_context $xdcDir/$budgetXDC" "$resultDir/read_xdc_${ooc_inst}_budget.log"
   }

   set impl_start [clock seconds]
   if {$opt} {
      impl_step opt_design $ooc_inst $opt_options $opt_directive ${opt.pre}
   }
   
   if {$place} {
      impl_step place_design $ooc_inst $place_options $place_directive ${place.pre}
   }
   
   if {$phys} {
      impl_step phys_opt_design $ooc_inst $phys_options $phys_directive ${phys.pre}
   }
   
   if {$route} {
      impl_step route_design $ooc_inst $route_options $route_directive ${route.pre}
   
   
      #Run report_timing_summary on final design
      command "report_timing_summary -file $reportDir/${ooc_inst}_timing_summary.rpt" "$resultDir/temp.log"
   
      #Run a final DRC that catches any Critical Warnings (module ruledeck quiet)
      check_drc $ooc_inst default 1
 
      #Copy OOC implementation results to Checkpoint directory
      if {![file exists $dcpDir]} {
         command "file mkdir $dcpDir"
      }   
      command "file copy -force $resultDir/${ooc_inst}_route_design.dcp $dcpDir"
   }
   
   set impl_end [clock seconds]
   log_time final $impl_start $impl_end 
   log_data $impl $ooc_inst
   
   if {${hd.isolated} && $bitstream} {
      command "set_property IS_ENABLED {false} \[get_drc_checks]"
      impl_step write_bitstream $ooc_inst $bitstream_options none ${bitstream.pre}
      command "reset_drc_check \[get_drc_checks]"
   }

   command "close_project"
   command "\n"
}
