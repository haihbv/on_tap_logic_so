module Unsigned_4bit_addition_tb;
	
	reg [3:0] a, b;
	wire [3:0] sum;
	wire carry;
	
	Unsigned_4bit_addition uut (
		.a(a),
		.b(b),
		.sum(sum),
		.carry(carry)
	);
	
	integer i, j;
	
	initial begin
		for(i=0; i<16; i=i+1) begin
			for(j=0; j<16; j=j+1) begin
				a = i;
				b = j;
				#10;
				$display("%d + %d = %d, carry = %d", a, b, sum, carry);
			end
		end
		
		$finish;
	end
endmodule
