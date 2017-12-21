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
    opcode_complete     ,
	
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
    localparam ST_IDLE            = 4'b0001;
    localparam ST_LOAD_OPCODE     = 4'b0010;
    localparam ST_DECODE_OPCODE   = 4'b0100;
    localparam ST_BUSY            = 4'b1000;    

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Outputs
	//-----------------------------------------------------------------------------------------------------------------------------------------------    
	input									clk;
	input									rst;
	
	input	[C_OPCODE_WIDTH-1:0]        	opcode;
	input									opcode_valid;
	output reg  							opcode_accept;
    output reg                              opcode_complete;

	input	[C_DATAIN_WIDTH-1:0]			datain;
	input									datain_valid;
	output	reg								datain_ready;
	
	output	[C_DATAOUT_WIDTH-1:0]			dataout;
	output reg  							dataout_valid;
	input									dataout_ready;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [3:0]                           state;
    reg [C_OPCODE_WIDTH - 1:0]          opcode_r;
    reg                                 pipeline_active;
    reg [15:0]                          num_outputs_count;
    reg [15:0]                          num_inputs;
    wire                                job_done;

   
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign num_inputs    = opcode_r[`ACT_NUM_INPUTS_FIELD];
    assign job_done      = (num_outputs_count == num_inputs);

    always@(posedge clk) begin
        if(rst) begin
            opcode_r                <= 0;
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            pipeline_active         <= 0;
            state                   <= ST_IDLE;
        end else begin
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            case(state)
                ST_IDLE: begin
                    if(opcode_valid) begin
                        opcode_r         <= opcode;
                        state            <= ST_LOAD_OPCODE;
                    end
                end
                ST_LOAD_OPCODE: begin
                    state             <= ST_DECODE_OPCODE;
                end
                ST_DECODE_OPCODE: begin
                    opcode_accept       <= 1;
                    pipeline_active     <= 1;
                    state               <= ST_BUSY;
                end
                ST_BUSY: begin
                    if(job_done) begin
                        opcode_r            <= 0;
                        opcode_complete     <= 1;
                        pipeline_active     <= 0;
                        state               <= ST_IDLE;
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
            if(dataout_valid) begin
                num_outputs_count <= num_outputs_count + 1;
            end else if(job_done) begin
                num_outputs_count <= 0;
            end
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------    

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            dataout_valid       <= 0;
            datain_ready        <= 0;
        end else begin
            dataout_valid       <= 0;
            datain_ready        <= 0;
            if(pipeline_active) begin
                datain_ready    <= 1;
            end
            if(datain_valid && dataout_ready) begin
                dataout         <= ($signed(datain) < $signed(0)) ? 0 : datain;
                dataout_valid   <= 1;
            end                     
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
 
`ifdef SIMULATION
    string state_0_s;
    always@(*) begin
        case(state_0)
            ST_IDLE             :   state_0_s = "ST_IDLE";
            ST_LOAD_OPCODE      :   state_0_s = "ST_LOAD_OPCODE";
            ST_DECODE_OPCODE    :   state_0_s = "ST_DECODE_OPCODE";
            ST_BUSY             :   state_0_s = "ST_BUSY";
        endcase
    end 
`endif
endmodule