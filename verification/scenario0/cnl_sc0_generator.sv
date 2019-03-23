`ifndef	__CNL_SC0_GENERATOR__
`define	__CNL_SC0_GENERATOR__


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


class sc0_genParams_t extends genParams_t;
endclass: sc0_genParams_t


class sc0_crtTestParams_t extends crtTestParams_t;
    int num_input_rows;
    int num_input_cols;
    int depth;
    int num_kernels;
    int kernel_size;
    int stride;
    int padding;
endclass: sc0_crtTestParams_t


class cnl_sc0_generator extends generator;
    extern function new(genParams_t genParams = null);
    extern function void createTest(crtTestParams_t params);
    extern function void plain2bits();
    extern function void post_randomize();
    

    rand int m_num_input_rows                                                           ;
    rand int m_num_input_cols                                                           ;
    int      m_num_output_rows_cfg                                                      ;
    int      m_num_output_cols_cfg                                                      ;
    int      m_num_output_rows                                                          ;
    int      m_num_output_cols                                                          ;    
    int      m_num_sim_output_rows                                                      ;
    int      m_num_sim_output_cols                                                      ;    
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
        m_stride == 2;
        m_padding == 0;
    }
endclass: cnl_sc0_generator


function cnl_sc0_generator::new(genParams_t genParams = null);
endfunction: new


function void cnl_sc0_generator::createTest(crtTestParams_t params);
    sc0_crtTestParams_t sc0_crtTestParams;
    int i;
    int j;
    int k;
    int a;
    int b;
    shortreal tmp_num_output_rows_cfg;
    shortreal tmp_num_output_cols_cfg;
    
    
    $cast(sc0_crtTestParams, params);
    m_num_input_rows = sc0_crtTestParams.num_input_rows;
    m_num_input_cols = sc0_crtTestParams.num_input_cols;
    m_depth = sc0_crtTestParams.depth;
    m_num_kernels = sc0_crtTestParams.num_kernels;
    m_kernel_size = sc0_crtTestParams.kernel_size;
    m_stride = sc0_crtTestParams.stride;
    m_padding = sc0_crtTestParams.padding;
 

    tmp_num_output_rows_cfg   = m_num_input_rows;
    tmp_num_output_cols_cfg   = m_num_input_cols;
    m_num_output_rows_cfg     = (m_stride == 1) ? m_num_input_rows - 1 : (m_stride == 2) ? ($ceil(tmp_num_output_rows_cfg / 2) - 1) : 0;
    m_num_output_cols_cfg     = (m_stride == 1) ? m_num_input_cols - 1 : (m_stride == 2) ? ($ceil(tmp_num_output_cols_cfg / 2) - 1) : 0;
    m_num_output_rows         = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_output_cols         = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_sim_output_rows     = (m_stride == 1) ? ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 2 : (m_stride == 2) ? $ceil(tmp_num_output_rows_cfg / 2) - 1 : 0;
    m_num_sim_output_cols     = (m_stride == 1) ? m_num_input_cols : (m_stride == 2) ? $ceil(tmp_num_output_cols_cfg / 2) : 0;
    
    
    m_pix_data = new[m_depth * m_num_input_rows * m_num_input_cols];
    for(k = 0; k < m_depth; k = k + 1) begin
        for(i = 0; i < m_num_input_rows; i = i + 1) begin
            for(j = 0; j < m_num_input_cols; j = j + 1) begin
                m_pix_data[(k * m_num_input_rows + i) * m_num_input_cols + j] = $urandom_range(1, 50);
            end
        end
    end

    
    m_kernel_data = new[m_num_kernels * m_depth * m_kernel_size * m_kernel_size]; 
    for(i = 0; i < m_num_kernels; i = i + 1) begin
        for(j = 0; j < m_depth; j = j + 1) begin
            for(a = 0; a < m_kernel_size; a = a + 1) begin
                for(b = 0; b < m_kernel_size; b = b + 1) begin
                    m_kernel_data[((i * m_depth + j) * m_kernel_size + a) * m_kernel_size + b] = $urandom_range(1, 50);
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
        // RR = row rename flag
        //
        //                        RR    RM    RST   P     SEQ
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
        // SEQ = sequence value
        // RR = row rename flag
        //
        //                         RR   RM   RST    P     SEQ
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
   
    
    $display("// Created Specific Test --------------------------------------");
    $display("// Num Rows:            %0d", m_num_input_rows                  );
    $display("// Num Cols:            %0d", m_num_input_cols                  );
    $display("// Num Depth:           %0d", m_depth                           );
    $display("// Num kernels:         %0d", m_num_kernels                     );
    $display("// Num Kernel size:     %0d", m_kernel_size                     );
    $display("// Stride               %0d", m_stride                          );
    $display("// Padding:             %0d", m_padding                         );
    $display("// Created Specific Test --------------------------------------");
    $display("\n");
endfunction: createTest


function void cnl_sc0_generator::plain2bits();
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


function void cnl_sc0_generator::post_randomize();
    int i;
    int j;
    int a;
    int b;
    shortreal tmp_num_output_rows_cfg;
    shortreal tmp_num_output_cols_cfg;    
    
    
    tmp_num_output_rows_cfg   = m_num_input_rows;
    tmp_num_output_cols_cfg   = m_num_input_cols;
    m_num_output_rows_cfg     = (m_stride == 1) ? m_num_input_rows : (m_stride == 2) ? ($ceil(tmp_num_output_rows_cfg / 2) - 1) : 0;
    m_num_output_cols_cfg     = (m_stride == 1) ? m_num_input_cols : (m_stride == 2) ? ($ceil(tmp_num_output_cols_cfg / 2) - 1) : 0;
    m_num_output_rows         = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_output_cols         = ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 1;
    m_num_sim_output_rows     = (m_stride == 1) ? ((m_num_input_rows - m_kernel_size + (2 * m_padding)) / m_stride) + 2 : (m_stride == 2) ? ($ceil(tmp_num_output_rows_cfg / 2) - 1) : 0;
    m_num_sim_output_cols     = (m_stride == 1) ? m_num_input_cols : (m_stride == 2) ? ($ceil(tmp_num_output_cols_cfg / 2) - 1) : 0;             


    m_pix_data = new[m_depth * m_num_input_rows * m_num_input_cols];
    foreach(m_pix_data[i]) begin
        m_pix_data[i] = $urandom_range(1, 50);
    end
 

    m_kernel_data = new[m_num_kernels * m_depth * m_kernel_size * m_kernel_size]; 
    for(i = 0; i < m_num_kernels; i = i + 1) begin
        for(j = 0; j < m_depth; j = j + 1) begin
            for(a = 0; a < m_kernel_size; a = a + 1) begin
                for(b = 0; b < m_kernel_size; b = b + 1) begin
                    m_kernel_data[((i * m_depth + j) * m_kernel_size + a) * m_kernel_size + b] = $urandom_range(1, 50);
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