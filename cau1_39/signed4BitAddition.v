module signed4BitAddition(
	input signed [3:0] a,
	input signed [3:0] b,
	output signed [3:0]sum,
	output overflow
);
	assign sum = a + b;
	
	assign overflow = (a[3] == b[3]) && (sum[3] != a[3]);
endmodule
