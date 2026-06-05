module MultiJK_tb;

	reg clk, clear;
	wire [3:0] Q;
	
	MultiJK uut (.clk(clk), .clear(clear), .Q(Q));
	
	
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("clk:%d, clear:%d, Q:%b", clk, clear, Q);
		
		clear = 0; #20;
		clear = 1;
		
		#1000;
		
		$finish;
	end
endmodule
		
	