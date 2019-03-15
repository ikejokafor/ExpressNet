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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_quad_bram_ctrl (
    clk                         ,
    rst                         ,
    num_input_cols              ,
    num_input_rows              ,
	convolution_stride          ,
	kernel_size                 ,
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
	output_stride				,
    row_matric                  ,
    gray_code                   ,
    pfb_empty                   ,
    pfb_rden                    ,
    pfb_full_count              ,
    row_matric_wrAddr           ,
    ce_execute                  ,
    cycle_counter               ,
    last_awe_ce1_cyc_counter    ,
    pix_seq_bram_rden           ,
    pix_seq_bram_rdAddr         ,
    next_kernel                 ,
	move_one_row_down			,
    last_kernel                 ,
    pipeline_flushed            ,
    wht_sequence_selector         
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

    localparam ST_IDLE                  = 6'b000001;  
    localparam ST_AWE_CE_PRIM_BUFFER    = 6'b000010;
    localparam ST_WAIT_PFB_LOAD         = 6'b000100;
    localparam ST_AWE_CE_ACTIVE         = 6'b001000;
    localparam ST_WAIT_JOB_DONE         = 6'b010000;
    localparam ST_SEND_COMPLETE         = 6'b100000;
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------  
    input  logic                              clk                         ;   
    input  logic                              rst                         ;
	input  logic   [C_LOG2_BRAM_DEPTH - 1:0]  num_input_cols              ;
	input  logic   [                    2:0]  convolution_stride          ;  
    input  logic   [C_LOG2_BRAM_DEPTH - 1:0]  num_input_rows              ;
	input  logic   [                    4:0]  kernel_size				  ;	
    input  logic                              job_start                   ;
    output logic                              job_accept                  ;
    output logic                              job_fetch_request           ;
    output logic                              job_fetch_in_progress       ;
    input  logic                              job_fetch_ack               ;
    input  logic                              job_fetch_complete          ;
    output logic                              job_complete                ;
    input  logic                              job_complete_ack            ;
    output logic [                    5:0]    state                       ;
    output logic [C_LOG2_BRAM_DEPTH - 1:0]    input_row                   ;
    output logic [C_LOG2_BRAM_DEPTH - 1:0]    input_col                   ;
	output logic [					  2:0]    output_stride               ;
	input  logic                              pfb_empty                   ;
    output logic                              pfb_rden                    ;
    input  logic [                    9:0]    pfb_full_count              ;
    input  logic                              row_matric                  ;
    output logic [                    1:0]    gray_code                   ;
    output logic [C_LOG2_BRAM_DEPTH - 2:0]    row_matric_wrAddr           ;
    output logic [         C_NUM_CE - 1:0]    ce_execute                  ;
    output logic [                    2:0]    cycle_counter               ;
    input  logic [                    2:0]    last_awe_ce1_cyc_counter    ;
    output logic                              pix_seq_bram_rden           ;
    output logic [                   11:0]    pix_seq_bram_rdAddr         ;
    output logic [         C_NUM_CE - 1:0]    next_kernel                 ;
	output logic [         C_NUM_CE - 1:0]    move_one_row_down          ;
    input  logic                              last_kernel                 ;
    input  logic                              pipeline_flushed            ;
	output logic                              wht_sequence_selector       ;
    

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------          
	logic                                    ce_execute_w                    ;
    logic     [                    11:0]     pix_seq_data_count              ;
    logic                                    pix_seq_bram_rden_r             ;
	(* mark_debug = "true" *) 
    logic     [                    11:0]     pix_seq_data_full_count         ;
    logic                                    pix_seq_bram_rden_d             ;
	logic                                    pix_seq_bram_rden_d1             ;
    logic                                    job_fetch_acked                 ;
    logic                                    job_complete_acked              ;
    logic     [ C_LOG2_BRAM_DEPTH - 1:0]     output_row                      ;  
	logic     [ C_LOG2_BRAM_DEPTH - 1:0]     output_col                      ;
	logic     [ C_LOG2_BRAM_DEPTH - 1:0]     num_output_rows                 ;
    logic     [ C_LOG2_BRAM_DEPTH - 1:0]     num_output_cols                 ;
    logic     [                     5:0]     next_state                      ;
    logic     [                     5:0]     return_state                    ;
    logic     [                     1:0]     graycode_r                      ;
    integer                                  idx                             ;  
    logic     [                     9:0]     pfb_count                       ;
	logic                                    ce_move_one_row_down            ;
	logic                                    ce_move_one_row_down_d          ;
    genvar                                   i                               ;

  	
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------             
    // delay bc of 3 cycle sequence bram read latency to start execution of pipeline
	assign 	ce_execute_w = pix_seq_bram_rden_r /*& (output_stride ==0)*/;
	
 
    SRL_bit #(
        .C_CLOCK_CYCLES( 2 )
    ) 
    i0_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( pix_seq_bram_rden_r   ),
        .data_out   ( pix_seq_bram_rden_d   )
    ); 
	
	
    SRL_bit #(
        .C_CLOCK_CYCLES( 1 )
    ) 
    i2_SRL_bit (
        .clk        ( clk                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( pix_seq_bram_rden_d   ),
        .data_out   ( pix_seq_bram_rden_d1   )
    ); 
	assign ce_move_one_row_down = (last_kernel && (output_stride != 0));
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 3 )
    ) 
    i1_SRL_bit (
        .clk        ( clk                     ),
        .rst        ( rst                     ),
        .ce         ( 1'b1                    ),
        .data_in    ( ce_move_one_row_down    ),
        .data_out   ( ce_move_one_row_down_d  )
    ); 
	

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            for(idx = 0; idx < C_NUM_CE; idx = idx + 1) begin
                next_kernel[idx] <= 0;
            end
        end else begin
            next_kernel[0] <= (output_col == num_output_cols && cycle_counter == `CYCLE_COUNT && (output_stride == 0));
            for(idx = 1; idx < C_NUM_CE; idx = idx + 1) begin
                next_kernel[idx] <= next_kernel[idx - 1];
            end
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
	
    
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            for(idx = 0; idx < C_NUM_CE; idx = idx + 1) begin
                move_one_row_down[idx] <= 0;
            end
        end else begin
            move_one_row_down[0] <= ce_move_one_row_down_d;
            for(idx = 1; idx < C_NUM_CE; idx = idx + 1) begin
                move_one_row_down[idx] <= move_one_row_down[idx - 1];
            end
        end
    end    
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
    
   
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	/* output map  rows = ((INPUT_ROWS + 2* PADDING - KERNEL_SIZE )/ STRIDE ) + 1 */
    assign num_output_rows  = /*(convolution_stride == 1) ? (num_input_rows) : 
                              (convolution_stride == 2) ? ((num_input_rows) >> 1):*/num_input_rows;
	/* output map  cols = ((INPUT_COLS + 2* PADDING - KERNEL_SIZE )/ STRIDE ) + 1 */						  
    assign num_output_cols  = (convolution_stride == 1) ? (num_input_cols) : 
                              (convolution_stride == 2) ? ((num_input_cols) >> 1) + 3 :num_input_cols;
    
    always@(posedge clk) begin
        if(rst) begin
            input_row   <= 0;
            input_col   <= 0;
        end else begin
            if(job_complete_ack) begin
                input_col  <= 0;
                input_row  <= 0;
            end else if(input_col == num_input_cols) begin
                input_col  <= 0;
                input_row  <= input_row + 1;
            end else if(pfb_rden) begin
                input_col  <= input_col + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------
 
 
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            cycle_counter <= 0;
        end else begin
            if(cycle_counter == `CYCLE_COUNT) begin
                cycle_counter <= 0;
            end else if(pix_seq_bram_rden_r) begin
                cycle_counter <= cycle_counter + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------	


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            output_stride <=0 ;
        end else begin
            if((output_col == num_output_cols) && (output_stride == convolution_stride - 1) &&  (cycle_counter == `CYCLE_COUNT) && last_kernel) begin
                output_stride <= 0;
            end else if((output_col == num_output_cols) && (cycle_counter == `CYCLE_COUNT)&& last_kernel) begin
                output_stride <= output_stride + 1;
            end
        end
    end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------	


    //Added by geetha for sequencing weight correctly 	
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
        always@(posedge clk) begin 
            if(rst) begin 
                wht_sequence_selector <= 1'b1;
            end else begin 
                if(wht_sequence_selector & (cycle_counter == `CYCLE_COUNT) & (convolution_stride == 1)) begin 
                    wht_sequence_selector <= 1'b0 ;
                end else if (!wht_sequence_selector & (cycle_counter == `CYCLE_COUNT)& (convolution_stride == 1)) begin 
                    wht_sequence_selector <= 1'b1 ;
                end
            end
        end				
    // END logic ------------------------------------------------------------------------------------------------------------------------------------	
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            output_row <= 0;
            output_col <= 0;
        end else begin
            if(job_complete_ack) begin
                output_col  <= 0;
                output_row  <= 0;
            end else if(output_col == num_output_cols && cycle_counter == `CYCLE_COUNT) begin
                output_col <= 0;
                if(last_kernel) begin
                    output_row <= output_row + 1;
                end
            end else if(cycle_counter == `CYCLE_COUNT) begin
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
            ce_execute[0] <= pix_seq_bram_rden_d;
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
    assign pix_seq_bram_rden    = pix_seq_bram_rden_d || pix_seq_bram_rden_r || pix_seq_bram_rden_d1;
   
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
                        state                   <= ST_WAIT_PFB_LOAD;
                    end if(input_row == 3 && pfb_count == pfb_full_count) begin
                        pix_seq_data_count   <= pix_seq_data_full_count;
						pix_seq_bram_rdAddr  <= 0;
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
                        pix_seq_bram_rdAddr <= pix_seq_bram_rdAddr + 1/*0*/;
                    end else if(pix_seq_bram_rden_r) begin
                        pix_seq_bram_rdAddr <= pix_seq_bram_rdAddr + 1;
                    end
                    // next state
                    if(output_col == num_output_cols && output_row == num_output_rows && cycle_counter == `CYCLE_COUNT && last_kernel) begin
                        next_state          <= ST_WAIT_JOB_DONE;
                    end else if(output_col == num_output_cols && output_row != num_output_rows && cycle_counter == `CYCLE_COUNT) begin
                        pix_seq_bram_rden_r  <= 0;
                        if(input_row < (num_input_rows + 1) && last_kernel) begin
                            return_state    <= ST_AWE_CE_ACTIVE;
                            next_state      <= ST_WAIT_PFB_LOAD;
                        end else begin
                            next_state      <= ST_AWE_CE_ACTIVE;
                        end
                    end
                    if((!ce_execute && last_awe_ce1_cyc_counter == 4) || ( last_kernel && (output_col == num_output_cols) && (cycle_counter == `CYCLE_COUNT) && (output_stride != 0)/*&& ~pix_seq_bram_rden_r */)) begin
                        row_matric_wrAddr   <= 0;
						pix_seq_data_count  <= pix_seq_data_full_count;
						pix_seq_bram_rdAddr <= 0;
						if(next_state[4]) begin
                            graycode_r <= 0;
                        end else if(last_kernel) begin
                            graycode_r <= graycode_r + 1;
                        end
						//Needed for stride != 1 
						if(output_row == num_output_rows) begin
							state <= ST_WAIT_JOB_DONE;
						end else begin
							state <= next_state;
						end						
                     end
					 
                end
                ST_WAIT_JOB_DONE: begin            
                    if(pipeline_flushed) begin
                        graycode_r  <= 0;
                        state       <= ST_SEND_COMPLETE;
                    end
                end
                ST_SEND_COMPLETE: begin
                    job_complete 	            <= job_complete_ack  ? 1'b0 : (~job_complete_acked ? 1'b1 : job_complete);
				    job_complete_acked          <= job_complete_ack  ? 1'b1 :  job_complete_acked; 
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
            ST_WAIT_JOB_DONE:           state_s = "ST_WAIT_JOB_DONE";
            ST_SEND_COMPLETE:           state_s = "ST_SEND_COMPLETE";
        endcase
    end
    
    string next_state_s;
    always@(next_state) begin 
        case(next_state) 
            ST_IDLE:                    next_state_s = "NEXT_ST_IDLE";              
            ST_AWE_CE_PRIM_BUFFER:      next_state_s = "NEXT_ST_AWE_CE_PRIM_BUFFER";
            ST_WAIT_PFB_LOAD:           next_state_s = "NEXT_ST_WAIT_PFB_LOAD";           
            ST_AWE_CE_ACTIVE:           next_state_s = "NEXT_ST_AWE_CE_ACTIVE";
            ST_WAIT_JOB_DONE:           next_state_s = "NEXT_ST_WAIT_JOB_DONE";
            ST_SEND_COMPLETE:           next_state_s = "NEXT_ST_SEND_COMPLETE";
        endcase
    end
`endif


endmodule