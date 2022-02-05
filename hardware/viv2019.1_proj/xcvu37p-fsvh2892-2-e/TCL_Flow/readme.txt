*************************************************************************
   ____  ____ 
  /   /\/   / 
 /___/  \  /   
 \   \   \/    © Copyright 2013 Xilinx, Inc. All rights reserved.
  \   \        This file contains confidential and proprietary 
  /   /        information of Xilinx, Inc. and is protected under U.S. 
 /___/   /\    and international copyright and other intellectual 
 \   \  /  \   property laws. 
  \___\/\___\ 
 
*************************************************************************

Vendor: Xilinx 
Current readme.txt Version: 1.1
Date Last Modified:  22NOV2013
Date Created: 21OCT2013

Associated Filename: ug946-vivado-hierarchical-design-tutorial.zip
Associated Document: UG946, Vivado Design Suite Tutorial: Hierachical Design

Supported Device(s): 7series FPGAs
   
*************************************************************************

Disclaimer: 

      This disclaimer is not a license and does not grant any rights to 
      the materials distributed herewith. Except as otherwise provided in 
      a valid license issued to you by Xilinx, and to the maximum extent 
      permitted by applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE 
      "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL 
      WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
      INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, 
      NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and 
      (2) Xilinx shall not be liable (whether in contract or tort, 
      including negligence, or under any other theory of liability) for 
      any loss or damage of any kind or nature related to, arising under 
      or in connection with these materials, including for any direct, or 
      any indirect, special, incidental, or consequential loss or damage 
      (including loss of data, profits, goodwill, or any type of loss or 
      damage suffered as a result of any action brought by a third party) 
      even if such damage or loss was reasonably foreseeable or Xilinx 
      had been advised of the possibility of the same.

Critical Applications:

      Xilinx products are not designed or intended to be fail-safe, or 
      for use in any application requiring fail-safe performance, such as 
      life-support or safety devices or systems, Class III medical 
      devices, nuclear facilities, applications related to the deployment 
      of airbags, or any other applications that could lead to death, 
      personal injury, or severe property or environmental damage 
      (individually and collectively, "Critical Applications"). Customer 
      assumes the sole risk and liability of any use of Xilinx products 
      in Critical Applications, subject only to applicable laws and 
      regulations governing limitations on product liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS 
FILE AT ALL TIMES.

*************************************************************************

This readme file contains these sections:

1. REVISION HISTORY
2. OVERVIEW
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. INSTALLATION AND OPERATING INSTRUCTIONS
6. OTHER INFORMATION (OPTIONAL)
7. SUPPORT


1. REVISION HISTORY 

Initial Xilinx release

            Readme  
Date        Version      Revision Description
=========================================================================
30OCT2013   1.0          Initial Xilinx release.
22Nov2013   1.1          Removed reference to provided project
                         Added reference to design.tcl 
                         Edited the flow control descriptions to match tutorial
=========================================================================



2. OVERVIEW

This readme describes how to use the files that are released with UG946

This design is a modified version of the Vivado CPU (HDL) example design,
to support bottom-up synthesis and the constraints necessary for the described
HD flow (Design Reuse).

This design can be processed through the provided scripts by sourcing
the design_complete.tcl:

vivado -mode batch -source design_complete.tcl -notrace

The out-of-context constraint generation that is shown in the tutorial can
also be done via the scripts by setting the variable "run.tdImpl" to a '1'
in design_compelte.tcl, and sourcing design_complete.tcl.

3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS

* Xilinx Vivado 2013.4 or higher


4. DESIGN FILE HIERARCHY

The directory structure underneath this top-level folder is described 
below:

Tcl
 |   This folder contains a set of scripts that are used to run 
 |   the Design Reuse flow with the recommended methodology. These
 |   scripts are driven by the user defined design.tcl, and do not
 |   require any modification to run additional designs beyond the
 |   provided tutorial.  
 |       
Source
 +-----  hdl
 |       The hdl directory contain the Verilog and VHDL 
 |       source code for the CPU reference design. 
 |    
 +-----  prj
 |       The prj directory contains ascii files that are
 |       passed to the provided scripts to provide
 |       a list of files for bottom-up synthesis.
 |
 +-----  xdc
 |       The xdc directory contains a few top-level XDC files. 
 |       There is an XDC file for the top-level synethesis, one
 |       for the top-down implementation, and one for the Design
 |       Resue implementaiton. 
 |
 design_complete.tcl
 |-----  This file is a completed file that can be used to run the
 |       Design Reuse flow in the tutorial without any modification.   
 |
 design.tcl
 |-----  This file is an incomplete file that is edited during the
 |       tutorial. 

5. INSTALLATION AND OPERATING INSTRUCTIONS 

1) Install the Xilinx Vivado 2013.4 or later tools.


6. OTHER INFORMATION (OPTIONAL) 

1. Flow Control
	The Design Reuse flow is currently only supported in a non-project flow.
	The tutorial walks you through some steps of setting up the flow, and then
	has you run the flow through the provided Tcl scripts. 

	The Design Reuse flow can be run step by step by controlling the flow variables
	at the top of design.tcl:

	####flow control
	set run.synth    -> This will run bottom-up synthesis on each OOC module and the top-level
	set run.tdImpl   -> This will run the Top-Down flow to generate the OOC constraints
	set run.oocImpl  -> This will implement each OOC module

5. INSTALLATION AND OPERATING INSTRUCTIONS 

1) Install the Xilinx Vivado 2013.4 or later tools.


6. OTHER INFORMATION (OPTIONAL) 

1. Flow Control
	The Design Reuse flow is currently only supported in a non-project flow.
	The tutorial walks you through some steps of setting up the flow, and then
	has you run the flow through the provided Tcl scripts. 

	The Design Reuse flow can be run step by step by controlling the flow variables
	at the top of design.tcl:

	####flow control
	set run.topSynth  -> This will run synthesis on the top-level with blackboxes for each OOC module
	set run.oocSynth  -> This will run bottom-up synthesis on each OOC module and prevent buffer-insertion
	set run.tdImpl    -> This will run the Top-Down flow to generate the OOC constraints
	set run.oocImpl   -> This will implement each OOC module
	set run.topImpl   -> This will run the Reuse (assembly) flow to import each OOC result
	set run.flatImpl  -> This is non-HD run for comparison or debug use.

	Setting any of the above varables to '1' will run that section of the flow. Some
	steps are dependent on others, so each step should be run from top-down given the
	order above.  

2. Output logs
The provided scripts generate several output logs
	+critial.log -> This is a list of all Critical Warnings found during the flow, and
	                should be reviewed with any major change to the design.
	+command.log -> This is log of all Vivado commands that were issued the last time
	                design.tcl was sourced. This will vary based on the flow control
	                variables that are set to '1'.
	+run.log     -> This is a summary of runtime and timing information from each major
	                phase of the flow (synthesis, implementation, etc). This will vary
	                based on the flow control variables that are set to '1'.

7. SUPPORT

To obtain technical support for this reference design, go to 
www.xilinx.com/support to locate answers to known issues in the Xilinx
Answers Database or to create a WebCase.  
