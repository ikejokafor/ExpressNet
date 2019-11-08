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


class `scX_testParams_t extends testParams_t;
    int num_input_rows;
    int num_input_cols;
    int depth;
    int num_kernels;
    int stride;
    int padding;
    int kernel_size;
    int conv_out_fmt;
    int cascade;
    bool upsample;
endclass: `scX_testParams_t


class `cnl_scX_generator extends generator;
    extern function new(genParams_t genParams = null)                                   ;
    extern function void createTest(testParams_t params)                                ;
    extern function void plain2bits()                                                   ;
    extern function void post_randomize()                                               ;
    extern function void setSlvReg()                                                    ;
    extern function void setKrnData()                                                   ;
    extern function void setSlvAddr()                                                   ;
    extern function void setPixSeqStr1()                                                ;
    extern function void setPixSeqStr2()                                                ;    
    rand int m_num_input_rows                                                           ;
    rand int m_num_input_cols                                                           ;
    int      m_num_acl_output_rows                                                      ;
    int      m_num_acl_output_cols                                                      ;
    rand int m_depth                                                                    ;
    rand int m_kernel_size                                                              ;
    int m_uple_fctr                                                                     ;
    int m_pfb_full_count                                                                ;
    rand int m_stride    		                                                        ;
    int m_conv_out_fmt                                                                  ;
    rand int m_padding                                                                  ;
    int m_num_output_cols                                                               ;
    int m_num_output_rows                                                               ;
    int m_pix_seq_data_full_count                                                       ;
    bool m_upsample                                                                     ;
    int m_num_expd_input_cols                                                           ;
    int m_num_expd_input_rows                                                           ;
    int m_crpd_input_col_start                                                          ;
    int m_crpd_input_row_start                                                          ;
    int m_crpd_input_col_end                                                            ;
    int m_crpd_input_row_end                                                            ;
    rand int m_num_kernels                                                              ;
    int m_master_quad                                                                   ;
    int m_cascade                                                                       ;
    int m_actv                                                                          ;
    int m_pfb_full_count_cfg                                                            ;
    int m_stride_cfg    		                                                        ;
    int m_conv_out_fmt_cfg                                                              ;
    int m_padding_cfg                                                                   ;
    int m_num_output_cols_cfg                                                           ;
    int m_num_output_rows_cfg                                                           ;
    int m_pix_seq_data_full_count_cfg                                                   ;
    int m_upsample_cfg                                                                  ;
    int m_num_expd_input_cols_cfg                                                       ;
    int m_num_expd_input_rows_cfg                                                       ;
    int m_crpd_input_col_start_cfg                                                      ;
    int m_crpd_input_row_start_cfg                                                      ;
    int m_crpd_input_col_end_cfg                                                        ;
    int m_crpd_input_row_end_cfg                                                        ;
    int m_num_kernels_cfg                                                               ;
    int m_master_quad_cfg                                                               ;
    int m_cascade_cfg                                                                   ;
    int m_actv_cfg                                                                      ;
    int slv_addr[]                                                                      ;
    logic [15:0] m_pix_seq_data_sim[0:(`PIX_SEQ_BRAM_DEPTH - 1)]                        ;
    int m_kernel_data[]                                                                 ;
    logic [15:0] m_kernel_data_sim[]                                                    ;
    logic [15:0] slv_addr_sim[]                                                         ;
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


function void `cnl_scX_generator::createTest(testParams_t params);
    `scX_testParams_t `scX_testParams;
    $cast(`scX_testParams, params);
    m_num_input_rows = `scX_testParams.num_input_rows;
    m_num_input_cols = `scX_testParams.num_input_cols;
    m_depth = `scX_testParams.depth;
    m_num_kernels = `scX_testParams.num_kernels;
    m_kernel_size = `scX_testParams.kernel_size;
    m_conv_out_fmt = `scX_testParams.conv_out_fmt;
    m_stride = `scX_testParams.stride;
    m_padding = `scX_testParams.padding;
    m_upsample = `scX_testParams.upsample;
    m_master_quad = 1;
    m_cascade = 0;
    m_actv = 0;
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
    $display("// Conv Output Format:    %0d", m_conv_out_fmt                    );
    $display("// Created Specific Test ----------------------------------------");
    $display("\n");
endfunction: createTest


function void `cnl_scX_generator::plain2bits();
    int i;
    int j;
    int a;
    int b;
    int n;
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
    slv_addr_sim = new[slv_addr.size()];
    for(i = 0; i < slv_addr.size(); i = i + 4) begin
        slv_addr_sim[i] = slv_addr[i];
    end
endfunction: plain2bits


function void `cnl_scX_generator::post_randomize();
    int i;
    int j;
    setSlvReg();
    setKrnData();
    setSlvAddr();
    if(m_stride == 1) begin
        setPixSeqStr1();
    end else if(m_stride == 2) begin
        setPixSeqStr2();
    end
endfunction: post_randomize


function void `cnl_scX_generator::setSlvReg();
    shortreal fl_num_expd_input_rows;
    shortreal fl_num_expd_input_cols;
    shortreal fl_num_input_cols;
    int fl_pix_seq_data_full_count;
    m_num_kernels_cfg = m_num_kernels - 1;
    m_num_output_rows = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_output_cols = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;     
    if(m_padding && !m_upsample) begin
        m_num_expd_input_rows = m_num_input_rows + 2;
        m_num_expd_input_cols = m_num_input_cols + 2;       
    end else if(!m_padding && m_upsample) begin
        m_num_expd_input_rows = m_num_input_rows * 2;
        m_num_expd_input_cols = m_num_input_cols * 2; 
        m_num_output_rows = ((m_num_expd_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_output_cols = ((m_num_expd_input_cols - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    end else if(m_padding && m_upsample) begin
        m_num_expd_input_rows = (m_num_input_rows * 2) + 2;
        m_num_expd_input_cols = (m_num_input_cols * 2) + 2;
        m_num_output_rows = (((m_num_expd_input_rows - 2) - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_output_cols = (((m_num_expd_input_cols - 2) - m_kernel_size + (2 * m_padding)) / m_stride) + 1;        
    end else begin // !m_padding && !m_upsample
        m_num_expd_input_rows = m_num_input_rows;
        m_num_expd_input_cols = m_num_input_cols;      
    end 
    m_num_expd_input_rows_cfg           = m_num_expd_input_rows - 1;
    m_num_expd_input_cols_cfg           = m_num_expd_input_cols - 1;      
    m_crpd_input_col_start_cfg          = 1;
    m_crpd_input_row_start_cfg          = 1;
    m_crpd_input_row_end_cfg            = m_num_expd_input_rows - 2;
    m_crpd_input_col_end_cfg            = m_num_expd_input_cols - 2;
    m_pfb_full_count_cfg                = m_num_expd_input_cols;
    if(m_padding && m_stride == 2) begin    
        fl_num_expd_input_rows          = m_num_expd_input_rows;
        fl_num_expd_input_cols          = m_num_expd_input_cols;
        m_num_acl_output_rows           = $ceil(fl_num_expd_input_rows / shortreal'(2)) - 1;
        m_num_acl_output_cols           = $ceil(fl_num_expd_input_cols / shortreal'(2));
        m_num_output_rows_cfg           = $ceil(fl_num_expd_input_rows / shortreal'(2)) - 1;
        m_num_output_cols_cfg           = $ceil(fl_num_expd_input_cols / shortreal'(2));
        m_pix_seq_data_full_count_cfg   = `WINDOW_3x3_NUM_CYCLES * $ceil(fl_num_expd_input_cols / shortreal'(2));
    end else if(!m_padding && m_stride == 2) begin
        fl_num_expd_input_rows          = m_num_expd_input_rows;
        fl_num_expd_input_cols          = m_num_expd_input_cols;
        m_num_acl_output_rows           = $ceil(fl_num_expd_input_rows / shortreal'(2)) - 1;
        m_num_acl_output_cols           = $ceil(fl_num_expd_input_cols / shortreal'(2));
        m_num_output_rows_cfg           = $ceil(fl_num_expd_input_rows / shortreal'(2)) - 1;
        m_num_output_cols_cfg           = $ceil(fl_num_expd_input_cols / shortreal'(2));
        m_pix_seq_data_full_count_cfg   = `WINDOW_3x3_NUM_CYCLES * $ceil(fl_num_expd_input_cols / shortreal'(2)); 
    end else if(m_padding && m_stride == 1) begin
        m_num_acl_output_rows           = (((m_num_expd_input_rows - 2) - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_acl_output_cols           = m_num_expd_input_cols;
        m_num_output_rows_cfg           = (((m_num_expd_input_rows - 2) - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_output_cols_cfg           = m_num_expd_input_cols;
        m_pix_seq_data_full_count_cfg   = `WINDOW_3x3_NUM_CYCLES * m_num_expd_input_cols;
    end else begin // (!m_padding && m_stride == 1)
        m_num_acl_output_rows           = ((m_num_expd_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_acl_output_cols           = m_num_expd_input_cols;
        m_num_output_rows_cfg           = ((m_num_expd_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
        m_num_output_cols_cfg           = m_num_expd_input_cols;
        m_pix_seq_data_full_count_cfg   = `WINDOW_3x3_NUM_CYCLES * m_num_expd_input_cols;
    end
    m_conv_out_fmt_cfg                  = m_conv_out_fmt        ;
    m_padding_cfg                       = m_padding             ;
    m_stride_cfg                        = m_stride              ; 
    m_upsample_cfg                      = m_upsample            ;  
    m_master_quad_cfg                   = m_master_quad         ;
    m_cascade_cfg                       = m_cascade             ;
    m_actv_cfg                          = m_actv                ;
endfunction: setSlvReg


function void `cnl_scX_generator::setKrnData();
    int i;
    int j;
    int k;
    int a;
    int b;
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
endfunction: setKrnData


function void `cnl_scX_generator::setSlvAddr();
    int i;
    int numAddress;
    numAddress = `SLV_SPCE_CFG_REG_HIGH >> 2;
    slv_addr = new[numAddress];
    for(i = 0; i <= `SLV_SPCE_CFG_REG_HIGH; i = i + 4) begin
        slv_addr[i] = i;
    end
endfunction: setSlvAddr


function void `cnl_scX_generator::setPixSeqStr1();
    int i;
    int j;
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
endfunction: setPixSeqStr1


function void `cnl_scX_generator::setPixSeqStr2();
    int i;
    int j;
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
endfunction: setPixSeqStr2

`endif