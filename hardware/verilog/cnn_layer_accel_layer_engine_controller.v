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
//               
//               
//               
//
// Dependencies: 
//               
//               
//               
//
// Revision:    
//
// Additional Comments:
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_layer_engine_controller  #(
    parameter	C_PACKET_WIDTH	        = 66,
    parameter   C_NUM_LAYER_ENG_CTRL    = 1  
) (

    clk                                                 ,
    rst                                                 ,

    layer_eng_ctrl_input_valid		,
    layer_eng_ctrl_input_accept	    ,
    layer_eng_ctrl_input_data		,
    layer_eng_ctrl_output_valid	    ,
    layer_eng_ctrl_output_accept	,
    layer_eng_ctrl_output_data		
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.vh"
    `include "cnn_layer_accel_defines.vh"
    `include "soc_it_defs.vh"

  
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam ST_IDLE             = 6'b000001;
    localparam ST_LOAD_MESSAGE     = 6'b000010;
    localparam ST_DECODE_MESSAGE   = 6'b000100;
    localparam ST_PROCESS          = 6'b001000;
    localparam ST_WAIT_WRITEBEACK  = 6'b010000;
    localparam ST_SEND_COMPLETION  = 6'b100000;

    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Ouputs
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input                                               clk;
    input                                               rst;
    
   input                                layer_eng_ctrl_input_valid;	
   output                               layer_eng_ctrl_input_accept;	
   input   [C_PACKET_WIDTH - 1:0]	    layer_eng_ctrl_input_data;	
   output  	                            layer_eng_ctrl_output_valid;	
   input   	                            layer_eng_ctrl_output_accept;
   output  [C_PACKET_WIDTH - 1:0]	    layer_eng_ctrl_output_data;	
      

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Wires / Regs 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
 
    reg  [                   5                     :0]       state;
   


    
    // BEGIN Main State Machine State Logic ---------------------------------------------------------------------------------------------------------   
    always@(posedge clk) begin
        if(rst) begin       
            state                                           <= ST_IDLE;           
        end else begin        
            case (state)
                ST_IDLE: begin          
                    if(layer_eng_ctrl_input_valid) begin
                        state <= ST_DECODE_MESSAGE;
                    end
                end
                ST_DECODE_MESSAGE: begin  
                    state               <= ST_PROCESS;
                end
                ST_WAIT_WRITEBEACK: begin
                    state               <= ST_SEND_COMPLETION;
                end
                ST_SEND_COMPLETION: begin
                    if(layer_eng_ctrl_output_accept) begin
                    
                    end
                    state <= ST_IDLE;
                end
                default: begin

                end
            endcase
        end
    end

 
`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
            ST_IDLE              : state_s = "ST_IDLE";
            ST_DECODE_MESSAGE    : state_s = "ST_DECODE_MESSAGE";
            ST_PROCESS           : state_s = "ST_PROCESS";
            ST_WAIT_WRITEBEACK   : state_s = "ST_WAIT_WRITEBEACK";
            ST_SEND_COMPLETION   : state_s = "ST_SEND_COMPLETION";
        endcase
    end
`endif

endmodule
