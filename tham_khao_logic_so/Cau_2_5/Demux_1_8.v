module Demux_1_8(
	input D,
	input [2:0] sellect,
	output reg [7:0] Q
);
	always @(*) begin
		Q = 8'd0;
		case (sellect)
			3'd0: Q[0] = D;
			3'd1: Q[1] = D;
			3'd2: Q[2] = D;
			3'd3: Q[3] = D;
			3'd4: Q[4] = D;
			3'd5: Q[5] = D;
			3'd6: Q[6] = D;
			3'd7: Q[7] = D;
			3'd8: Q[8] = D;
			3'd9: Q[9] = D;
		endcase
	end
endmodule


module Priority_8_3(
	input [7:0] D,
	input ce,
	output reg [2:0] Q
);

	always @(*) begin
		if(ce) Q = 3'b111; // Tắt đầu ra
		else begin
			casez (D) // ?: Trạng thái bất kỳ
				8'b0???????: Q = 3'b000; // D7
				8'b10??????: Q = 3'b001; // D6
				8'b110?????: Q = 3'b010; // D5
				8'b1110????: Q = 3'b011; // D4
				8'b11110???: Q = 3'b100; // D3
				8'b111110??: Q = 3'b101; // D2 
				8'b1111110?: Q = 3'b110; // D1
				8'b11111110: Q = 3'b111; // D0
				default: 	 Q = 3'b111;
			endcase
		end
	end
endmodule
