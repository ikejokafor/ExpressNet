`ifndef __CNL_SC0_DUT_OUTPUT__
`define __CNL_SC0_DUT_OUTPUT__


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
// Additional Comments:    This class drives the appropiate signals to recieve outputs from the DUT, transforms them into
//                              a more readable format, and passes it to the checker
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "DUTOutput.sv"


class sc0_DUTOutParams_t extends DUTOutParams_t;
    int num_kernels;
    int num_output_rows;
    int num_output_cols;
endclass: sc0_DUTOutParams_t


class cnl_sc0_DUTOutput extends DUToutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    int m_num_kernels;
    int m_num_output_rows;
    int m_num_output_cols;
    logic [15:0] m_conv_map[];
endclass: cnl_sc0_DUTOutput


function cnl_sc0_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    sc0_DUTOutParams_t sc0_DUTOutParams;

    if(DUTOutParams != null) begin
        $cast(sc0_DUTOutParams, DUTOutParams);
        m_num_kernels       = sc0_DUTOutParams.num_kernels;
        m_num_output_rows   = sc0_DUTOutParams.num_output_rows;      
        m_num_output_cols   = sc0_DUTOutParams.num_output_cols;
        m_conv_map          = new[sc0_DUTOutParams.num_kernels * sc0_DUTOutParams.num_output_rows * sc0_DUTOutParams.num_output_cols];
    end
endfunction: new


function void cnl_sc0_DUTOutput::bits2plain();
endfunction: bits2plain


`endif