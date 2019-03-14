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


`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"
`include "DUTOutput.sv"


class sc0_DUTOutParams_t extends DUTOutParams_t;
    int num_output_rows;
    int num_output_cols;
    int num_sim_output_rows;
    int num_sim_output_cols;
    int kernel_size;
    int depth_offset;
endclass: sc0_DUTOutParams_t


typedef struct {
    int sim_time;
    logic [15:0] pixel;
} sc0_datum_t;


class cnl_sc0_DUTOutput extends DUToutput;
    extern function new(DUTOutParams_t DUTOutParams = null);
    extern function void bits2plain();
    
    
    int m_num_output_rows;
    int m_num_output_cols;
    int m_num_sim_output_rows;
    int m_num_sim_output_cols;    
    int m_kernel_size;
    int m_depth_offset;
    sc0_datum_t m_pix_data_sol[][][][];
endclass: cnl_sc0_DUTOutput


function cnl_sc0_DUTOutput::new(DUTOutParams_t DUTOutParams = null);
    sc0_DUTOutParams_t sc0_DUTOutParams;


    if(DUTOutParams != null) begin
        $cast(sc0_DUTOutParams, DUTOutParams);
        m_num_output_rows       = sc0_DUTOutParams.num_output_rows;      
        m_num_output_cols       = sc0_DUTOutParams.num_output_cols;
        m_num_sim_output_rows   = sc0_DUTOutParams.num_sim_output_rows;
        m_num_sim_output_cols   = sc0_DUTOutParams.num_sim_output_cols;
        m_kernel_size           = sc0_DUTOutParams.kernel_size;
        m_depth_offset          = sc0_DUTOutParams.depth_offset;
        
        m_pix_data_sol = new[`NUM_CE_PER_AWE];
        foreach(m_pix_data_sol[i]) begin
            m_pix_data_sol[i] = new[m_num_sim_output_rows];
            foreach(m_pix_data_sol[i, ii]) begin
                m_pix_data_sol[i][ii] = new[m_num_sim_output_cols];
                foreach(m_pix_data_sol[i, ii, iii]) begin
                    m_pix_data_sol[i][ii][iii] = new[`KERNEL_3x3_COUNT_FULL_CFG];
                end
            end
        end
    end
endfunction: new


function void cnl_sc0_DUTOutput::bits2plain();
endfunction: bits2plain


`endif