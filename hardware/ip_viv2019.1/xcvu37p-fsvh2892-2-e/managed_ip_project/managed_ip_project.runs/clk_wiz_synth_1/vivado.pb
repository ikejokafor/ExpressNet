
?
Command: %s
53*	vivadotcl2]
Isynth_design -top clk_wiz -part xcvu37p-fsvh2892-2-e -mode out_of_context2default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xcvu37p2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xcvu37p2default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and has expired for new software. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
719*common2
2019.102default:defaultZ17-1540h px? 
[
Loading part %s157*device2(
xcvu37p-fsvh2892-2-e2default:defaultZ21-403h px? 
?
%s*synth2?
?Starting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 2669.008 ; gain = 49.719 ; free physical = 49120 ; free virtual = 107302
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
clk_wiz2default:default2
 2default:default2?
n/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz.v2default:default2
712default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2#
clk_wiz_clk_wiz2default:default2
 2default:default2?
v/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_clk_wiz.v2default:default2
692default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
IBUF2default:default2
 2default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
328562default:default8@Z8-6157h px? 
g
%s
*synth2O
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 
2default:defaulth p
x
? 
f
%s
*synth2N
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IBUF2default:default2
 2default:default2
12default:default2
12default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
328562default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	PLLE4_ADV2default:default2
 2default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
614422default:default8@Z8-6157h px? 
c
%s
*synth2K
7	Parameter CLKFBOUT_MULT bound to: 10 - type: integer 
2default:defaulth p
x
? 
h
%s
*synth2P
<	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKIN_PERIOD bound to: 10.000000 - type: float 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter CLKOUT0_DIVIDE bound to: 12 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter CLKOUT1_DIVIDE bound to: 3 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: float 
2default:defaulth p
x
? 
g
%s
*synth2O
;	Parameter CLKOUTPHY_MODE bound to: VCO_2X - type: string 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter COMPENSATION bound to: AUTO - type: string 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter IS_CLKFBIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter IS_CLKIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter IS_PWRDWN_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter IS_RST_INVERTED bound to: 1'b0 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter REF_JITTER bound to: 0.010000 - type: float 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	PLLE4_ADV2default:default2
 2default:default2
22default:default2
12default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
614422default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
BUFG2default:default2
 2default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
10752default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BUFG2default:default2
 2default:default2
32default:default2
12default:default2^
H/home/software/vivado-2019.1/Vivado/2019.1/scripts/rt/data/unisim_comp.v2default:default2
10752default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
clk_wiz_clk_wiz2default:default2
 2default:default2
42default:default2
12default:default2?
v/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_clk_wiz.v2default:default2
692default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clk_wiz2default:default2
 2default:default2
52default:default2
12default:default2?
n/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz.v2default:default2
712default:default8@Z8-6155h px? 
?
%s*synth2?
?Finished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 2724.727 ; gain = 105.438 ; free physical = 49140 ; free virtual = 107324
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:09 . Memory (MB): peak = 2730.664 ; gain = 111.375 ; free physical = 49136 ; free virtual = 107319
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:09 . Memory (MB): peak = 2730.664 ; gain = 111.375 ; free physical = 49136 ; free virtual = 107319
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
t/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_ooc.xdc2default:default2
inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
t/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_ooc.xdc2default:default2
inst	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
v/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_board.xdc2default:default2
inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
v/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz_board.xdc2default:default2
inst	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
p/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz.xdc2default:default2
inst	2default:default8Z20-848h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
create_clock: 2default:default2
00:00:072default:default2
00:00:072default:default2
2867.1022default:default2
15.8442default:default2
490182default:default2
1072022default:defaultZ17-722h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
p/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz.xdc2default:default2
inst	2default:default8Z20-847h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
p/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/clk_wiz/clk_wiz.xdc2default:default2-
.Xil/clk_wiz_propImpl.xdc2default:defaultZ1-236h px? 
8
Deriving generated clocks
2*timingZ38-2h px? 
?
Parsing XDC File [%s]
179*designutils2?
?/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/managed_ip_project/managed_ip_project.runs/clk_wiz_synth_1/dont_touch.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
?/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/managed_ip_project/managed_ip_project.runs/clk_wiz_synth_1/dont_touch.xdc2default:default8Z20-178h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2867.1022default:default2
0.0002default:default2
490182default:default2
1072012default:defaultZ17-722h px? 
?
!Unisim Transformation Summary:
%s111*project2?
w  A total of 3 instances were transformed.
  BUFG => BUFGCE: 2 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 1 instances
2default:defaultZ1-111h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:00.032default:default2
00:00:00.072default:default2
2867.1022default:default2
0.0002default:default2
490182default:default2
1072012default:defaultZ17-722h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:25 ; elapsed = 00:00:32 . Memory (MB): peak = 2867.102 ; gain = 247.812 ; free physical = 49117 ; free virtual = 107300
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Loading part: xcvu37p-fsvh2892-2-e
2default:defaulth p
x
? 
B
 Reading net delay rules and data4578*oasysZ8-6742h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:25 ; elapsed = 00:00:32 . Memory (MB): peak = 2867.102 ; gain = 247.812 ; free physical = 49117 ; free virtual = 107300
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:25 ; elapsed = 00:00:32 . Memory (MB): peak = 2867.102 ; gain = 247.812 ; free physical = 49117 ; free virtual = 107300
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:25 ; elapsed = 00:00:33 . Memory (MB): peak = 2867.102 ; gain = 247.812 ; free physical = 49118 ; free virtual = 107302
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2o
[Part Resources:
DSPs: 9024 (col length:94)
BRAMs: 4032 (col length: RAMB18 288 RAMB36 144)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:34 . Memory (MB): peak = 2867.102 ; gain = 247.812 ; free physical = 49116 ; free virtual = 107301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:14 ; elapsed = 00:02:00 . Memory (MB): peak = 3221.305 ; gain = 602.016 ; free physical = 48592 ; free virtual = 106778
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:01:14 ; elapsed = 00:02:00 . Memory (MB): peak = 3221.305 ; gain = 602.016 ; free physical = 48592 ; free virtual = 106778
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:01:14 ; elapsed = 00:02:00 . Memory (MB): peak = 3230.320 ; gain = 611.031 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
G
%s*synth2/
|      |Cell      |Count |
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
G
%s*synth2/
|1     |BUFG      |     2|
2default:defaulth px? 
G
%s*synth2/
|2     |PLLE4_ADV |     1|
2default:defaulth px? 
G
%s*synth2/
|3     |IBUF      |     1|
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
W
%s
*synth2?
++------+---------+----------------+------+
2default:defaulth p
x
? 
W
%s
*synth2?
+|      |Instance |Module          |Cells |
2default:defaulth p
x
? 
W
%s
*synth2?
++------+---------+----------------+------+
2default:defaulth p
x
? 
W
%s
*synth2?
+|1     |top      |                |     4|
2default:defaulth p
x
? 
W
%s
*synth2?
+|2     |  inst   |clk_wiz_clk_wiz |     4|
2default:defaulth p
x
? 
W
%s
*synth2?
++------+---------+----------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.195 ; gain = 625.906 ; free physical = 48591 ; free virtual = 106777
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:01:02 ; elapsed = 00:01:45 . Memory (MB): peak = 3245.195 ; gain = 489.469 ; free physical = 48628 ; free virtual = 106814
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:01:16 ; elapsed = 00:02:02 . Memory (MB): peak = 3245.203 ; gain = 625.906 ; free physical = 48641 ; free virtual = 106828
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
rThe CLKFBOUT to CLKFBIN net for instance %s with COMPENSATION=INTERNAL is optimized away to aid design routability238*opt2>
inst/plle4_adv_inst	inst/plle4_adv_inst2default:default8Z31-326h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3316.4382default:default2
0.0002default:default2
485362default:default2
1067222default:defaultZ17-722h px? 
?
!Unisim Transformation Summary:
%s111*project2?
w  A total of 3 instances were transformed.
  BUFG => BUFGCE: 2 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 1 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:01:462default:default2
00:03:232default:default2
3316.4382default:default2
1871.0622default:default2
486272default:default2
1068132default:defaultZ17-722h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
3316.4382default:default2
0.0002default:default2
486272default:default2
1068132default:defaultZ17-722h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/managed_ip_project/managed_ip_project.runs/clk_wiz_synth_1/clk_wiz.dcp2default:defaultZ17-1381h px? 
?
'%s' is deprecated. %s
384*common2#
use_project_ipc2default:default2A
-This option is deprecated and no longer used.2default:defaultZ17-576h px? 
?
<Added synthesis output to IP cache for IP %s, cache-ID = %s
485*coretcl2
clk_wiz2default:default2$
ec084521906c68302default:defaultZ2-1648h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3316.4382default:default2
0.0002default:default2
486212default:default2
1068082default:defaultZ17-722h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2019.1/xcvu37p-fsvh2892-2-e/managed_ip_project/managed_ip_project.runs/clk_wiz_synth_1/clk_wiz.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2x
dExecuting : report_utilization -file clk_wiz_utilization_synth.rpt -pb clk_wiz_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed Nov 17 18:11:44 20212default:defaultZ17-206h px? 


End Record