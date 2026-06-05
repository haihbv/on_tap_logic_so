module Trigger_JK_tb;
	reg clk;
	reg reset;
	reg J;
	reg K;
	reg R;
	reg S;
	wire Q;
	wire Q_n;
	
	Trigger_JK uut (
		.clk(clk),
		.reset(reset),
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
		$monitor("clk: %d, reset: %d, S=%d, R=%d, J=%d, K=%d, Q=%d, Q_n=%d", clk, reset, S, R, J, K, Q, Q_n);
	end
	
	initial begin
		reset = 0; #20;
		reset = 1;
		
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

		
		