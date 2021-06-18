#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/software/vivado-2016.1/SDK/2016.1/bin:/home/software/vivado-2016.1/Vivado/2016.1/ids_lite/ISE/bin/lin64:/home/software/vivado-2016.1/Vivado/2016.1/bin
else
  PATH=/home/software/vivado-2016.1/SDK/2016.1/bin:/home/software/vivado-2016.1/Vivado/2016.1/ids_lite/ISE/bin/lin64:/home/software/vivado-2016.1/Vivado/2016.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/software/vivado-2016.1/Vivado/2016.1/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/software/vivado-2016.1/Vivado/2016.1/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/mdl/izo5011/SOC_IT/cnn_layer_accel/hardware/ip/xcku115/managed_ip_project/managed_ip_project.runs/xilinx_async_fwft_fifo_count_synth_1'
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

EAStep vivado -log xilinx_async_fwft_fifo_count.vds -m64 -mode batch -messageDb vivado.pb -notrace -source xilinx_async_fwft_fifo_count.tcl
