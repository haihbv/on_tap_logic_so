module tb_updown_counter_8bit();
	reg clk;
	reg rst_n;
	reg ce;
	reg inc; // 1: dem tien - 0: dem lui
	reg load;
	reg [7:0] load_num;
	wire[7:0] counter;
	
	updown_counter_8bit uut(
		.clk(clk),
		.rst_n(rst_n),
		.ce(ce),
		.inc(inc),
		.load(load),
		.load_num(load_num),
		.counter(counter)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("rst_n=%b | ce=%b | inc=%b | load=%b | load_num=%d | counter=%d", rst_n, ce, inc, load, load_num, counter);
	end
	
	initial begin
		ce = 0; load = 0; rst_n = 0; inc = 0;
		#20;
		rst_n = 1;
		
		load = 1;
		load_num = 8'd46;
		#10; load = 0;
		
		ce = 1; inc = 1;
		#200;
		
		ce = 0;
		#100;
		
		ce =1;
		#200;
		
		inc = 0; #500;
		
		$finish;
	end
endmodule
