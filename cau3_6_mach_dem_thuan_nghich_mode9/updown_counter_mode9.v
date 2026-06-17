// uint16_t Led7Seg[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

module led_7seg(
	input [3:0] num,
	output reg [7:0] pin
);
	always @(*) begin
		case (num)
			4'd0: pin = 8'hC0;
			4'd1: pin = 8'hF9;
			4'd2: pin = 8'hA4;
			4'd3: pin = 8'hB0;
			4'd4: pin = 8'h99;
			4'd5: pin = 8'h92;
			4'd6: pin = 8'h82;
			4'd7: pin = 8'hF8;
			4'd8: pin = 8'h80;
			4'd9: pin = 8'h90;
			default: pin = 8'hff;
		endcase
	end
endmodule

module updown_counter_mode9(
	input clk,
	input rst_n,
	input up,
	output reg [3:0] Z,
	output [7:0] Q
);
	
	led_7seg led_out(.num(Z), .pin(Q));
	
	localparam S0 = 4'd0,
           S1 = 4'd1,
           S2 = 4'd2,
           S3 = 4'd3,
           S4 = 4'd4,
           S5 = 4'd5,
           S6 = 4'd6,
           S7 = 4'd7,
           S8 = 4'd8;
	
	reg [3:0] state, next_state;
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) state <= S0;
		else state <= next_state;
	end
	
	always @(*) begin
		case (state)
			S0: next_state = (up) ? S1 : S8;
			S1: next_state = (up) ? S2 : S0;
			S2: next_state = (up) ? S3 : S1;
			S3: next_state = (up) ? S4 : S2;
			S4: next_state = (up) ? S5 : S3;
			S5: next_state = (up) ? S6 : S4;
			S6: next_state = (up) ? S7 : S5;
			S7: next_state = (up) ? S8 : S6;
			S8: next_state = (up) ? S0 : S7;
			default: next_state = S0;
		endcase
	end
	
	always @(*) begin
		case (state)
			S0: Z = 4'd0;
			S1: Z = 4'd1;
			S2: Z = 4'd2;
			S3: Z = 4'd3;
			S4: Z = 4'd4;
			S5: Z = 4'd5;
			S6: Z = 4'd6;
			S7: Z = 4'd7;
			S8: Z = 4'd8;
			default: Z = 4'd0;
		endcase
	end
endmodule

