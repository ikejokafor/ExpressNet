///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

`ifndef __CNN_LAYER_ACCEL_DEFINES__
`define __CNN_LAYER_ACCEL_DEFINES__

//-----------------------------------------------------------------------------------------------------------------------------------------------
//	Includes
//-----------------------------------------------------------------------------------------------------------------------------------------------
`include "tile_router_v1_00_a_defines.vh"

//---------------------------------------------------------------------------------------------------------------------------------------------------   
// MSC definitions 
//---------------------------------------------------------------------------------------------------------------------------------------------------
`define NUM_ENGINES                         16'd4
`define NUM_FLITS                           16'd1
`define NUM_TRANSACTORS                     16'd1
`define NUM_SLAVE_REGS                      16'd1
`define SOC_IT_DATAIN_WIDTH                 16'd128
`define DSP_LATENCY                         16'd4
`define NUM_MAST_INF_CLIENTS                16'd1
`define BITS_PER_BYTE                       16'd8
`define MAX_CELL_KEYPOINTS                  16'd16
`define BYTE_PER_ELEMENT                    16'd4


//--------------------------------------------------------------------------------------------------------------------------------------------------
// CONMAND DATA FIELDS
//--------------------------------------------------------------------------------------------------------------------------------------------------
// COMMAND 0
`define CMD_DATA_WIDTH                   64
`define CMD_DATA_FIELD_LOW               0
`define CMD_DATA_FIELD_HIGH              (`CMD_DATA_FIELD_LOW + `CMD_DATA_WIDTH - 1)
`define CMD_DATA_FIELD                   (`CMD_DATA_FIELD_HIGH):(`CMD_DATA_FIELD_LOW)


//--------------------------------------------------------------------------------------------------------------------------------------------------
// TILE ROUTER PORT CONFIGS
//--------------------------------------------------------------------------------------------------------------------------------------------------
parameter C_PORT_CONFIG_NONE            = 0;
parameter C_PORT_CONFIG_LAYER_ENGINE_IO = 1;
parameter C_PORT_CONFIG_LAYER_BRIDGE    = 2;
parameter C_PORT_CONFIG_DATA_MOVER_RD   = 3;
parameter C_PORT_CONFIG_DATA_MOVER_WR   = 4;
parameter C_PORT_CONFIG_CONTROLLER      = 5;
parameter C_PORT_CONFIG_MSG_INTF        = 6;

parameter C_COL                         = 0;
parameter C_ROW                         = 1;

`define NUM_ROWS            16'd7
`define NUM_COLS            16'd2
`define NUM_PE              16'd4
`define NUM_PE_TYPES        16'd7
`define NUM_DATA_MOVERS     16'd6
`define NUM_LAYER_ENG_PE    (`NUM_ROWS - 1)

`define	PACKET_WIDTH	        16'd66
`define NUM_LAYER_ENG_IO        (`NUM_PE * `NUM_LAYER_ENG_PE * `NUM_COLS)
`define NUM_LAYER_BRIDGE        16'd1
`define NUM_LAYER_ENG_CTRL      16'd1
`define NUM_MSG_INTF            16'd1

`define NUM_CONFIG_ROW  `NUM_COLS
`define NUM_CONFIG_COL  `NUM_PE


function integer rd_data_mover_idx;
	input integer r;
	input integer c;
	input integer p;
    input integer NUM_CONFIG_ROW;
    input integer NUM_CONFIG_COL;
    
    integer idx;
    idx = router_index(r, c, p, NUM_CONFIG_ROW, NUM_CONFIG_COL);
	begin
        rd_data_mover_idx = idx - (`NUM_LAYER_ENG_IO);
    end
endfunction

function integer wr_data_mover_idx;
	input integer r;
	input integer c;
	input integer p;
    input integer NUM_CONFIG_ROW;
    input integer NUM_CONFIG_COL;
    
    integer idx;
    idx = router_index(r, c, p, NUM_CONFIG_ROW, NUM_CONFIG_COL);
	begin
        wr_data_mover_idx = (idx - (`NUM_LAYER_ENG_IO + `NUM_PE)) + 3;
    end
endfunction


function integer lyr_eng_idx;
	input integer i;
    
	begin
        lyr_eng_idx = (i / 2);
    end
endfunction
































`define TRANSACTOR_MODE_KEEP_QUEUE_OCCUPIED				1'b0
`define TRANSACTOR_MODE_KEEP_QUEUE_EMPTY				1'b1

`define PACKETIZER_MODE_ROUTE_MATCH						2'b00
`define PACKETIZER_MODE_ROUTE_FIXED						2'b01

`define INGRESS_CMD_FETCH_INJECT						2'b00
`define INGRESS_CMD_FETCH_CACHE							2'b01
`define INGRESS_CMD_STORE								2'b10

`define PACKET_PAYLOAD_FIELD							127:0
`define PACKET_HEADER_DEST_FIELD						139:128

`define MATCH_MODEL_ID_HIGH								47

`define KEYPOINT_ID_WIDTH								16

`define MATCH_INFO_QUERY_KEYPOINT_ID_WIDTH				`KEYPOINT_ID_WIDTH
`define MATCH_INFO_QUERY_KEYPOINT_ID_LOW				0
`define MATCH_INFO_QUERY_KEYPOINT_ID_HIGH				(`MATCH_INFO_QUERY_KEYPOINT_ID_LOW + `MATCH_INFO_QUERY_KEYPOINT_ID_WIDTH - 1)
`define MATCH_INFO_QUERY_KEYPOINT_ID_FIELD				(`MATCH_INFO_QUERY_KEYPOINT_ID_HIGH):(`MATCH_INFO_QUERY_KEYPOINT_ID_LOW)

`define MATCH_INFO_MODEL_KEYPOINT_ID_WIDTH				`KEYPOINT_ID_WIDTH
`define MATCH_INFO_MODEL_KEYPOINT_ID_LOW				(`MATCH_INFO_QUERY_KEYPOINT_ID_HIGH + 1)
`define MATCH_INFO_MODEL_KEYPOINT_ID_HIGH				(`MATCH_INFO_MODEL_KEYPOINT_ID_LOW + `MATCH_INFO_MODEL_KEYPOINT_ID_WIDTH - 1)
`define MATCH_INFO_MODEL_KEYPOINT_ID_FIELD				(`MATCH_INFO_MODEL_KEYPOINT_ID_HIGH):(`MATCH_INFO_MODEL_KEYPOINT_ID_LOW)

`define MATCH_INFO_SCORE_WIDTH							32
`define MATCH_INFO_SCORE_LOW							(`MATCH_INFO_MODEL_KEYPOINT_ID_HIGH + 1)
`define MATCH_INFO_SCORE_HIGH							(`MATCH_INFO_SCORE_LOW + `MATCH_INFO_SCORE_WIDTH - 1)
`define MATCH_INFO_SCORE_FIELD							(`MATCH_INFO_SCORE_HIGH):(`MATCH_INFO_SCORE_LOW)
																	
`define MATCH_TABLE_SCORE_WIDTH                         `MATCH_INFO_SCORE_WIDTH

`define MATCH_TABLE_1ST_SCORE_WIDTH                     `MATCH_TABLE_SCORE_WIDTH
`define MATCH_TABLE_1ST_SCORE_LOW                       0
`define MATCH_TABLE_1ST_SCORE_HIGH                      (`MATCH_TABLE_1ST_SCORE_LOW + `MATCH_TABLE_SCORE_WIDTH - 1)
`define MATCH_TABLE_1ST_SCORE_FIELD                     (`MATCH_TABLE_1ST_SCORE_HIGH):(`MATCH_TABLE_1ST_SCORE_LOW)

`define MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_WIDTH         (`KEYPOINT_ID_WIDTH)
`define MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_LOW           (`MATCH_TABLE_1ST_SCORE_HIGH + 1)
`define MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_HIGH          (`MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_LOW + `MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_WIDTH - 1)
`define MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_FIELD         (`MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_HIGH):(`MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_LOW)

`define MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_WIDTH         (`KEYPOINT_ID_WIDTH)
`define MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_LOW           (`MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_HIGH + 1)
`define MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_HIGH          (`MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_LOW + `MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_WIDTH - 1)
`define MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_FIELD         (`MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_HIGH):(`MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_LOW)

`define MATCH_TABLE_2ND_SCORE_WIDTH                     `MATCH_TABLE_SCORE_WIDTH 
`define MATCH_TABLE_2ND_SCORE_LOW                       (`MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_HIGH + 1)
`define MATCH_TABLE_2ND_SCORE_HIGH                      (`MATCH_TABLE_2ND_SCORE_LOW + `MATCH_TABLE_2ND_SCORE_WIDTH - 1)
`define MATCH_TABLE_2ND_SCORE_FIELD                     (`MATCH_TABLE_2ND_SCORE_HIGH):(`MATCH_TABLE_2ND_SCORE_LOW)

`define MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_WIDTH         (`KEYPOINT_ID_WIDTH)
`define MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_LOW           (`MATCH_TABLE_2ND_SCORE_HIGH + 1)
`define MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_HIGH          (`MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_LOW + `MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_WIDTH - 1)
`define MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_FIELD         (`MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_HIGH):(`MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_LOW)

`define MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_WIDTH         (`KEYPOINT_ID_WIDTH)
`define MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_LOW           (`MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_HIGH + 1)
`define MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_HIGH          (`MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_LOW + `MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_WIDTH - 1)
`define MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_FIELD         (`MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_HIGH):(`MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_LOW)

`define MATCH_TABLE_VALID_FLAG_WIDTH					1
`define MATCH_TABLE_VALID_FLAG							(`MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_HIGH + 1)

`define MATCH_TABLE_WIDTH								((`MATCH_TABLE_1ST_SCORE_WIDTH)				+ \
														(`MATCH_TABLE_1ST_QUERY_KEYPOINT_ID_WIDTH)	+ \
														(`MATCH_TABLE_1ST_MODEL_KEYPOINT_ID_WIDTH)	+ \
														(`MATCH_TABLE_2ND_SCORE_WIDTH) 				+ \
														(`MATCH_TABLE_2ND_QUERY_KEYPOINT_ID_WIDTH) 	+ \
														(`MATCH_TABLE_2ND_MODEL_KEYPOINT_ID_WIDTH) 	+ \
														(`MATCH_TABLE_VALID_FLAG_WIDTH))

`define MATCH_INFO_WIDTH								((`MATCH_INFO_QUERY_KEYPOINT_ID_WIDTH)		+ \
														(`MATCH_INFO_MODEL_KEYPOINT_ID_WIDTH)		+ \
														(`MATCH_INFO_SCORE_WIDTH)					+ \
														(`MATCH_INFO_MATCH_TABLE_INDEX_WIDTH))

`define MATCH_CACHE_COMMAND_INFO_TYPE_WIDTH				3
`define MATCH_CACHE_COMMAND_INFO_TYPE_LOW				0
`define MATCH_CACHE_COMMAND_INFO_TYPE_HIGH				(`MATCH_CACHE_COMMAND_INFO_TYPE_LOW + `MATCH_CACHE_COMMAND_INFO_TYPE_WIDTH - 1)
`define MATCH_CACHE_COMMAND_INFO_TYPE_FIELD				(`MATCH_CACHE_COMMAND_INFO_TYPE_HIGH):(`MATCH_CACHE_COMMAND_INFO_TYPE_LOW)
	
`define MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_WIDTH		16
`define MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_LOW			(`MATCH_CACHE_COMMAND_INFO_TYPE_HIGH + 1)
`define MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_HIGH		(`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_LOW + `MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_WIDTH - 1)
`define MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_FIELD		(`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_HIGH):(`MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_LOW)
	
`define MATCH_CACHE_COMMAND_TYPE_CLEAR 					3'b000
`define MATCH_CACHE_COMMAND_TYPE_READ					3'b001
`define MATCH_CACHE_COMMAND_TYPE_LOAD					3'b010
`define MATCH_CACHE_COMMAND_TYPE_BYPASS					3'b011
`define MATCH_CACHE_COMMAND_TYPE_BYPASS_AND_CACHE		3'b100

`define MATCH_CACHE_COMMAND_INFO_WIDTH					(`MATCH_CACHE_COMMAND_INFO_TYPE_WIDTH + `MATCH_CACHE_COMMAND_INFO_LOAD_COUNT_WIDTH)









function integer get_instance_location;     // fix function
	input 	[(`NUM_PE_TYPES - 1):0] 	config_array	[(`NUM_ROWS - 1):0][(`NUM_COLS - 1):0][(`NUM_PE - 1):0];
	input	[(`NUM_PE_TYPES - 1):0]	    config_type;
	input	[(`NUM_PE_TYPES - 1):0] 	location_type;
	
	integer r,c,p;
    	
	begin
        for (r=0; r<`NUM_ROWS ; r=r+1)
			for (c=0; c<`NUM_COLS; c=c+1)
				for (p=0; p<`NUM_PE; p=p+1)
					if (config_array[r][c][p] == config_type)
					begin
						if (location_type == C_ROW)
							get_instance_location = r;
						else if (location_type == C_COL)
							get_instance_location = c;
						else
							get_instance_location = p;
						
						break;
					end
    end
endfunction


function integer count_instances;
	input 	[(`NUM_PE_TYPES - 1):0] 	config_array	[(`NUM_ROWS - 1):0][(`NUM_COLS - 1):0][(`NUM_PE - 1):0];
	input	[(`NUM_PE_TYPES - 1):0]	    config_type;
	
	integer r,c,p;
    begin
		count_instances = 0;
        for (r=0; r<`NUM_ROWS; r=r+1)
			for (c=0; c<`NUM_COLS; c=c+1)
				for (p=0; p<`NUM_PE; p=p+1)
					if (config_array[r][c][p] == config_type)
						count_instances = count_instances + 1;
    end
endfunction


function integer count_active;  // fix function
	input 	[(`NUM_PE_TYPES - 1):0] 	config_array	[(`NUM_ROWS - 1):0][(`NUM_COLS - 1):0][(`NUM_PE - 1):0];
	input	[(`NUM_PE_TYPES - 1):0]	    location_type;
	
	integer r,c,p;
	integer row_count;
	integer col_count;
	
	reg row_active;
	reg col_active;
	
	begin
		row_count = 0;
		col_count = 0;
		
        for (r = 0; r < `NUM_ROWS; r = r + 1)
		begin
			row_active = 1'b0;
			for (c = 0; c < `NUM_COLS ; c = c + 1)
			begin
				col_active = 1'b0;
				for (p = 0; p < `NUM_PE; p = p + 1)
				begin
					if (config_array[r][c][p] != C_PORT_CONFIG_NONE)
					begin
						col_active = 1'b1;
						row_active = 1'b1;
					end
				end
				if (col_active == 1)
					col_count = col_count + 1;
			end
			if (row_active == 1)
				row_count = row_count + 1;
		end
		
		count_active = (location_type == C_ROW) ? row_count : col_count;
    end
endfunction


`endif

