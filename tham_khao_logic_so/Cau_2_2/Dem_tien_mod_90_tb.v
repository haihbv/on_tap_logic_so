module Dem_tien_mod_90_tb;
	reg clk;
	reg reset;
	reg load;
	reg ce;
	reg [3:0] load_chuc, load_donvi;
	wire [7:0] chuc_out, donvi_out;
	
	Dem_tien_mod_90 uut (
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
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk:%d, reset: %d, load: %d, ce: %d, load_chuc: %d, load_donvi: %d, chuc_out: %h, donvi_out: %h", clk, reset, load, ce, load_chuc, load_donvi, chuc_out, donvi_out);
		
		reset = 0; #20;
		reset = 1;
		
		ce = 1;
		load_chuc = 4'd7;
		load_donvi = 4'd0;
		load = 0; #20;
		load = 1; #20;
		ce = 0;
		
		#1000;
		
		$finish;
		
	end
endmodule
