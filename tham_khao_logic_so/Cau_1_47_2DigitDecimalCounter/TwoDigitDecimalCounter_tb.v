module TwoDigitDecimalCounter_tb;
	reg clk;
	reg reset;
	wire [7:0] chuc_out;
	wire [7:0] donvi_out;
	
	TwoDigitDecimalCounter uut (
		.clk(clk),
		.reset(reset),
		.chuc_out(chuc_out),
		.donvi_out(donvi_out)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk: %d, reset: %d, chuc=%h, donvi=%h", clk, reset, chuc_out, donvi_out);
		
		reset = 0; #20;
		reset = 1;
		#1000;
		$finish;
	end
endmodule
