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
    parameter C_FAS_ID = 0,
    parameter C_IM_SM_RD_ID = 0,
    parameter C_PM_SM_RD_ID = 1,
    parameter C_PV_SM_RD_ID = 2,
    parameter C_RM_SM_RD_ID = 3
) (
    clk     
    rst
    start_FAS
    start_FAS_ack
    cfg_data
    sys_mem_read_req
    sys_mem_read_req_ack
    sys_mem_read_in_prog  
    sys_mem_read_cmpl
    sys_mem_write_req
    sys_mem_write_req_ack
    sys_mem_write_in_prog
    sys_mem_write_cmpl
    trans_fifo_wren
    convMap_bram_wren
    resdMap_bram_wren
    partMap_bram_wren
    prevMap_fifo_wren
    krnl1x1_bram_wren
    krnl1x1Bias_bram_wren
    trans_fifo_datain
    convMap_bram_datain
    resdMap_bram_datain
    partMap_bram_datain
    prevMap_fifo_datain
    krnl1x1_bram_datain
    krnl1x1Bias_bram_datain
    outBuf_fifo_rden
    outBuf_fifo_dout
    AWP_complete
    send_FAS_complete
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



    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic [5:0]  state                      ;
    logic [] krnl1x1Depth_cfg               ;
    logic [] krnl1x1Addr_cfg                ;
    logic [] krnl1x1BiasAddr_cfg            ;
    logic [] pixelSeqAddr_cfg               ;
    logic [] partMapAddr_cfg                ;
    logic [] resdMapAddr_cfg                ;
    logic [] outMapAddr_cfg                 ;
    logic [] pixSeqCfgFetchTotal_cfg        ;
    logic [] inMapAddrArr_cfg               ;
    logic [] krnl3x3AddrArr_cfg             ;
    logic [] prevMapAddr_cfg			    ;
    logic [] inMapFetchFactor_cfg           ;
    logic [] inMapFetchTotal_cfg            ;
    logic [] krnl3x3FetchTotal_cfg          ;
    logic [] krnl3x3BiasFetchCount          ;
    logic [] krnl3x3BiasFetchTotal_cfg      ;
    logic [] krnl1x1FetchTotal_cfg          ;
    logic [] krnl1x1BiasFetchTotal_cfg      ;
    logic [] partMapFetchTotal_cfg          ;
    logic [] resdMapFetchTotal_cfg          ;
    logic [] outMapStoreTotal_cfg           ;
    logic [] outMapStoreFactor_cfg          ;
    logic [] prevMapFetchTotal_cfg          ;
    logic [] conv_out_fmt0_cfg              ;
    logic [] num_1x1_kernels_cfg            ;
    logic [] cm_high_watermark_cfg          ;
    logic [] rm_low_watermark_cfg           ;
    logic [] pm_low_watermark_cfg           ;
    logic [] pv_low_watermark_cfg           ;
    logic [] rm_fetch_amount_cfg            ;
    logic [] pm_fetch_amount_cfg            ;
    logic [] pv_fetch_amount_cfg            ;
    logic [] krnl1x1_pding_cfg              ;
    logic [] krnl1x1_pad_bgn_cfg            ;
    logic [] krnl1x1_pad_end_cfg            ;
    logic [] opcode_cfg                     ;
    logic [] res_high_watermark_cfg         ;
    logic [`MAX_AWP_PER_FAS - 1:0] all_AWP_complete
    logic [] FAS_complete_acked
    logic [] vector_add_out;
    logic [`MAX_FAS_RD_ID - 1:0] sys_mem_read_req_acked;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( ), 
        .C_RAM_WR_DEPTH        ( ), 
        .C_RAM_RD_WIDTH        ( ), 
        .C_RD_PORT_HIGH_PERF   ( ), 
    )
    convMap_bram (
        .wr_clk      ( clk                  ),
        .wrAddr      ( convMap_bram_wrAddr  ),
        .wren        ( convMap_bram_wren    ),
        .din         ( convMap_bram_datain  ),
        .rd_clk      ( clk                  ),
        .rdAddr      ( convMap_bram_rdAddr  ),
        .rden        ( convMap_bram_rden    ),
        .rd_mode     (),
        .fifo_fwft   (),
        .dout        ( convMap_bram_dout    )
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
        .datain      ( krnl1x1_bram_datain ),
        .clk         ( clk ),
        .wren        ( krnl1x1_bram_wren ),
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
        .datain      ( krnl1x1Bias_bram_datain ),
        .clk         ( clk ),
        .wren        ( krnl1x1Bias_bram_wren ),
        .rden        (),
        .fifo_fwft   ( 1 ),
        .dataout     ()
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( ), 
        .C_RAM_WR_DEPTH        ( ), 
        .C_RAM_RD_WIDTH        ( ), 
        .C_RD_PORT_HIGH_PERF   ( ), 
    )
    resdMap_bram (
        wr_clk      ( clk ),
        wrAddr      (),
        wren        ( resdMap_bram_wren ),
        din         ( resdMap_bram_datain ),
        rd_clk      ( clk ),
        rdAddr      (),
        rden        (),
        rd_mode     (),
        fifo_fwft   (),
        dout        ()
    );


    xilinx_simple_dual_port_no_change_asym_width_count_2_clock_ram #(
        .C_RAM_WR_WIDTH        ( ),
        .C_RAM_WR_DEPTH        ( ),
        .C_RAM_RD_WIDTH        ( ),
        .C_RD_PORT_HIGH_PERF   ( )
    )
    partMap_bram (
        wr_clk      ( clk ),
        wrAddr      (),
        wren        ( partMap_bram_wren ),
        din         ( partMap_bram_datain ),
        rd_clk      ( clk ),
        rdAddr      (),
        rden        (),
        rd_mode     (),
        fifo_fwft   (),
        dout        ()
    );
    
    
    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH = 128,
        .C_FIFO_DEPTH = 16,
    )
    prevMap_fifo (
        .clk            ( clk ),
        .rst            ( rst ),
        .wren           ( prevMap_fifo_wren ),
        .rden           (),
        .datain         ( prevMap_fifo_datain ),
        .dataout        (),
        .empty          (),
        .full           (),
        .thresh         (),
        .prog_full      (),
        .count          ()
    );


    fifo_fwft_prog_full_count #(
        .C_DATA_WIDTH   ( ),
        .C_FIFO_DEPTH   ( ),
    )
    outputBuffer_fifo
    (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .wren           ( outBuf_fifo_wren      ),
        .rden           ( outBuf_fifo_rden      ),
        .datain         ( outBuf_fifo_datain    ),
        .dataout        ( outBuf_fifo_dout      ),
        .empty          (                       ),
        .full           (                       ),
        .thresh         (                       ),
        .prog_full      (                       ),
        .count          (                       )
    );
    
    
    fifo_fwft #(
        C_DATA_WIDTH                ( ),
        C_FIFO_DEPTH                ( )
    )
    trans_fifo
    (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .wren           ( trans_fifo_wren       ),
        .rden           ( trans_fifo_rden       ),
        .datain         ( trans_fifo_datain     ),
        .dataout        ( trans_fifo_dataout    ),
        .empty          ( trans_fifo_empty      ),
        .full           (                       )
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
        .datain_ready       ( adder_tree_datain ),
        .datain_valid       (),
        .datain             (),
        .dataout_ready      (),
        .dataout_valid      (),
        .dataout            ()
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 1 )
    )
    i0_SRL_bit (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_0          ),
        .data_out   ( vector_add_0_d        )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( 2 )
    )
    i0_SRL_bit (
        .clk        ( clk                   ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_1          ),
        .data_out   ( vector_add_1_d        )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( 3 )
    )
    i0_SRL_bit (
        .clk        ( clk                      ),
        .ce         ( 1'b1                     ),
        .rst        ( rst                      ),
        .data_in    ( resdMap_bram_wren_w1     ),
        .data_out   ( resdMap_bram_rden_w1_d   )
    );


    SRL_bit #(
        .C_CLOCK_CYCLES ( 4 )
    )
    i0_SRL_bit (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( outBuf_fifo_wren_w1       ),
        .data_out   ( outBuf_fifo_wren_w1_d     )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 1 )
    )
    i0_SRL_bit (
        .clk        ( clk                       ),
        .ce         ( 1'b1                      ),
        .rst        ( rst                       ),
        .data_in    ( outBuf_fifo_wren_w2       ),
        .data_out   ( outBuf_fifo_wren_w2_d     )
    );
  

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge ckk) begin
        if(rst || process_cmpl) begin
            krnl1x1Depth_cfg            <= 0;
            krnl1x1Addr_cfg             <= 0;
            krnl1x1BiasAddr_cfg         <= 0;
            pixelSeqAddr_cfg            <= 0;
            partMapAddr_cfg             <= 0;
            resdMapAddr_cfg             <= 0;
            outMapAddr_cfg              <= 0;
            pixSeqCfgFetchTotal_cfg     <= 0;
            inMapAddrArr_cfg            <= 0;
            krnl3x3AddrArr_cfg          <= 0;
            prevMapAddr_cfg			    <= 0;
            inMapFetchFactor_cfg        <= 0;
            inMapFetchTotal_cfg         <= 0;
            krnl3x3FetchTotal_cfg       <= 0;
            krnl3x3BiasFetchCount       <= 0;
            krnl3x3BiasFetchTotal_cfg   <= 0;
            krnl1x1FetchTotal_cfg       <= 0;
            krnl1x1BiasFetchTotal_cfg   <= 0;
            partMapFetchTotal_cfg       <= 0;
            resdMapFetchTotal_cfg       <= 0;
            outMapStoreTotal_cfg        <= 0;
            outMapStoreFactor_cfg       <= 0;
            prevMapFetchTotal_cfg       <= 0;
            conv_out_fmt0_cfg           <= 0;
            num_1x1_kernels_cfg         <= 0;
            co_high_watermark_cfg       <= 0;
            rm_low_watermark_cfg        <= 0;
            pm_low_watermark_cfg        <= 0;
            pv_low_watermark_cfg        <= 0;
            rm_fetch_amount_cfg         <= 0;
            pm_fetch_amount_cfg         <= 0;
            pv_fetch_amount_cfg         <= 0;
            krnl1x1_pding_cfg           <= 0;
            krnl1x1_pad_bgn_cfg         <= 0;
            krnl1x1_pad_end_cfg         <= 0;
            opcode_cfg                  <= 0;
            res_high_watermark_cfg      <= 0;       
        end else begin
            krnl1x1Depth_cfg            <= cfg_data[];
            krnl1x1Addr_cfg             <= cfg_data[];
            krnl1x1BiasAddr_cfg         <= cfg_data[];
            pixelSeqAddr_cfg            <= cfg_data[];
            partMapAddr_cfg             <= cfg_data[];
            resdMapAddr_cfg             <= cfg_data[];
            outMapAddr_cfg              <= cfg_data[];
            pixSeqCfgFetchTotal_cfg     <= cfg_data[];
            inMapAddrArr_cfg            <= cfg_data[];
            krnl3x3AddrArr_cfg          <= cfg_data[];
            prevMapAddr_cfg			    <= cfg_data[];
            inMapFetchFactor_cfg        <= cfg_data[];  
            inMapFetchTotal_cfg         <= cfg_data[];  
            krnl3x3FetchTotal_cfg       <= cfg_data[];  
            krnl3x3BiasFetchCount       <= cfg_data[];  
            krnl3x3BiasFetchTotal_cfg   <= cfg_data[];  
            krnl1x1FetchTotal_cfg       <= cfg_data[];  
            krnl1x1BiasFetchTotal_cfg   <= cfg_data[];  
            partMapFetchTotal_cfg       <= cfg_data[];  
            resdMapFetchTotal_cfg       <= cfg_data[];  
            outMapStoreTotal_cfg        <= cfg_data[];  
            outMapStoreFactor_cfg       <= cfg_data[];  
            prevMapFetchTotal_cfg       <= cfg_data[];  
            conv_out_fmt0_cfg           <= cfg_data[];  
            num_1x1_kernels_cfg         <= cfg_data[];  
            co_high_watermark_cfg       <= cfg_data[];  
            rm_low_watermark_cfg        <= cfg_data[];  
            pm_low_watermark_cfg        <= cfg_data[];  
            pv_low_watermark_cfg        <= cfg_data[];  
            rm_fetch_amount_cfg         <= cfg_data[];  
            pm_fetch_amount_cfg         <= cfg_data[];  
            pv_fetch_amount_cfg         <= cfg_data[];  
            krnl1x1_pding_cfg           <= cfg_data[];  
            krnl1x1_pad_bgn_cfg         <= cfg_data[];  
            krnl1x1_pad_end_cfg         <= cfg_data[];  
            opcode_cfg                  <= cfg_data[];  
            res_high_watermark_cfg      <= cfg_data[];
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

   
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i0, i1;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && opcode_cfg == `OPCODE_15 && vector_add_0_d) begin
            for(i0 = 0; i0 < `VECTOR_ADD_SIMD; i0 = i0 + 1) begin
                vector_add_out_0[(i0 * `PIXEL_SIZE) +: `PIXEL_SIZE] 
                    = convMap_bram_dout[(i0 * `PIXEL_SIZE) +: `PIXEL_SIZE] + partMap_bram_dout[(i0 * `PIXEL_SIZE) +: `PIXEL_SIZE];
            end
        end
        if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17 && vector_add_0_d) begin
            for(i1 = 0; i1 < `VECTOR_ADD_SIMD; i1 = i1 + 1) begin
                vector_add_out_0[(i1 * `PIXEL_SIZE) +: `PIXEL_SIZE] 
                    = convMap_bram_dout[(i1 * `PIXEL_SIZE) +: `PIXEL_SIZE] + resdMap_bram_dout[(i1 * `PIXEL_SIZE) +: `PIXEL_SIZE];
            end
        end
    end
    
    integer i2;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && vector_add_1_d) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1)
                vector_add_out_1[(i2 * `PIXEL_SIZE) +: `PIXEL_SIZE]
                    = vector_add_out_0[(i2 * `PIXEL_SIZE) +: `PIXEL_SIZE] + resdMap_bram_dout[(i2 * `PIXEL_SIZE) +: `PIXEL_SIZE];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i3
    always@(*) begin
        always@(posedge clk) begin
            for(i3 = 0; i3 < `VECTOR_MULT_SIMD; i3 = i3 + 1) begin
                vector_mult[(i3 * `PIXEL_SIZE) +: `PIXEL_SIZE]
                    = convMap_bram_dout[(i3 * `PIXEL_SIZE) +: `PIXEL_SIZE] + krnl1x1_bram_dout[(i3 * `PIXEL_SIZE) +: `PIXEL_SIZE];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign convMap_bram_empty       = (convMap_bram_count > 0);
    assign convMap_bram_prog_full   = (convMap_bram_count > cm_high_watermark_cfg);
    assign convMap_bram_rden        = (convMap_bram_rden_w0 | convMap_bram_rden_w1);

    always@(posedge ckk) begin
        if(rst) begin
            convMap_bram_count <= 0;
        end else begin
            if(convMap_bram_wren && convMap_bram_rden) begin
                convMap_bram_count <= convMap_bram_count;
            end else if(convMap_bram_wren) begin
                convMap_bram_count <= convMap_bram_count + 1;
            end else if(convMap_bram_rden) begin
                convMap_bram_count <= convMap_bram_count - 1;
            end
        end
    end  
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign partMap_bram_empty       = (partMap_bram_count > 0);
    assign partMap_bram_prog_full   = (partMap_bram_count > pm_high_watermark_cfg);
    assign partMap_bram_rden        = (partMap_bram_rden_w0 | partMap_bram_rden_w1);

    always@(posedge ckk) begin
        if(rst) begin
            partMap_bram_count <= 0;
        end else begin
            if(partMap_bram_wren && partMap_bram_rden) begin
                partMap_bram_count <= partMap_bram_count;
            end else if(partMap_bram_wren) begin
                partMap_bram_count <= partMap_bram_count + 1;
            end else if(partMap_bram_rden) begin
                partMap_bram_count <= partMap_bram_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign resdMap_bram_empty       = (resdMap_bram_count > 0);
    assign resdMap_bram_prog_full   = (resdMap_bram_count > cm_high_watermark_cfg);
    assign resdMap_bram_rden        = (resdMap_bram_rden_w0 | resdMap_bram_rden_w1_d | resdMap_bram_rden_w2);

    always@(posedge ckk) begin
        if(rst) begin
            resdMap_bram_count <= 0;
        end else begin
            if(resdMap_bram_wren && resdMap_bram_rden) begin
                resdMap_bram_count <= resdMap_bram_count;
            end else if(resdMap_bram_wren) begin
                resdMap_bram_count <= resdMap_bram_count + 1;
            end else if(resdMap_bram_rden) begin
                resdMap_bram_count <= resdMap_bram_count - 1;
            end
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
            process_cmpl        <= 0;
        end else begin
            start_FAS_ack       <= 0;
            process_cmpl        <= 0;
            last_wrt_r          <= (last_wrt)       ? 1 : last_wrt_r;
            last_CO_recvd_r     <= (last_CO_recvd)  ? 1 : last_CO_recvd_r;
            for(i = 0; i < `MAX_AWP_PER_FAS; i = i + 1) begin
                all_AWP_complete[i] <= AWP_complete[i];
            end
            case(state)
                ST_IDLE: begin
                    if(start_FAS) begin
                        start_FAS_ack   <= 1;
                        if(opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17)
                            state <= ST_ACTIVE;
                        end else begin
                            state <= ST_CFG_AWP;
                        end
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
                    if(partMapFetchCount == partMapFetchTotal_cfg
                        && inMapFetchCount == inMapFetchTotal_cfg
                        && resMapFetchCount == resMapFetchTotal_cfg
                        && prevMapFetchCount == prevMapFetchTotal_cfg
                        && (m_last_CO_recvd || opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17))
                    begin
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
                            process_cmpl                <= 1;
                            all_AWP_complete            <= 0;
                            krnl3x3FetchCount           <= 0;
                            krnl3x3BiasFetchCount       <= 0;
                            partMapFetchCount           <= 0;
                            prevMapFetchCount           <= 0;                            
                            inMapFetchCount             <= 0;
                            krnl1x1FetchCount           <= 0;
                            krnl1x1BiasFetchCount       <= 0;
                            resMapFetchCount            <= 0;
                            outMapStoreCount            <= 0;
                        end
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk)
        if(rst) begin
            trans_fifo_rden <= 0;
        end else begin
            trans_fifo_rden <= 0;
            if(!trans_fifo_empty && !convMap_bram_prog_full) begin
                trans_fifo_rden <= 1
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_IM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= 0;
        end else begin
            if(trans_fifo_rden && !sys_mem_read_in_prog[C_IM_SM_RD_ID]) begin
                sys_mem_read_req[C_IM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_IM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_IM_SM_RD_ID]);
                sys_mem_read_req_acked[C_IM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_IM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_PM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= 0;
        end else begin
            if(state == ST_ACTIVE && !sys_mem_read_in_prog[C_PM_SM_RD_ID]
                ((opcode_cfg != `OPCODE_14 && partMap_bram_prog_full && partMapFetchCount != partMapFetchTotal_cfg)
                || ((opcode_cfg == `OPCODE_14 || opcode_cfg == `OPCODE_17) && convMap_bram_prog_full && partMapFetchCount != partMapFetchTotal_cfg)))
            begin
                sys_mem_read_req[C_PM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_PM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PM_SM_RD_ID]);
                sys_mem_read_req_acked[C_PM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_PM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_PV_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_PV_SM_RD_ID] && state == ST_ACTIVE && && prevMap_bram_prog_full && prevMapFetchCount != prevMapFetchTotal_cfg) begin
                sys_mem_read_req[C_PV_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_PV_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_PV_SM_RD_ID]);
                sys_mem_read_req_acked[C_PV_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_PV_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            sys_mem_read_req[C_RM_SM_RD_ID]           <= 0;
            sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= 0;
        end else begin
            if(!sys_mem_read_in_prog[C_RM_SM_RD_ID] && state == ST_ACTIVE && && prevMap_fifo_sz <= resfMap_bram_prog_full && resdMapFetchCount != resdMapFetchTotal_cfg) begin
                sys_mem_read_req[C_RM_SM_RD_ID]           <= sys_mem_read_req_ack  ? 1'b0 : (~sys_mem_read_req_acked[C_RM_SM_RD_ID] ? 1'b1 : sys_mem_read_req[C_RM_SM_RD_ID]);
                sys_mem_read_req_acked[C_RM_SM_RD_ID]     <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
                sys_mem_read_in_prog[C_RM_SM_RD_ID]       <= sys_mem_read_req_ack  ? 1'b1 :  sys_mem_read_req_acked[C_RM_SM_RD_ID];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk)
        if(rst)
            dpth_count              <= 0;
            krnl_count              <= 0;
            buffer_update           <= 0;
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            adder_tree_datain_valid <= 1;
        end else begin
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            buffer_update           <= 0;
            adder_tree_datain_valid <= 0;
            if(krnl_1x1_bram_rden) begin
                if(dpth_count == (krnl1x1Depth_cfg - `KRNL_1x1_BRAM_RD_WIDTH)) begin
                    dpth_count <= 0;
                    if(krnl_count == ((num_1x1_kernels_cfg >> `KERNEL_1x1_SIMD_SHMAT) - 1)) begin
                        buffer_update   <= 1;
                        krnl_count      <= 0;
                    end else begin
                        krnl_count <= krnl_count + 1;
                    end
                end else begin
                    dpth_count <= dpth_count + `KRNL_1x1_BRAM_RD_WIDTH;
                end
                adder_tree_datain_valid <= 1;
                if(opcode_cfg == `OPCODE_0;
                    || opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_10
                    || opcode_cfg == `OPCODE_11)
                begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end  else if(opcode_cfg == `OPCODE_4 || opcode_cfg == `OPCODE_5) begin
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_6 || opcode_cfg == `OPCODE_7) begin
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_13
                    || opcode_cfg == `OPCODE_14)
                begin
                    convMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_8)
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17)
                    convMap_bram_rden_w0 <= 1;
                    resdMap_bram_rden_w0 <= 1;
                end else if(opcode_cfg == `OPCODE_15)
                    convMap_bram_rden_w0 <= 1;
                    partMap_bram_rden_w0 <= 1;
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            buffer_update_in_prog <= 0;
        end else begin
            buffer_update_in_prog <= 0;
            if(buffer_update) begin
                buffer_update_in_prog <= 1;
                if(opcode_cfg == `OPCODE_0;
                    || opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_10
                    || opcode_cfg == `OPCODE_11)
                begin
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    partMap_bram_rdAddr <= partMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end  else if(opcode_cfg == `OPCODE_4 || opcode_cfg == `OPCODE_5) begin
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    partMap_bram_rdAddr <= partMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    resdMap_bram_rdAddr <= resdMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end else if(opcode_cfg == `OPCODE_6 || opcode_cfg == `OPCODE_7) begin
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    resdMap_bram_rdAddr <= resdMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end else if(opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_13
                    || opcode_cfg == `OPCODE_14)
                begin
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end else if(opcode_cfg == `OPCODE_8)
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    partMap_bram_rdAddr <= partMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    resdMap_bram_rdAddr <= resdMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end else if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17)
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    resdMap_bram_rdAddr <= resdMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end else if(opcode_cfg == `OPCODE_15)
                    convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                    partMap_bram_rdAddr <= partMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
                end
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            krnl_1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
            outBuffer_fifo_wren_w1  <= 0;
            outBuffer_fifo_wren_w2  <= 0;
        end else begin
            krnl_1x1_bram_rden      <= 0;
            convMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w1    <= 0;
            resdMap_bram_rden_w2    <= 0;
            partMap_bram_rden_w1    <= 0;
            outBuffer_fifo_wren_w1  <= 0;
            outBuffer_fifo_wren_w2  <= 0;            
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) 
                && (opcode_cfg == `OPCODE_0
                    || opcode_cfg == `OPCODE_1
                    || opcode_cfg == `OPCODE_10
                    || opcode_cfg == `OPCODE_11)
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)                
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) 
                && (opcode_cfg == `OPCODE_2
                    || opcode_cfg == `OPCODE_3
                    || opcode_cfg == `OPCODE_12
                    || opcode_cfg == `OPCODE_13
                    || opcode_cfg == `OPCODE_14)
                && !convMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)                
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) 
                && (opcode_cfg == `OPCODE_4
                    || opcode_cfg == `OPCODE_5)
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)                
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) 
                && (opcode_cfg == `OPCODE_6
                    || opcode_cfg == `OPCODE_7)
                && !convMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)               
            begin
                krnl_1x1_bram_rden <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_8
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                partMap_bram_rden_w1    <= 1;
                vector_add_0            <= 1;
                vector_add_1            <= 1;
                resdMap_bram_rden_w1    <= 1;
                outBuffer_fifo_wren_w1  <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg == `OPCODE_9 || opcode_cfg == `OPCODE_17)
                && !convMap_bram_empty
                && !resdMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                resdMap_bram_rden_w2    <= 1;
                vector_add_0            <= 1;
                outBuffer_fifo_wren_w2  <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_15
                && !convMap_bram_empty
                && !partMap_bram_empty
                && !buffer_update && !buffer_update_in_prog)
            begin
                convMap_bram_rden_w1    <= 1;
                partMap_bram_rden_w1    <= 1;
                vector_add_0            <= 1;
                outBuffer_fifo_wren_w2  <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign outBuf_fifo_wren = (outBuffer_fifo_wren_w1_d | outBuffer_fifo_wren_w2_d);

    always@(*) begin
        if(opcode_cfg == `OPCODE_0
            || opcode_cfg == `OPCODE_1         
            || opcode_cfg == `OPCODE_2
            || opcode_cfg == `OPCODE_3
            || opcode_cfg == `OPCODE_4
            || opcode_cfg == `OPCODE_5
            || opcode_cfg == `OPCODE_6
            || opcode_cfg == `OPCODE_7
            || opcode_cfg == `OPCODE_10
            || opcode_cfg == `OPCODE_11
            || opcode_cfg == `OPCODE_12
            || opcode_cfg == `OPCODE_13
            || opcode_cfg == `OPCODE_14)
        begin
            outBuf_fifo_datain = 
        end else if(opcode_cfg == `OPCODE_8
            && !convMap_bram_empty
            && !partMap_bram_empty
            && !resdMap_bram_empty
            && !buffer_update && !buffer_update_in_prog)
        begin
            convMap_bram_rden_w1    <= 1;
            partMap_bram_rden_w1    <= 1;
            vector_add_0            <= 1;
            vector_add_1            <= 1;
            resdMap_bram_rden_w1    <= 1;
            outBuffer_fifo_wren_w1  <= 1;
        end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg == `OPCODE_9 || opcode_cfg == `OPCODE_17)
            && !convMap_bram_empty
            && !resdMap_bram_empty
            && !buffer_update && !buffer_update_in_prog)
        begin
            convMap_bram_rden_w1    <= 1;
            resdMap_bram_rden_w2    <= 1;
            vector_add_0            <= 1;
            outBuffer_fifo_wren_w2  <= 1;
        end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg == `OPCODE_15
            && !convMap_bram_empty
            && !partMap_bram_empty
            && !buffer_update && !buffer_update_in_prog)
        begin
            convMap_bram_rden_w1    <= 1;
            partMap_bram_rden_w1    <= 1;
            vector_add_0            <= 1;
            outBuffer_fifo_wren_w2  <= 1;
        end
    end

    always@(posedge clk)
        if(rst || process_cmpl) begin
            outMapStoreCount <= 0;
        end else begin
            if(outBuf_fifo_prog_full && (state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)) begin
                sys_mem_write_req          <= sys_mem_write_req_ack  ? 1'b0 : (~sys_mem_write_req_acked ? 1'b1 : sys_mem_write_req);
                sys_mem_write_req_acked    <= sys_mem_write_req_ack  ? 1'b1 :  sys_mem_write_req_acked;
            end
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