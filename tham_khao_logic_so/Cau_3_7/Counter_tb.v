module Counter_tb;
	reg clk, reset, load, up;
	reg [9:0] load_data;
	wire [9:0] data_out;
	
	Counter uut (
		.clk(clk),
		.reset(reset),
		.load(load),
		.up(up),
		.load_data(load_data),
		.data_out(data_out)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	initial begin
		$monitor("clk: %d, reset: %d, load: %d, up: %d, load_data: %d, data_out: %d", clk, reset, load, up, load_data, data_out);
		
		reset = 0; #20;
		reset = 1;
		
		up = 0;
		
		load_data = 200;
		load = 1; #20;
		load = 0;
		
		#200;
		up = 1;
		#7000;
		
		$finish;
	end
endmodule
		
		