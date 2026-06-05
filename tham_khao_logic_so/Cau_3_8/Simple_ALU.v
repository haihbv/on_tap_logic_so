/*
	Mạch ALU 8 bit đơn giản với mã op như sau:
		op = 000 -> A+B
		op = 001 -> A-B
		op = 010 -> A&B
		op = 011 -> A|B
		op = 100 -> A^B
		op = 101 -> A>>B
		op = 110 -> A<<B
		op = 111 -> A==B
	
*/

module Simple_ALU(
	input [7:0] A,
	input [7:0] B,
	input [2:0] op,
	output reg [7:0] result,
	output reg carry,
	output zero
);

	wire [8:0] sum;
	
	assign sum = A + B;
	assign zero = (result == 8'd0);

	always @(*) begin
		case (op)
			3'b000: begin
				result <= A + B;
				carry = sum[8];
			end
			
			3'b001: begin
				result <= A - B;
				carry = (A < B);
			end
			
			3'b010: result <= A & B;
			3'b011: result <= A | B;
			3'b100: result <= A ^ B;
			3'b101: result <= A >> B;
			3'b110: result <= A << B;
			3'b111: result <= (A == B) ? 8'd1 : 8'd0;
			default: result <= 8'd0;
		endcase
	end
endmodule
		