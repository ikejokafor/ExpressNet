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
`ifndef __CNN_LAYER_ACCEL_CONV1X1_PIP__
`define __CNN_LAYER_ACCEL_CONV1X1_PIP__


//-----------------------------------------------------------------------------------------------------------------------------------------------
//  Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "utilities.svh"


`define KRNL_1X1_BRAM_WR_WTH     	1024 // TODO: Remove hard coding
`define KRNL_1X1_BRAM_WR_DTH     	8192 // TODO: Remove hard coding   
`define KRNL_1X1_BRAM_RD_WTH     	1024 // TODO: Remove hard coding
`define KRNL_1X1_BRAM_RD_DTH     	8192 // TODO: Remove hard coding    
`define KRNL_1X1_BIAS_BRAM_WR_WTH	1024 // TODO: Remove hard coding
`define KRNL_1X1_BIAS_BRAM_WR_DTH	8192 // TODO: Remove hard coding   
`define KRNL_1X1_BIAS_BRAM_RD_WTH	32 // TODO: Remove hard coding
`define KRNL_1X1_BIAS_BRAM_RD_DTH	262144 // TODO: Remove hard coding    


`endif
