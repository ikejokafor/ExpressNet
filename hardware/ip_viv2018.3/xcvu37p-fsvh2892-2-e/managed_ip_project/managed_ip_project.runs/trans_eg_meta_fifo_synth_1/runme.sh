#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/software/vivado-2018.3/SDK/2018.3/bin:/home/software/vivado-2018.3/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/software/vivado-2018.3/Vivado/2018.3/bin
else
  PATH=/home/software/vivado-2018.3/SDK/2018.3/bin:/home/software/vivado-2018.3/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/software/vivado-2018.3/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/software/vivado-2018.3/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/software/vivado-2018.3/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip_viv2018.3/xcvu37p-fsvh2892-2-e/managed_ip_project/managed_ip_project.runs/trans_eg_meta_fifo_synth_1'
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

EAStep vivado -log trans_eg_meta_fifo.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source trans_eg_meta_fifo.tcl
