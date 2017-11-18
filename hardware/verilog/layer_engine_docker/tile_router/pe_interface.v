module pe_interface
(
	pe0_datain_clk,
	pe0_datain,
	pe0_datain_valid,
	pe0_datain_accept,
	pe0_dataout_clk,
	pe0_dataout,
	pe0_dataout_valid,
	pe0_dataout_accept,
	
	pe1_datain_clk,
	pe1_datain,
	pe1_datain_valid,
	pe1_datain_accept,
	pe1_dataout_clk,
	pe1_dataout,
	pe1_dataout_valid,
	pe1_dataout_accept,
	
	pe2_datain_clk,
	pe2_datain,
	pe2_datain_valid,
	pe2_datain_accept,
	pe2_dataout_clk,
	pe2_dataout,
	pe2_dataout_valid,
	pe2_dataout_accept,
	
	pe3_datain_clk,
	pe3_datain,
	pe3_datain_valid,
	pe3_datain_accept,
	pe3_dataout_clk,
	pe3_dataout,
	pe3_dataout_valid,
	pe3_dataout_accept
	
);

	output			pe0_datain_clk;
	input	[63:0]	pe0_datain;
	input			pe0_datain_valid;
	output			pe0_datain_accept;
	output			pe0_dataout_clk;
	output	[63:0]	pe0_dataout;
	output			pe0_dataout_valid;
	input			pe0_dataout_accept;
	
	output			pe1_datain_clk;
	input	[63:0]	pe1_datain;
	input			pe1_datain_valid;
	output			pe1_datain_accept;
	output			pe1_dataout_clk;
	output	[63:0]	pe1_dataout;
	output			pe1_dataout_valid;
	input			pe1_dataout_accept;
	
	output			pe2_datain_clk;
	input	[63:0]	pe2_datain;
	input			pe2_datain_valid;
	output			pe2_datain_accept;
	output			pe2_dataout_clk;
	output	[63:0]	pe2_dataout;
	output			pe2_dataout_valid;
	input			pe2_dataout_accept;
	
	output			pe3_datain_clk;
	input	[63:0]	pe3_datain;
	input			pe3_datain_valid;
	output			pe3_datain_accept;
	output			pe3_dataout_clk;
	output	[63:0]	pe3_dataout;
	output			pe3_dataout_valid;
	input			pe3_dataout_accept;
	
endmodule