module tb_triggerRS;
	reg clk, rst_n, pre, clr, r, s;
	wire q, q_n;
	
	triggerRS uut(
		.clk(clk),
		.rst_n(rst_n),
		.pre(pre),
		.clr(clr),
		.r(r),
		.s(s),
		.q(q),
		.q_n(q_n)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		pre = 0; clr = 0; r = 0; s = 0;
		$monitor("rst_n=%d | pre=%b | clr=%b | R=%b | S=%b | Q=%b | Q_n=%b", rst_n, pre, clr, r, s, q, q_n);
		
		rst_n = 0;
		#10;
		rst_n = 1;
		
		pre = 1; clr = 0;
		#10;
		
		clr = 1; pre = 0;
		#10;
		clr = 0;
		
		r = 0; s = 0; #10;
		r = 1; s = 0; #10;
		r = 0; s = 1; #10;
		
		#20;
		$finish;
		
	end
	
endmodule
