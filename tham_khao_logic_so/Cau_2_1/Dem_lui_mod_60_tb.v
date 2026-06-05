module Dem_lui_mod_60_tb;
	reg clk;
	reg reset;
	reg load;
	reg ce;
	reg [3:0] load_chuc;
	reg [3:0] load_donvi;
	wire [7:0] chuc_out;
	wire [7:0] donvi_out;
	
	Dem_lui_mod_60 uut (
		.clk(clk),
		.reset(reset),
		.load(load),
		.ce(ce),
		.load_chuc(load_chuc),
		.load_donvi(load_donvi),
		.chuc_out(chuc_out),
		.donvi_out(donvi_out)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("C:%d, reset:%d, load:%d, ce:%d, load_chuc: %d, load_donvi: %d, chuc_out: %h, donvi_out: %h", clk, reset, load, ce, load_chuc, load_donvi, chuc_out, donvi_out);
		
		reset = 1; #20;
		reset = 0;
		
		ce = 0;
		
		load_chuc = 4'd2;
		load_donvi = 4'd5;
		load = 1; #20;
		load = 0; #20;
		ce = 1;
		
		#1000;
		
		$finish;
	end
endmodule
		