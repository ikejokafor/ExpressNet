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
    clk     			        ,
    rst                         ,
    start_FAS                   ,
    start_FAS_ack               ,
    cfg_data                    ,
    sys_mem_read_req            ,
    sys_mem_read_req_ack        ,
    sys_mem_read_in_prog        ,
    sys_mem_read_cmpl           ,
    sys_mem_write_req           ,
    sys_mem_write_req_ack       ,
    sys_mem_write_in_prog       ,
    sys_mem_write_cmpl          ,
    trans_fifo_wren             ,
    convMap_bram_wren           ,
    resdMap_bram_wren           ,
    partMap_bram_wren           ,
    prevMap_fifo_wren           ,
    krnl1x1_bram_wren           ,
    krnl1x1Bias_bram_wren       ,
    trans_fifo_datain           ,
    convMap_bram_datain         ,
    resdMap_bram_datain         ,
    partMap_bram_datain         ,
    prevMap_fifo_datain         ,
    krnl1x1_bram_datain			,
    krnl1x1Bias_bram_datain		,
    outBuf_fifo_rden			,
    outBuf_fifo_dout            ,
    AWP_complete                ,
    send_FAS_complete           ,
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
	
	localparam C_VECTOR_ADD_WTH 	= `PIXEL_WIDTH * VECTOR_ADD_SIMD;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input clk     						;
    input rst                           ;
    input start_FAS                     ;
    output start_FAS_ack                 ;
    input [] cfg_data                   ;
    output [] sys_mem_read_req           ;
    input [] sys_mem_read_req_ack       ;
    input [] sys_mem_read_in_prog       ;
    input [] sys_mem_read_cmpl          ;
    output sys_mem_write_req             ;
    input sys_mem_write_req_ack         ;
    input sys_mem_write_in_prog         ;
    input sys_mem_write_cmpl            ;
    input trans_fifo_wren               ;
    input convMap_bram_wren             ;
    input resdMap_bram_wren             ;
    input partMap_bram_wren             ;
    input prevMap_fifo_wren             ;
    input krnl1x1_bram_wren             ;
    input krnl1x1Bias_bram_wren         ;
    input [] trans_fifo_datain          ;
    input [] convMap_bram_datain        ;
    input [] resdMap_bram_datain        ;
    input [] partMap_bram_datain        ;
    input [] prevMap_fifo_datain        ;
    input [] krnl1x1_bram_datain        ;
    input [] krnl1x1Bias_bram_datain    ;
    input outBuf_fifo_rden              ;
	input outBuf_fifo_dout_valid		;
    input [] outBuf_fifo_dout           ;
    input [] AWP_complete               ;
    input send_FAS_complete             ;
    input FAS_complete_ack              ;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    logic [					   5:0]	state                          	;
	logic [					  15:0] 	krnl1x1Depth_cfg                ;
	logic [					  15:0] 	krnl1x1Addr_cfg                 ;
	logic [					  15:0] 	krnl1x1BiasAddr_cfg             ;
	logic [					  15:0] 	pixelSeqAddr_cfg                ;
	logic [					  15:0] 	partMapAddr_cfg                 ;
	logic [					  15:0] 	resdMapAddr_cfg                 ;
	logic [					  15:0] 	outMapAddr_cfg                  ;
	logic [					  15:0] 	pixSeqCfgFetchTotal_cfg         ;
	logic [					  15:0] 	inMapAddr_cfg            	    ;
	logic [					  15:0] 	prevMapAddr_cfg			        ;
	logic [					  15:0] 	inMapFetchFactor_cfg            ;
	logic [					  15:0] 	inMapFetchTotal_cfg             ;
	logic [					  15:0] 	krnl3x3Addr_cfg				    ;
	logic [					  15:0] 	krnl3x3BiasAddr_cfg			    ;
	logic [					  15:0] 	krnl3x3FetchTotal_cfg           ;
	logic [					  15:0] 	krnl3x3BiasFetchTotal_cfg       ;
	logic [					  15:0] 	krnl1x1FetchTotal_cfg           ;
	logic [					  15:0] 	krnl1x1BiasFetchTotal_cfg       ;
	logic [					  15:0] 	partMapFetchTotal_cfg           ;
	logic [					  15:0] 	resdMapFetchTotal_cfg           ;
	logic [					  15:0] 	outMapStoreTotal_cfg            ;
	logic [					  15:0] 	outMapStoreFactor_cfg           ;
	logic [					  15:0] 	prevMapFetchTotal_cfg           ;
	logic [					  15:0] 	num_1x1_kernels_cfg             ;
	logic [					  15:0] 	cm_high_watermark_cfg           ;
	logic [					  15:0] 	rm_low_watermark_cfg            ;
	logic [					  15:0] 	pm_low_watermark_cfg            ;
	logic [					  15:0] 	pv_low_watermark_cfg            ;
	logic [					  15:0] 	rm_fetch_amount_cfg             ;
	logic [					  15:0] 	pm_fetch_amount_cfg             ;
	logic [					  15:0] 	pv_fetch_amount_cfg             ;
	logic [					  15:0] 	krnl1x1_pding_cfg               ;
	logic [					  15:0] 	krnl1x1_pad_bgn_cfg             ;
	logic [					  15:0] 	krnl1x1_pad_end_cfg             ;
	logic [					  15:0] 	opcode_cfg                      ;
	logic [					  15:0] 	res_high_watermark_cfg      	;
    logic [ `MAX_AWP_PER_FAS - 1:0] 	all_AWP_complete				;
    logic 								FAS_complete_acked				;
    logic [ C_VECTOR_ADD_WTH - 1:0] 	vector_add_out_0				;
	logic [ C_VECTOR_ADD_WTH - 1:0] 	vector_add_out_1			   	;
	logic [C_VECTOR_MULT_WTH - 1:0] 	vector_mult						;
    logic [   `MAX_FAS_RD_ID - 1:0] 	sys_mem_read_req_acked         	;
	logic 								sys_mem_writereq_acked         	;


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
			inMapAddr_cfg            	<= 0;
			prevMapAddr_cfg			    <= 0;
			inMapFetchFactor_cfg        <= 0;
			inMapFetchTotal_cfg         <= 0;
			krnl3x3Addr_cfg				<= 0;
			krnl3x3BiasAddr_cfg			<= 0;
			krnl3x3FetchTotal_cfg       <= 0;
			krnl3x3BiasFetchTotal_cfg	<= 0;
			krnl1x1FetchTotal_cfg       <= 0;
			krnl1x1BiasFetchTotal_cfg   <= 0;
			partMapFetchTotal_cfg       <= 0;
			resdMapFetchTotal_cfg       <= 0;
			outMapStoreTotal_cfg        <= 0;
			outMapStoreFactor_cfg       <= 0;
			prevMapFetchTotal_cfg       <= 0;
			num_1x1_kernels_cfg         <= 0;
			cm_high_watermark_cfg       <= 0;
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
            krnl1x1Depth_cfg            <= cfg_data[`KRNL1X1_DEPTH_FIELD];
            krnl1x1Addr_cfg             <= cfg_data[`KRNL1X1_ADDR_FIELD];
            krnl1x1BiasAddr_cfg         <= cfg_data[`KRNL1X1_BIAS_ADDR_FIELD];
            pixelSeqAddr_cfg            <= cfg_data[`PIXEL_SEQ_ADDR_FIELD];
            partMapAddr_cfg             <= cfg_data[`PARTMAP_ADDR_FIELD];
            resdMapAddr_cfg             <= cfg_data[`RESDMAP_ADDR_FIELD];
            outMapAddr_cfg              <= cfg_data[`OUTMAP_ADDR_FIELD];
            pixSeqCfgFetchTotal_cfg     <= cfg_data[`INMAP_ADDR_FIELD];
            inMapAddr_cfg            	<= cfg_data[`INMAP_ADDR_FIELD];
            prevMapAddr_cfg			    <= cfg_data[`PREVMAP_ADDR_FIELD];
            inMapFetchFactor_cfg        <= cfg_data[`INMAP_FETCHFACTOR_FIELD];  
            inMapFetchTotal_cfg         <= cfg_data[`INMAP_FETCHTOTAL_FIELD];
			krnl3x3Addr_cfg				<= cfg_data[`KRNL3X3_ADDR_FIELD]; 					
			krnl3x3BiasAddr_cfg			<= cfg_data[`KRNL3X3_BIAS_ADDR_FIELD]; 	
            krnl3x3FetchTotal_cfg       <= cfg_data[`KRNL3X3_FETCHTOTAL_FIELD];  
            krnl3x3BiasFetchTotal_cfg   <= cfg_data[`KRNL3X3_BIAS_FETCHTOTAL_FIELD];  
            krnl1x1FetchTotal_cfg       <= cfg_data[`KRNL1X1_FETCHTOTAL_FIELD];  
            krnl1x1BiasFetchTotal_cfg   <= cfg_data[`KRNL1X1_BIAS_FETCHTOTAL_FIELD];  
            partMapFetchTotal_cfg       <= cfg_data[`PARTMAP_FETCHTOTAL_FIELD];  
            resdMapFetchTotal_cfg       <= cfg_data[`RESDMAP_FETCHTOTAL_FIELD];  
            outMapStoreTotal_cfg        <= cfg_data[`OUTMAP_STORETOTAL_FIELD];  
            outMapStoreFactor_cfg       <= cfg_data[`OUTMAP_STOREFACTOR_FIELD];  
            prevMapFetchTotal_cfg       <= cfg_data[`PREVMAP_FETCHTOTAL_FIELD];  
            num_1x1_kernels_cfg         <= cfg_data[`NUM_1X1_KERNELS_FIELD];  
            cm_high_watermark_cfg       <= cfg_data[`CM_HIGH_WATERMARK_FIELD];  
            rm_low_watermark_cfg        <= cfg_data[`RM_LOW_WATERMARK_FIELD];  
            pm_low_watermark_cfg        <= cfg_data[`PM_LOW_WATERMARK_FIELD];  
            pv_low_watermark_cfg        <= cfg_data[`PV_LOW_WATERMARK_FIELD];  
            rm_fetch_amount_cfg         <= cfg_data[`RM_FETCH_AMOUNT_FIELD];  
            pm_fetch_amount_cfg         <= cfg_data[`PM_FETCH_AMOUNT_FIELD];  
            pv_fetch_amount_cfg         <= cfg_data[`PV_FETCH_AMOUNT_FIELD];  
            krnl1x1_pding_cfg           <= cfg_data[`KRNL1X1_PDING_FIELD];  
            krnl1x1_pad_bgn_cfg         <= cfg_data[`KRNL1X1_PAD_BGN_FIELD];  
            krnl1x1_pad_end_cfg         <= cfg_data[`KRNL1X1_PAD_END_FIELD];  
            opcode_cfg                  <= cfg_data[`OPCODE_FIELD];  
            res_high_watermark_cfg      <= cfg_data[`RES_HIGH_WATERMARK_FIELD];
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

   
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i0, i1;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && opcode_cfg == `OPCODE_15 && vector_add_0_d) begin
            for(i0 = 0; i0 < `VECTOR_ADD_SIMD; i0 = i0 + 1) begin
                vector_add_out_0[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    = convMap_bram_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + partMap_bram_dout[(i0 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
        if(opcode_cfg == `OPCODE_9 && opcode_cfg == `OPCODE_17 && vector_add_0_d) begin
            for(i1 = 0; i1 < `VECTOR_ADD_SIMD; i1 = i1 + 1) begin
                vector_add_out_0[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] 
                    = convMap_bram_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + resdMap_bram_dout[(i1 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
    end
    
    integer i2;
    always@(*) begin
        if(opcode_cfg == `OPCODE_8 && vector_add_1_d) begin
            for(i2 = 0; i2 < `VECTOR_ADD_SIMD; i2 = i2 + 1)
                vector_add_out_1[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = vector_add_out_0[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] + resdMap_bram_dout[(i2 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    integer i3
    always@(*) begin
        always@(posedge clk) begin
            for(i3 = 0; i3 < `VECTOR_MULT_SIMD; i3 = i3 + 1) begin
                vector_mult[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH]
                    = convMap_bram_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH] * krnl1x1_bram_dout[(i3 * `PIXEL_WIDTH) +: `PIXEL_WIDTH];
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
			buffer_update_in_prog   <= 0;			
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            adder_tree_datain_valid <= 0;
        end else begin
            convMap_bram_rden_w0    <= 0;
            partMap_bram_rden_w0    <= 0;
            resdMap_bram_rden_w0    <= 0;
            buffer_update           <= 0;
			buffer_update_in_prog	<= 0;
            adder_tree_datain_valid <= 0;
			if(buffer_update) begin
				buffer_update_in_prog <= 1;
			end
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
			convMap_bram_rdAddr <= 0;
			partMap_bram_rdAddr <= 0;
			resdMap_bram_rdAddr <= 0;
        end else if(buffer_update) begin
			if(opcode_cfg == `OPCODE_0;
				|| opcode_cfg == `OPCODE_1
				|| opcode_cfg == `OPCODE_10
				|| opcode_cfg == `OPCODE_11)
			begin
				convMap_bram_rdAddr <= convMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
				partMap_bram_rdAddr <= partMap_bram_rdAddr + (krnl1x1Depth_cfg >> `KERNEL_1x1_SIMD_SHMAT);
			end else if(opcode_cfg == `OPCODE_4 || opcode_cfg == `OPCODE_5) begin
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
            outBuf_fifo_datain = outBuf_dwc_fifo_dout; 
        end else if(opcode_cfg == `OPCODE_9 || opcode_cfg == `OPCODE_17 || opcode_cfg == `OPCODE_15) begin
			outBuf_fifo_datain = vector_add_out_0; 
        end else if(opcode_cfg == `OPCODE_8) begin
			outBuf_fifo_datain = vector_add_out_1;
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