module Decode_3_8(
	input [2:0] sel,
	input ce,
	output [7:0] Q
);

	assign Q = !ce ? (~(8'b1 << (~sel))) : 8'b11111111;
	
endmodule
