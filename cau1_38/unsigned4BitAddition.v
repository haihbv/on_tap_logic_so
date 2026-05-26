module unsigned4BitAddition(
	input [3:0] a, b,
	output [3:0] sum,
	output carry
);

	assign {carry, sum} = a + b;
endmodule
