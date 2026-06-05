
// Ý thứ nhất: Thanh ghi dịch nối tiếp 4 bit
module Shift4bit(
	input clk,
	input din,
	output reg [3:0] dout
);

	always @(posedge clk) begin
		dout <= {din, dout[3:1]};
	end
endmodule



// Ý thứ 2: Bộ đếm lên thập phân 2 digit đếm từ 00 đến 99, Reset đồng bộ tích cực thấp. 
module Led7Seg(
	input [3:0] num,
	output reg [6:0] seg
);

	always @(*) begin
		case (num)
			4'd0: seg <= 7'b1111110;
			4'd1: seg <= 7'b0110000;
			4'd2: seg <= 7'b1101101;
			4'd3: seg <= 7'b1111001;
			4'd4: seg <= 7'b0110011;
			4'd5: seg <= 7'b1011011;
			4'd6: seg <= 7'b1011111;
			4'd7: seg <= 7'b1110000;
			4'd8: seg <= 7'b1111111;
			4'd9: seg <= 7'b1111011;
			default: seg <= 7'b0000000;
		endcase
	end
endmodule


module Counter(
	input clk,
	input reset,
	output [6:0] chuc_out,
	output [6:0] donvi_out
);
	reg [3:0] chuc, donvi;
	
	Led7Seg led_chuc (.num(chuc), .seg(chuc_out));
	Led7Seg led_donvi (.num(donvi), .seg(donvi_out));
	
	always @(posedge clk) begin
		if(!reset) begin
			chuc <= 4'd0;
			donvi <= 4'd0;
		end
		
		else begin
			if(donvi == 4'd9) begin
				donvi <= 4'd0;
				if(chuc == 4'd9) chuc <= 4'd0;
				else chuc <= chuc + 1;
			end
			else donvi <= donvi + 1;
		end
	end
endmodule
