module Counter_tbb;
	reg clk, reset;
	wire [6:0] chuc_out, donvi_out;
	
	Counter uut (.clk(clk), .reset(reset), .chuc_out(chuc_out), .donvi_out(donvi_out));
	
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	initial begin
		$monitor("clk: %d, reset: %d, chuc: %b, donvi: %b", clk, reset, chuc_out, donvi_out);
		
		reset = 0; #20;
		reset = 1;
		
		#2000;
		
		$finish;
	end
endmodule
