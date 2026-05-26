`timescale 1ns/1ps

module tb_grayToBinary;

	reg clk;
	reg rst;
	reg [3:0] gray;
	wire [3:0] binary;
	
	grayToBinary uut(
		.clk(clk),
		.rst(rst),
		.gray(gray),
		.binary(binary)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	integer i;
	
	initial begin
		gray = 4'b0000;
		rst = 0;
		
		#20;
		
		rst = 1;
		
		$display("Gray -> Binary");
		
		for (i = 0; i < 16; i=i+1) begin
			gray = i;
			#10;
			$display("%b -> %b", gray, binary);
		end
		
		$finish;
	end
endmodule
