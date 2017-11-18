`timescale 1ns / 1ns



`define DBG_TRANSACTOR
module master_transactor #(
  parameter DEBUG_TRANSACTOR        = 0,
  parameter C_BURST_SIZE_BYTES      = 4096,
  parameter C_BURST_MODE_ENABLED    = 0
) (
    master_clk,
    master_rst,
    master_request,
    master_request_ack,
    master_request_complete,
    master_request_option,  
    master_request_error,
    master_request_tag,
    master_request_type,
    master_request_flow,
    master_request_local_address,
    master_request_length,
    master_descriptor_src_rdy,
    master_descriptor_dst_rdy,
    master_descriptor_tag,
    master_descriptor,
    master_datain_src_rdy,
    master_datain_dst_rdy,
    master_datain_tag,
    master_dataout_src_rdy,
    master_dataout_dst_rdy,
    master_dataout_tag,
    initialize,
    intiialize_request_type,
    initialize_address,
    initialize_length,
    initialize_complete,
    transactor_request,
    transactor_enable,
    transactor_request_option,
    transactor_request_busy,
    transactor_active, 
    transaction_request_complete,
    transactor_param_complete,
    transactor_reset,
    use_provided_param,
    provided_parameters_length,
    provided_request_option,
    provided_request_type_r,
    provided_parameters_address   
);
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//	Includes
	//-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "soc_it_defs.vh"
   

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Local parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------  
    localparam ST_IDLE                  = 5'b0_0001; // 1
    localparam ST_INITIALIZE_PARAMETERS = 5'b0_0010; // 2
    localparam ST_ACTIVE                = 5'b0_0100; // 4
    localparam ST_TRANSACTION_REQUEST   = 5'b0_1000; // 8
    localparam ST_UPDATE_PARAMETERS     = 5'b1_0000; // 16
    

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Inputs / Ouputs
    //----------------------------------------------------------------------------------------------------------------------------------------------- 
    input                      master_clk;
    input                      master_rst;
    output  reg                master_request;
    input                      master_request_ack;
    input                      master_request_complete;
    output  reg  [3  :0]       master_request_option;  
    input        [6  :0]       master_request_error;
    input        [3  :0]       master_request_tag;
    output  reg  [3  :0]       master_request_type;
    output  reg  [9  :0]       master_request_flow;
    output  reg  [63 :0]       master_request_local_address;
    output  reg  [35 :0]       master_request_length;
    output  reg                master_descriptor_src_rdy;
    input                      master_descriptor_dst_rdy;
    input        [  3:0]       master_descriptor_tag;
    output  reg  [127:0]       master_descriptor;
    input                      master_datain_src_rdy;
    input                      master_datain_dst_rdy;
    input        [  3:0]       master_datain_tag;
    input                      master_dataout_src_rdy;
    input                      master_dataout_dst_rdy;
    input        [  3:0]       master_dataout_tag;
    input                      initialize;
    input        [  3:0]       intiialize_request_type;
    input        [ 63:0]       initialize_address;
    input        [ 35:0]       initialize_length;
    input                      initialize_complete;
    input                      transactor_enable;
    input                      transactor_request;
    input        [  3:0]       transactor_request_option;
    output reg                 transactor_request_busy;
    output reg                 transactor_active;
    output reg                 transaction_request_complete;
    output                     transactor_param_complete;
    input                      transactor_reset;
    input                      use_provided_param;
    input        [ 35:0]       provided_parameters_length;
    input        [  3:0]       provided_request_option;
    input        [  3:0]       provided_request_type_r;
    input        [ 63:0]       provided_parameters_address; 
    
  
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Wires / Regs
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    reg     [3:0]    master_request_type_r;
    reg              master_request_acked;
    reg              master_descriptor_accepted;
    reg     [35:0]   master_request_length_total;
    reg     [23:0]   master_transfered_count;
    reg              transfer_parameters_initialize;
    reg     [63:0]   transfer_parameters_initialize_address;
    reg     [35:0]   transfer_parameters_initialize_length;
    reg              transfer_parameters_initialize_complete;
    reg              transfer_parameters_update;
    reg     [35:0]   transfer_parameters_size;
    wire    [63:0]   transfer_parameters_address;
    wire    [35:0]   transfer_parameters_length; // Nothing but initialize_length
    wire             transfer_parameters_valid;
    wire             transfer_complete;
    reg     [4:0]    state;
    reg              use_provided_param_r;
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    // Module Instaniations / Generate Statements
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    address_incrementer 
    i0_address_incrementer (
        .clk                          ( master_clk                              ),
        .rst                          ( master_rst                              ),
        .initialize                   ( transfer_parameters_initialize          ),
        .initialize_address           ( transfer_parameters_initialize_address  ),
        .initialize_length            ( transfer_parameters_initialize_length   ),
        .initialize_complete          ( transfer_parameters_initialize_complete ),
        .transfer_parameters_update   ( transfer_parameters_update              ),
        .transfer_parameters_size     ( transfer_parameters_size                ),
        .transfer_parameters_address  ( transfer_parameters_address             ),
        .transfer_parameters_length   ( transfer_parameters_length              ),
        .transfer_parameters_valid    ( transfer_parameters_valid               ),
        .transfer_parameters_complete ( transfer_complete                       )
    );
    
    
    // BEGIN Transactor logic -------------------------------------------------------------------------------------------------------------------

    assign transactor_param_complete                  = transfer_complete;

    always @(posedge master_clk) begin
        if(master_rst) begin
            master_request                         <= 1'b0;
            master_request_acked                   <= 1'b0;
            master_request_type                    <= 4'b0;
            master_request_flow                    <= 10'd0; 
            master_request_option                  <= `NIF_CMD_VARIANT_NO_ALLOCATE;
            master_request_local_address           <= 64'd0;
            master_request_length                  <= 36'd0;
            master_request_length_total            <= 36'd0;
            master_descriptor_accepted             <= 1'b0;
            master_descriptor_src_rdy              <= 1'b0;
            master_descriptor                      <= 128'b0;
            master_transfered_count                <= 24'd0;
            transfer_parameters_initialize         <= 1'b0;
            transfer_parameters_initialize_address <= 64'b0;
            transfer_parameters_initialize_length  <= 36'b0;
            transfer_parameters_update             <= 1'b0;
            transfer_parameters_size               <= 36'b0;      
            transactor_request_busy                <= 1'b0;
            transactor_active                      <= 1'b0;
            master_request_type_r                  <= 0;
            use_provided_param_r                   <= 0;
            state                                  <= ST_ACTIVE;
        end else begin
            transfer_parameters_update             <= 1'b0; 
            transaction_request_complete           <= 0;           
            case (state)
                ST_IDLE: begin
                    if(initialize) begin
                        transfer_parameters_initialize_complete <= initialize_complete;
                        transactor_active                       <= 1'b1;
                        transfer_parameters_initialize          <= 1'b1;
                        transfer_parameters_initialize_address  <= initialize_address;
                        transfer_parameters_initialize_length   <= initialize_length;
                        master_request_type_r                   <= intiialize_request_type;
                        state                                   <= ST_INITIALIZE_PARAMETERS;
                    end
                end
                ST_INITIALIZE_PARAMETERS: begin
                    if(transfer_parameters_initialize) begin
                        transfer_parameters_initialize <= 1'b0;
                        state                          <= ST_ACTIVE;
                    end
                end
                ST_ACTIVE: begin
                    if(transactor_reset) begin
                        master_request_length       <= 0;
                        master_request_option       <= 0;
                        master_request_type         <= 0;
                        master_request_flow         <= 0;
                        master_descriptor           <= 0;
                        state                       <= ST_IDLE;
                    end else if(transactor_enable) begin
                        if(transactor_request == 1'b1) begin
                            if(!use_provided_param) begin
                                if(C_BURST_MODE_ENABLED) begin
                                    transactor_request_busy                                     <= 1'b1;                        
                                    master_request_length_total                                 <= (C_BURST_SIZE_BYTES > transfer_parameters_length) ? transfer_parameters_length : C_BURST_SIZE_BYTES; 
                                    master_request_length                                       <= (C_BURST_SIZE_BYTES > transfer_parameters_length) ? transfer_parameters_length : C_BURST_SIZE_BYTES;
                                    master_request_option                                       <= transactor_request_option;
                                    master_request_type                                         <= master_request_type_r;
                                    master_request_flow                                         <= 10'd64;                          
                                    // NIF_DMA_DESCRIPTOR_LENGTH_FIELD        35:0  
                                    // NIF_DMA_DESCRIPTOR_DEVICE_FIELD        51:36
                                    // NIF_DMA_DESCRIPTOR_FLOW_FIELD          61:52
                                    // NIF_DMA_DESCRIPTOR_LAST_TARGET_FLAG    63  
                                    // NIF_DMA_DESCRIPTOR_ADDRESS_FIELD       127:64  
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_LENGTH_FIELD]         <= (C_BURST_SIZE_BYTES > transfer_parameters_length) ? transfer_parameters_length : C_BURST_SIZE_BYTES;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD]        <= transfer_parameters_address;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_DEVICE_FIELD]         <= 10'd0;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_FLOW_FIELD]           <= 10'd64;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_LAST_TARGET_FLAG]     <= 1'b1;
                                    master_transfered_count                                     <= 24'd0;
                                    state                                                       <= ST_TRANSACTION_REQUEST;
                                end else begin
                                    transactor_request_busy                                     <= 1'b1;                        
                                    master_request_length_total                                 <= transfer_parameters_initialize_length;
                                    master_request_length                                       <= transfer_parameters_initialize_length;
                                    master_request_option                                       <= transactor_request_option;
                                    master_request_type                                         <= master_request_type_r;
                                    master_request_flow                                         <= 10'd64; 
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_LENGTH_FIELD]         <= transfer_parameters_initialize_length;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD]        <= transfer_parameters_address;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_DEVICE_FIELD]         <= 10'd0;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_FLOW_FIELD]           <= 10'd64;
                                    master_descriptor[`NIF_DMA_DESCRIPTOR_LAST_TARGET_FLAG]     <= 1'b1;
                                    master_transfered_count                                     <= 24'd0;
                                    state                                                       <= ST_TRANSACTION_REQUEST;
                                end                       
                            end else begin
                                use_provided_param_r                                        <= 1;
                                transactor_request_busy                                     <= 1'b1;                        
                                master_request_length_total                                 <= provided_parameters_length;
                                master_request_length                                       <= provided_parameters_length;
                                master_request_option                                       <= provided_request_option;
                                master_request_type                                         <= provided_request_type_r;
                                master_request_flow                                         <= 10'd64; 
                                master_descriptor[`NIF_DMA_DESCRIPTOR_LENGTH_FIELD]         <= provided_parameters_length;
                                master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD]        <= provided_parameters_address;
                                master_descriptor[`NIF_DMA_DESCRIPTOR_DEVICE_FIELD]         <= 10'd0;
                                master_descriptor[`NIF_DMA_DESCRIPTOR_FLOW_FIELD]           <= 10'd64;
                                master_descriptor[`NIF_DMA_DESCRIPTOR_LAST_TARGET_FLAG]     <= 1'b1;
                                master_transfered_count                                     <= 24'd0;
                                state                                                       <= ST_TRANSACTION_REQUEST;
                            end
                        end
                    end
                end
                ST_TRANSACTION_REQUEST: begin
                    // Generate the request to the interface and keep track of the request phases 
                    master_request                   <= (master_request_ack || master_request_complete) ? 1'b0 : ((~master_request_acked || master_request_complete) ? 1'b1 : master_request);
                    master_request_acked             <= master_request_ack                              ? 1'b1 :   master_request_acked;
                    master_descriptor_src_rdy        <= master_descriptor_dst_rdy  ? 1'b0 : (~master_descriptor_accepted  ? 1'b1 : master_descriptor_src_rdy);
                    master_descriptor_accepted       <= master_descriptor_dst_rdy  ? 1'b1 :   master_descriptor_accepted;            
                    if(((master_request_type == `NIF_MASTER_CMD_RDREQ) && master_datain_src_rdy && master_datain_dst_rdy) || ((master_request_type == `NIF_MASTER_CMD_WRREQ) && master_dataout_src_rdy && master_dataout_dst_rdy)) begin
                        master_transfered_count        <= master_transfered_count + 24'd16;
                    end
                    if(master_request_complete) begin
                        master_request_acked           <= 1'b0;
                        master_descriptor_accepted     <= 1'b0;
                        master_descriptor_src_rdy      <= 1'b0;
                        if(master_request_error == 0) begin
                            transfer_parameters_update   <= 1'b1;
                            transfer_parameters_size     <= master_request_length_total;
                            transaction_request_complete <= 1;
                            state                        <= ST_UPDATE_PARAMETERS;
                        end else if(master_request_error != 0 && master_request_type_r == `NIF_MASTER_CMD_RDREQ) begin
                            master_transfered_count                                 <= 0;
                            master_request_length                                   <= master_request_length - master_transfered_count;
                            master_descriptor[`NIF_DMA_DESCRIPTOR_LENGTH_FIELD]     <= master_request_length - master_transfered_count;
                            master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD]    <= master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD] + master_transfered_count;           
                            if(master_transfered_count == master_request_length) begin
                                transfer_parameters_update      <= 1'b1;
                                transfer_parameters_size        <= master_request_length_total;
                                transaction_request_complete    <= 1;
                                if(!use_provided_param_r) begin
                                    state                           <= ST_UPDATE_PARAMETERS;
                                end else begin
                                    transactor_request_busy         <= 1'b0;    
                                    use_provided_param_r            <= 0;
                                    master_request_length           <= 0;
                                    master_request_option           <= 0;
                                    master_request_type             <= 0;
                                    master_request_flow             <= 0;
                                    master_descriptor               <= 0;
                                    state                           <= ST_ACTIVE;
                                end
                            end else begin
                                state                           <= ST_TRANSACTION_REQUEST;
                            end
                        end else if(master_request_error != 0 && master_request_type_r == `NIF_MASTER_CMD_WRREQ) begin
                            master_transfered_count                                 <= 0;
                            master_request_length                                   <= master_request_length;
                            master_descriptor[`NIF_DMA_DESCRIPTOR_LENGTH_FIELD]     <= master_request_length;
                            master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD]    <= master_descriptor[`NIF_DMA_DESCRIPTOR_ADDRESS_FIELD];           
                            if(master_transfered_count == master_request_length) begin
                                transfer_parameters_update      <= 1'b1;
                                transfer_parameters_size        <= master_request_length_total;
                                transaction_request_complete    <= 1;
                                if(!use_provided_param_r) begin
                                    state                           <= ST_UPDATE_PARAMETERS;
                                end else begin
                                    transactor_request_busy         <= 1'b0;    
                                    use_provided_param_r            <= 0;
                                    master_request_length           <= 0;
                                    master_request_option           <= 0;
                                    master_request_type             <= 0;
                                    master_request_flow             <= 0;
                                    master_descriptor               <= 0;
                                    state                           <= ST_ACTIVE;
                                end
                            end else begin
                                state                               <= ST_TRANSACTION_REQUEST;
                            end
                        end
                    end                        
                end
                ST_UPDATE_PARAMETERS: begin
                    if(!transfer_parameters_update && transfer_parameters_valid) begin
                        transactor_request_busy         <= 1'b0;
                        if(transfer_complete) begin
                            transactor_active            <= 1'b0;
                            master_request_length        <= 0;
                            master_request_option        <= 0;
                            master_request_type          <= 0;
                            master_request_flow          <= 0;
                            master_descriptor            <= 0;
                            state                        <= ST_IDLE;
                        end else begin
                            master_request_length        <= 0;
                            master_request_option        <= 0;
                            master_request_type          <= 0;
                            master_request_flow          <= 0;
                            master_descriptor            <= 0;
                            state                        <= ST_ACTIVE;
                        end
                    end
                end
            endcase
        end
    end
    // END Transactor logic -------------------------------------------------------------------------------------------------------------------------

    
`ifdef SIMULATION
    string state_s;
    always@(state) begin 
        case(state) 
            ST_IDLE                     : state_s = " ST_IDLE";                           
            ST_INITIALIZE_PARAMETERS    : state_s = " ST_INITIALIZE_PARAMETERS";    
            ST_ACTIVE                   : state_s = " ST_ACTIVE";                   
            ST_TRANSACTION_REQUEST      : state_s = " ST_TRANSACTION_REQUEST";      
            ST_UPDATE_PARAMETERS        : state_s = " ST_UPDATE_PARAMETERS";        
        endcase
    end
`endif

endmodule

