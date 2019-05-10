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
// Additional Comments:    This class is a container for the DUT output we are checking
//
//                              
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "DUTOutput.sv"
`include "cnl_`scX_defs.vh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"


class `scX_DUTOutParams_t extends DUTOutParams_t;
    int num_output_rows;
    int num_output_cols;
    int num_acl_output_rows;
    int num_acl_output_cols;
    int depth;
    int depth_offset;
endclass: `scX_DUTOutParams_t


typedef struct {
    int sim_time;
    logic [15:0] pixel;
} `scX_datum_t;


class cnl_`scX_DUTOutput extends DUTOutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    int m_num_output_rows;
    int m_num_output_cols;
    int m_num_acl_output_rows;
    int m_num_acl_output_cols;
    int m_depth;    
    int m_depth_offset;
    `scX_datum_t m_pix_data[];
endclass: cnl_`scX_DUTOutput


function cnl_`scX_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    `scX_DUTOutParams_t `scX_DUTOutParams;


    if(DUTOutParams != null) begin
        $cast(`scX_DUTOutParams, DUTOutParams);
        m_num_output_rows       = `scX_DUTOutParams.num_output_rows;      
        m_num_output_cols       = `scX_DUTOutParams.num_output_cols;
        m_num_sim_output_rows   = `scX_DUTOutParams.num_acl_output_rows;
        m_num_sim_output_cols   = `scX_DUTOutParams.num_acl_output_cols;
        m_depth                 = `scX_DUTOutParams.depth;
        m_depth_offset          = `scX_DUTOutParams.depth_offset;
        
        m_pix_data = new[`NUM_CE_PER_AWE * m_num_sim_output_rows * m_num_sim_output_cols * `NUM_CONV_WINDOW_VALUES];
    end
endfunction: new


function void cnl_`scX_DUTOutput::bits2plain();
endfunction: bits2plain


`endif