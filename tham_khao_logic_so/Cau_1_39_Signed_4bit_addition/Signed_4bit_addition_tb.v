module Signed_4bit_addition_tb;
	reg signed [3:0] a;
	reg signed [3:0] b;
	wire signed [4:0] sum;
	
	Signed_4bit_addition uut (
		.a(a),
		.b(b),
		.sum(sum)
	);
	
	integer i, j;
	
	initial begin
		for(i=-8; i<8; i=i+1) begin
			for(j=-8; j<8; j=j+1) begin
				a = i;
				b = j;
				#10;
				$display("%d + %d = %d", a, b, sum);
			end 
		end
		
		$finish;
	end
endmodule

				