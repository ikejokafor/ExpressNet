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
    parameter C_DATAIN_WIDTH    = 128,
    parameter C_DATAOUT_WIDTH   = 128,
	parameter C_OPCODE_WIDTH    = 64,
    parameter C_PIXEL_WIDTH     = 16,
    parameter C_MAX_IMG_WIDTH   = 10,
    parameter C_POOL_WINDOW_SZ  = 3
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
    localparam ST_ACTIVE                = 4'b0100;
    localparam ST_FLUSH_PIPELINE        = 4'b1000;
    

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
	output   								datain_ready;
	
	output	[C_DATAOUT_WIDTH-1:0]			dataout;
	output									dataout_valid;
	input									dataout_ready;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg [3:0]                           state_0;
    reg [3:0]                           state_1;
    reg [C_OPCODE_WIDTH-1:0]            opcode_r;
    
    reg                                 input_buffer_rden;
    wire [C_PIXEL_WIDTH - 1:0]          input_buffer_dataout;       
    wire                                input_buffer_empty;        
    wire                                input_buffer_full; 

    wire                                output_buffer_wren;
    wire                                output_buffer_full;
    wire [C_PIXEL_WIDTH - 1:0]          output_buffer_datain;    

    reg [clog2(C_MAX_IMG_WIDTH) - 1:0]  i0_row_buffer_wr_addr;    
    reg [clog2(C_MAX_IMG_WIDTH) - 1:0]  i0_row_buffer_wr_addr_r;  
    wire [C_PIXEL_WIDTH - 1:0]          i0_row_buffer_datain;     
    wire                                i0_row_buffer_wren;
    reg                                 i0_row_buffer_wren_r;
    reg                                 i0_row_buffer_rden;       
    wire [C_PIXEL_WIDTH - 1:0]          i0_row_buffer_dataout;      
    wire                                i0_row_buffer_full;       
    wire [clog2(C_MAX_IMG_WIDTH):0]     i0_row_buffer_count;    

    reg [clog2(C_MAX_IMG_WIDTH) - 1:0]  i1_row_buffer_wr_addr;
    reg [clog2(C_MAX_IMG_WIDTH) - 1:0]  i1_row_buffer_wr_addr_r;

    wire                                i1_row_buffer_wren;
    reg                                 i1_row_buffer_wren_r;
    reg                                 i1_row_buffer_rden;       
    wire [C_PIXEL_WIDTH - 1:0]          i1_row_buffer_dataout;     
    wire                                i1_row_buffer_full;  
    wire [clog2(C_MAX_IMG_WIDTH):0]     i1_row_buffer_count;      

    reg [C_PIXEL_WIDTH - 1:0]           i0_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i1_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i2_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i2_SRL_bus_out_r;
    reg [C_PIXEL_WIDTH - 1:0]           i3_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i4_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i5_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i5_SRL_bus_out_r;
    reg [C_PIXEL_WIDTH - 1:0]           i6_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i7_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i8_SRL_bus_out;
    reg [C_PIXEL_WIDTH - 1:0]           i8_SRL_bus_out_r;
   
    reg [C_PIXEL_WIDTH - 1:0]           partial_max0_0;  
    reg [C_PIXEL_WIDTH - 1:0]           partial_max0_1;  
    reg [C_PIXEL_WIDTH - 1:0]           partial_max0_2;
    reg [C_PIXEL_WIDTH - 1:0]           partial_max1_1;  
    reg [C_PIXEL_WIDTH - 1:0]           partial_max1_2; 
    reg [C_PIXEL_WIDTH - 1:0]           partial_max1_3;   
    reg [C_PIXEL_WIDTH - 1:0]           partial_max2;    
    reg [C_PIXEL_WIDTH - 1:0]           partial_max1_3_r;

    reg [C_PIXEL_WIDTH - 1:0]           pool_out; 
    reg [1:0]                           row_buffer_select;
    wire                                pool_out_valid;
    
    wire [15:0]                         input_img_row; 
    wire [15:0]                         input_img_col; 
    reg  [15:0]                         img_row_count;
    reg  [15:0]                         img_col_count;
    reg  [15:0]                         map_count;
    wire [15:0]                         num_maps;
    reg  [15:0]                         pad_amt;
    wire [15:0]                         num_output_pixels;
    reg  [15:0]                         num_output_pixels_count;
    wire                                pipeline_active;
    reg                                 init_pipeline;
    reg  [15:0]                         output_count;
 
 
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
        .empty          (                                           ),
        .full           ( output_buffer_full                        ),
        .almost_full    (                                           )
    );


    row_buffer #(
       .C_PIXEL_WIDTH ( C_PIXEL_WIDTH     ),
       .C_IMAGE_WIDTH ( C_MAX_IMG_WIDTH     ) 
    ) 
    i0_row_buffer(
        .wr_addr    ( i0_row_buffer_wr_addr     ),
        .din        ( i0_row_buffer_datain      ),
        .clk        ( clk                       ),  
        .wren       ( i0_row_buffer_wren        ),
        .rden       ( i0_row_buffer_rden        ),
        .rst        ( rst                       ),
        .dout       ( i0_row_buffer_dataout     ),
        .full       ( i0_row_buffer_full        ),
        .count      ( i0_row_buffer_count       )
    );	

    
    row_buffer #(
       .C_PIXEL_WIDTH  ( C_PIXEL_WIDTH      ),
       .C_IMAGE_WIDTH  ( C_MAX_IMG_WIDTH    ) 
    ) 
    i1_row_buffer(
        .wr_addr    ( i1_row_buffer_wr_addr    ),
        .din        ( input_buffer_dataout     ),
        .clk        ( clk                      ),      
        .wren       ( i1_row_buffer_wren       ),
        .rden       ( i1_row_buffer_rden       ),
        .rst        ( rst                      ),
        .dout       ( i1_row_buffer_dataout    ),
        .full       ( i1_row_buffer_full       ),
        .count      ( i1_row_buffer_count      )
    );

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        i0_SRL_bus_out      <= input_buffer_dataout;
        i1_SRL_bus_out      <= i0_SRL_bus_out;
        i2_SRL_bus_out      <= i1_SRL_bus_out;
        i2_SRL_bus_out_r    <= i2_SRL_bus_out;
        
        i3_SRL_bus_out      <= i1_row_buffer_dataout;
        i4_SRL_bus_out      <= i3_SRL_bus_out;
        i5_SRL_bus_out      <= i4_SRL_bus_out;
        i5_SRL_bus_out_r    <= i5_SRL_bus_out;
        
        i6_SRL_bus_out      <= i0_row_buffer_dataout;
        i7_SRL_bus_out      <= i6_SRL_bus_out;
        i8_SRL_bus_out      <= i7_SRL_bus_out;
        i8_SRL_bus_out_r    <= i8_SRL_bus_out;
        
        partial_max0_0      <= (i0_SRL_bus_out > i1_SRL_bus_out) ? i0_SRL_bus_out : i1_SRL_bus_out;
        partial_max0_1      <= (i3_SRL_bus_out > i4_SRL_bus_out) ? i3_SRL_bus_out : i4_SRL_bus_out;
        partial_max0_2      <= (i6_SRL_bus_out > i7_SRL_bus_out) ? i6_SRL_bus_out : i7_SRL_bus_out;

        partial_max1_1      <= (partial_max0_0 > i2_SRL_bus_out_r) ? partial_max0_0 : i2_SRL_bus_out_r;
        partial_max1_2      <= (partial_max0_1 > i5_SRL_bus_out_r) ? partial_max0_1 : i5_SRL_bus_out_r;
        partial_max1_3      <= (partial_max0_2 > i8_SRL_bus_out_r) ? partial_max0_2 : i8_SRL_bus_out_r;  
        
        partial_max2        <= (partial_max1_1 > partial_max1_2) ? partial_max1_1 : partial_max1_2;
        
        partial_max1_3_r    <= partial_max1_3;

        pool_out            <= (partial_max2 > partial_max1_3_r) ? partial_max2 : partial_max1_3_r;
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            img_row_count <= 0;       
            img_col_count <= 0;
        end else begin
            if(state_1 == ST_ACTIVE && !input_buffer_empty) begin // as along as active, outputing valid pixel every cycle
                img_col_count <= img_col_count + 1;
                if(img_col_count == input_img_col) begin
                    img_col_count <= 0;
                    img_row_count <= img_row_count + 1;
                end
                if(img_col_count == input_img_col && img_row_count == input_img_row) begin
                    img_col_count <= 0;
                    img_row_count <= 0;
                end
            end
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
        // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------    
    always@(posedge clk) begin
        if(rst) begin
            output_count <= 0;       
        end else begin
            if(state_1 == ST_ACTIVE) begin // as along as active, outputing valid pixel every cycle
                output_count <= output_count + 1;
            end
        end
    end
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    

    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    //assign input_img_row      = opcode_r[`POOL_ENG_NUM_IMG_ROW_FIELD];
    //assign input_img_col      = opcode_r[`POOL_ENG_NUM_IMG_COL_FIELD]; 
    //assign num_maps           = opcode_r[`POOL_ENG_NUM_MAP_FIELD];
    //assign num_output_pixels  = opcode_r[`POOL_ENG_NUM_OUT_PIXELS_FIELD]
    
    assign input_img_row        = 10;
    assign input_img_col        = 10; 
    assign num_maps             = 1;
    assign num_output_pixels    = 100;
    assign dataout_valid        = !output_buffer_full;
    
    always@(posedge clk) begin
        if(rst) begin
            opcode_r                <= 0;
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            init_pipeline           <= 0;
            state_0                 <= ST_IDLE_0;
        end else begin
            opcode_accept           <= 0;
            opcode_complete         <= 0;
            init_pipeline           <= 0;
            case(state_0)
                ST_IDLE_0: begin
                    if(opcode_valid) begin
                        opcode_r        <= opcode;
                        state_0         <= ST_LOAD_OPCODE;
                    end
                end
                ST_LOAD_OPCODE: begin
                    pad_amt             <= (C_POOL_WINDOW_SZ - 1) >> 1; // dealing with square images, so padding is the same
                    state_0             <= ST_DECODE_OPCODE;
                end
                ST_DECODE_OPCODE: begin
                    opcode_accept   <= 1;
                    init_pipeline   <= 1;
                    state_0         <= ST_BUSY;
                end
                ST_BUSY: begin
                    if(map_count == num_maps) begin
                        opcode_complete <= 1;
                        state_0         <= ST_IDLE_0;
                    end                   
                end
                default: begin

                end            
            endcase
        end
    end  
	// END logic ------------------------------------------------------------------------------------------------------------------------------------  

    
    // BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
    assign output_buffer_datain  =  (    
                                        img_col_count >= pad_amt && img_col_count <= ((input_img_col - 1) - pad_amt) &&
                                        img_row_count >= pad_amt && img_row_count <= ((input_img_row - 1) - pad_amt)  
                                    ) ? pool_out : 0;
    assign output_buffer_wren    = (state_1 == ST_ACTIVE);
    assign i0_row_buffer_datain  = (state_1 == ST_LOAD_ROW_BUFFERS) ? input_buffer_dataout : i1_row_buffer_dataout;
    assign i0_row_buffer_wren    = i0_row_buffer_wren_r;
    assign i1_row_buffer_wren    = i1_row_buffer_wren_r;
    assign datain_ready          = (!input_buffer_full) && (state_1 != ST_IDLE_1 || state_1 != ST_FLUSH_PIPELINE);
    assign pipeline_active       = (state_1 == ST_ACTIVE);

    always@(posedge clk) begin
        if(rst) begin
            i0_row_buffer_wr_addr   <= 0;
            i1_row_buffer_wr_addr   <= 0;
            i0_row_buffer_wr_addr_r <= 0;
            i1_row_buffer_wr_addr_r <= 0;            
            i0_row_buffer_rden      <= 0;
            i1_row_buffer_rden      <= 0;
            i0_row_buffer_wren_r    <= 0;
            i1_row_buffer_wren_r    <= 0;
            input_buffer_rden       <= 0;
            row_buffer_select       <= {1'b0, 1'b1};
            map_count               <= 0;
            state_1                 <= ST_IDLE_1;
        end else begin
            i0_row_buffer_rden      <= 0;
            i1_row_buffer_rden      <= 0;
            i0_row_buffer_wren_r    <= 0;
            i1_row_buffer_wren_r    <= 0;
            input_buffer_rden       <= 0;
            case(state_1)
                ST_IDLE_1: begin
                    if(init_pipeline) begin
                        state_1  <= ST_LOAD_ROW_BUFFERS;
                    end
                end
                ST_LOAD_ROW_BUFFERS: begin
                    if(!input_buffer_empty) begin
                        if(row_buffer_select[0] && !(i0_row_buffer_count == input_img_col)) begin
                            input_buffer_rden       <= 1;
                            i0_row_buffer_wren_r    <= 1;
                            i0_row_buffer_wr_addr_r <= i0_row_buffer_wr_addr_r + 1;
                            i0_row_buffer_wr_addr   <= i0_row_buffer_wr_addr_r;
                        end else if(row_buffer_select[1] && !(i1_row_buffer_count == input_img_col)) begin
                            input_buffer_rden       <= 1;
                            i1_row_buffer_wren_r    <= 1;
                            i1_row_buffer_wr_addr_r <= i1_row_buffer_wr_addr_r + 1;
                            i1_row_buffer_wr_addr   <= i1_row_buffer_wr_addr_r;
                        end                   
                        if(i0_row_buffer_count == (input_img_col - 1)) begin
                            row_buffer_select       <= {row_buffer_select[0], row_buffer_select[1]};
                            i0_row_buffer_wren_r    <= 0;
                            input_buffer_rden       <= 1;
                            i1_row_buffer_wren_r    <= 1;
                            i1_row_buffer_wr_addr_r <= i1_row_buffer_wr_addr_r + 1;
                            i1_row_buffer_wr_addr   <= i1_row_buffer_wr_addr_r;
                        end
                        if(i1_row_buffer_count == (input_img_col - 1)) begin
                            input_buffer_rden       <= 0;
                        end 
                        if((i0_row_buffer_count == input_img_col) && (i1_row_buffer_count == input_img_col) && input_buffer_full) begin
                            row_buffer_select       <= {row_buffer_select[0], row_buffer_select[1]};
                            i0_row_buffer_wr_addr   <= input_img_col - 1;
                            i1_row_buffer_wr_addr   <= input_img_col - 1;
                            state_1                 <= ST_ACTIVE;
                        end
                    end
                end
                ST_ACTIVE: begin
                    //if(!input_buffer_empty && !output_buffer_full) begin
                    if(!input_buffer_empty) begin
                        i0_row_buffer_rden      <= pipeline_active;
                        i1_row_buffer_rden      <= pipeline_active;
                        i0_row_buffer_wren_r    <= pipeline_active;
                        i1_row_buffer_wren_r    <= pipeline_active;
                        input_buffer_rden       <= pipeline_active;
                    end
                    if(img_col_count == input_img_col && img_row_count == input_img_row) begin 
                        // since output will always be same same as input, and for resonable image sizes (ie >> 3x3)
                        // no need to explicit flush pipeline (ie, clock num_filter_latency_cycles after valid output)
                        map_count   <= map_count + 1;
                        state_1     <= ST_FLUSH_PIPELINE;
                    end
                end
                ST_FLUSH_PIPELINE: begin
                    i0_row_buffer_wr_addr   <= 0;
                    i1_row_buffer_wr_addr   <= 0;
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
                ST_ACTIVE           :   state_1_s = "ST_ACTIVE";
                ST_FLUSH_PIPELINE   :   state_1_s = "ST_FLUSH_PIPELINE";
            endcase
        end
    `endif
    
endmodule