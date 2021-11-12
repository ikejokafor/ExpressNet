###############################################################
###   Tcl Variables
###############################################################
#set tclParams [list <param1> <value> <param2> <value> ... <paramN> <value>]
set tclParams [list place.closeImportedSites 1 tcl.notrace 1 hd.visual 0] 

#Define location for "Tcl" directory. Defaults to "./Tcl"
set tclHome "./Tcl"
if {[file exists $tclHome]} {
   set tclDir $tclHome
} elseif {[file exists "./Tcl"]} {
   set tclDir  "./Tcl"
} else {
   error "ERROR: No valid location found for required Tcl scripts. Set \$tclDir in design.tcl to a valid location."
}

###############################################################
### Define Part, Package, Speedgrade 
###############################################################
set device       "xcvu37p"
set package      "-fsvh2892"
set speed        "-2-e"
set part         $device$package$speed

###############################################################
###  Setup Variables
###############################################################
####flow control
set run.topSynth   0
set run.oocSynth   1
set run.tdImpl     0
set run.oocImpl    0
set run.topImpl    0
set run.flatImpl   0

####Report and DCP controls - values: 0-required min; 1-few extra; 2-all
set verbose      1
set dcpLevel     1

####Output Directories
set synthDir  "./Synth"
set implDir   "./Implement"
set dcpDir    "./Checkpoint"

####Input Directories
set srcDir     "./Sources"
set rtlDir     "$srcDir/hdl"
set prjDir     "$srcDir/prj"
set xdcDir     "$srcDir/xdc"
set coreDir    "$srcDir/cores"
set netlistDir "$srcDir/netlist"

####Source required Tcl Procs
source $tclDir/design_utils.tcl
source $tclDir/synth_utils.tcl
source $tclDir/impl_utils.tcl
source $tclDir/hd_floorplan_utils.tcl


####################################################################
### OOC Module Definition and OOC Implementation for each instance
####################################################################
set module1 "cnn_layer_accel"
add_module $module1
set_module_attribute $module1 prj          $prjDir/$module1.prj
set_module_attribute $module1 synth        ${run.oocSynth}


########################################################################
### Task / flow portion
########################################################################

# Build the designs
source $tclDir/run.tcl

exit
