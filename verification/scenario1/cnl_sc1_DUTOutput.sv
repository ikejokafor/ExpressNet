`ifndef __CNL_SC1_DUT_OUTPUT__
`define __CNL_SC1_DUT_OUTPUT__


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


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "DUTOutput.sv"


class sc1_DUTOutParams_t extends DUTOutParams_t;
    int num_kernels;
    int num_output_rows;
    int num_output_cols;
    int num_sim_output_rows;
    int num_sim_output_cols;    
endclass: sc1_DUTOutParams_t


typedef struct {
    int sim_time;
    logic pixel;
} sc1_datum_t;


class cnl_sc1_DUTOutput extends DUToutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    int m_num_kernels;
    int m_num_output_rows;
    int m_num_output_cols;
    int m_num_sim_output_rows;
    int m_num_sim_output_cols;
    sc1_datum_t m_conv_map[];
endclass: cnl_sc1_DUTOutput


function cnl_sc1_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    sc1_DUTOutParams_t sc1_DUTOutParams;


    if(DUTOutParams != null) begin
        $cast(sc1_DUTOutParams, DUTOutParams);
        m_num_kernels           = sc1_DUTOutParams.num_kernels;
        m_num_output_rows       = sc1_DUTOutParams.num_output_rows;      
        m_num_output_cols       = sc1_DUTOutParams.num_output_cols;
        m_num_sim_output_rows   = sc1_DUTOutParams.num_sim_output_rows;  
        m_num_sim_output_cols   = sc1_DUTOutParams.num_sim_output_cols;  
        m_conv_map              = new[m_num_kernels * m_num_sim_output_rows * m_num_sim_output_cols];
    end
endfunction: new


function void cnl_sc1_DUTOutput::bits2plain();
endfunction: bits2plain


`endif