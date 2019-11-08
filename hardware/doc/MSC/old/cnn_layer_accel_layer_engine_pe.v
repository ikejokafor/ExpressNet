`timescale 1ns / 1ps

module layer_engine_pe
(
    clk                 ,
	rst                 ,
	
    ingress_clk         ,
	ingress_valid       ,
	ingress_accept      ,
	ingress_payload     ,
	
    egress_clk          ,
	egress_valid        ,
	egress_accept       ,
	egress_payload      ,
    
    msg_in_valid        ,
    msg_in_accept       ,
    msg_in_payload      ,

    msg_out_valid       ,
    msg_out_accept      ,
    msg_out_payload     ,
);
    parameter C_DATA_WIDTH      = 128;
    parameter C_NUM_PORTS       = 4;
    parameter C_OPCODE_WIDTH    = 64;
    
    input										clk					;
	input										rst					;
	
    input                                       ingress_clk         ;
	input	[ C_NUM_PORTS-1:0]					ingress_valid		;
	output	[ C_NUM_PORTS-1:0]					ingress_accept		;
	input	[(C_NUM_PORTS*C_DATA_WIDTH)-1:0]	ingress_payload		;
	
    input                                       egress_clk          ;
	output	[ C_NUM_PORTS-1:0]					egress_valid	    ;
	input	[ C_NUM_PORTS-1:0]					egress_accept	    ;
	output	[(C_NUM_PORTS*C_DATA_WIDTH)-1:0]	egress_payload	    ;
    
    wire    [(5*C_OPCODE_WIDTH)-1:0]            opcode              ;
    wire    [ 5-1:0]                            opcode_valid        ;
    wire    [ 5-1:0]                            opcode_accept       ;
    
    wire    [15:0]                              config_address      ;
    wire                                        config_wren         ;
    wire                                        config_wrack        ;
    wire                                        config_rden         ;
    wire                                        config_rdack        ;
    wire    [127:0]                             config_datain       ;
    wire    [127:0]                             config_dataout      ;
    
    layer_engine_controller
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_controller
    (
        .clk                (clk),
        .rst                (rst),
        
        .msg_in_valid       (),
        .msg_in_accept      (),
        .msg_in_payload     (),
        
        .msg_out_valid      (),
        .msg_out_accept     (),
        .msg_out_payload    (),
        
        .opcode             (opcode         ),
        .opcode_valid       (opcode_valid   ),
        .opcode_accept      (opcode_accept  ),
        
        .config_address     (config_address ),
        .config_wren        (config_wren    ),
        .config_wrack       (config_wrack   ),
        .config_rden        (config_rden    ),
        .config_rdack       (config_rdack   ),
        .config_datain      (config_datain  ),
        .config_dataout     (config_dataout )
    );

    layer_engine_convolver
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_convolver
    (
        .clk                (clk),
        .rst                (rst),
        
        .opcode             (opcode         [0*C_OPCODE_WIDTH +: C_OPCODE_WIDTH]   ),
        .opcode_valid       (opcode_valid   [0]                                    ),
        .opcode_accept      (opcode_accept  [0]                                    ),
        
        .datain             (),
        .datain_valid       (),
        .datain_ready       (),
        
        .dataout            (),
        .dataout_valid      (),
        .dataout_ready      (),
        
        .config_address     (config_address ),
        .config_wren        (config_wren    ),
        .config_wrack       (config_wrack   ),
        .config_rden        (config_rden    ),
        .config_rdack       (config_rdack   ),
        .config_datain      (config_datain  ),
        .config_dataout     (config_dataout )
    );
    
    layer_engine_adder
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_adder
    (
        .clk                (clk),
        .rst                (rst),
        
        .opcode             (opcode         [1*C_OPCODE_WIDTH +: C_OPCODE_WIDTH]   ),
        .opcode_valid       (opcode_valid   [1]                                    ),
        .opcode_accept      (opcode_accept  [1]                                    ),
        
        .datain             (),
        .datain_valid       (),
        .datain_ready       (),
        
        .dataout            (),
        .dataout_valid      (),
        .dataout_ready      ()
    );
    
    layer_engine_pooler
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_pooler
    (
        .clk                (clk),
        .rst                (rst),
        
        .opcode             (opcode         [2*C_OPCODE_WIDTH +: C_OPCODE_WIDTH]   ),
        .opcode_valid       (opcode_valid   [2]                                    ),
        .opcode_accept      (opcode_accept  [2]                                    ),
        
        .datain             (),
        .datain_valid       (),
        .datain_ready       (),
        
        .dataout            (),
        .dataout_valid      (),
        .dataout_ready      ()
    );
    
    layer_engine_activator
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_activator
    (
        .clk                (clk),
        .rst                (rst),
        
        .opcode             (opcode         [3*C_OPCODE_WIDTH +: C_OPCODE_WIDTH]   ),
        .opcode_valid       (opcode_valid   [3]                                    ),
        .opcode_accept      (opcode_accept  [3]                                    ),
        
        .datain             (),
        .datain_valid       (),
        .datain_ready       (),
        
        .dataout            (),
        .dataout_valid      (),
        .dataout_ready      ()
    );
    
    layer_engine_output_map
    #(
        .C_OPCODE_WIDTH     (C_OPCODE_WIDTH)
    )
    i_output_map
    (
        .clk                (clk),
        .rst                (rst),
        
        .opcode             (opcode         [4*C_OPCODE_WIDTH +: C_OPCODE_WIDTH]   ),
        .opcode_valid       (opcode_valid   [4]                                    ),
        .opcode_accept      (opcode_accept  [4]                                    ),
        
        .datain             (),
        .datain_valid       (),
        .datain_ready       (),
        
        .dataout            (),
        .dataout_valid      (),
        .dataout_ready      ()
    );
    
    
endmodule