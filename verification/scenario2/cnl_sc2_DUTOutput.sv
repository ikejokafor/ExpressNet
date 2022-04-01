`ifndef __CNL_SC2_DUT_OUTPUT__
`define __CNL_SC2_DUT_OUTPUT__


`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:			
//				
// Engineer:		
//
// Create Date:		
// Design Name:		
// Module Name:		
// Project Name:	
// Target Devices:  
// Tool versions:
// Description:		
//
// Dependencies:
//	 
// 	 
//
// Revision:
//
//
//
//
// Additional Comments:    This class is a container for the DUT output we are checking
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
`include "cnn_layer_accel.svh"
`include "cnn_layer_accel_AWP.svh"
`include "cnn_layer_accel_conv1x1_pip.svh"
`include "cnn_layer_accel_FAS.svh"
`include "cnn_layer_accel_FAS_pip_ctrl.svh"
`include "cnn_layer_accel_QUAD.svh"
`include "cnn_layer_accel_trans_fifo.svh"
`include "awe.svh"
`include "axi_defs.svh"

`include "DUTOutput.sv"
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_verif_defs.svh"


class `scX_DUTOutParams_t extends DUTOutParams_t;
    int num_kernels;
    int num_output_rows;
    int num_output_cols;
    int num_acl_output_rows;
    int num_acl_output_cols;  
    int depth;
    int inst_cfg;
    int conv_out_fmt;
endclass: `scX_DUTOutParams_t


typedef struct {
    int sim_time;
    logic [15:0] pixel;
} `scX_datum_t;


class `cnl_scX_DUTOutput extends DUTOutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    int m_num_kernels;
    int m_num_output_rows;
    int m_num_output_cols;
    int m_num_acl_output_rows;
    int m_num_acl_output_cols;
    int m_depth;
    int m_inst_cfg;
    int m_conv_out_fmt;
    `scX_datum_t m_conv_map[];
endclass: `cnl_scX_DUTOutput


function `cnl_scX_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    `scX_DUTOutParams_t `scX_DUTOutParams;


    if(DUTOutParams != null) begin
        $cast(`scX_DUTOutParams, DUTOutParams);
        m_num_kernels           = `scX_DUTOutParams.num_kernels;
        m_num_output_rows       = `scX_DUTOutParams.num_output_rows;      
        m_num_output_cols       = `scX_DUTOutParams.num_output_cols;
        m_num_acl_output_rows   = `scX_DUTOutParams.num_acl_output_rows;  
        m_num_acl_output_cols   = `scX_DUTOutParams.num_acl_output_cols;
        m_depth                 = `scX_DUTOutParams.depth;
        m_inst_cfg              = `scX_DUTOutParams.inst_cfg;
        m_conv_out_fmt          = `scX_DUTOutParams.conv_out_fmt;
        if(m_inst_cfg == 0) begin
            m_conv_map          = new[m_num_kernels * m_num_output_rows * m_num_output_cols]; 
        end else begin
            m_conv_map          = new[m_num_kernels * m_num_acl_output_rows * m_num_acl_output_cols];
        end
    end
endfunction: new


function void `cnl_scX_DUTOutput::bits2plain();
endfunction: bits2plain


`endif