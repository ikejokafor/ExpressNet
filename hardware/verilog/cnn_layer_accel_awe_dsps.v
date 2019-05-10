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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module cnn_layer_accel_awe_dsps #(
    parameter C_DATAIN_DELAY            = 0
) (
	rst						,
	clk						, 
	clk_5x					,
	
	new_map				    ,
	kernal_window_size      ,
	mode                    ,	
    
	cascade_datain			,
	cascade_carryin			,
	cascade_datain_valid	,
		
	ce0_pixel_valid		    ,
	ce0_pixel_datain		,
		
	ce1_pixel_valid	    	,
	ce1_pixel_datain 		,
		
	ce0_weight_valid		,
	ce0_weight_datain		,
	
	ce1_weight_valid		,
	ce1_weight_datain		,

	dataout_valid			,
	dataout_p				,
	dataout_c				,
		
	cascade_dataout			,
	cascade_carryout		,
	cascade_dataout_valid
	
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "cnn_layer_accel_defs.vh"	
	`include "awe.vh"
    `include "math.vh"
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Parameters
	//-----------------------------------------------------------------------------------------------------------------------------------------------	
	localparam C_PIXEL_DATAOUT_WIDTH    = `NUM_CE_PER_AWE * `PIXEL_WIDTH;
    localparam C_WHT_DOUT_WIDTH         = `WEIGHT_WIDTH * `NUM_DSP_PER_CE;
    
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
   	input  logic       							  rst			 	   ;
    input  logic         						  clk             	   ;
    input  logic         						  clk_5x          	   ;
	                                                                   
	input  logic        						  new_map		 	   ;		   
	input  logic [  C_KERNAL_SIZE_WIDTH-1:0]      kernal_window_size   ; 
	input  logic [         C_MODE_WIDTH-1:0]      mode                 ;	
    
	input  logic [     C_P_OUTPUT_WIDTH-1:0]      cascade_datain	   ;
	input  logic                                  cascade_carryin	   ;
	input  logic                                  cascade_datain_valid ;
		
	input  logic        					      ce0_pixel_valid      ;
	input  logic [C_PIXEL_DATAOUT_WIDTH-1:0]      ce0_pixel_datain	   ;
		
	input  logic        					      ce1_pixel_valid      ;
	input  logic [C_PIXEL_DATAOUT_WIDTH-1:0]      ce1_pixel_datain	   ;
	
	input  logic        					      ce0_weight_valid	   ;
	input  logic [     C_WHT_DOUT_WIDTH-1:0]      ce0_weight_datain	   ;
	
	input  logic        					      ce1_weight_valid	   ;
	input  logic [     C_WHT_DOUT_WIDTH-1:0]      ce1_weight_datain	   ;
	
	
	output logic  								  dataout_valid			;
	output logic                                  dataout_c	            ;
	output logic [     C_P_OUTPUT_WIDTH-1:0]      dataout_p				;
			
	output logic  								  cascade_dataout_valid	;
	output logic                                  cascade_carryout      ;
	output logic [     C_P_OUTPUT_WIDTH-1:0]      cascade_dataout		;
		

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Local Variables
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    logic     [       `PIXEL_WIDTH -1 :0 ]                 ce0_pixel_datain_upper		;
	logic     											   ce0_pixel_valid_upper		;
	
	logic     [       `PIXEL_WIDTH -1 :0 ]                 ce0_pixel_datain_lower		;
	logic     											   ce0_pixel_valid_lower		;
	
	logic     [       `WEIGHT_WIDTH -1 :0 ]                ce0_weight_datain_upper	    ;
	logic     											   ce0_weight_valid_upper		;
	
	logic     [       `WEIGHT_WIDTH -1 :0 ]                ce0_weight_datain_lower		;
	logic     											   ce0_weight_valid_lower		;
	
	logic     [       `PIXEL_WIDTH -1 :0 ]                 ce1_pixel_datain_upper		;
	logic     											   ce1_pixel_valid_upper		;
	
	logic     [       `PIXEL_WIDTH -1 :0 ]                 ce1_pixel_datain_lower		;
	logic     											   ce1_pixel_valid_lower		;
	
	logic     [       `WEIGHT_WIDTH -1 :0 ]                ce1_weight_datain_upper	    ;
	logic     											   ce1_weight_valid_upper		;
	
	logic     [       `WEIGHT_WIDTH -1 :0 ]                ce1_weight_datain_lower		;
	logic     											   ce1_weight_valid_lower		;
 
 
    logic  												    ce0_cascade_dataout_valid	;
	logic                                  					ce0_cascade_carryout        ;
	logic     [     C_P_OUTPUT_WIDTH-1:0]      				ce0_cascade_dataout		    ; 
 
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	
	
	     // Delay for ce0 upper      		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 0 + C_DATAIN_DELAY       ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH 		    )
    ) 
    i0_SRL_bus(
        .clk        ( clk_5x                       								),
        .ce         ( 1'b1                      								),
        .rst        ( rst                       								),
        .data_in    ( ce0_pixel_datain[C_PIXEL_DATAOUT_WIDTH-1:`PIXEL_WIDTH]  	),
        .data_out   ( ce0_pixel_datain_upper    								)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 0  + C_DATAIN_DELAY )
    ) 
    i0_SRL_bit(
        .clk        ( clk_5x                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( ce0_pixel_valid   	),
        .data_out   ( ce0_pixel_valid_upper )
    ); 	
	
     // Delay for ce0 lower        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1  + C_DATAIN_DELAY      ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH 		    )
    ) 
    i1_SRL_bus(
        .clk        ( clk_5x                       			),
        .ce         ( 1'b1                      			),
        .rst        ( rst                       			),
        .data_in    ( ce0_pixel_datain[`PIXEL_WIDTH-1:0]  	),
        .data_out   ( ce0_pixel_datain_lower    			)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 1  + C_DATAIN_DELAY)
    ) 
    i1_SRL_bit(
        .clk        ( clk_5x                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( ce0_pixel_valid   	),
        .data_out   ( ce0_pixel_valid_lower )
    ); 

	     // Delay for ce1 upper        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1  + C_DATAIN_DELAY                       ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH 		    )
    ) 
    i2_SRL_bus(
        .clk        ( clk_5x                       								),
        .ce         ( 1'b1                      								),
        .rst        ( rst                       								),
        .data_in    ( ce1_pixel_datain[C_PIXEL_DATAOUT_WIDTH-1:`PIXEL_WIDTH]  	),
        .data_out   ( ce1_pixel_datain_upper    								)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 1 + C_DATAIN_DELAY )
    ) 
    i2_SRL_bit (
        .clk        ( clk_5x                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( ce1_pixel_valid   	),
        .data_out   ( ce1_pixel_valid_upper )
    ); 

    
	 // Delay for ce1 lower        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2  + C_DATAIN_DELAY                       ),
        .C_DATA_WIDTH    ( `PIXEL_WIDTH 		    )
    ) 
    i3_SRL_bus (
        .clk        ( clk_5x                       			),
        .ce         ( 1'b1                      			),
        .rst        ( rst                       			),
        .data_in    ( ce1_pixel_datain[`PIXEL_WIDTH-1:0]  	),
        .data_out   ( ce1_pixel_datain_lower    			)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 2  + C_DATAIN_DELAY)
    ) 
    i3_SRL_bit (
        .clk        ( clk_5x                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( ce1_pixel_valid   	),
        .data_out   ( ce1_pixel_valid_lower )
    ); 
	
	// Delaying the weights in a similar fashion 
	
	SRL_bus #(  
        .C_CLOCK_CYCLES  ( 0   + C_DATAIN_DELAY                      ),
        .C_DATA_WIDTH    ( `WEIGHT_WIDTH 		    )
    ) 
    i4_SRL_bus (
        .clk        ( clk_5x                       			),
        .ce         ( 1'b1                      			),
        .rst        ( rst                       			),
        .data_in    ( ce0_weight_datain[C_WHT_DOUT_WIDTH-1:`WEIGHT_WIDTH]  ),
        .data_out   ( ce0_weight_datain_upper    			)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 0 + C_DATAIN_DELAY )
    ) 
    i4_SRL_bit (
        .clk        ( clk_5x                    ),
        .rst        ( rst                    ),
        .ce         ( 1'b1                   ),
        .data_in    ( ce0_weight_valid   	 ),
        .data_out   ( ce0_weight_valid_upper )
    ); 
	
	
     // Delay for ce0 lower        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1   + C_DATAIN_DELAY                      ),
        .C_DATA_WIDTH    ( `WEIGHT_WIDTH 		    )
    ) 
    i5_SRL_bus (
        .clk        ( clk_5x                       			),
        .ce         ( 1'b1                      			),
        .rst        ( rst                       			),
        .data_in    ( ce0_weight_datain[`WEIGHT_WIDTH-1:0]  ),
        .data_out   ( ce0_weight_datain_lower    			)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 1 + C_DATAIN_DELAY )
    ) 
    i5_SRL_bit (
        .clk        ( clk_5x                    ),
        .rst        ( rst                    ),
        .ce         ( 1'b1                   ),
        .data_in    ( ce0_weight_valid   	 ),
        .data_out   ( ce0_weight_valid_lower )
    ); 

	     // Delay for ce1 upper        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 1  + C_DATAIN_DELAY                       ),
        .C_DATA_WIDTH    ( `WEIGHT_WIDTH 		    )
    ) 
    i6_SRL_bus (
        .clk        ( clk_5x                       							),
        .ce         ( 1'b1                      							),
        .rst        ( rst                       							),
        .data_in    ( ce1_weight_datain[C_WHT_DOUT_WIDTH-1:`WEIGHT_WIDTH]  	),
        .data_out   ( ce1_weight_datain_upper    							)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 1 + C_DATAIN_DELAY )
    ) 
    i6_SRL_bit (
        .clk        ( clk_5x                    ),
        .rst        ( rst                    ),
        .ce         ( 1'b1                   ),
        .data_in    ( ce1_weight_valid   	 ),
        .data_out   ( ce1_weight_valid_upper )
    ); 

    
	 // Delay for ce1 lower        		   
    SRL_bus #(  
        .C_CLOCK_CYCLES  ( 2  + C_DATAIN_DELAY                       ),
        .C_DATA_WIDTH    ( `WEIGHT_WIDTH 		    )
    ) 
    i7_SRL_bus (
        .clk        ( clk_5x                       			),
        .ce         ( 1'b1                      			),
        .rst        ( rst                       			),
        .data_in    ( ce1_weight_datain[`WEIGHT_WIDTH-1:0]  ),
        .data_out   ( ce1_weight_datain_lower    			)
    ); 
	
	SRL_bit #(
        .C_CLOCK_CYCLES( 2 + C_DATAIN_DELAY )
    ) 
    i7_SRL_bit (
        .clk        ( clk_5x                   ),
        .rst        ( rst                   ),
        .ce         ( 1'b1                  ),
        .data_in    ( ce1_weight_valid   	),
        .data_out   ( ce1_weight_valid_lower )
    ); 
	
	
			
			
	cnn_layer_accel_ce_dsps #(
    )
	i0_cnn_layer_accel_ce_dsps (	
		.rst						( rst								),
		.clk						( clk								), 
		.clk_5x					    ( clk_5x							),
		.new_map				    ( new_map							),
		.kernal_window_size			( kernal_window_size				),
		.mode						( mode  						    ),	
		.cascade_datain			    ( cascade_datain       			    ),    
		.cascade_carryin			( cascade_carryin      			    ),
		.cascade_datain_valid	    ( cascade_datain_valid 			    ),
		.pixel_valid_upper		    ( ce0_pixel_valid_upper 		    ),
		.pixel_datain_upper		    ( ce0_pixel_datain_upper			),
		.pixel_valid_lower	    	( ce0_pixel_valid_lower				),
		.pixel_datain_lower 		( ce0_pixel_datain_lower			),
		.weight_valid_upper			( ce0_weight_valid_upper			), 
		.weight_datain_upper		( ce0_weight_datain_upper			),
		.weight_valid_lower			( ce0_weight_valid_lower			), 
		.weight_datain_lower		( ce0_weight_datain_lower			),
		.dataout_valid				(									),
		.dataout_p					(									),
		.dataout_c					(									),
		.cascade_dataout			( ce0_cascade_dataout				),
		.cascade_carryout			( ce0_cascade_carryout				),
		.cascade_dataout_valid		( ce0_cascade_dataout_valid			)
		
    );
	

	cnn_layer_accel_ce_dsps #(
    )
	i1_cnn_layer_accel_ce_dsps (	
		.rst						( rst								),
		.clk						( clk								), 
		.clk_5x					    ( clk_5x							),
		.new_map				    ( new_map							),
		.kernal_window_size			( kernal_window_size				),
		.mode						( mode							    ),	
		.cascade_datain			    ( ce0_cascade_dataout       	    ),    
		.cascade_carryin			( ce0_cascade_carryout      	    ),
		.cascade_datain_valid	    ( ce0_cascade_dataout_valid 	    ),
		.pixel_valid_upper		    ( ce1_pixel_valid_upper 		    ),
		.pixel_datain_upper		    ( ce1_pixel_datain_upper			),
		.pixel_valid_lower	    	( ce1_pixel_valid_lower				),
		.pixel_datain_lower 		( ce1_pixel_datain_lower			),
		.weight_valid_upper			( ce1_weight_valid_upper			), 
		.weight_datain_upper		( ce1_weight_datain_upper			),
		.weight_valid_lower			( ce1_weight_valid_lower			), 
		.weight_datain_lower		( ce1_weight_datain_lower			),
		.dataout_valid				( dataout_valid						),
		.dataout_p					( dataout_p							),
		.dataout_c					( dataout_c							),
		.cascade_dataout			( cascade_dataout					),
		.cascade_carryout			( cascade_carryout					),
		.cascade_dataout_valid		( cascade_dataout_valid				)
		
    );
			
			
	// END logic ------------------------------------------------------------------------------------------------------------------------------------
    
    
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
	// DEBUG ----------------------------------------------------------------------------------------------------------------------------------------

	
	
endmodule

