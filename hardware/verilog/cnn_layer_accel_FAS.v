`ifndef __CNN_LAYER_ACCEL_FAS__
`define __CNN_LAYER_ACCEL_FAS__


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
// Additional Comments:
//
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_FAS #(
    parameter C_FAS_ID = 0
) (
    clk
    rst
    krnl1x1Addr_cfg
    krnl1x1BiasAddr_cfg
    pixelSeqAddr_cfg
    partMapAddr_cfg
    resMapAddr_cfg
    outMapAddr_cfg
    pixSeqCfgFetchTotal_cfg
    inMapFetchFactor_cfg
    inMapFetchTotal_cfg
    krnl3x3FetchTotal_cfg
    krnl3x3BiasFetchTotal_cfg
    krnl1x1FetchTotal_cfg
    krnl1x1BiasFetchTotal_cfg
    partMapFetchTotal_cfg
    resMapFetchTotal_cfg
    outMapStoreTotal_cfg
    outMapStoreFactor_cfg
    first_depth_iter_cfg
    do_res_layer_cfg
    do_kernels1x1_cfg
    num_1x1_kernels_cfg
    co_high_watermark_cfg
    rm_low_watermark_cfg
    pm_low_watermark_cfg
    krnl1x1_pding_cfg
    krnl1x1_pad_bgn_cfg
    krnl1x1_pad_end_cfg
    AWP_complete
    start_FAS
    cfg_AWP_done
    start_AWP_done
    last_CO_recvd
    FAS_complete_ack
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
    `include "cnn_layer_accel_defs.vh"



    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE              = 6'b000001;
    localparam ST_CFG_AWP           = 6'b000010;
    localparam ST_START_AWP         = 6'b000100;    
    localparam ST_ACTIVE            = 6'b001000;
    localparam ST_WAIT_LAST_WRITE   = 6'b010000;
    localparam ST_SEND_COMPLETE     = 6'b100000;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input logic                          clk
    input logic                          rst
    input logic [                  63:0] krnl1x1Addr
    input logic [                  63:0] krnl1x1BiasAddr
    input logic [                  63:0] pixelSeqAddr
    input logic [                  63:0] partMapAddr
    input logic [                  63:0] resMapAddr
    input logic [                  63:0] outMapAddr
    input logic [                  31:0] pixSeqCfgFetchTotal
    input logic [                  31:0] inMapFetchFactor
    input logic [                  31:0] inMapFetchTotal
    input logic [                  31:0] krnl3x3FetchTotal
    input logic [                  31:0] krnl3x3BiasFetchTotal
    input logic [                  31:0] krnl1x1FetchTotal
    input logic [                  31:0] krnl1x1BiasFetchTotal
    input logic [                  31:0] partMapFetchTotal
    input logic [                  31:0] resMapFetchTotal
    input logic [                  31:0] outMapStoreTotal
    input logic [                  31:0] outMapStoreFactor
    input logic                          first_depth_iter
    input logic                          do_res_layer
    input logic                          do_kernels1x1
    input logic [                   9:0] num_1x1_kernels
    input logic [                  31:0] co_high_watermark
    input logic [                  31:0] rm_low_watermark
    input logic [                  31:0] pm_low_watermark
    input logic                          krnl1x1_pding
    input logic [                   9:0] krnl1x1_pad_bgn
    input logic [                   9:0] krnl1x1_pad_end
    input logic [`MAX_AWP_PER_FAS - 1:0] AWP_complete
    input logic                          start_FAS
    input logic                          cfg_AWP_done
    input logic                          start_AWP_done
    input logic                          last_CO_recvd
    input logic                          FAS_complete_ack


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic   [ 5:0]  state
    logic   [63:0]  krnl1x1Addr_cfg
    logic   [63:0]  krnl1x1BiasAddr_cfg
    logic   [63:0]  pixelSeqAddr_cfg
    logic   [63:0]  partMapAddr_cfg
    logic   [63:0]  resMapAddr_cfg
    logic   [63:0]  outMapAddr_cfg
    logic   [31:0]  pixSeqCfgFetchTotal_cfg
    logic   [31:0]  inMapFetchFactor_cfg
    logic   [31:0]  inMapFetchTotal_cfg
    logic   [31:0]  krnl3x3FetchTotal_cfg
    logic   [31:0]  krnl3x3BiasFetchTotal_cfg
    logic   [31:0]  krnl1x1FetchTotal_cfg
    logic   [31:0]  krnl1x1BiasFetchTotal_cfg
    logic   [31:0]  partMapFetchTotal_cfg
    logic   [31:0]  resMapFetchTotal_cfg
    logic   [31:0]  outMapStoreTotal_cfg
    logic   [31:0]  outMapStoreFactor_cfg
    logic           first_depth_iter_cfg
    logic           do_res_layer_cfg
    logic           do_kernels1x1_cfg
    logic   [ 9:0]  num_1x1_kernels_cfg
    logic   [31:0]  co_high_watermark_cfg
    logic   [31:0]  rm_low_watermark_cfg
    logic   [31:0]  pm_low_watermark_cfg
    logic           krnl1x1_pding_cfg
    logic   [ 9:0]  krnl1x1_pad_bgn_cfg
    logic   [ 9:0]  krnl1x1_pad_end_cfg

    logic [`MAX_AWP_PER_FAS - 1:0] all_AWP_complete

    logic send_FAS_complete
    logic FAS_complete_ack
    logic FAS_complete_acked


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( ), 
        .C_RAM_WR_DEPTH        ( ), 
        .C_RAM_RD_WIDTH        ( ), 
        .C_RD_PORT_HIGH_PERF   ( ), 
    )
    convMapIn_bram (
        wr_clk      ( clk ),
        wrAddr      (),
        wren        (),
        din         (),
        rd_clk      ( clk ),
        rdAddr      (),
        rden        (),
        rd_mode     (),
        fifo_fwft   (),
        dout        ()
    );


    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH       ( ),
        .C_RAM_DEPTH       ( ),
        .C_RAM_PERF        ( ),
    )
    krnl1x1_bram
    (
        .wrAddr      (),
        .rdAddr      (),
        .datain      (),
        .clk         ( clk ),
        .wren        (),
        .rden        (),
        .fifo_fwft   ( 1 ),
        .dataout     ()
    );


    xilinx_simple_dual_port_no_change_ram #(
        .C_RAM_WIDTH       ( ),
        .C_RAM_DEPTH       ( ),
        .C_RAM_PERF        ( ),
    )
    krnl1x1Bias_bram
    (
        .wrAddr      (),
        .rdAddr      (),
        .datain      (),
        .clk         ( clk ),
        .wren        (),
        .rden        (),
        .fifo_fwft   ( 1 ),
        .dataout     ()
    );


    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH               ( ),
        .C_FIFO_DEPTH               ( ),
        .C_PROG_FULL_THRESHOLD      ( ),
    )
    residualMap_fifo
    (
        .clk            (),
        .rst            (),
        .wren           (),
        .rden           (),
        .datain         (),
        .dataout        (),
        .empty          (),
        .full           (),
        .prog_full      (),
        .count          ()
    );


    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH               ( ),
        .C_FIFO_DEPTH               ( ),
        .C_PROG_FULL_THRESHOLD      ( ),
    )
    partialMap_fifo
    (
        .clk            (),
        .rst            (),
        .wren           (),
        .rden           (),
        .datain         (),
        .dataout        (),
        .empty          (),
        .full           (),
        .prog_full      (),
        .count          ()
    );


    fifo_fwft_prog_full_count #(
        C_DATA_WIDTH                ( ),
        C_FIFO_DEPTH                ( ),
        C_PROG_FULL_THRESHOLD       ( ),
    )
    outputBuffer_fifo
    (
        .clk            (),
        .rst            (),
        .wren           (),
        .rden           (),
        .datain         (),
        .dataout        (),
        .empty          (),
        .full           (),
        .prog_full      (),
        .count          ()
    );


    adder_tree #(
        .C_NUINPUTS         ( ),
        .C_INPUT_WIDTH      ( ),
        .C_OUTPUT_WIDTH     ( )
    )
    i0_adder_tree
    (
        .clk                (),
        .rst                (),
        .datain_ready       (),
        .datain_valid       (),
        .datain             (),
        .dataout_ready      (),
        .dataout_valid      (),
        .dataout            ()
    );


    SRL_bit #(
        .C_CLOCK_CYCLES (  )
    )
    i0_SRL_bit (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    (                       ),
        .data_out   (                       )
    );
    
    
    SRL_bus #(
        .C_CLOCK_CYCLES ( ),
        .C_DATA_WIDTH   ( )
    ) 
    i0_SRL_bus (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    (                       ),
        .data_out   (                       )
    );


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            krnl1x1Addr_cfg             <= 0;
            krnl1x1BiasAddr_cfg         <= 0;
            pixelSeqAddr_cfg            <= 0;
            partMapAddr_cfg             <= 0;
            resMapAddr_cfg              <= 0;
            outMapAddr_cfg              <= 0;
            pixSeqCfgFetchTotal_cfg     <= 0;
            inMapFetchFactor_cfg        <= 0;
            inMapFetchTotal_cfg         <= 0;
            krnl3x3FetchTotal_cfg       <= 0;
            krnl3x3BiasFetchTotal_cfg   <= 0;
            krnl1x1FetchTotal_cfg       <= 0;
            krnl1x1BiasFetchTotal_cfg   <= 0;
            partMapFetchTotal_cfg       <= 0;
            resMapFetchTotal_cfg        <= 0;
            outMapStoreTotal_cfg        <= 0;
            outMapStoreFactor_cfg       <= 0;
            first_depth_iter_cfg        <= 0;
            do_res_layer_cfg            <= 0;
            do_kernels1x1_cfg           <= 0;
            num_1x1_kernels_cfg         <= 0;
            co_high_watermark_cfg       <= 0;
            rm_low_watermark_cfg        <= 0;
            pm_low_watermark_cfg        <= 0;
            krnl1x1_pding_cfg           <= 0;
            krnl1x1_pad_bgn_cfg         <= 0;
            krnl1x1_pad_end             <= 0;
        end else begin

        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin

        end else begin

        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            send_FAS_complete   <= 0;
            FAS_complete_acked  <= 0;
            last_wrt_r          <= 0;
            last_CO_recvd_r     <= 0;
        end else begin
            last_wrt_r          <= (last_wrt)       ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)  ? 1 : last_CO_recvd_r;
            for(i = 0; i < `MAX_AWP_PER_FAS; i = i + 1) begin
                all_AWP_complete[i] <= AWP_complete[i];
            end
            case(state)
                ST_IDLE: begin
                    if(start_FAS) begin
                        state <= ST_CFG_AWP;
                    end
                end
                ST_CFG_AWP: begin
                    if(cfg_AWP_done) begin
                        state <= ST_START_AWP;
                    end
                end
                ST_START_AWP: begin
                    if(start_AWP_done) begin
                        state <= ST_ACTIVE;
                    end
                end
                ST_ACTIVE: begin
                    if(
                        partMapFetchCount == partMapFetchTotal_cfg
                        && inMapFetchCount == inMapFetchTotal_cfg
                        && resMapFetchCount == resMapFetchTotal_cfg
                        && last_CO_recvd
                    ) begin
                        state <= ST_WAIT_LAST_WRITE;
                    end
                end
                ST_WAIT_LAST_WRITE: begin
                    if(last_wrt_r) begin
                        last_wrt_r          <= 0;
                        last_CO_recvd_r     <= 0;
                        state               <= ST_SEND_COMPLETE;
                    end
                end
                ST_SEND_COMPLETE: begin
                    if(&all_AWP_complete) begin
                        send_FAS_complete 	            <= FAS_complete_ack  ? 1'b0 : (~FAS_complete_acked ? 1'b1 : send_FAS_complete);
                        FAS_complete_acked              <= FAS_complete_ack  ? 1'b1 :  FAS_complete_acked;
                        if(FAS_complete_acked) begin
                            state                       <= ST_IDLE;
                            all_AWP_complete            <= 0;
                            krnl3x3FetchCount           <= 0;
                            krnl3x3BiasFetchCount       <= 0;
                            partMapFetchCount           <= 0;
                            inMapFetchCount             <= 0;
                            krnl1x1FetchCount           <= 0;
                            krnl1x1BiasFetchCount       <= 0;
                            resMapFetchCount            <= 0;
                            outMapStoreCount            <= 0;
                            partMapFetchTotal_cfg       <= 0;
                            inMapFetchTotal_cfg         <= 0;
                            resMapFetchTotal_cfg        <= 0;
                            dpth_count                  <= 0;
                            krnl_count                  <= 0;
                            krnl_1x1_brasz              <= 0;
                            krnl_1x1_bias_brasz         <= 0;
                        end
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin
        case(state)
            ST_IDLE:                state_s = "ST_IDLE";
            ST_CFG_AWP:             state_s = "ST_CFG_AWP";
            ST_START_AWP:           state_s = "ST_START_AWP";
            ST_ACTIVE:              state_s = "ST_ACTIVE";
            ST_WAIT_LAST_WRITE:     state_s = "ST_WAIT_LAST_WRITE";
            ST_SEND_COMPLETE:       state_s = "ST_SEND_COMPLETE";
        endcase
    end
`endif


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
endmodule


`endif