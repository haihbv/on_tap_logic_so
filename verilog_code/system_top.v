// uint16_t Led7Seg[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
module led7Seg(
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

module system_top(
	input clk,
	input rst_n,
	input load,
	input ce,
	output [7:0] chuc_out,
	output [7:0] donvi_out,
	
	input load_chuc,
	input load_donvi
);
	reg [3:0] chuc, donvi;
	
	led7Seg led_chuc(.num(chuc), .pin(chuc_out));
	led7Seg led_donvi(.num(donvi), .pin(donvi_out));
	
	always @(posedge clk) begin
		if (!rst_n) begin
			chuc <= 4'd5;
			donvi <= 4'd9;
		end
		else if (load) begin
			chuc <= load_chuc;
			donvi <= load_donvi;
		end
		else if (ce) begin
			if (donvi == 4'd0) begin
				donvi <= 4'd9;
				if (chuc == 4'd0) begin
					chuc <= 4'd5;
				end
					chuc <= chuc - 1;
			end
			else donvi <= donvi + 1;
		end
	end
	
endmodule

