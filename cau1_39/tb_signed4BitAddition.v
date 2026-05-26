module tb_signed4BitAddition;
	reg signed [3:0] a;
	reg signed [3:0] b;
	wire signed [3:0] sum;
	wire overflow;
	
	signed4BitAddition uut(
		.a(a),
		.b(b),
		.sum(sum),
		.overflow(overflow)
	);
	
	integer i, j;
	initial begin
		for (i = -8; i < 8; i = i + 1) begin
			for (j = -8; j < 8; j = j + 1) begin
				a = i;
				b = j;
				#10;
				$display("%d + %d = %d, overflow = %d", a, b, sum, overflow);
			end
		end
		
		$finish;
	end

endmodule
