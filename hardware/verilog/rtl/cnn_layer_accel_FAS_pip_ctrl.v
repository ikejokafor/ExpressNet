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
module cnn_layer_accel_FAS_pip_ctrl (
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	rst						,
	clk_FAS             	,
	FAS_rdy_n           	,
	opcode_cfg				,
	state 					,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	convMap_fifo_empty		,
	partMap_fifo_empty      ,
	resdMap_fifo_empty      ,
	prevMap_fifo_empty      ,
	krnl_count				,
	conv1x1_dwc_fifo_rden	,
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	pipe_enable				,
	conv1x1_pip_start0  	,
	conv1x1_pip_start1		,
	conv1x1_pip_start2  	,
	vector_add_pm       	,
	vector_add_rm0      	,
	vector_add_rm1      	,
	vector_add_rm_conv  	,
    vector_add_pv       	,
	outBuf_fifo_wren1   	,
	outBuf_fifo_wren2   
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "utilities.svh"
    `include "cnn_layer_accel_FAS.svh"
	`include "cnn_layer_accel_FAS_pip_ctrl.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE                  = 7'b0000001;
    localparam ST_LD_1X1_KRN            = 7'b0000010;
    localparam ST_CFG_AWP               = 7'b0000100;
    localparam ST_START_AWP             = 7'b0001000;
    localparam ST_ACTIVE                = 7'b0010000;
    localparam ST_WAIT_LAST_WRITE		= 7'b0100000;
    localparam ST_SEND_COMPLETE         = 7'b1000000;

	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------	
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	input  logic    	rst						;	
	input  logic    	clk_FAS             	;
	input  logic    	FAS_rdy_n           	;
	input  logic [16:0]	opcode_cfg				;
	input  logic [ 6:0] state 					;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
	input  logic 		convMap_fifo_empty		;
	input  logic 		partMap_fifo_empty      ;
	input  logic 		resdMap_fifo_empty      ;
	input  logic 		prevMap_fifo_empty      ;
	input  logic		krnl_count				;
	input  logic		conv1x1_dwc_fifo_rden	;
	// BEGIN ----------------------------------------------------------------------------------------------------------------------------------------	
	output logic 		pipe_enable				;	
	output logic 		conv1x1_pip_start0		;
	output logic 		conv1x1_pip_start1  	;
	output logic 		conv1x1_pip_start2  	;
	output logic 		vector_add_pm       	;
	output logic 		vector_add_rm0      	;
	output logic 		vector_add_rm1      	;
	output logic        vector_add_rm_conv  	;
    output logic        vector_add_pv       	;
	output logic 		outBuf_fifo_wren1   	;
	output logic 		outBuf_fifo_wren2   	;
	

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	logic 				state_update_in_prog	;			
	logic				pipe_enable_r			;
	logic 				vector_add_pm_r       	;
	logic 				vector_add_rm0_r      	;
	logic 				vector_add_rm1_r      	;
	logic       		vector_add_rm_conv_r  	;
    logic				vector_add_pv_r       	;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Instantiations
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i0_SRL_bit (
        .clk        ( clk_FAS            ),
        .ce         ( 1'b1               ),
        .rst        ( rst                ),
        .data_in    ( pipe_enable_r      ),
        .data_out   ( pipe_enable      	 )
    ); 


	SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i1_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_pm_r		),
        .data_out   ( vector_add_pm         )
    );
    
    
    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i2_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm0_r      ),
        .data_out   ( vector_add_rm0        )
    );
    

    SRL_bit #(
        .C_CLOCK_CYCLES ( 2 * `FAS_FIFO_LATENCY + `VEC_ADD_LATENCY )
    )
    i3_SRL_bit (
        .clk        ( clk_FAS               ),
        .ce         ( 1'b1                  ),
        .rst        ( rst                   ),
        .data_in    ( vector_add_rm1_r      ),
        .data_out   ( vector_add_rm1        )
    );
	
	
	SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i4_SRL_bit (
        .clk        ( clk_FAS                 ),
        .ce         ( 1'b1                    ),
        .rst        ( rst                     ),
        .data_in    ( vector_add_rm_conv_r    ),
        .data_out   ( vector_add_rm_conv      )
    );
  

    SRL_bit #(
        .C_CLOCK_CYCLES ( `FAS_FIFO_LATENCY )
    )
    i5_SRL_bit (
        .clk        ( clk_FAS                 ),
        .ce         ( 1'b1                    ),
        .rst        ( rst                     ),
        .data_in    ( vector_add_pv_r         ),
        .data_out   ( vector_add_pv           )
    );


	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign state_update_in_prog     = pipe_enable;

    // always@(posedge clk) begin
    //     for(i7 = 1; i7 < __; i7 = i7 + 1) begin
    //         state_update_in_prog[i7] = state_update_in_prog[i7 - 1];
    //     end
    // end

    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            pipe_enable_r               <= 0;
            conv1x1_pip_start0          <= 0;
            conv1x1_pip_start1          <= 0;
            conv1x1_pip_start2          <= 0;
            vector_add_pm_r             <= 0;
            vector_add_rm0_r            <= 0;
            vector_add_rm1_r            <= 0;
            outBuf_fifo_wren1           <= 0;
            outBuf_fifo_wren2           <= 0; 
        end else begin
            pipe_enable_r               <= 0;
            conv1x1_pip_start0          <= 0;
            conv1x1_pip_start1          <= 0;
            conv1x1_pip_start2          <= 0;
            vector_add_pm_r             <= 0;
            vector_add_rm0_r            <= 0;
            vector_add_rm1_r            <= 0;
            outBuf_fifo_wren1           <= 0;
            outBuf_fifo_wren2           <= 0;
            if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_0_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_pm_r         <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_1_FIELD]
                    || opcode_cfg[`OPCODE_11_FIELD])
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !prevMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_pm_r         <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_2_FIELD]
                    || opcode_cfg[`OPCODE_12_FIELD]
                    || opcode_cfg[`OPCODE_14_FIELD])
                && !convMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                conv1x1_pip_start0          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && (opcode_cfg[`OPCODE_3_FIELD]
                    || opcode_cfg[`OPCODE_13_FIELD])
                && !convMap_fifo_empty
                && !prevMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                conv1x1_pip_start0          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_4_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_pm_r         <= 1;
                    vector_add_rm1_r        <= 1;
                end
                conv1x1_pip_start2          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_5_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !prevMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_pm_r         <= 1;
                    vector_add_rm1_r        <= 1;
                end
                conv1x1_pip_start2          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_6_FIELD]
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_rm0_r        <= 1;
                end
                conv1x1_pip_start1          <= 1;
                outBuf_fifo_wren2           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_7_FIELD]
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !prevMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                if(krnl_count == 0) begin
                    vector_add_rm0_r        <= 1;
                end
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg[`OPCODE_8_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                vector_add_pm_r             <= 1;
                vector_add_rm1_r            <= 1;
                outBuf_fifo_wren2           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && (opcode_cfg[`OPCODE_9_FIELD] || opcode_cfg[`OPCODE_17_FIELD])
                && !convMap_fifo_empty
                && !resdMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                vector_add_rm0_r            <= 1;
                outBuf_fifo_wren1           <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE)
                && opcode_cfg[`OPCODE_10_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                vector_add_pm_r             <= 1;
                conv1x1_pip_start1          <= 1;
            end else if((state == ST_ACTIVE || state == ST_WAIT_LAST_WRITE) && opcode_cfg[`OPCODE_15_FIELD]
                && !convMap_fifo_empty
                && !partMap_fifo_empty
                && !(|state_update_in_prog))
            begin
                pipe_enable_r               <= 1;
                vector_add_pm_r             <= 1;
                outBuf_fifo_wren1           <= 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk_FAS) begin
        if(rst || FAS_rdy_n) begin
            vector_add_rm_conv  <= 0;
            vector_add_pv       <= 0;
        end else begin
            vector_add_rm_conv  <= 0;
            vector_add_pv       <= 0;
            // - - - - - - - - - - - - - -
            if(conv1x1_dwc_fifo_rden && (opcode_cfg[`OPCODE_0_FIELD] || opcode_cfg[`OPCODE_2_FIELD])) begin
                vector_add_rm_conv <= 1;
            end
            // - - - - - - - - - - - - - -
            if(conv1x1_dwc_fifo_rden && (opcode_cfg[`OPCODE_1_FIELD] 
                                        || opcode_cfg[`OPCODE_3_FIELD] 
                                        || opcode_cfg[`OPCODE_5_FIELD] 
                                        || opcode_cfg[`OPCODE_7_FIELD])) 
            begin
                vector_add_pv <= 1;
            end
            // - - - - - - - - - - - - - -
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


`ifdef SIMULATION
    string state_s;
    always@(state) begin
        case(state)
            ST_IDLE:                state_s = "ST_IDLE";
            ST_LD_1X1_KRN:          state_s = "ST_LD_1X1_KRN";
            ST_CFG_AWP:             state_s = "ST_CFG_AWP";
            ST_START_AWP:           state_s = "ST_START_AWP";
            ST_ACTIVE:              state_s = "ST_ACTIVE";
            ST_WAIT_LAST_WRITE:     state_s = "ST_WAIT_LAST_WRITE";
            ST_SEND_COMPLETE:       state_s = "ST_SEND_COMPLETE";
        endcase
    end
`endif
	
	
endmodule