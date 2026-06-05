module Mux_8_1(
	input [7:0] D,
	input [2:0] sel,
	output reg Q
);

	always @(*) begin
		case (sel)
			3'd0: Q = D[0];
			3'd1: Q = D[1];
			3'd2: Q = D[2];
			3'd3: Q = D[3];
			3'd4: Q = D[4];
			3'd5: Q = D[5];
			3'd6: Q = D[6];
			3'd7: Q = D[7];
		endcase
	end
endmodule
		