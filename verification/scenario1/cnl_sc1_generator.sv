`ifndef	__CNL_SC1_GENERATOR__
`define	__CNL_SC1_GENERATOR__


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
// Additional Comments:     This class creates test for DUT
//                              pre_randomize() and post_randomize() are built in overridable functions  
//                          
//                          
//                          
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "generator.sv"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.sv"


class sc1_genParams_t extends genParams_t;
endclass: sc1_genParams_t


class cnl_sc1_generator extends generator;
    extern function new(genParams_t genParams = null);
    extern function void plain2bits();
    extern function void pre_randomize();
    extern function void post_randomize();   

    rand int m_num_input_rows                                                           ;
    rand int m_num_input_cols                                                           ;
    rand int m_depth                                                                    ;
    rand int m_num_kernels                                                              ;
    rand int m_kernel_size                                                              ;
    rand int m_stride                                                                   ;
    rand int m_padding                                                                  ;
    int m_pix_data[]                                                                    ;
    int m_kernel_data[]                                                                 ;
    logic [15:0] m_pix_seq_data_sim[0:((`MAX_NUM_INPUT_COLS * `NUM_CE_PER_QUAD) - 1)]   ;
    logic [15:0] m_pix_data_sim[]                                                       ;
    logic [15:0] m_kernel_data_sim[]                                                    ;

    constraint c0 {      
        solve m_num_input_rows before m_num_input_cols;
        m_num_input_rows inside {[`MIN_NUM_INPUT_ROWS:`MAX_NUM_INPUT_ROWS]};
        m_num_input_cols == m_num_input_rows;
        m_depth == `NUM_CE_PER_QUAD;
        m_kernel_size == 3;
        m_num_kernels inside {[1:`MAX_BRAM_3x3_KERNELS]};
        m_stride == 1;
        m_padding == 0;
    }
endclass: cnl_sc1_generator


function cnl_sc1_generator::new(genParams_t genParams = null);
    int i;
    int j;

    
    // Note: The code below will work for 3x3. Has not been tested for 1x1
    // RM = Row matriculate
    // RST = Reset MACC reg
    // P = parity bit
    // SEQ = sequence value
    //
    //                             RM    RST   P     SEQ
    m_pix_seq_data_sim[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
    m_pix_seq_data_sim[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
    m_pix_seq_data_sim[2] = {3'b1, 1'b0, 1'b0, 1'b0, 10'd512};
    m_pix_seq_data_sim[3] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd513};
    m_pix_seq_data_sim[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};

    j = 0;
    for(i = 5; i < (`MAX_NUM_INPUT_COLS * `WINDOW_3x3_NUM_CYCLES); i = i + 5) begin            
        if((j % 2) == 0) begin
            m_pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b0, m_pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            m_pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b1, m_pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD]};
        end else begin           
            m_pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b1, m_pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
            m_pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, m_pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
        end
        m_pix_seq_data_sim[i + 2] = {3'b1, 1'b0, 1'b0, 1'b0, m_pix_seq_data_sim[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
        m_pix_seq_data_sim[i + 3] = {3'b0, 1'b0, 1'b0, 1'b0, m_pix_seq_data_sim[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
        m_pix_seq_data_sim[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, m_pix_seq_data_sim[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd1};
        j = (j + 1) % 2;
    end
    while(i < (`MAX_NUM_INPUT_COLS * `NUM_CE_PER_QUAD)) begin
        m_pix_seq_data_sim[i] = 0;
        i = i + 1;
    end
endfunction: new


function void cnl_sc1_generator::plain2bits();
    m_pix_data_sim = new[m_pix_data.size()];
    foreach(m_pix_data[i]) begin
        m_pix_data_sim[i] = m_pix_data[i];
    end
    
    
    m_kernel_data_sim = new[m_kernel_data.size()];    
    foreach(m_kernel_data[i]) begin
        m_kernel_data_sim[i] = m_kernel_data[i];
    end
endfunction: plain2bits


function void cnl_sc1_generator::pre_randomize();
endfunction: pre_randomize


function void cnl_sc1_generator::post_randomize();
    int i;
    int j;
    int k;


    m_pix_data = new[m_depth * m_num_input_rows * m_num_input_cols];
    foreach(m_pix_data[i]) begin
        m_pix_data[i] = $urandom_range(1, 10);
    end
 

    m_kernel_data = new[m_num_kernels * m_depth * `KERNEL_3x3_COUNT_FULL_CFG]; 
    for(k = 0; k < m_num_kernels; k = k + 1) begin
        for(i = 0; i < m_depth; i = i + 1) begin
            for(j = 0; j < `KERNEL_3x3_COUNT_FULL_CFG; j = j + 1) begin
                if(j != `KERNEL_3x3_COUNT_FULL_CFG - 1) begin
                    m_kernel_data[(k * m_depth + i) * `KERNEL_3x3_COUNT_FULL_CFG + j] = $urandom_range(1, 10);
                end else begin
                    m_kernel_data[(k * m_depth + i) * `KERNEL_3x3_COUNT_FULL_CFG + j] = 0;
                end
            end
        end
    end
endfunction: post_randomize


`endif