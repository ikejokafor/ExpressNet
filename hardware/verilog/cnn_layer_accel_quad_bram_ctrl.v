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
    job_fetch_in_progress       ,
    job_fetch_ack               ,
    job_fetch_complete          ,
    job_complete                ,
    job_complete_ack            ,
    state                     ,
    input_row                   ,
    input_col                   ,
    row_matric                  ,
    gray_code                   ,
    pfb_empty                   ,
    pfb_rden                    ,
    pfb_full_count              ,
    wrAddr                      ,
    ce_execute                  ,
    seq_rden                    ,
    seq_rdAddr                  ,
    last_kernel                                                           
);


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------     
    localparam C_LOG2_BRAM_DEPTH        = clog2(C_BRAM_DEPTH);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((C_BRAM_DEPTH / 2) * 5);
    localparam C_CE_EXEC_WIDTH          = C_NUM_AWE * C_NUM_CE_PER_AWE; 

    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 6'b000010;
    localparam ST_WAIT_PFB_LOAD         = 6'b000100;
    localparam ST_AWE_CE_ACTIVE         = 6'b001000;
    localparam ST_FIN_ROW_MATRIC        = 6'b010000;
    localparam ST_JOB_DONE              = 6'b100000;

    
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
    output reg                              job_fetch_in_progress       ;
    input                                   job_fetch_ack               ;
    input                                   job_fetch_complete          ;
    output reg                              job_complete                ;
    input                                   job_complete_ack            ;
    output reg [                    5:0]    state                       ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_row                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_col                   ;
    input                                   pfb_empty                   ;
    output reg                              pfb_rden                    ;
    input      [                    8:0]    pfb_full_count              ;
    input                                   row_matric                  ;
    output     [                    1:0]    gray_code                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    wrAddr                      ;
    output reg [  C_CE_EXEC_WIDTH - 1:0]    ce_execute                  ;
    output reg                              seq_rden                    ;
    output reg [11:0]                       seq_rdAddr                  ;
    input                                   last_kernel                 ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------          
    wire                                    ce_execute_d                    ;
    reg     [                    10:0]      seq_count                       ;
    reg                                     seq_rden_r                      ;
    reg     [                    10:0]      seq_full_count                  ;
    reg     [                     5:0]      cycle_counter                   ;
    wire                                    seq_rden_d                      ;
    reg     [4:0]                           job_accept_r                    ;
    reg                                     job_fetch_acked                 ;
    reg                                     job_complete_acked              ;
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_row                      ;  
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_col                      ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_rows                 ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_cols                 ;
    reg     [                     3:0]      next_state                      ;
    reg     [                     1:0]      gc                              ;
    integer                                 idx                             ;  
    reg     [                     8:0]      pfb_count                       ;
    reg     [                     8:0]      pfb_count_d                     ;
    
  	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------             
    // delay bc of 3 cycle sequence bram read latency to start execution of pipeline
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i0_SRL_bit (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( seq_rden      ),
        .data_out   ( ce_execute_d  )
    ); 


    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .ce         ( 1'b1          ),
        .data_in    ( seq_rden_r    ),
        .data_out   ( seq_rden_d    )
    ); 
    

    
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1         ),
        .C_DATA_WIDTH    ( 9         )
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
            end else if(pfb_rden && state != ST_FIN_ROW_MATRIC) begin
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
            end else if(ce_execute_d && state == ST_AWE_CE_ACTIVE) begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end

    always@(posedge clk) begin
        if(rst) begin
            output_row <= 0;
            output_col <= 0;
        end else begin
            if(output_col == num_output_cols && cycle_counter == 4) begin
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
    always@(posedge clk) begin
        if(rst) begin
            ce_execute[0] <= 0;
            for(idx = 1; idx < C_CE_EXEC_WIDTH; idx = idx + 1) begin
                ce_execute[idx] <= 0;
            end
        end else begin
            ce_execute[0] <= (state == ST_AWE_CE_ACTIVE && ce_execute_d);
            for(idx = 1; idx < C_CE_EXEC_WIDTH; idx = idx + 1) begin
                ce_execute[idx] <= ce_execute[idx - 1];
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    always@(posedge clk) begin
        if(rst) begin
            pfb_count <= 0;
        end else begin
            if(job_fetch_complete && job_fetch_in_progress) begin
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
        end else begin
            if(job_fetch_ack) begin
                job_fetch_in_progress   <= 1;
            end
            if(job_fetch_complete) begin
                job_fetch_in_progress   <= 0;
            end
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
    assign gray_code = {gc[1], ^gc[1:0]};
    assign seq_rden  = seq_rden_d || seq_rden_r;
   
    always@(posedge clk) begin
        if(rst) begin
            pfb_rden                <= 0;
            wrAddr                  <= 0;
            job_accept_r[0]         <= 0;
            job_fetch_request       <= 0;
            job_fetch_acked         <= 0;
            job_complete_acked      <= 0;
            job_complete            <= 0;
            seq_rden_r              <= 0;
            seq_rdAddr              <= 0;
            gc                      <= 0;
            seq_count               <= 0;
            state                   <= ST_IDLE;
        end else begin
            pfb_rden                <= 0;
            job_accept_r[0]         <= 0;
            job_fetch_request       <= 0;
            job_complete            <= 0;
            seq_rden_r              <= 0;
            case(state)            
                ST_IDLE: begin
                    if(job_start) begin
                        job_accept_r[0] <= 1;
                        state         <= ST_AWE_CE_PRIM_BUFFER;
                    end
                end
                ST_WAIT_PFB_LOAD: begin
                    if(!job_fetch_in_progress) begin
                        job_fetch_request 	<= job_fetch_ack  ? 1'b0 : (~job_fetch_acked ? 1'b1 : job_fetch_request);
                        job_fetch_acked     <= job_fetch_ack  ? 1'b1 :  job_fetch_acked;
                    end
                    if(job_fetch_complete) begin
                        job_fetch_acked <= 0;
                        state         <= next_state;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER: begin
                    if(pfb_count == 0 && input_row < 4) begin
                        next_state            <= state;
                        state                 <= ST_WAIT_PFB_LOAD;
                    end if(input_row == 3 && pfb_count == pfb_full_count) begin
                        seq_count   <= seq_full_count;
                        state       <= ST_AWE_CE_ACTIVE;
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
                    if(row_matric && last_kernel && pfb_count != 0) begin
                        pfb_rden   <= 1;
                    end
                    if(row_matric && last_kernel && wrAddr == num_input_cols) begin
                        wrAddr <= 0;
                    end else if(row_matric && last_kernel) begin
                        wrAddr <= wrAddr + 1;
                    end
                    // sequence data reading logic
                    if(seq_count > 1) begin
                        seq_rden_r <= 1;
                    end
                    if(seq_rden_r) begin
                        seq_count <= seq_count - 1;
                    end
                    if(seq_rdAddr == (seq_full_count - 1)) begin
                        seq_rdAddr <= 0;
                    end else if(seq_rden_r) begin
                        seq_rdAddr <= seq_rdAddr + 1;
                    end
                    // next state
                    if(output_col == num_output_cols && output_row == num_output_rows && cycle_counter == 4) begin
                        gc          <= 0;
                        wrAddr      <= 0;
                        state       <= ST_JOB_DONE;
                    end else if(output_col == num_output_cols && output_row != num_output_row && scycle_counter == 4) begin
                        seq_rden_r  <= 0;
                        seq_count   <= seq_full_count;
                        state       <= ST_FIN_ROW_MATRIC;
                    end
                end
                ST_FIN_ROW_MATRIC: begin
                    if(row_matric && last_kernel && pfb_count != 0) begin
                        pfb_rden   <= 1;
                    end
                    if(row_matric && last_kernel && wrAddr == num_input_cols) begin
                        wrAddr <= 0;
                    end else if(row_matric && last_kernel) begin
                        wrAddr <= wrAddr + 1;
                    end
                    if(pfb_count == 0) begin
                        gc <= gc + 1;
                        if(input_row != (num_input_rows + 1)) begin
                            next_state  <= ST_AWE_CE_ACTIVE;
                            state       <= ST_WAIT_PFB_LOAD;
                        end else if(!ce_execute) begin
                            state       <= ST_AWE_CE_ACTIVE;
                        end
                    end
                end
                ST_JOB_DONE: begin
                    job_complete 	    <= job_complete_ack  ? 1'b0 : (~job_complete_acked ? 1'b1 : job_complete);
				    job_complete_acked  <= job_complete_ack  ? 1'b1 :  job_complete_acked; 
                    seq_rdAddr          <= 0;                    
                    if(job_complete_ack) begin
                        job_complete_acked      <= 0;
                        state                   <= ST_IDLE;
                    end
                end
            endcase
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
  
    
`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
                ST_IDLE:                    state_s = "ST_IDLE";              
                ST_AWE_CE_PRIM_BUFFER:      state_s = "ST_AWE_CE_PRIM_BUFFER";
                ST_WAIT_PFB_LOAD:           state_s = "ST_WAIT_PFB_LOAD";           
                ST_AWE_CE_ACTIVE:           state_s = "ST_AWE_CE_ACTIVE";
                ST_FIN_ROW_MATRIC:          state_s = "ST_FIN_ROW_MATRIC";
                ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif	


endmodule