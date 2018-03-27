`timescale 1ns / 1ns
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
// Additional Comments:    input dimensions is regular map dimensions plus padded size
//                         
//                         
//                         
//                         
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_quad_bram_ctrl #(
    parameter C_NUM_AWE         = 4,
    parameter C_NUM_CE_PER_AWE  = 2,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    clk                         ,
    rst                         ,
    num_input_cols              ,
    num_input_rows              ,
    job_start                   ,
    job_accept                  ,
    job_fetch_request           ,
    job_fetch_ack               ,
    job_fetch_complete          ,
    job_complete                ,
    job_complete_ack            ,
    state_0                     ,
    state_1                     ,
    input_row                   ,
    input_col                   ,
    row_matric                  ,
    gray_code                   ,
    pfb_empty                   ,
    pfb_rden                    ,
    pfb_full_count              ,
    wrAddr                      ,
    ce_start                    ,
    seq_rden                    ,
    seq_rdAddr                  ,
    last_kernel                 ,
    next_row                    ,
    pixel_valid                 ,
    pixel_ready                          
);


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------     
    localparam ST_IDLE_0                = 5'b00001; 
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;
 
    localparam ST_IDLE_1                = 2'b01;
    localparam ST_ROW_REQUEST           = 2'b10;

    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    localparam C_CE_START_WIDTH         = C_NUM_AWE * C_NUM_CE_PER_AWE;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------   
    input                                   clk                         ;   
    input                                   rst                         ;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols              ;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_rows              ;
    input                                   job_start                   ;
    output                                  job_accept                  ;
    output reg                              job_fetch_request           ;
    input                                   job_fetch_ack               ;
    input                                   job_fetch_complete          ;
    output reg                              job_complete                ;
    input                                   job_complete_ack            ;
    output reg [                    4:0]    state_0                     ;
    output reg [                    1:0]    state_1                     ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_row                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_col                   ;
    input                                   pfb_empty                   ;
    output reg                              pfb_rden                    ;
    input      [                    8:0]    pfb_full_count              ;
    input                                   row_matric                  ;
    output     [                    1:0]    gray_code                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    wrAddr                      ;
    output reg [ C_CE_START_WIDTH - 1:0]    ce_start                    ;
    output reg                              seq_rden                    ;
    output reg [11:0]                       seq_rdAddr                  ;
    input                                   last_kernel                 ;
    input                                   next_row                    ;
    input                                   pixel_valid                 ;
    input                                   pixel_ready                 ;    
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------          
    reg     [                     5:0]      cycle_counter                   ;
    wire                                    seq_rden_d                      ;
    reg     [4:0]                           job_accept_r                    ;
    reg                                     job_fetch_acked                 ;
    reg                                     job_fetch_in_progress           ;
    reg                                     job_complete_acked              ;
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_row                      ;  
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_col                      ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_rows                 ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_cols                 ;
    reg     [                     3:0]      prev_state_0                    ;
    wire                                    cycle_count_inc                 ;
    reg     [                     1:0]      gc                              ;
    integer                                 idx                             ;  
    reg     [                     8:0]      pfb_count                       ;
    reg     [                     8:0]      pfb_count_d                     ;
    
  
	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------         
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( seq_rden_d            ),
        .data_out   ( cycle_count_inc       )
    );
   
    
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i2_SRL_bit (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( seq_rden      ),
        .data_out   ( seq_rden_d    )
    ); 
   
    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1                ),
        .C_DATA_WIDTH    ( 9                )
    ) 
    i0_SRL_bus (
        .clk        ( clk            ),
        .ce         ( 1'b1           ),
        .rst        ( rst            ),
        .data_in    ( pfb_count      ),
        .data_out   ( pfb_count_d    )
    );   
   
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign num_output_rows = num_input_rows; 
    assign num_output_cols = num_input_cols;
    
    always@(posedge clk) begin
        if(rst) begin
            input_row   <= 0;
            input_col   <= 0;
        end else begin
            if(input_col == num_input_cols) begin
                input_col  <= 0;
                input_row  <= input_row + 1;
            end else if(pfb_rden) begin
                input_col  <= input_col + 1;
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            cycle_counter <= 0;
        end else begin
            if(cycle_counter == 4) begin
                cycle_counter <= 0;
            end else if(seq_rden) begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            output_row <= 0;
            output_col <= 0;
        end else begin
            if(output_col == num_output_cols) begin
                output_col <= 0;
                if(last_kernel) begin
                    output_row <= output_row + 1;
                end
            end else if(cycle_counter == 4) begin
                output_col <= output_col + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------        
    assign gray_code = {gc[1], ^gc[1:0]};
    
    always@(posedge clk) begin
        if(rst) begin
            gc <= 0;
        end else begin
            if(output_col == num_output_cols && last_kernel) begin
                gc <= gc + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            ce_start[0] <= 0;
            for(idx = 1; idx < C_CE_START_WIDTH; idx = idx + 1) begin
                ce_start[idx] <= 0;
            end
        end else begin
            ce_start[0] <= (state_0 == ST_AWE_CE_ACTIVE && seq_rden_d);
            for(idx = 1; idx < C_CE_START_WIDTH; idx = idx + 1) begin
                ce_start[idx] <= ce_start[idx - 1];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            pfb_count <= 0;
        end else begin
            if(job_fetch_complete && state_1 == ST_ROW_REQUEST) begin
                pfb_count <= pfb_full_count;
            end
            if(pfb_rden) begin
                pfb_count <= pfb_count - 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign job_accept = |job_accept_r;
   
    always@(posedge clk) begin
        if(rst) begin
            job_fetch_in_progress   <= 0;
            state_1                 <= ST_IDLE_1;
        end else begin
            case(state_1)
                ST_IDLE_1: begin
                    if(job_fetch_ack) begin
                        state_1                 <= ST_ROW_REQUEST;
                    end
                end
                ST_ROW_REQUEST: begin
                    if(job_fetch_complete) begin
                        job_fetch_in_progress   <= 0;
                        state_1                 <= ST_IDLE_1;
                    end
                end
            endcase
        end
    end
    
    always@(posedge clk) begin
        if(rst) begin
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= 0;
            end     
        end else begin
            for(idx = 1; idx < 5; idx = idx + 1) begin
                job_accept_r[idx] <= job_accept_r[idx - 1];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            pfb_rden                <= 0;
            wrAddr                  <= 0;
            job_accept_r[0]         <= 0;
            job_fetch_request       <= 0;
            job_fetch_acked         <= 0;
            job_complete_acked      <= 0;
            job_complete            <= 0;
            seq_rden                <= 0;
            seq_rdAddr              <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            pfb_rden                <= 0;
            job_accept_r[0]         <= 0;
            job_fetch_request       <= 0;
            job_complete            <= 0;
            seq_rden                <= 0;
            case(state_0)            
                ST_IDLE_0: begin
                    if(job_start) begin
                        job_accept_r[0] <= 1;
                        state_0         <= ST_AWE_CE_PRIM_BUFFER;
                    end
                end
                ST_WAIT_PFB_LOAD: begin
                    job_fetch_request 	<= job_fetch_ack  ? 1'b0 : (~job_fetch_acked ? 1'b1 : job_fetch_request);
				    job_fetch_acked     <= job_fetch_ack  ? 1'b1 :  job_fetch_acked;
                    if(job_fetch_complete) begin
                        job_fetch_acked <= 0;
                        state_0         <= prev_state_0;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER: begin
                    if(pfb_count == 0 && pfb_count_d == 0 && input_row < 4) begin
                        prev_state_0            <= state_0;
                        state_0                 <= ST_WAIT_PFB_LOAD;
                    end if(input_row == 3 && pfb_count == pfb_full_count) begin
                        state_0  <= ST_AWE_CE_ACTIVE;
                    end else begin
                        if(pfb_count > 1) begin
                            pfb_rden <= 1;
                        end else begin
                            pfb_rden <= 0;
                        end
                    end
                end
                ST_AWE_CE_ACTIVE: begin
                    // overlap row matric with execution
                    if(row_matric && output_col <= num_output_cols) begin
                        wrAddr     <= wrAddr + 1;
                        pfb_rden   <= 1;
                    end
                    seq_rden <= 1;
                    if(seq_rden) begin
                        seq_rdAddr <= seq_rdAddr + 1;
                    end 
                    if(!last_kernel && output_col == num_output_cols) begin
                        seq_rdAddr <= 0;
                    end else if(output_col == num_input_cols) begin
                        seq_rden <= 0;
                        if(output_row == num_input_rows) begin
                            state_0         <= ST_JOB_DONE;
                        end else if(pfb_count == 0 && input_row <= num_input_cols) begin
                            prev_state_0    <= state_0;
                            state_0         <= ST_WAIT_PFB_LOAD;
                        end
                    end
                end
                ST_JOB_DONE: begin
                    job_complete 	    <= job_complete_ack  ? 1'b0 : (~job_complete_acked ? 1'b1 : job_complete);
				    job_complete_acked  <= job_complete_ack  ? 1'b1 :  job_complete_acked;                  
                    if(job_complete_ack) begin
                        job_complete_acked    <= 0;
                        state_0               <= ST_IDLE_0;
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
  
    
`ifdef SIMULATION
    string state_0_s;
    always@(state_0) begin 
        case(state_0) 
                ST_IDLE_0:                  state_0_s = "ST_IDLE_0";              
                ST_AWE_CE_PRIM_BUFFER:      state_0_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_0_s = "ST_WAIT_PFB_LOAD";           
                ST_AWE_CE_ACTIVE:           state_0_s = "ST_AWE_CE_ACTIVE";
                ST_JOB_DONE:                state_0_s = "ST_JOB_DONE";
        endcase
    end
    
    string state_1_s;
    always@(state_1) begin
        case(state_1)
            ST_IDLE_1:                  state_1_s = "ST_IDLE_1";             
            ST_ROW_REQUEST:             state_1_s = "ST_ROW_REQUEST";        
        endcase
	end
`endif	


endmodule