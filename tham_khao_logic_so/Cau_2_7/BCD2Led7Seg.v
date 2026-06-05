module BCD2Led7Seg(
	input [3:0] in,
	output [6:0] out
);
	
	assign out = 	(in == 4'd0) ? 7'b1111110 :
						(in == 4'd1) ? 7'b0110000 :
						(in == 4'd2) ? 7'b1101101 :
						(in == 4'd3) ? 7'b1111001 :
						(in == 4'd4) ? 7'b0110011 :
						(in == 4'd5) ? 7'b1011011 :
						(in == 4'd6) ? 7'b1011111 :
						(in == 4'd7) ? 7'b1110000 :
						(in == 4'd8) ? 7'b1111111 :
						(in == 4'd9) ? 7'b1111011 : 7'b0000000;


endmodule
