`timescale 1ns/1ps

module tb_grayToBinary;

	reg [3:0] gray_in;
	wire [3:0] binary_out;
	
	grayToBinary uut(
		.gray_in(gray_in),
		.binary_out(binary_out)
	);
	
	initial begin
		$display("Gray -> Binary");
		$monitor("%b -> %b", gray_in, binary_out);
	end
	
	integer i;
	
	initial begin
		for (i = 0; i < 16; i=i+1) begin
			gray_in = i;
			#10;
		end
		$finish;
	end
endmodule
