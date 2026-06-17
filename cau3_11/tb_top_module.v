`timescale 1ns/1ns
module tb_top_module;
	reg  clk, rst_n;
	wire Q1, Q2, Q3;
	wire Q1_n, Q2_n, Q3_n;
	integer i;
	
	top_module uut (
		.clk(clk), .rst_n(rst_n),
		.Q1(Q1), .Q2(Q2), .Q3(Q3),
		.Q1_n(Q1_n), .Q2_n(Q2_n), .Q3_n(Q3_n)
	);
	
	initial clk = 0;
	always #5 clk = ~clk;          
	
	initial begin
		$monitor("t=%d | Q3=%d Q2=%d Q1=%d | so=%d", $time, Q3, Q2, Q1, {Q3,Q2,Q1});
		rst_n = 0; #10; rst_n = 1;          
		for (i = 0; i < 14; i = i + 1) #10;  
		$finish;
	end
endmodule
