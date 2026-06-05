module Counter8bit_tb;
	reg clk;
	reg reset;
	reg load;
	reg ce;
	reg inc;
	reg [7:0] load_num;
	wire [7:0] Q;
	
	Counter8bit uut (
		.clk(clk),
		.reset(reset),
		.load(load),
		.ce(ce),
		.inc(inc),
		.load_num(load_num),
		.Q(Q)
	);
	
	initial begin
		clk = 1;
		forever #5 clk = !clk;
	end
	
	initial begin
		$monitor("clk: %b, reset: %b, load: %b, ce: %b, inc: %b, load_num: %d, Q: %d", clk, reset, load, ce, inc, load_num, Q);
		
		reset = 0; #20;
		reset = 1;
		
		ce = 1;
		load_num = 100;
		load = 0; #20;
		load = 1; #20;
		ce = 0;
		inc = 0;
		#500;
		inc = 1;
		#5000;
		
		
		$finish;
	end
endmodule
