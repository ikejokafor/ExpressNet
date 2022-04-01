# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/xdma_0.xci
# IP: The module: 'xdma_0' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/xdma_0_pcie4c_ip.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/xdma_0_pcie4c_ip_gt.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip_gt || ORIG_REF_NAME==xdma_0_pcie4c_ip_gt} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_1/xdma_v4_1_2_blk_mem_64_reg_be.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_v4_1_2_blk_mem_64_reg_be || ORIG_REF_NAME==xdma_v4_1_2_blk_mem_64_reg_be} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_2/xdma_v4_1_2_blk_mem_64_noreg_be.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_v4_1_2_blk_mem_64_noreg_be || ORIG_REF_NAME==xdma_v4_1_2_blk_mem_64_noreg_be} -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/synth/xdma_0_pcie4c_ip_gt_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/synth/xdma_0_pcie4c_ip_gt.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip_gt || ORIG_REF_NAME==xdma_0_pcie4c_ip_gt} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/xdma_0_pcie4c_ip_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/synth/xdma_0_pcie4c_ip_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/synth/xdma_0_pcie4c_ip_late.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/source/ip_pcie4_uscale_plus_x0y0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_1/xdma_v4_1_2_blk_mem_64_reg_be_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_2/xdma_v4_1_2_blk_mem_64_noreg_be_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/xdma_0_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/source/xdma_0_pcie4_uscaleplus_ip.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/synth/xdma_0_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/xdma_0.xci
# IP: The module: 'xdma_0' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/xdma_0_pcie4c_ip.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/xdma_0_pcie4c_ip_gt.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip_gt || ORIG_REF_NAME==xdma_0_pcie4c_ip_gt} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_1/xdma_v4_1_2_blk_mem_64_reg_be.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_v4_1_2_blk_mem_64_reg_be || ORIG_REF_NAME==xdma_v4_1_2_blk_mem_64_reg_be} -quiet] -quiet

# IP: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_2/xdma_v4_1_2_blk_mem_64_noreg_be.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==xdma_v4_1_2_blk_mem_64_noreg_be || ORIG_REF_NAME==xdma_v4_1_2_blk_mem_64_noreg_be} -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/synth/xdma_0_pcie4c_ip_gt_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/ip_0/synth/xdma_0_pcie4c_ip_gt.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip_gt || ORIG_REF_NAME==xdma_0_pcie4c_ip_gt} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/xdma_0_pcie4c_ip_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/synth/xdma_0_pcie4c_ip_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/synth/xdma_0_pcie4c_ip_late.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_0/source/ip_pcie4_uscale_plus_x0y0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==xdma_0_pcie4c_ip || ORIG_REF_NAME==xdma_0_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_1/xdma_v4_1_2_blk_mem_64_reg_be_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/ip_2/xdma_v4_1_2_blk_mem_64_noreg_be_ooc.xdc

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/xdma_0_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/source/xdma_0_pcie4_uscaleplus_ip.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: /home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/hardware/ip/xcvu37p-fsvh2892-2-e/xdma_0/synth/xdma_0_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'xdma_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet
