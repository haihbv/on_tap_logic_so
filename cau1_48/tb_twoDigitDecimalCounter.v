module tb_twoDigitDecimalCounter();
	reg clk;
	reg rst_n;
	wire [7:0] chuc_out;
	wire [7:0] donvi_out;
	
	twoDigitDecimalCounter uut(
		.clk(clk),
		.rst_n(rst_n),
		.chuc_out(chuc_out),
		.donvi_out(donvi_out)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk: %d, rst_n: %d, chuc_out: %d, donvi_out: %d", clk, rst_n, uut.chuc, uut.donvi);
	end
	
	initial begin
		rst_n = 0;
		#20;
		rst_n = 1;
		
		#1000;
		$finish;
	end
endmodule
