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
module cnn_layer_accel_layer_engine_pooler #(
    parameter C_DATAIN_WIDTH        = 16,
    parameter C_DATAOUT_WIDTH       = 16,
	parameter C_OPCODE_WIDTH        = 64,
    parameter C_MAX_KERNEL_WIDTH 	= 3,
    parameter C_MAX_KERNEL_HEIGHT 	= 3,	    
    parameter C_MAX_WINDOW_WIDTH 	= 10	    
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
    localparam ST_IDLE_0                = 4'b0001;
    localparam ST_LOAD_OPCODE           = 4'b0010;
    localparam ST_DECODE_OPCODE         = 4'b0100;
    localparam ST_BUSY                  = 4'b1000;
    
    localparam ST_IDLE_1                = 4'b0001;
    localparam ST_LOAD_ROW_BUFFERS      = 4'b0010;
    localparam ST_ACTIVE_0              = 4'b0100;
    localparam ST_ACTIVE_1              = 4'b1000;
    
    localparam C_WINDOW_WIDTH           = C_DATAIN_WIDTH * C_MAX_KERNEL_WIDTH * C_MAX_KERNEL_HEIGHT;
    localparam C_WINDOW_V_WIDTH         = C_MAX_KERNEL_WIDTH * C_MAX_KERNEL_HEIGHT;
    localparam C_LOG2_MAX_WINDOW_WIDTH  = clog2(C_MAX_WINDOW_WIDTH);


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
	output   reg						    datain_ready;
	
	output	reg [C_DATAOUT_WIDTH-1:0]		dataout;
	output	reg								dataout_valid;
	input									dataout_ready;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [3:0]                           state_0;
    reg [3:0]                           state_1;
    reg [C_OPCODE_WIDTH - 1:0]          opcode_r;   
    
    wire [15:0]                         input_kernel_size; 

    wire [15:0]                         job_done;             
    
    wire [C_WINDOW_WIDTH - 1:0]         window;
    wire [C_WINDOW_V_WIDTH - 1:0]       window_valid;
    reg  [C_DATAIN_WIDTH - 1:0]         window_00;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_01;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_02;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_02_r;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_10;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_11;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_12;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_12_r;         
    reg  [C_DATAIN_WIDTH - 1:0]         window_20;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_21;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_22;        
    reg  [C_DATAIN_WIDTH - 1:0]         window_22_r;      

    reg [C_DATAIN_WIDTH - 1:0]           partial_max0_0;  
    reg [C_DATAIN_WIDTH - 1:0]           partial_max0_1;  
    reg [C_DATAIN_WIDTH - 1:0]           partial_max0_2;
    reg [C_DATAIN_WIDTH - 1:0]           partial_max1_1;  
    reg [C_DATAIN_WIDTH - 1:0]           partial_max1_2; 
    reg [C_DATAIN_WIDTH - 1:0]           partial_max1_3;   
    reg [C_DATAIN_WIDTH - 1:0]           partial_max2;    
    reg [C_DATAIN_WIDTH - 1:0]           partial_max1_3_r;

    reg [C_DATAIN_WIDTH - 1:0]          pool_out; 
    wire                                pool_out_valid;
    
    wire [C_LOG2_MAX_WINDOW_WIDTH - 1:0]     input_img_row; 
    wire [C_LOG2_MAX_WINDOW_WIDTH - 1:0]     input_img_col; 
    reg  [15:0]                         img_row_count;
    reg  [15:0]                         img_col_count;
    reg  [15:0]                         map_count;
    wire [15:0]                         num_maps;
    reg  [15:0]                         pad_amt;
    reg                                 pipeline_active;
    reg                                 initialize;
 
 
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    window_buffer #(
       .C_KERNEL_WIDTH 		( C_MAX_KERNEL_WIDTH	    ),
       .C_KERNEL_HEIGHT 	( C_MAX_KERNEL_HEIGHT		),
       .C_DATAIN_WIDTH 		( C_DATAIN_WIDTH	        ),
       .C_MAX_WINDOW_WIDTH  ( C_MAX_WINDOW_WIDTH        )
    ) 
    i0_window_buffer (
        .rst            ( rst               ),
        .initialize     ( initialize        ),
        .clk            ( clk               ),
        .width          ( input_img_col     ),
        .datain         ( datain            ),
        .datain_valid   ( datain_valid      ),
        .window         ( window            ),
        .window_valid   ( window_valid      )
    );
    
    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(state_1 == ST_ACTIVE_0 && datain_valid && dataout_ready) begin
            window_00           <= window[0 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_01           <= window[1 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_02           <= window[2 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_02_r         <= window_02;

            window_10           <= window[3 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_11           <= window[4 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_12           <= window[5 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_12_r         <= window_12;

            window_20           <= window[6 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_21           <= window[7 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_22           <= window[8 * C_DATAIN_WIDTH +: C_DATAIN_WIDTH];
            window_22_r         <= window_22;
            
            partial_max0_0      <= (window_00 > window_01) ? window_00 : window_01;
            partial_max0_1      <= (window_10 > window_11) ? window_10 : window_11;
            partial_max0_2      <= (window_20 > window_21) ? window_20 : window_21;

            partial_max1_1      <= (partial_max0_0 > window_02_r) ? partial_max0_0 : window_02_r;
            partial_max1_2      <= (partial_max0_1 > window_12_r) ? partial_max0_1 : window_12_r;
            partial_max1_3      <= (partial_max0_2 > window_22_r) ? partial_max0_2 : window_22_r;  
            
            partial_max2        <= (partial_max1_1 > partial_max1_2) ? partial_max1_1 : partial_max1_2;
            
            partial_max1_3_r    <= partial_max1_3;

            pool_out            <= (partial_max2 > partial_max1_3_r) ? partial_max2 : partial_max1_3_r;
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
      // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
  
        SRL_bit #(
        .C_CLOCK_CYCLES( 5 )
    )
    i0_SRL_bit    (
        .clk        ( clk                                                       ),
        .rst        ( rst                                                       ),
        .ce         ( 1'b1                                                      ),
        .data_in    ( state_1 == ST_ACTIVE_0 && datain_valid && dataout_ready   ),
        .data_out   ( pool_out_valid                                            )
    );
	// END logic ------------------------------------------------------------------------------------------------------------------------------------


    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            img_row_count <= 0;       
            img_col_count <= 0;
        end else begin
            if(state_1 == ST_IDLE_1 && pipeline_active) begin
                img_col_count <= pad_amt;
                img_row_count <= pad_amt;
            end
            if(state_1 == ST_ACTIVE_0 && datain_valid && dataout_ready && pool_out_valid) begin
                img_col_count <= img_col_count + 1;
                if(img_col_count == (input_img_col - 1)) begin
                    img_col_count <= 0;
                    img_row_count <= img_row_count + 1;
                end
                if(img_col_count == ((input_img_col - 1) - pad_amt) && img_row_count == ((input_img_row - 1) - pad_amt)) begin 
                    img_col_count <= pad_amt;
                    img_row_count <= pad_amt;
                end
            end
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    //assign input_img_row      = opcode_r[`POOL_ENG_NUM_IMG_ROW_FIELD];
    //assign input_img_col      = opcode_r[`POOL_ENG_NUM_IMG_COL_FIELD]; 
    //assign num_maps           = opcode_r[`POOL_ENG_NUM_MAP_FIELD];
    //assign input_kernel_size  = opcode_r[`POOL_ENG_KERNEL_SIZE_FIELD];    
    assign input_img_row        = 10;
    assign input_img_col        = 10; 
    assign num_maps             = 2;
    assign input_kernel_size    = 3;   
    assign pad_amt              = (input_kernel_size - 1) >> 1; // dealing with square images, so padding is the same
    assign job_done             = (map_count == num_maps);
   
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
                    state_0             <= ST_DECODE_OPCODE;
                end
                ST_DECODE_OPCODE: begin
                    opcode_accept       <= 1;
                    pipeline_active     <= 1;
                    state_0             <= ST_BUSY;
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


    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign dataout          =  pool_out;                      
    assign dataout_valid    =   (    
                                    img_col_count >= pad_amt && img_col_count <= ((input_img_col - 1) - pad_amt) &&
                                    img_row_count >= pad_amt && img_row_count <= ((input_img_row - 1) - pad_amt) &&
                                    pool_out_valid && state_1 == ST_ACTIVE_0
                                );
    assign datain_ready     = (state_1 != ST_IDLE_1 && !initialize);
    
    always@(posedge clk) begin
        if(rst) begin
            map_count    <= 0;
            initialize   <= 0;
            state_1      <= ST_IDLE_1;
        end else begin
            initialize   <= 0;
            case(state_1)
                ST_IDLE_1: begin
                    if(pipeline_active) begin
                        state_1         <= ST_LOAD_ROW_BUFFERS;
                    end
                end
                ST_LOAD_ROW_BUFFERS: begin
                    if(&window_valid[7:0]) begin
                        state_1 <= ST_ACTIVE_0;
                    end
                end
                ST_ACTIVE_0: begin
                    if(img_col_count == ((input_img_col - 1) - pad_amt) && img_row_count == ((input_img_row - 1) - pad_amt)) begin 
                        map_count   <= map_count + 1;
                        initialize  <= 1;
                        state_1     <= ST_ACTIVE_1;
                    end
                end
                ST_ACTIVE_1: begin
                    if(map_count == num_maps) begin
                        map_count   <= 0;
                        state_1     <= ST_IDLE_1;
                    end else begin
                        state_1     <= ST_LOAD_ROW_BUFFERS;
                    end
                end
                default: begin

                end            
            endcase
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
`ifdef SIMULATION
    string state_0_s;
    always@(*) begin
        case(state_0)
            ST_IDLE_0           :   state_0_s = "ST_IDLE_0";
            ST_LOAD_OPCODE      :   state_0_s = "ST_LOAD_OPCODE";
            ST_DECODE_OPCODE    :   state_0_s = "ST_DECODE_OPCODE";
            ST_BUSY             :   state_0_s = "ST_BUSY";
        endcase
    end
    string state_1_s;
    always@(*) begin
        case(state_1)
            ST_IDLE_1           :   state_1_s = "ST_IDLE_1";
            ST_LOAD_ROW_BUFFERS :   state_1_s = "ST_LOAD_ROW_BUFFERS";
            ST_ACTIVE_0         :   state_1_s = "ST_ACTIVE_0";
            ST_ACTIVE_1         :   state_1_s = "ST_ACTIVE_1";
        endcase
    end
`endif
    
endmodule