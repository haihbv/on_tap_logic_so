module Binary_Counter_tb;
	reg clk;
	reg reset;
	wire [7:0] Q;
	
	Binary_Counter uut (
		.clk(clk),
		.reset(reset),
		.Q(Q)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	initial begin
		reset = 0; #20;
		reset = 1;
		
		$monitor("clk: %d, Q = %d", clk, Q);
		#1000;
		$finish;
	end
endmodule
