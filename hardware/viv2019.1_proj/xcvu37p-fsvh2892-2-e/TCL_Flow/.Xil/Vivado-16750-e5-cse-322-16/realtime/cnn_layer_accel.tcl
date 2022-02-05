# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "./.Xil/Vivado-16750-e5-cse-322-16/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xcvu37p-fsvh2892-2-e
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include {
    /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog
    /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/defs
  } -define OOC_SYNTH {
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/SRL_bit.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/SRL_bus.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/fifo_fwft.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/xilinx_simple_dual_port_no_change_ram.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/xilinx_true_dual_port_no_change_ram.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/xilinx_simple_dual_port_no_change_2_clock_ram.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/xilinx_simple_dual_port_no_change_asym_width_2_clock_ram.sv
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/vector_multiply.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_macc_0.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_macc_1.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_conv1x1_pip.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS_pip_ctrl.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_FAS_vec_add.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_prefetch_buffer.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_quad.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_quad_bram_ctrl.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_trans_eg_fifo.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_trans_in_fifo.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_sequence_table0.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_sequence_table1.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_weight_table_top.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/awe_dsp_input_mux.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_awe_dsps.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_awe_rowbuffers.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_AWP.sv
      /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/rtl/cnn_layer_accel_ce_dsps.sv
      /home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      /home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
    }
      rt::read_verilog -include {
    /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog
    /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/verilog/defs
  } -define OOC_SYNTH {
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/krnl1x1Bias_dwc_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/outbuf_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/partMap_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/prevMap_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/res_dwc_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/resdMap_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/trans_eg_meta_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/trans_eg_pyld_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/trans_in_meta_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/trans_in_pyld_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/conv1x1_dwc_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/convMap_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/job_fetch_fifo_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/krnl1x1_bram_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/krnl1x1Bias_bram_stub.v
      ./.Xil/Vivado-16750-e5-cse-322-16/realtime/pixel_sequence_data_bram_stub.v
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/fifo_fwft_prog_full_count.v
      /home/mdl/izo5011/IkennaWorkSpace/accel_infst_common/hardware/verilog/adder_tree.v
    }
      rt::read_vhdl -lib xpm /home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top cnn_layer_accel
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "./.Xil/Vivado-16750-e5-cse-322-16/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}