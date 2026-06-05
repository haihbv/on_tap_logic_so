module Trigger_D_tb;
	reg clk;
	reg reset;
	reg D;
	reg S;
	reg R;
	wire Q;
	wire Q_n;
	
	Trigger_D uut (
		.clk(clk),
		.reset(reset),
		.D(D),
		.S(S),
		.R(R),
		.Q(Q),
		.Q_n(Q_n)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		reset = 0; #20;
		reset = 1;
		
		S = 1; R = 0; #10;
		S = 0; R = 1; #10;
		
		S = 0; R = 0;
		
		D = 1; #10;
		D = 0; #10;
		
		$finish;
	end
	
	initial begin
		$monitor("clk: %d, reset: %d, S=%d, R=%d, D=%d, Q=%d, Q_n=%d", clk, reset, S, R, D, Q, Q_n);
	end
endmodule
