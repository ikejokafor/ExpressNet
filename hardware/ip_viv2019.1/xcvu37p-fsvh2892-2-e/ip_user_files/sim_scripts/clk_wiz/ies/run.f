-makelib ies_lib/xil_defaultlib -sv \
  "/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/software/vivado-2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../clk_wiz/clk_wiz_clk_wiz.v" \
  "../../../../clk_wiz/clk_wiz.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

