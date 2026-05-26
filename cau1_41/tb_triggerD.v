module tb_triggerD;
	reg clk;
	reg rst_n;
	reg S;
	reg R;
	reg D;
	
	wire Q;
	wire Q_n;
	
	triggerD uut(
		.clk(clk),
		.rst_n(rst_n),
		.S(S),
		.R(R),
		.D(D),
		.Q(Q),
		.Q_n(Q_n)
	);
	
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		rst_n = 0;
		#20;
		rst_n = 1;
		
		S = 1; R = 0; #10;
		S = 0; R = 1; #10;
		
		S = 0; R = 0;
		
		D = 1; #10;
		D = 0; #10;
		
		$finish;
	end
	
	initial begin
		$monitor("clk=%d - rst_n=%d - S=%d - R=%d - D=%d - Q=%d - Q_n=%d", clk, rst_n, S, R, D, Q, Q_n);
	end

endmodule
