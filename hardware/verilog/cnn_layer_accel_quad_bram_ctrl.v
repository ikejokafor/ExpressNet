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
// Additional Comments:    
//                         
//                         
//                         
//                         
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_quad_bram_ctrl (
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
    state                       ,
    input_row                   ,
    input_col                   ,
    row_matric                  ,
    gray_code                   ,
    pfb_empty                   ,
    pfb_rden                    ,
    pfb_full_count              ,
    row_matric_wrAddr           ,
    ce_execute                  ,
    cycle_counter               ,
    pix_seq_bram_rden           ,
    pix_seq_bram_rdAddr         ,
    next_kernel                 ,
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
    localparam C_LOG2_BRAM_DEPTH        = clog2(`BRAM_DEPTH);
    localparam C_LOG2_SEQ_DATA_DEPTH    = clog2((`BRAM_DEPTH / 2) * 5);
    localparam C_NUM_CE                 = `NUM_AWE * `NUM_CE_PER_AWE; 

    localparam ST_IDLE                  = 5'b00001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 5'b00010;
    localparam ST_WAIT_PFB_LOAD         = 5'b00100;
    localparam ST_AWE_CE_ACTIVE         = 5'b01000;
    localparam ST_JOB_DONE              = 5'b10000;

    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    input                                   clk                         ;   
    input                                   rst                         ;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_cols              ;
    input      [C_LOG2_BRAM_DEPTH - 2:0]    num_input_rows              ;
    input                                   job_start                   ;
    output reg                              job_accept                  ;
    output reg                              job_fetch_request           ;
    output reg                              job_fetch_in_progress       ;
    input                                   job_fetch_ack               ;
    input                                   job_fetch_complete          ;
    output reg                              job_complete                ;
    input                                   job_complete_ack            ;
    output reg [                    4:0]    state                       ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_row                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    input_col                   ;
    input                                   pfb_empty                   ;
    output reg                              pfb_rden                    ;
    input      [                    8:0]    pfb_full_count              ;
    input                                   row_matric                  ;
    output     [                    1:0]    gray_code                   ;
    output reg [C_LOG2_BRAM_DEPTH - 2:0]    row_matric_wrAddr           ;
    output reg [         C_NUM_CE - 1:0]    ce_execute                  ;
    output reg [                    2:0]    cycle_counter               ;
    output reg                              pix_seq_bram_rden           ;
    output reg [11:0]                       pix_seq_bram_rdAddr         ;
    output reg [         C_NUM_CE - 1:0]    next_kernel                 ;
    input                                   last_kernel                 ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------          
    wire                                    ce_execute_d                    ;
    reg     [                    10:0]      pix_seq_data_count              ;
    reg                                     pix_seq_bram_rden_r             ;
    reg     [                    10:0]      pix_seq_data_full_count         ;
    wire                                    pix_seq_bram_rden_d             ;
    reg                                     job_fetch_acked                 ;
    reg                                     job_complete_acked              ;
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_row                      ;  
    reg     [ C_LOG2_BRAM_DEPTH - 2:0]      output_col                      ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_rows                 ;
    wire    [ C_LOG2_BRAM_DEPTH - 2:0]      num_output_cols                 ;
    reg     [                     4:0]      next_state                      ;
    reg     [                     4:0]      return_state                    ;
    reg     [                     1:0]      graycode_r                      ;
    integer                                 idx                             ;  
    reg     [                     8:0]      pfb_count                       ;
    genvar                                  i                               ;

  	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------             
    // delay bc of 3 cycle sequence bram read latency to start execution of pipeline
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( pix_seq_bram_rden_r   ),
        .data_out   ( ce_execute_d          )
    ); 


    SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( pix_seq_bram_rden_r   ),
        .data_out   ( pix_seq_bram_rden_d   )
    ); 

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            for(idx = 0; idx < C_NUM_CE; idx = idx + 1) begin
                next_kernel[idx] <= 0;
            end
        end else begin
            next_kernel[0] <= (output_col == num_output_cols && cycle_counter == 4);
            for(idx = 1; idx < C_NUM_CE; idx = idx + 1) begin
                next_kernel[idx] <= next_kernel[idx - 1];
            end
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
   
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    assign num_output_rows  = num_input_rows; 
    assign num_output_cols  = num_input_cols;
    assign last_col         = (output_col == num_output_cols);
    
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
            end else if(pix_seq_bram_rden_r) begin
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
            for(idx = 1; idx < C_NUM_CE; idx = idx + 1) begin
                ce_execute[idx] <= 0;
            end
        end else begin
            ce_execute[0] <= ce_execute_d;
            for(idx = 1; idx < C_NUM_CE; idx = idx + 1) begin
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
    // END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign gray_code            = {graycode_r[1], ^graycode_r[1:0]};
    assign pix_seq_bram_rden    = pix_seq_bram_rden_d || pix_seq_bram_rden_r;
   
    always@(posedge clk) begin
        if(rst) begin
            pfb_rden                <= 0;
            row_matric_wrAddr       <= 0;
            job_accept              <= 0;
            job_fetch_request       <= 0;
            job_fetch_acked         <= 0;
            job_complete_acked      <= 0;
            job_complete            <= 0;
            pix_seq_bram_rden_r     <= 0;
            pix_seq_bram_rdAddr     <= 0;
            graycode_r              <= 0;
            pix_seq_data_count      <= 0;          
            state                   <= ST_IDLE;
        end else begin
            pfb_rden                <= 0;
            job_accept              <= 0;
            job_fetch_request       <= 0;
            job_complete            <= 0;
            pix_seq_bram_rden_r     <= 0;       
            case(state)            
                ST_IDLE: begin
                    if(job_start) begin
                        job_accept      <= 1;
                        state           <= ST_AWE_CE_PRIM_BUFFER;
                    end
                end
                ST_WAIT_PFB_LOAD: begin
                    if(!job_fetch_in_progress) begin
                        job_fetch_request 	<= job_fetch_ack  ? 1'b0 : (~job_fetch_acked ? 1'b1 : job_fetch_request);
                        job_fetch_acked     <= job_fetch_ack  ? 1'b1 :  job_fetch_acked;
                    end
                    if(job_fetch_complete) begin
                        job_fetch_acked <= 0;
                        state           <= return_state;
                    end
                end
                ST_AWE_CE_PRIM_BUFFER: begin
                    if(pfb_count == 0 && input_row < 4) begin
                        return_state            <= state;
                        state                 <= ST_WAIT_PFB_LOAD;
                    end if(input_row == 3 && pfb_count == pfb_full_count) begin
                        pix_seq_data_count   <= pix_seq_data_full_count;
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
                    if(row_matric && last_kernel && row_matric_wrAddr == num_input_cols) begin
                        row_matric_wrAddr <= 0;
                    end else if(row_matric && last_kernel) begin
                        row_matric_wrAddr <= row_matric_wrAddr + 1;
                    end
                    // sequence data reading logic
                    if(pix_seq_data_count > 1) begin
                        pix_seq_bram_rden_r <= 1;
                    end
                    if(pix_seq_bram_rden_r) begin
                        pix_seq_data_count <= pix_seq_data_count - 1;
                    end
                    if(pix_seq_bram_rdAddr == (pix_seq_data_full_count - 1)) begin
                        pix_seq_bram_rdAddr <= 0;
                    end else if(pix_seq_bram_rden_r) begin
                        pix_seq_bram_rdAddr <= pix_seq_bram_rdAddr + 1;
                    end
                    // next state
                    if(output_col == num_output_cols && output_row == num_output_rows && cycle_counter == 4 && last_kernel) begin
                        next_state          <= ST_JOB_DONE;
                    end else if(output_col == num_output_cols && output_row != num_output_rows && cycle_counter == 4) begin
                        pix_seq_bram_rden_r  <= 0;
                        if(input_row != (num_input_rows + 1) && last_kernel) begin
                            return_state    <= ST_AWE_CE_ACTIVE;
                            next_state      <= ST_WAIT_PFB_LOAD;
                        end else begin
                            next_state      <= ST_AWE_CE_ACTIVE;
                        end
                    end
                    if(!ce_execute && pix_seq_data_count == 0) begin
                        row_matric_wrAddr   <= 0;
                        pix_seq_data_count  <= pix_seq_data_full_count;
                        if(next_state[4]) begin
                            graycode_r <= 0;
                        end else begin
                            graycode_r <= graycode_r + 1;
                        end
                        state <= next_state;
                    end
                end
                ST_JOB_DONE: begin
                    job_complete 	    <= job_complete_ack  ? 1'b0 : (~job_complete_acked ? 1'b1 : job_complete);
				    job_complete_acked  <= job_complete_ack  ? 1'b1 :  job_complete_acked; 
                    pix_seq_bram_rdAddr          <= 0;                    
                    if(job_complete_ack) begin
                        job_complete_acked      <= 0;
                        state                   <= ST_IDLE;
                    end
                end
                default: begin
                
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
                ST_JOB_DONE:                state_s = "ST_JOB_DONE";
        endcase
    end
`endif


endmodule