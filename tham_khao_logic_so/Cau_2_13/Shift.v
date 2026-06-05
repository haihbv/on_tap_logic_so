module Shift #(parameter N = 8)(
	input clk,
	input load,
	input din,
	input [N-1:0] load_in,
	output reg [N-1:0] dout
);

	always @(posedge clk) begin
		if(load) dout <= load_in;
		else dout <= {din, dout[N-1:1]};
	end
endmodule


module Counter(
	input clk,
	input reset,
	output reg [6:0] seg
);
	
	reg[3:0] num;
	
	always @(posedge clk) begin
		if(!reset) num <= 4'd0;
		else begin
			if(num == 4'd9) num <= 4'd0;
			else num <= num + 1;
		end
		
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
		endcase
	end
endmodule
	