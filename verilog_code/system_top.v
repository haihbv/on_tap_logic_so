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
	output [7:0] chuc_out,
	output [7:0] donvi_out
);
	reg [3:0] chuc, donvi;
	
	led7Seg led_chuc(.num(chuc), .pin(chuc_out));
	led7Seg led_donvi(.num(donvi), .pin(donvi_out));
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			chuc <= 4'd0;
			donvi <= 4'd0;
		end
		else begin
			if (donvi == 4'd9) begin
				donvi <= 4'd0;
				if (chuc == 4'd9) chuc <= 4'd0;
				else chuc <= chuc + 1;
			end
			else donvi <= donvi + 1;
		end
	end

endmodule
