set modules             [list ]
set ooc_implementations [list ]
set implementations     [list ]
set configurations      [list ]

set valid_module_attributes [list "moduleName"       \
                                  "top_level"        \
                                  "prj"              \
                                  "includes"         \
                                  "generics"         \
                                  "vlog_headers"     \
                                  "vlog_defines"     \
                                  "sysvlog"          \
                                  "vlog"             \
                                  "vhdl"             \
                                  "ip"               \
                                  "ipRepo"           \
                                  "bd"               \
                                  "cores"            \
                                  "synthXDC"         \
                                  "implXDC"          \
                                  "synth"            \
                                  "synth_options"    \
                                  "synthCheckpoint"  \
                            ]

set valid_config_attributes [ list "top"                  \
                                   "implXDC"              \
                                   "linkXDC"              \
                                   "cores"                \
                                   "impl"                 \
                                   "settings"             \
                                   "link"                 \
                                   "opt"                  \
                                   "opt.pre"              \
                                   "opt_options"          \
                                   "opt_directive"        \
                                   "place"                \
                                   "place.pre"            \
                                   "place_options"        \
                                   "place_directive"      \
                                   "phys"                 \
                                   "phys.pre"             \
                                   "phys_options"         \
                                   "phys_directive"       \
                                   "route"                \
                                   "route.pre"            \
                                   "route_options"        \
                                   "route_directive"      \
                                   "verify"               \
                                   "bitstream"            \
                                   "bitstream.pre"        \
                                   "bitstream_options"    \
                                   "bitstream_settings"   \
                            ]

set valid_impl_attributes [ list "top"                  \
                                 "implXDC"              \
                                 "linkXDC"              \
                                 "cores"                \
                                 "impl"                 \
                                 "hd.impl"              \
                                 "td.impl"              \
                                 "ic.impl"              \
                                 "partitions"           \
                                 "link"                 \
                                 "opt"                  \
                                 "opt.pre"              \
                                 "opt_options"          \
                                 "opt_directive"        \
                                 "place"                \
                                 "place.pre"            \
                                 "place_options"        \
                                 "place_directive"      \
                                 "phys"                 \
                                 "phys.pre"             \
                                 "phys_options"         \
                                 "phys_directive"       \
                                 "route"                \
                                 "route.pre"            \
                                 "route_options"        \
                                 "route_directive"      \
                                 "bitstream"            \
                                 "bitstream.pre"        \
                                 "bitstream_options"    \
                                 "bitstream_settings"   \
                           ]

set valid_ooc_attributes [list "module"               \
                               "inst"                 \
                               "hierInst"             \
                               "implXDC"              \
                               "cores"                \
                               "impl"                 \
                               "hd.isolated"          \
                               "budget.create"        \
                               "budget.percent"       \
                               "link"                 \
                               "opt"                  \
                               "opt.pre"              \
                               "opt_options"          \
                               "opt_directive"        \
                               "place"                \
                               "place.pre"            \
                               "place_options"        \
                               "place_directive"      \
                               "phys"                 \
                               "phys.pre"             \
                               "phys_options"         \
                               "phys_directive"       \
                               "route"                \
                               "route.pre"            \
                               "route_options"        \
                               "route_directive"      \
                               "bitstream"            \
                               "bitstream.pre"        \
                               "bitstream_options"    \
                               "bitstream_settings"   \
                               "implCheckpoint"       \
                               "preservation"         \
                          ]






###############################################################
### Define a top-level implementation
###############################################################
proc add_implementation { name } {
   global implementations
   set procname [lindex [info level 0] 0]
   
   if {[lsearch -exact $implementations $name] >= 0} {
      set errMsg "ERROR: Implementation $name is already defined"
      error $errMsg
   }

   lappend implementations $name
   set_impl_attribute $name "top"                 ""
   set_impl_attribute $name "implXDC"             "" 
   set_impl_attribute $name "linkXDC"             "" 
   set_impl_attribute $name "cores"               ""
   set_impl_attribute $name "impl"                0
   set_impl_attribute $name "hd.impl"             0
   set_impl_attribute $name "td.impl"             0
   set_impl_attribute $name "ic.impl"             0
   set_impl_attribute $name "partitions"          [list ]
   set_impl_attribute $name "link"                1
   set_impl_attribute $name "opt"                 1
   set_impl_attribute $name "opt.pre"             ""
   set_impl_attribute $name "opt_options"         ""
   set_impl_attribute $name "opt_directive"       ""
   set_impl_attribute $name "place"               1
   set_impl_attribute $name "place.pre"           ""
   set_impl_attribute $name "place_options"       ""
   set_impl_attribute $name "place_directive"     ""
   set_impl_attribute $name "phys"                1
   set_impl_attribute $name "phys.pre"            ""
   set_impl_attribute $name "phys_options"        ""
   set_impl_attribute $name "phys_directive"      ""
   set_impl_attribute $name "route"               1
   set_impl_attribute $name "route.pre"           ""
   set_impl_attribute $name "route_options"       ""
   set_impl_attribute $name "route_directive"     ""
   set_impl_attribute $name "bitstream"           0
   set_impl_attribute $name "bitstream.pre"       ""
   set_impl_attribute $name "bitstream_options"   ""
   set_impl_attribute $name "bitstream_settings"  ""
}

###############################################################
### Define a PR configuration
###############################################################
proc add_configuration { name } {
  global configurations

   if {[lsearch -exact $configurations $name] >= 0} {
      set errMsg "ERROR: Configuration $name is already defined"
      error $errMsg
   }

   lappend configurations $name
   set_config_attribute $name "top"                 ""
   set_config_attribute $name "implXDC"             "" 
   set_config_attribute $name "linkXDC"             "" 
   set_config_attribute $name "cores"               ""
   set_config_attribute $name "settings"            [list ]
   set_config_attribute $name "impl"                0 
   set_config_attribute $name "link"                1
   set_config_attribute $name "opt"                 1
   set_config_attribute $name "opt.pre"             ""
   set_config_attribute $name "opt_options"         ""
   set_config_attribute $name "opt_directive"       ""
   set_config_attribute $name "place"               1
   set_config_attribute $name "place.pre"           ""
   set_config_attribute $name "place_options"       ""
   set_config_attribute $name "place_directive"     ""
   set_config_attribute $name "phys"                1
   set_config_attribute $name "phys.pre"            ""
   set_config_attribute $name "phys_options"        ""
   set_config_attribute $name "phys_directive"      ""
   set_config_attribute $name "route"               1
   set_config_attribute $name "route.pre"           ""
   set_config_attribute $name "route_options"       ""
   set_config_attribute $name "route_directive"     ""
   set_config_attribute $name "verify"              0
   set_config_attribute $name "bitstream"           0
   set_config_attribute $name "bitstream.pre"       ""
   set_config_attribute $name "bitstream_options"   ""
   set_config_attribute $name "bitstream_settings"  ""
}

###############################################################
### Define an OOC implementation
###############################################################
proc add_ooc_implementation { name } {
   global ooc_implementations
   global dcpDir

   set procname [lindex [info level 0] 0]
   
   if {[lsearch -exact $ooc_implementations $name] >= 0} {
      set errMsg "ERROR: OOC implementation $name is already defined"
      exit $errMsg
   }

   lappend ooc_implementations $name
   set_ooc_attribute $name "module"              ""
   set_ooc_attribute $name "inst"                "$name"
   set_ooc_attribute $name "hierInst"            ""
   set_ooc_attribute $name "implXDC"             "" 
   set_ooc_attribute $name "cores"               ""
   set_ooc_attribute $name "impl"                0
   set_ooc_attribute $name "hd.isolated"         0
   set_ooc_attribute $name "budget.create"       0
   set_ooc_attribute $name "budget.percent"      50
   set_ooc_attribute $name "link"                1
   set_ooc_attribute $name "opt"                 1
   set_ooc_attribute $name "opt.pre"             ""
   set_ooc_attribute $name "opt_options"         ""
   set_ooc_attribute $name "opt_directive"       ""
   set_ooc_attribute $name "place"               1
   set_ooc_attribute $name "place.pre"           ""
   set_ooc_attribute $name "place_options"       ""
   set_ooc_attribute $name "place_directive"     ""
   set_ooc_attribute $name "phys"                1
   set_ooc_attribute $name "phys.pre"            ""
   set_ooc_attribute $name "phys_options"        ""
   set_ooc_attribute $name "phys_directive"      ""
   set_ooc_attribute $name "route"               1
   set_ooc_attribute $name "route.pre"           ""
   set_ooc_attribute $name "route_options"       ""
   set_ooc_attribute $name "route_directive"     ""
   set_ooc_attribute $name "bitstream"           0
   set_ooc_attribute $name "bitstream.pre"       ""
   set_ooc_attribute $name "bitstream_options"   ""
   set_ooc_attribute $name "bitstream_settings"  ""
   set_ooc_attribute $name "implCheckpoint"      "$dcpDir/${name}_route_design.dcp"
   set_ooc_attribute $name "preservation"        routing
}
   
###############################################################
### Add a module
###############################################################
proc add_module { name } {
   global modules

   if {[lsearch -exact $modules $name] >= 0} {
      set errMsg "ERROR: Module $name is already defined"
      error $errMsg
   }

   lappend modules $name
   set_module_attribute $name "moduleName"       $name
   set_module_attribute $name "top_level"        0
   set_module_attribute $name "prj"              ""
   set_module_attribute $name "includes"         ""
   set_module_attribute $name "generics"         ""
   set_module_attribute $name "vlog_headers"     [list ]
   set_module_attribute $name "vlog_defines"     ""
   set_module_attribute $name "sysvlog"          [list ]
   set_module_attribute $name "vlog"             [list ]
   set_module_attribute $name "vhdl"             [list ]
   set_module_attribute $name "ip"               [list ]
   set_module_attribute $name "ipRepo"           [list ]
   set_module_attribute $name "bd"               [list ]
   set_module_attribute $name "cores"            [list ]
   set_module_attribute $name "synthXDC"         [list ]
   set_module_attribute $name "implXDC"          [list ]
   set_module_attribute $name "synth"            0 
   set_module_attribute $name "synth_options"    "-flatten_hierarchy rebuilt" 
   set_module_attribute $name "synthCheckpoint"  ""
}

###############################################################
### Set an implementation attribute
###############################################################
proc set_impl_attribute { impl attribute {value null} } {
   global implAttribute
   set procname [lindex [info level 0] 0]

   check_impl $impl $procname
   check_impl_attribute $attribute $procname
   if {![string match $value "null"]} {
      set implAttribute(${impl}.$attribute) $value
   }
   return
}

###############################################################
### Get an implementation attribute
###############################################################
proc get_impl_attribute { impl attribute } {
   global implAttribute
   set procname [lindex [info level 0] 0]

   check_impl $impl $procname
   check_impl_attribute $attribute $procname
   return $implAttribute(${impl}.$attribute)
}

###############################################################
### Set a config attribute
###############################################################
proc set_config_attribute { config attribute {value null} } {
   global configAttribute
   set procname [lindex [info level 0] 0]

   check_config $config $procname
   check_config_attribute $attribute $procname
   if {![string match $value "null"]} {
      set configAttribute(${config}.$attribute) $value
   }
   return
}

###############################################################
### Get a confg attribute
###############################################################
proc get_config_attribute { config attribute } {
   global configAttribute
   set procname [lindex [info level 0] 0]

   check_config $config $procname
   check_config_attribute $attribute $procname
   return $configAttribute(${config}.$attribute)
}

###############################################################
### Set an OOC implementation attribute
###############################################################
proc set_ooc_attribute { impl attribute {value null} } {
   global oocAttribute
   set procname [lindex [info level 0] 0]

   check_ooc $impl $procname
   check_ooc_attribute $attribute $procname
   if {![string match $value "null"]} {
      set oocAttribute(${impl}.$attribute) $value
   }
   return
}

###############################################################
### Get an OOC implementation attribute
###############################################################
proc get_ooc_attribute { impl attribute } {
   global oocAttribute
   set procname [lindex [info level 0] 0]

   check_ooc $impl $procname
   check_ooc_attribute $attribute $procname
   return $oocAttribute(${impl}.$attribute)
}

###############################################################
### Set a module attribute
###############################################################
proc set_module_attribute { module attribute {value null} } {
   global moduleAttribute
   set procname [lindex [info level 0] 0]
   check_module $module $procname
   check_module_attribute $attribute $procname
   if {![string match $value "null"]} {
      set moduleAttribute(${module}.$attribute) $value
   }
   return
}

###############################################################
### Get a module attribute
###############################################################
proc get_module_attribute { module attribute } {
   global moduleAttribute
   set procname [lindex [info level 0] 0]

   check_module $module $procname
   check_module_attribute $attribute $procname
   return $moduleAttribute(${module}.$attribute)
}






###############################################################
### Check if implementation exists
###############################################################
proc check_impl { impl procname } {
   global implementations
   if {[lsearch -exact $implementations $impl] < 0} {
      set errMsg "ERROR: Invalid implementation $impl specified in $procname"
      error $errMsg 
   }
}

###############################################################
### Check if implementation attribute exists
###############################################################
proc check_impl_attribute { attribute procname } {
   global valid_impl_attributes
   if {[lsearch -exact $valid_impl_attributes $attribute] < 0} {
      set errMsg "ERROR: Invalid implementation attribute $attribute specified in $procname"
      error $errMsg
   }
}

###############################################################
### Check if config exists
###############################################################
proc check_config { name procname } {
   global configurations
   if {[lsearch -exact $configurations $name] < 0} {
      set errMsg "ERROR: Invalid configuration $name specified in $procname"
      error $errMsg 
   }
}

###############################################################
### Check if config attribute exists
###############################################################
proc check_config_attribute { attribute procname } {
   global valid_config_attributes
   if {[lsearch -exact $valid_config_attributes $attribute] < 0} {
      set errMsg "ERROR: Invalid configuration attribute $attribute specified in $procname"
      error $errMsg 
   }
}

###############################################################
### Check if OOC implementation exists
###############################################################
proc check_ooc { impl procname } {
   global ooc_implementations
   if {[lsearch -exact $ooc_implementations $impl] < 0} {
      set errMsg "ERROR: Invalid implementation $impl specified in $procname"
      error $errMsg 
   }
}

###############################################################
### Check if OOC implementation attribute exists
###############################################################
proc check_ooc_attribute { attribute procname } {
   global valid_ooc_attributes
   if {[lsearch -exact $valid_ooc_attributes $attribute] < 0} {
      set errMsg "ERROR: Invalid OOC implementation attribute $attribute specified in $procname"
      error $errMsg
   }
}

###############################################################
### Check if module exists
###############################################################
proc check_module { name procname } {
   global modules
   if {[lsearch -exact $modules $name] < 0} {
      set errMsg "ERROR: Invalid module $name specified in $procname"
      error $errMsg 
   }
}

###############################################################
### Check if module attribute exists
###############################################################
proc check_module_attribute { attribute procname } {
   global valid_module_attributes
   if {[lsearch -exact $valid_module_attributes $attribute] < 0} {
      set errMsg "ERROR: Invalid module attribute $attribute specified in $procname"
      error $errMsg
   }
}

###############################################################
### Override directives with global values
###############################################################
proc set_ooc_directives {ooc} {
   global Directives
     
   set_ooc_attribute $ooc opt_directive   $Directives(opt)
   set_ooc_attribute $ooc place_directive $Directives(place)
   set_ooc_attribute $ooc phys_directive  $Directives(phys)
   set_ooc_attribute $ooc route_directive $Directives(route)
}

###############################################################
### Override directives with global values
###############################################################
proc set_impl_directives {impl} {
   global Directives

   set_impl_attribute $impl opt_directive   $Directives(opt)
   set_impl_attribute $impl place_directive $Directives(place)
   set_impl_attribute $impl phys_directive  $Directives(phys)
   set_impl_attribute $impl route_directive $Directives(route)
}

###############################################################
### Override directives with global values
###############################################################
proc set_config_directives {config} {
   global Directives

   set_config_attribute $config opt_directive   $Directives(opt)
   set_config_attribute $config place_directive $Directives(place)
   set_config_attribute $config phys_directive  $Directives(phys)
   set_config_attribute $config route_directive $Directives(route)
}

###############################################################
### Sorts the list of configurations to put any configuration
### that implements Static at the beginning of the list. This
### prevents having to worry about what order the configurations
### are defined in design.tcl, or allows them to easily be changed.
###############################################################
proc sort_configurations { } {
   global configurations

   set configs "" 

   #Sort list of configurations. Insert "initial" config at beginning of list.
   foreach configuration $configurations {
      set settings [get_config_attribute $configuration settings]
      set top      [get_config_attribute $configuration top]
      foreach setting $settings {
         lassign $setting name module state
         if {[string match $module $top]} {
            if {[string match -nocase $state "implement"]} {
               set configs [linsert $configs 0 $configuration]
            } else {
               lappend configs $configuration
            }
         }
      }
   }

   puts "\n#HD: Sorted list of configurations:"
   foreach config $configs {
      set settings [get_config_attribute $config settings]
      set impl      [get_config_attribute $config impl]
      set verify    [get_config_attribute $config verify]
      set bitstream [get_config_attribute $config bitstream]
      foreach setting $settings {
         lassign $setting name module state
         if {[string match -nocase $state "import"]} {
            #Add spaces to align print statement
            set state "import   "
         }
         if {[string match $module $top]} {
            puts "\t${config}\t(Static: $state\tImplement: $impl\tVerify: $verify\tBitstream: $bitstream\)"
         }
      }
   }
   puts "\n"

   #Make sure no configurations get lost in the sort
   if {[llength $configs] == [llength $configurations]} {
      set configurations $configs
   } else {
      set errMsg "ERROR: Number of configurations changed during sorting process." 
      error $errMsg
   }
}
