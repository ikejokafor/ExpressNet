#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/software/vivado-2019.1/SDK/2019.1/bin:/home/software/vivado-2019.1/Vivado/2019.1/ids_lite/ISE/bin/lin64:/home/software/vivado-2019.1/Vivado/2019.1/bin
else
  PATH=/home/software/vivado-2019.1/SDK/2019.1/bin:/home/software/vivado-2019.1/Vivado/2019.1/ids_lite/ISE/bin/lin64:/home/software/vivado-2019.1/Vivado/2019.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/viv2019.1_proj/xcvu37p-fsvh2892-2-e/GUI_Flow/cnn_layer_accel.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log xcvu37_fsvh2892_2_e.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source xcvu37_fsvh2892_2_e.tcl
