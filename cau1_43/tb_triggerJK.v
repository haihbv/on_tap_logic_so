module tb_triggerJK;
	reg clk;
	reg rst_n;
	reg J;
	reg K;
	reg R;
	reg S;
	wire Q;
	wire Q_n;
	
	triggerJK uut (
		.clk(clk),
		.rst_n(rst_n),
		.J(J),
		.K(K),
		.R(R),
		.S(S),
		.Q(Q),
		.Q_n(Q_n)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk: %d, rst_n: %d, S=%d, R=%d, J=%d, K=%d, Q=%d, Q_n=%d", clk, rst_n, S, R, J, K, Q, Q_n);
	end
	
	initial begin
		rst_n = 0; #20;
		rst_n = 1;
		
		S = 1; R = 0; #10;
		S = 0; R = 1; #10;
		S = 0; R = 0;
		
		J = 0; K = 1; #10;
		J = 1; K = 0; #10;
		J = 0; K = 0; #10;
		J = 1; K = 1; #10;
		
		$finish;
	end
endmodule

		
		