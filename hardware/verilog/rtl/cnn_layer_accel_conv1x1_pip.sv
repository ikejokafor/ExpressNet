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
// Description:             Responsible for multiplying pixels across the depth of a kernel, followed by accumulation across the depth
//                          Can be instantiated multiple times to handle multiply kernels at once
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
// Additional Comments:
//
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_conv1x1_pip #(
    parameter C_CONV1X1_PIP_DLY = 0
) (
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    rst                         ,
    clk_FAS                     ,
    clk_intf                    ,
    process_cmpl_FAS            ,
	process_cmpl_intf			,
    FAS_intf_rdy_n              ,
    FAS_rdy_n                   ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    opcode_cfg                  ,
    krnl1x1Depth_cfg            ,
    itN_num_1x1_kernels_cfg     ,
    conv1x1_it_pip_en           ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    conv1x1_pip_start0          ,
    conv1x1_pip_start1          ,
    conv1x1_pip_start2          ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    vec_add_pm_sum              ,
    vec_add_rm0_sum             ,
    vec_add_rm1_sum             ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    krnl1x1_bram_din            ,
    krnl1x1Bias_bram_din        ,
    krnl1x1_bram_wren           ,
    krnl1x1Bias_bram_wren       ,
    convMap_fifo_dout			,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------        
    conv1x1_out                 ,
    conv1x1_vld                 
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.svh"
    `include "utilities.svh"
    `include "cnn_layer_accel.svh"
    `include "cnn_layer_accel_FAS.svh"
    `include "cnn_layer_accel_FAS_pip_ctrl.svh"
    `include "cnn_layer_accel_conv1x1_pip.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    localparam C_KRNL_1X1_BRAM_WR_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_WR_DTH);   
    localparam C_KRNL_1X1_BRAM_RD_ADDR_WTH          = clog2(`KRNL_1X1_BRAM_RD_DTH);
    localparam C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_WR_DTH);   
    localparam C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH     = clog2(`KRNL_1X1_BIAS_BRAM_RD_DTH); 
    localparam C_VEC_ADD_WIDTH                      = `VECTOR_ADD_SIMD * `PIXEL_WIDTH;
    localparam C_VEC_MULT_WIDTH                     = `VECTOR_MULT_SIMD * `PIXEL_WIDTH;    
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                        rst                          ;
    input  logic                                        clk_FAS                      ;
    input  logic                                        clk_intf                     ;
    input  logic                                        process_cmpl_FAS             ;
	input  logic										process_cmpl_intf			 ;
    input  logic                                        FAS_intf_rdy_n               ;
    input  logic                                        FAS_rdy_n                    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic [                            17:0]     opcode_cfg                   ;
    input  logic [                            15:0]     krnl1x1Depth_cfg             ;
    input  logic [                            15:0]     itN_num_1x1_kernels_cfg      ;
    input  logic                                       	conv1x1_it_pip_en            ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    input  logic                                        conv1x1_pip_start0           ;
    input  logic                                        conv1x1_pip_start1           ;
    input  logic                                        conv1x1_pip_start2           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic [           C_VEC_ADD_WIDTH - 1:0]  	vec_add_pm_sum               ; 
    input  logic [           C_VEC_ADD_WIDTH - 1:0]  	vec_add_rm0_sum              ; 
    input  logic [           C_VEC_ADD_WIDTH - 1:0]  	vec_add_rm1_sum              ; 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    input  logic                                        krnl1x1_bram_wren            ;
    input  logic                                        krnl1x1Bias_bram_wren        ;
    input  logic [     `KRNL_1X1_BRAM_WR_WTH - 1:0]  	krnl1x1_bram_din             ;
    input  logic [`KRNL_1X1_BIAS_BRAM_WR_WTH - 1:0]  	krnl1x1Bias_bram_din         ;
	input  logic [      `CONVMAP_FIFO_RD_WTH - 1:0]		convMap_fifo_dout			 ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------        
    output logic [              `PIXEL_WIDTH - 1:0]  	conv1x1_out                  ;
    output logic                                        conv1x1_vld                  ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           	adder_tree_out_vld          ;
    logic                                           	adder_tree_din_vld          ;
    logic                                           	adder_tree_din_rdy          ;   
    logic [                     `PIXEL_WIDTH - 1:0]  	adder_tree_out              ;
    logic                                           	adder_tree_datain_valid     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic                                           	conv1x1_vld_r               ;             
    logic                                           	conv1x1_bias_vld_r          ;  
	logic												conv1x1_bias_vld_d			;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                           	conv1x1_pip_start0_d        ;
    logic                                           	conv1x1_pip_start1_d        ;
    logic                                           	conv1x1_pip_start2_d        ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                  C_VEC_ADD_WIDTH - 1:0]  	vec_add_pm_sum_d            ;
    logic [                  C_VEC_ADD_WIDTH - 1:0]  	vec_add_rm0_sum_d           ;
    logic [                  C_VEC_ADD_WIDTH - 1:0]  	vec_add_rm1_sum_d           ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic                                          		vec_mult_din_vld            ;
    logic                                          		vec_mult_din_vld0           ;
    logic                                          		vec_mult_din_vld1           ;
    logic                                          		vec_mult_din_vld2           ;
    logic [                 C_VEC_MULT_WIDTH - 1:0]  	vec_mult_din                ;
    logic                                           	vec_mult_dout_vld           ;
    logic [                 C_VEC_MULT_WIDTH - 1:0]		vec_mult_dout               ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------    
    logic [      C_KRNL_1X1_BRAM_WR_ADDR_WTH - 1:0]  	krnl1x1_bram_wrAddr         ;                    
    logic                                            	krnl1x1_bram_rden           ;                 
    logic [      C_KRNL_1X1_BRAM_RD_ADDR_WTH - 1:0]  	krnl1x1_bram_rdAddr         ;                 
    logic [            `KRNL_1X1_BRAM_RD_WTH - 1:0]  	krnl1x1_bram_dout           ;                 
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [ C_KRNL_1X1_BIAS_BRAM_WR_ADDR_WTH - 1:0]  	krnl1x1Bias_bram_wrAddr		;                   
    logic                                            	krnl1x1Bias_bram_rden       ;              
    logic [ C_KRNL_1X1_BIAS_BRAM_RD_ADDR_WTH - 1:0]  	krnl1x1Bias_bram_rdAddr     ;              
    logic [       `KRNL_1X1_BIAS_BRAM_RD_WTH - 1:0]  	krnl1x1Bias_bram_dout       ;
    logic [                     `PIXEL_WIDTH - 1:0]  	krnl1x1Bias_bram_dout_w     ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    logic [                                   15:0]		dpth_count                  ;
    logic [                                   15:0]		krnl_count                  ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + C_CONV1X1_PIP_DLY )
    )
    i0_SRL_bit (
        .clk        ( clk_FAS                   ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( conv1x1_pip_start0        ),
        .data_out   ( conv1x1_pip_start0_d      )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + `VEC_ADD_LATENCY + C_CONV1X1_PIP_DLY )
    )
    i1_SRL_bit (
        .clk        ( clk_FAS                   ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( conv1x1_pip_start1        ),
        .data_out   ( conv1x1_pip_start1_d        )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + (2 * `VEC_ADD_LATENCY) + C_CONV1X1_PIP_DLY )
    )
    i2_SRL_bit (
        .clk        ( clk_FAS                   ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( conv1x1_pip_start2        ),
        .data_out   ( conv1x1_pip_start2_d      )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY + `ADD_BIAS_LATENCY )
    )
    i3_SRL_bit (
        .clk        ( clk_FAS                   ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( conv1x1_bias_vld_r        ),
        .data_out   ( conv1x1_bias_vld_d        )
    );


    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
        .C_DATA_WIDTH    ( C_VEC_ADD_WIDTH     )
    ) 
    i0_SRL_bus (
        .clk        ( clk_FAS                           ),
        .ce         ( 1'b1                              ),
        .rst        ( rst                               ),
        .data_in    ( vec_add_pm_sum                    ),
        .data_out   ( vec_add_pm_sum_d                  )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
        .C_DATA_WIDTH    ( C_VEC_ADD_WIDTH     )
    ) 
    i1_SRL_bus (
        .clk        ( clk_FAS                               ),
        .ce         ( 1'b1                                  ),
        .rst        ( rst                                   ),
        .data_in    ( vec_add_rm0_sum                       ),
        .data_out   ( vec_add_rm0_sum_d                     )
    );
    
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( C_CONV1X1_PIP_DLY   ),
        .C_DATA_WIDTH    ( C_VEC_ADD_WIDTH     )
    ) 
    i2_SRL_bus (
        .clk        ( clk_FAS                               ),
        .ce         ( 1'b1                                  ),
        .rst        ( rst                                   ),
        .data_in    ( vec_add_rm1_sum                       ),
        .data_out   ( vec_add_rm1_sum_d                     )
    );


    krnl1x1_bram
    i_krnl1x1_bram (
        .clka   ( clk_intf                                      ),
        .ena    (                                               ),
        .wea    ( krnl1x1_bram_wren                             ),
        .addra  ( krnl1x1_bram_wrAddr                           ),
        .dina   ( krnl1x1_bram_din                              ),
        .clkb   ( clk_FAS                                       ),
        .enb    ( krnl1x1_bram_rden                             ),
        .addrb  ( krnl1x1_bram_rdAddr                           ),
        .doutb  ( krnl1x1_bram_dout                             ) 
    );


    krnl1x1Bias_bram
    i_krnl1x1Bias_bram (
        .clka   ( clk_FAS                                       ),
        .ena    (                                               ),
        .wea    ( krnl1x1Bias_bram_wren                         ),
        .addra  ( krnl1x1Bias_bram_wrAddr                       ),
        .dina   ( krnl1x1Bias_bram_din                          ),
        .clkb   ( clk_FAS                                       ),
        .enb    ( krnl1x1Bias_bram_rden                         ),
        .addrb  ( krnl1x1Bias_bram_rdAddr                       ),
        .doutb  ( krnl1x1Bias_bram_dout                         )
    );


    vector_multiply
    #(
        .C_OP_WIDTH      ( `PIXEL_WIDTH          ),
        .C_NUM_OPERANDS  ( `VECTOR_MULT_SIMD * 2 )
    )
    i0_vector_multiply (
        .clk                ( clk_FAS                                   ),
        .rst                ( rst                                       ),
        .datain             ( {vec_mult_din, krnl1x1_bram_dout}         ),
        .datain_ready       (                                           ),
        .datain_valid       ( vec_mult_din_vld                          ),
        .dout               ( vec_mult_dout                             ),
        .dout_ready         ( 1'b1                                      ),
        .dout_valid         ( vec_mult_dout_vld                         )
    );


    adder_tree #(
        .C_NUM_INPUTS       ( `KRNL_1X1_DEPTH_SIMD     ),
        .C_INPUT_WIDTH      ( `PIXEL_WIDTH             ),
        .C_OUTPUT_WIDTH     ( `PIXEL_WIDTH             )
    )
    i0_adder_tree (
        .clk                ( clk_FAS                   ),
        .rst                (                           ),
        .datain_ready       ( adder_tree_din_rdy        ),
        .datain_valid       ( adder_tree_din_vld        ),
        .datain             ( vec_mult_dout             ),
        .dataout_ready      ( 1'b1                      ),
        .dataout_valid      ( adder_tree_out_vld        ),
        .dataout            ( adder_tree_out            )
    );


    // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_intf) begin
        if(rst || FAS_intf_rdy_n || process_cmpl_intf) begin
            krnl1x1_bram_wrAddr    <= 0;
        end else begin
            if(krnl1x1_bram_wren) begin
                krnl1x1_bram_wrAddr <= krnl1x1_bram_wrAddr + 1;
            end
        end
    end
    // END logic ---------------------------------------------------------------------------------------------------------------------------- 
    

    // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
    assign vec_mult_din_vld = vec_mult_din_vld0 || vec_mult_din_vld1 || vec_mult_din_vld2;
    
    always@(posedge clk_FAS) begin
        // - - - - - - - - - - - - - -
        if(conv1x1_pip_start0_d && (opcode_cfg[`OPCODE_2_FIELD]
            || opcode_cfg[`OPCODE_3_FIELD]
            || opcode_cfg[`OPCODE_12_FIELD]
            || opcode_cfg[`OPCODE_13_FIELD]
            || opcode_cfg[`OPCODE_14_FIELD]))
        begin
            vec_mult_din_vld0 = 1;
        end else begin
            vec_mult_din_vld0 = 0;
        end
        // - - - - - - - - - - - - - -
        if(conv1x1_pip_start1_d&& opcode_cfg[`OPCODE_0_FIELD]
            || opcode_cfg[`OPCODE_1_FIELD]
            || opcode_cfg[`OPCODE_6_FIELD]
            || opcode_cfg[`OPCODE_7_FIELD]
            || opcode_cfg[`OPCODE_10_FIELD]
            || opcode_cfg[`OPCODE_11_FIELD])
        begin
            vec_mult_din_vld1 = 1;
        end else begin
            vec_mult_din_vld1 = 0;
        end
        // - - - - - - - - - - - - - -
        if(conv1x1_pip_start2_d && opcode_cfg[`OPCODE_4_FIELD]
            || opcode_cfg[`OPCODE_5_FIELD])
        begin
            vec_mult_din_vld2 = 1;
        end else begin
            vec_mult_din_vld2 = 0;
        end
        // - - - - - - - - - - - - - -
    end 
    
    always@(*) begin
        if(opcode_cfg[`OPCODE_0_FIELD]
            || opcode_cfg[`OPCODE_1_FIELD]    
            || opcode_cfg[`OPCODE_10_FIELD]
            || opcode_cfg[`OPCODE_11_FIELD])
        begin
            vec_mult_din = vec_add_pm_sum_d;
        end else if(opcode_cfg[`OPCODE_6_FIELD]
            || opcode_cfg[`OPCODE_7_FIELD])
        begin
            vec_mult_din = vec_add_rm0_sum_d;
        end else if(opcode_cfg[`OPCODE_4_FIELD]
                    || opcode_cfg[`OPCODE_5_FIELD])
        begin
            vec_mult_din = vec_add_rm1_sum_d;
        end else if(opcode_cfg[`OPCODE_2_FIELD]
                    || opcode_cfg[`OPCODE_3_FIELD]
                    || opcode_cfg[`OPCODE_12_FIELD]
                    || opcode_cfg[`OPCODE_13_FIELD]
                    || opcode_cfg[`OPCODE_14_FIELD])
        begin
            vec_mult_din = convMap_fifo_dout;
        end
    end
    // END logic ----------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            krnl1x1_bram_rden <= 0;
        end else begin
            krnl1x1_bram_rden <=    (conv1x1_it_pip_en && 
                                           (conv1x1_pip_start0_d
                                           || conv1x1_pip_start1_d
                                           || conv1x1_pip_start2_d)) ? 1
                                        : 0;
        end
    end

    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n || process_cmpl_FAS) begin
            krnl1x1_bram_rdAddr <= 0;
        end else begin
            krnl1x1_bram_rden <= 0;
            if(krnl1x1_bram_rden && conv1x1_it_pip_en) begin
                krnl1x1_bram_rdAddr <= 0;
            end else if(krnl1x1_bram_rden) begin
                krnl1x1_bram_rdAddr <= krnl1x1_bram_rdAddr+ 1;
            end
        end
    end
    // END logic ----------------------------------------------------------------------------------------------------------------------------
  
    
    // BEGIN logic --------------------------------------------------------------------------------------------------------------------------            
    assign adder_tree_din_vld = adder_tree_din_rdy && vec_mult_dout_vld;
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            dpth_count              <= 0;
            krnl_count              <= 0;
            adder_tree_datain_valid <= 0;
        end else begin
            adder_tree_datain_valid <= 0;
            if(krnl1x1_bram_rden) begin
                adder_tree_datain_valid     <= 1;
                if(dpth_count == (krnl1x1Depth_cfg - `KRNL_1X1_BRAM_RD_WTH)) begin
                    dpth_count         <= 0;
                    if(krnl_count == itN_num_1x1_kernels_cfg) begin
                        krnl_count     <= 0;
                    end else begin
                        krnl_count <= krnl_count + 1;
                    end
                end else begin
                    dpth_count <= dpth_count + `KRNL_1X1_BRAM_RD_WTH;
                end
            end
        end
    end
    // END logic ----------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic --------------------------------------------------------------------------------------------------------------------------
    assign krnl1x1Bias_bram_dout_w     = krnl1x1Bias_bram_dout[`PIXEL_WIDTH - 1:0];
    assign conv1x1_vld                 = conv1x1_vld_r || conv1x1_bias_vld_d;
	
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            conv1x1_vld_r             <= 0;
            conv1x1_bias_vld_r        <= 0;
            krnl1x1Bias_bram_rden   <= 0;
        end else begin
            conv1x1_vld_r          <= 0;
            conv1x1_bias_vld_r     <= 0;
            if(adder_tree_out_vld && !opcode_cfg[`OPCODE_0_FIELD]
                && !opcode_cfg[`OPCODE_2_FIELD] && !opcode_cfg[`OPCODE_4_FIELD]
                && !opcode_cfg[`OPCODE_6_FIELD] && !opcode_cfg[`OPCODE_10_FIELD]
                && !opcode_cfg[`OPCODE_12_FIELD] && !opcode_cfg[`OPCODE_14_FIELD])
            begin
                conv1x1_vld_r     <= 1;
                conv1x1_out       <= adder_tree_out;
            end else if (adder_tree_out_vld) begin
                krnl1x1Bias_bram_rden   <= 1;
                conv1x1_bias_vld_r      <= 1;
                conv1x1_out             <= adder_tree_out + krnl1x1Bias_bram_dout_w;
            end
        end
    end
    
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            krnl1x1Bias_bram_rdAddr <= 0;
        end else begin
            if(krnl1x1Bias_bram_rden && krnl_count == itN_num_1x1_kernels_cfg) begin
                krnl1x1Bias_bram_rdAddr <= 0;
            end else if(krnl1x1Bias_bram_rden) begin
                krnl1x1Bias_bram_rdAddr <= krnl1x1Bias_bram_rdAddr + 1;
            end
        end
    end            
    // END logic ----------------------------------------------------------------------------------------------------------------------------


endmodule