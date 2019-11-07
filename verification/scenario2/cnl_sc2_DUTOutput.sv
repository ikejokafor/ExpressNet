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


`include "DUTOutput.sv"
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"


class `scX_DUTOutParams_t extends DUTOutParams_t;
    int m_num_kernels;
    int m_depth;
endclass: `scX_DUTOutParams_t


class `cnl_scX_DUTOutput extends DUTOutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    logic [15:0] m_pix_seq_data_sim[0:`MAX_NUM_INPUT_COLS - 1]   ;
    logic [15:0] m_kernel_data_sim[]                             ;
    logic [127:0] m_acl_slv_reg                                  ;
    int m_num_kernels                                            ;
    int m_depth                                                  ;
endclass: `cnl_scX_DUTOutput


function `cnl_scX_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    `scX_DUTOutParams_t `scX_DUTOutParams;


    if(DUTOutParams != null) begin
        $cast(`scX_DUTOutParams, DUTOutParams);
        m_num_kernels       = `scX_DUTOutParams.m_num_kernels;      
        m_depth             = `scX_DUTOutParams.m_depth;
        m_kernel_data_sim   = new[m_num_kernels * m_depth * `KERNEL_3x3_COUNT_FULL];
    end
endfunction: new


function void `cnl_scX_DUTOutput::bits2plain();
endfunction: bits2plain


`endif