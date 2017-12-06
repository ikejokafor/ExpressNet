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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module layer_engine_activator #(
    parameter C_DATAIN_WIDTH    = 128,
    parameter C_DATAOUT_WIDTH   = 128,
	parameter C_OPCODE_WIDTH    = 64
) (
	clk                 ,
	rst                 ,
	
	opcode              ,
	opcode_valid        ,
	opcode_accept       ,
	
	datain              ,
	datain_valid        ,
	datain_ready        ,
	
	dataout             ,
	dataout_valid       ,
	dataout_ready       
);
 	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE_0                = 3'b001;
    localparam ST_DECODE_OPCODE         = 3'b010;
    localparam ST_BUSY                  = 3'b100;    

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Outputs
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
	input									clk;
	input									rst;
	
	input	[C_OPCODE_WIDTH-1:0]        	opcode;
	input									opcode_valid;
	output									opcode_accept;

	input	[C_DATAIN_WIDTH-1:0]			datain;
	input									datain_valid;
	output									datain_ready;
	
	output	[C_DATAOUT_WIDTH-1:0]			dataout;
	output									dataout_valid;
	input									dataout_ready;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [2:0]                           state;
    reg [15:0]                          num_outputs_count;

    reg                                 input_buffer_rden; 
    wire    [C_DATAIN_WIDTH - 1:0]      input_buffer_dataout;
    wire                                input_buffer_empty;
    wire                                input_buffer_full;

    reg                                 output_buffer_wren;                          
    reg     [C_DATAOUT_WIDTH - 1:0]     output_buffer_datain; 
    wire                                output_buffer_empty;    
    wire                                output_buffer_full; 
    reg                                 num_inputs;                      

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    fifo_fwft #(
       .C_DATA_WIDTH ( C_PIXEL_WIDTH     ),
       .C_FIFO_DEPTH ( 10                )
    ) i0_input_buffer (
        .clk            ( clk                    ),
        .rst            ( rst                    ),
        .wren           ( datain_valid           ),
        .rden           ( input_buffer_rden      ),
        .datain         ( datain                 ),
        .dataout        ( input_buffer_dataout   ),
        .empty          ( input_buffer_empty     ),
        .full           ( input_buffer_full      ),
        .almost_full    (                        )
    );
    
    
    fifo_fwft #(
       .C_DATA_WIDTH ( C_PIXEL_WIDTH     ),
       .C_FIFO_DEPTH ( 10                )
    ) i0_output_buffer (
        .clk            ( clk                                       ),
        .rst            ( rst                                       ),
        .wren           ( output_buffer_wren                        ),
        .rden           ( dataout_valid && dataout_ready            ),
        .datain         ( output_buffer_datain                      ),
        .dataout        ( dataout                                   ),
        .empty          ( output_buffer_empty                       ),
        .full           ( output_buffer_full                        ),
        .almost_full    (                                           )
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign dataout_valid = output_buffer_empty;
    assign datain_ready  = !input_buffer_full;
   
    always@(posedge clk) begin
        if(rst) begin
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            pipeline_active         <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            case(state_0)
                ST_IDLE_0: begin
                    if(opcode_valid) begin
                        num_inputs        <= opcode[`ACT_NUM_INPUTS_FIELD];
                        state_0           <= ST_DECODE_OPCODE;
                    end
                end
                ST_DECODE_OPCODE: begin
                    opcode_accept       <= 1;
                    pipeline_active     <= 1;
                    state_0             <= ST_BUSY;
                end
                ST_BUSY: begin
                    if(num_outputs_count == num_inputs) begin
                        opcode_complete     <= 1;
                        pipeline_active     <= 0;
                        state_0             <= ST_IDLE_0;
                    end                   
                end
                default: begin

                end            
            endcase
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------ 
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------   
    always@(posedge clk) begin
        if(rst) begin
            num_outputs_count <= 0;
        end else begin
            if(output_buffer_wren) begin
                num_outputs_count <= num_outputs_count + 1;
            end
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------    

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            input_buffer_rden       <= 1;
        end else begin
            input_buffer_rden       <= 0;
            output_buffer_wren      <= 0;
            output_buffer_datain    <= 0;
            if(pipeline_active && !input_buffer_empty && !output_buffer_full) begin
                input_buffer_rden     <= 1;
                output_buffer_datain  <= (input_buffer_dataout < 0) ? 0 : input_buffer_dataout;
                output_buffer_wren    <= 1;
            end                     
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
endmodule