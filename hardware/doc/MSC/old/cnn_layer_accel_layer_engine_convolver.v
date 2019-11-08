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
module cnn_layer_accel_layer_engine_convolver #(
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
	dataout_ready       ,
	
	config_address      ,
	config_wren         ,
	config_wrack        ,
	config_rden         ,
	config_rdack        ,
	config_datain       ,
	config_dataout      
);
  	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"   


	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE_0                = 4'b0001;
    localparam ST_LOAD_OPCODE           = 4'b0010;
    localparam ST_DECODE_OPCODE         = 4'b0100;
    localparam ST_BUSY                  = 4'b1000;
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Inputs / Outputs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
	input									clk;
	input									rst;
	
	input	[C_OPCODE_WIDTH-1:0]        	opcode;
	input									opcode_valid;
	output reg								opcode_accept;
    output reg  							opcode_complete;

	input	[C_DATAIN_WIDTH-1:0]			datain;
	input									datain_valid;
	output  reg						        datain_ready;
	
	output	reg [C_DATAOUT_WIDTH-1:0]		dataout;
	output	reg								dataout_valid;
	input									dataout_ready;
	
	input	[35:0]							config_address;
	input									config_wren;
	output									config_wrack;
	input									config_rden;
	output									config_rdack;
	input	[127:0]							config_datain;
	output	[127:0]							config_dataout;
    
 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [3:0]                           state_0;
    reg [C_OPCODE_WIDTH - 1:0]          opcode_r;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    cnn_layer_accel_layer_bram_bank (
        .clk
        .rst
        
    );
    
    cnn_layer_accel_layer_conv_array #(
        .C_MAX_WINDOW_SIZE
        .C_PIXEL_WIDTH
        .C_CONV_RESULT_WIDTH
    ) (
        .clk            ( clk                   ),
        .rst            ( rst                   ),
        .window_size    ( current_window_size   ),
        .datain         ( bram_bank_dataout     ),
        .dataout        (),
        .dataout_valid  (),     
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign job_done             = 0;
   
    always@(posedge clk) begin
        if(rst) begin
            opcode_r                <= 0;
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            pipeline_active         <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            pipeline_active         <= 0;
            case(state_0)
                ST_IDLE_0: begin
                    if(opcode_valid) begin
                        opcode_r        <= opcode;
                        state_0         <= ST_LOAD_OPCODE;
                    end
                end
                ST_LOAD_OPCODE: begin
                    if(opcode_load_done) begin
                        state_0             <= ST_DECODE_OPCODE;
                    
                end
                ST_DECODE_OPCODE: begin
                    if(opcode_param_valid) begin
                        opcode_accept       <= 1;
                        pipeline_active     <= 1;
                        state_0             <= ST_BUSY;
                    end
                end
                ST_BUSY: begin
                    if(job_done) begin
                        opcode_r            <= 0;
                        pipeline_active     <= 0;
                        opcode_complete     <= 1;
                        state_0             <= ST_IDLE_0;
                    end                   
                end
                default: begin

                end            
            endcase
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------ 
    
endmodule