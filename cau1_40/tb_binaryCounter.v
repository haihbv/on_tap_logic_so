module tb_binaryCounter;
	reg clk;
	reg rst_n;
	wire [7:0] counter;
	
	binaryCounter uut(
		.clk(clk),
		.rst_n(rst_n),
		.counter(counter)
	);
	
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		$monitor("clk = %d, counter = %d", clk, counter);
		rst_n = 0;
		#20;
		rst_n = 1;
		
		#1000;
		$finish;
	end
endmodule
