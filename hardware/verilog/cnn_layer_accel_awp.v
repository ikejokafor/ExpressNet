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
module cnn_layer_accel_awp #(
    parameter C_NUM_NETWORK_IF  = 1,
    parameter C_PACKET_WIDTH    = 128,
    parameter C_NUM_QUADS       = 1,
    parameter C_NUM_AWE         = 4,
    parameter C_NUM_CE_PER_AWE  = 2,
    parameter C_PIXEL_WIDTH     = 16,
    parameter C_BRAM_DEPTH      = 1024,
    parameter C_SEQ_DATA_WIDTH  = 16
) (
    clk_500MHz                  ,
    accel_rst                   ,
    
    network_rst                 ,
	network_clk                 ,
	
	from_network_valid			,
	from_network_accept		    ,
	from_network_payload		,
	
	to_network_valid			,
	to_network_accept			,
	to_network_payload			
);

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	`include "math.vh"
    `include "cnn_layer_accel_defs.vh"
 

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    localparam C_PAYLOAD_WIDTH = C_NUM_NETWORK_IF * C_PACKET_WIDTH;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Inputs / Output Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    input                               clk_500MHz              ;       
	input	                            accel_rst    			;

    input	                            network_rst             ;
	input	                            network_clk             ;

	input	[C_NUM_NETWORK_IF - 1:0]    from_network_valid		;
	output  [C_NUM_NETWORK_IF - 1:0]    from_network_accept		;
	input	[C_PAYLOAD_WIDTH  - 1:0]    from_network_payload	;

	output	[C_NUM_NETWORK_IF - 1:0]	to_network_valid		;
	input	[C_NUM_NETWORK_IF - 1:0]	to_network_accept		;
	output	[C_PAYLOAD_WIDTH  - 1:0]	to_network_payload		;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Wires / Regs
	//----------------------------------------------------------------------------------------------------------------------------------------------- 
    reg         seq_wren            ;
    wire        seq_rden            ;
    reg [ 8:0]  seq_wrAddr          ;
    reg [11:0]  seq_rdAddr          ;
    reg [15:0]  seq_dataout         ;

    reg         pixel_datain_valid  ;
    reg         config_wren         ;
    reg         weight_wren         ;
    genvar      i                   ;

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Instantiations
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    // Sequence BRAM Specs
    // Write Width: 128 bits
    // Write Depth: 512
    // Read Width:  16 bits
    // Read Depth:  4096
    xilinx_dual_port_2_clock_ram
    sequencer (
        .clka     ( network_clk             ),
        .wea      ( seq_wren                ),
        .addra    ( seq_wrAddr              ),    
        .dina     ( from_network_payload    ),
        .clkb     ( clk_500MHz              ),
        .enb      ( seq_rden                ),
        .addrb    ( seq_rdAddr              ),
        .doutb    ( seq_dataout             )
    );
    

    generate
        for(i = 0; i < C_NUM_QUADS; i = i + 1) begin
            cnn_layer_accel_quad #(
                .C_NUM_AWE          ( C_NUM_AWE         ),     
                .C_NUM_CE_PER_AWE   ( C_NUM_CE_PER_AWE  ),      
                .C_PIXEL_WIDTH      ( C_PIXEL_WIDTH     ),          
                .C_BRAM_DEPTH       ( C_BRAM_DEPTH      ),            
                .C_SEQ_DATA_WIDTH   ( C_SEQ_DATA_WIDTH  )            
            ) 
            i0_cnn_layer_accel_quad (
                .network_clk            ( network_clk               ),
                .network_rst            ( network_rst               ),
                .clk_500MHz             ( clk_500MHz                ),
                .accel_rst              ( accel_rst                 ),
                .pixel_datain_valid     ( pixel_datain_valid        ),
                .weight_wren            ( weight_wren               ),
                .config_wren            ( config_wren               ),
                .datain                 ( from_network_payload      ),   
                .seq_rden               ( seq_rden                  ),
                .seq_datain             ( seq_dataout               ),
                .from_network_valid	    ( from_network_valid	    ),
                .from_network_accept    ( from_network_accept	    ),
                .from_network_payload   ( from_network_payload      ),
                .to_network_valid		( to_network_valid		    ),
                .to_network_accept		( to_network_accept		    ),
                .to_network_payload		( to_network_payload		)         
            );
        end
    endgenerate
    
    
    // BEGIN Network Output Data Logic --------------------------------------------------------------------------------------------------------------
    always@(posedge network_clk) begin
        if(accel_rst) begin
            seq_wren                <= 0;
            seq_wrAddr              <= 0;
            seq_rdAddr              <= 0;
            config_wren             <= 0;
            weight_wren             <= 0;
            pixel_datain_valid      <= 0;
        end else begin
            seq_wren                <= 0;
            config_wren             <= 0;
            weight_wren             <= 0;
            pixel_datain_valid      <= 0;
            /*
            if() begin
                config_wren
            end
            if() begin
                weight_wren
            end
            if() begin
                pixel_datain_valid
            end
            
            // sequence data logic
            if() begin
                seq_wren
            end
            */
            if(seq_wren) begin
                seq_wrAddr <= seq_wrAddr + 1;
            end
            //if() begin
            //    seq_wrAddr <= 0;
            //end
            if(seq_rden) begin
                seq_rdAddr <= seq_rdAddr + 1;
            end 
            //if() begin
            //    seq_rdAddr <= 0;
            //end            
        end
    end
    // END Network Output Data Logic ----------------------------------------------------------------------------------------------------------------
    
    /*
    // BEGIN Network Input Data Logic --------------------------------------------------------------------------------------------------------------- 
    always@(posedge network_clk) begin
        if(accel_rst) begin
        
        end else begin
        
        end 
    end
    // END Network Input Data Logic -----------------------------------------------------------------------------------------------------------------
    */
    
endmodule