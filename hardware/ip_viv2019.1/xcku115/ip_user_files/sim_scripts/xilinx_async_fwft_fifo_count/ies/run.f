-makelib ies/xil_defaultlib \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
-endlib
-makelib ies/xpm \
  "/home/software/vivado-2016.1/Vivado/2016.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_0 \
  "../../../ipstatic/fifo_generator_v13_1_0/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_0 \
  "../../../ipstatic/fifo_generator_v13_1_0/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_0 \
  "../../../ipstatic/fifo_generator_v13_1_0/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../xilinx_async_fwft_fifo_count/sim/xilinx_async_fwft_fifo_count.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

