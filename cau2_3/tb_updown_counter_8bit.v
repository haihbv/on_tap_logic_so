module tb_updown_counter_8bit();
	reg clk;
	reg rst_n;
	reg inc;
	reg CE;
	reg load;
	reg [7:0] load_num;
	wire [7:0] counter;
	
	updown_counter_8bit uut(
		.clk(clk),
		.rst_n(rst_n),
		.inc(inc),
		.CE(CE),
		.load(load),
		.load_num(load_num),
		.counter(counter)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk:%d, rst_n:%d, inc:%d, CE:%d, load:%d, load_num:%d, counter:%d", clk, rst_n, inc, CE, load, load_num, counter);
	end
	
	initial begin
		rst_n = 0;
		load_num = 8'd50;
		CE = 1;
		load = 1;
		inc = 0;
		
		#10;
		rst_n = 1;
		
		#10;
		load = 0;
		
		#10;
		load = 1;
		
		#10;
		CE = 0; 
		inc = 1;
		#200;
		
		inc = 0;
		#200;
		
		CE = 1;
		#30;
		
		$finish;
	end

endmodule
