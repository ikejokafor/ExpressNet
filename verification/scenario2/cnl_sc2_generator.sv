`ifndef	__CNL_SC2_GENERATOR__
`define	__CNL_SC2_GENERATOR__


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
//                          Not testing padding > 1
//                          
//                          floor((W - F + (2 * P)) / S) + 1
//                          
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`include "generator.sv"
`include "cnl_sc2_verif_defs.svh"
`include "cnn_layer_accel_defs.vh"
`include "cnn_layer_accel_verif_defs.svh"


class `scX_genParams_t extends genParams_t;
endclass: `scX_genParams_t


class `scX_crtTestParams_t extends crtTestParams_t;
    int num_input_rows;
    int num_input_cols;
    int depth;
    int num_kernels;
    int kernel_size;
    int stride;
    int padding;
    bool upsample;
endclass: `scX_crtTestParams_t


class `cnl_scX_generator extends generator;
    extern function new(genParams_t genParams = null);
    extern function void createTest(crtTestParams_t params);
    extern function void plain2bits();
    extern function void post_randomize();
    

    rand int m_num_input_rows                                                           ;
    rand int m_num_input_cols                                                           ;
    int      m_expd_num_input_cols                                                      ;
    int      m_expd_num_input_rows                                                      ;   
    int      m_num_input_rows_cfg                                                       ;
    int      m_num_input_cols_cfg                                                       ;
    int      m_num_output_rows_cfg                                                      ;
    int      m_num_output_cols_cfg                                                      ;
    int      m_num_output_rows                                                          ;
    int      m_num_output_cols                                                          ;    
    int      m_num_acl_output_rows                                                      ;
    int      m_num_acl_output_cols                                                      ;
    int      m_pfb_full_count                                                           ;
    int      m_pfb_full_count_cfg                                                       ;
    rand int m_depth                                                                    ;
    rand int m_num_kernels                                                              ;
    rand int m_kernel_size                                                              ;
    rand int m_stride                                                                   ;
    rand int m_padding                                                                  ;
    rand bool m_upsample                                                                ;
    int m_expd_num_input_cols_cfg                                                       ;
    int m_expd_num_input_rows_cfg                                                       ;
    int m_crpd_input_col_start_cfg                                                      ;
    int m_crpd_input_row_start_cfg                                                      ;
    int m_crpd_input_col_end_cfg                                                        ;
    int m_crpd_input_row_end_cfg                                                        ;
    int m_pix_seq_data_full_count_cfg                                                   ;
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
        m_stride inside {[1:2]};
        m_padding inside {[0:`MAX_PADDING]};
        m_upsample inside {[0:1]};
    }
endclass: `cnl_scX_generator


function `cnl_scX_generator::new(genParams_t genParams = null);
    `scX_genParams_t `scX_genParams;


    if(genParams != null) begin
        $cast(`scX_genParams, genParams);
        m_ti = `scX_genParams.ti;
    end
endfunction: new


function void `cnl_scX_generator::createTest(crtTestParams_t params);
    `scX_crtTestParams_t `scX_crtTestParams;
    int i;
    int j;
    int k;
    int a;
    int b;
    shortreal tmp_num_output_rows_cfg;
    shortreal tmp_num_output_cols_cfg;
    
    
    $cast(`scX_crtTestParams, params);
    m_num_input_rows = `scX_crtTestParams.num_input_rows;
    m_num_input_cols = `scX_crtTestParams.num_input_cols;
    m_depth = `scX_crtTestParams.depth;
    m_num_kernels = `scX_crtTestParams.num_kernels;
    m_kernel_size = `scX_crtTestParams.kernel_size;
    m_stride = `scX_crtTestParams.stride;
    m_padding = `scX_crtTestParams.padding;
    m_upsample = `scX_crtTestParams.upsample;
    post_randomize();

    
    $display("// Created Specific Test ----------------------------------------");
    $display("// Test Index:            %0d", m_ti                              );
    $display("// Num Input Rows:        %0d", m_num_input_rows                  );
    $display("// Num Input Cols:        %0d", m_num_input_cols                  );
    $display("// Input Depth:           %0d", m_depth                           );
    $display("// Num Kernels:           %0d", m_num_kernels                     );
    $display("// Kernel size:           %0d", m_kernel_size                     );
    $display("// Stride                 %0d", m_stride                          );
    $display("// Padding:               %0d", m_padding                         );
    $display("// Upsample               %0d", m_upsample                        );
    $display("// Num Output Rows:       %0d", m_num_output_rows                 );
    $display("// Num Output Cols:       %0d", m_num_output_cols                 );
    $display("// Num Acl Output Rows:   %0d", m_num_acl_output_rows             );
    $display("// Num Acl Output Cols:   %0d", m_num_acl_output_cols             ); 
    $display("// Created Specific Test ----------------------------------------");
    $display("\n");
endfunction: createTest


function void `cnl_scX_generator::plain2bits();
    int i;
    int j;
    int a;
    int b;
    int n;


    m_pix_data_sim = new[m_pix_data.size()];
    foreach(m_pix_data[i]) begin
        m_pix_data_sim[i] = m_pix_data[i];
    end


    m_kernel_data_sim = new[m_num_kernels * m_depth * `KERNEL_3x3_COUNT_FULL];
    for(i = 0; i < m_num_kernels; i = i + 1) begin
        for(j = 0; j < m_depth; j = j + 1) begin
            n = 0;
            for(a = 0; a < m_kernel_size; a = a + 1) begin
                for(b = 0; b < m_kernel_size; b = b + 1) begin
                    m_kernel_data_sim[(i * m_depth + j) * `KERNEL_3x3_COUNT_FULL + n]
                        = m_kernel_data[((i * m_depth + j) * m_kernel_size + a) * m_kernel_size + b];
                    n = n + 1;
                end
            end
            m_kernel_data_sim[(i * m_depth + j) * `KERNEL_3x3_COUNT_FULL + n] = 0;
        end
    end
endfunction: plain2bits


function void `cnl_scX_generator::post_randomize();
    int i;
    int j;
    int a;
    int b;
    shortreal tmp_num_output_rows_cfg;
    shortreal tmp_num_output_cols_cfg;
    shortreal tmp_m_num_input_cols;
    int tmp_pix_seq_data_full_count;
    
    
    m_num_output_rows = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_output_cols = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;     
    if(m_padding && !m_upsample) begin
        m_expd_num_input_rows = m_num_input_rows + 2;
        m_expd_num_input_cols = m_num_input_cols + 2;
    end else if(!m_padding && m_upsample) begin
    
    end else if(m_padding && m_upsample) begin
    
    end else begin // !m_padding && !m_upsample
        m_expd_num_input_rows = m_num_input_rows;
        m_expd_num_input_cols = m_num_input_cols;  
    end
    m_pfb_full_count                    = m_expd_num_input_cols;
    tmp_num_output_rows_cfg             = m_expd_num_input_rows;
    tmp_num_output_cols_cfg             = m_expd_num_input_cols;
    m_num_output_rows_cfg               = (m_stride == 1) ? m_expd_num_input_rows - 1 : (m_stride == 2) ? ($ceil(tmp_num_output_rows_cfg / 2) - 1) : 0;
    m_num_output_cols_cfg               = (m_stride == 1) ? m_expd_num_input_cols - 1 : (m_stride == 2) ? ($ceil(tmp_num_output_cols_cfg / 2) - 1) : 0;
    m_num_acl_output_rows               = (m_stride == 1) ? ((m_expd_num_input_rows - m_kernel_size) / m_stride) + 2 : (m_stride == 2) ? $ceil(tmp_num_output_rows_cfg / 2) - 1 : 0;
    m_num_acl_output_cols               = (m_stride == 1) ? m_expd_num_input_cols : (m_stride == 2) ? $ceil(tmp_num_output_cols_cfg / 2) : 0;
    tmp_m_num_input_cols                = m_expd_num_input_cols;
    tmp_pix_seq_data_full_count         = `WINDOW_3x3_NUM_CYCLES * $ceil(tmp_m_num_input_cols / 2);
    m_pix_seq_data_full_count_cfg       = (m_stride == 1) ? (`WINDOW_3x3_NUM_CYCLES * m_expd_num_input_cols) : (m_stride == 2) ? tmp_pix_seq_data_full_count : 0;
    m_num_input_rows_cfg                = m_num_input_rows - 1;
    m_num_input_cols_cfg                = m_num_input_cols - 1;
    m_expd_num_input_rows_cfg           = m_expd_num_input_rows - 1;
    m_expd_num_input_cols_cfg           = m_expd_num_input_cols - 1;      
    m_crpd_input_col_start_cfg          = 1;
    m_crpd_input_row_start_cfg          = 1;
    m_crpd_input_row_end_cfg            = m_expd_num_input_rows - 2;
    m_crpd_input_col_end_cfg            = m_expd_num_input_cols - 2;
    m_pfb_full_count_cfg                = m_pfb_full_count;
    

    m_pix_data = new[m_depth * m_num_input_rows * m_num_input_cols];
    foreach(m_pix_data[i]) begin
        m_pix_data[i] = $urandom_range(`MIN_RND_VALUE, `MAX_RND_VALUE);
    end
 

    m_kernel_data = new[m_num_kernels * m_depth * m_kernel_size * m_kernel_size]; 
    for(i = 0; i < m_num_kernels; i = i + 1) begin
        for(j = 0; j < m_depth; j = j + 1) begin
            for(a = 0; a < m_kernel_size; a = a + 1) begin
                for(b = 0; b < m_kernel_size; b = b + 1) begin
                    m_kernel_data[((i * m_depth + j) * m_kernel_size + a) * m_kernel_size + b] = $urandom_range(`MIN_RND_VALUE, `MAX_RND_VALUE);
                end
            end
        end
    end
    
 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    if(m_stride == 1) begin
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
        for(i = `WINDOW_3x3_NUM_CYCLES; i < (`MAX_NUM_INPUT_COLS * `WINDOW_3x3_NUM_CYCLES); i = i + `WINDOW_3x3_NUM_CYCLES) begin            
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
    end else if(m_stride == 2) begin
        // RM = Row matriculate
        // RST = Reset MACC reg
        // P = parity bit
        //                            RM   RST    P
        m_pix_seq_data_sim[0] = {3'b0, 1'b0, 1'b1, 1'b1, 10'd0  };
        m_pix_seq_data_sim[1] = {3'b0, 1'b0, 1'b0, 1'b0, 10'd2  };
        m_pix_seq_data_sim[2] = {3'b1, 1'b0, 1'b0, 1'b0, 10'd512};
        m_pix_seq_data_sim[3] = {3'b1, 1'b1, 1'b0, 1'b0, 10'd513};
        m_pix_seq_data_sim[4] = {3'b0, 1'b1, 1'b0, 1'b0, 10'd514};
    
        j = 0;
        for(i = `WINDOW_3x3_NUM_CYCLES; i < ((`MAX_NUM_INPUT_COLS / 2) * `WINDOW_3x3_NUM_CYCLES); i = i + `WINDOW_3x3_NUM_CYCLES) begin
            m_pix_seq_data_sim[i    ] = {3'b0, 1'b0, 1'b1, 1'b1, m_pix_seq_data_sim[i - 5][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            m_pix_seq_data_sim[i + 1] = {3'b0, 1'b0, 1'b0, 1'b0, m_pix_seq_data_sim[i - 4][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            m_pix_seq_data_sim[i + 2] = {3'b1, 1'b0, 1'b0, 1'b0, m_pix_seq_data_sim[i - 3][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            m_pix_seq_data_sim[i + 3] = {3'b1, 1'b1, 1'b0, 1'b0, m_pix_seq_data_sim[i - 2][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            m_pix_seq_data_sim[i + 4] = {3'b0, 1'b1, 1'b0, 1'b0, m_pix_seq_data_sim[i - 1][`PIX_SEQ_DATA_SEQ_FIELD] + 10'd2};
            j = (j + 1) % 2;
        end
        while(i < (`MAX_NUM_INPUT_COLS * `NUM_CE_PER_QUAD)) begin
            m_pix_seq_data_sim[i] = 0;
            i = i + 1;
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

endfunction: post_randomize


`endif