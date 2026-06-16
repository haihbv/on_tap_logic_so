
// Viết mô tả VHDL cho IC ghi dịch 8 bit hoạt động tại sườn dương clock, có tín hiệu chốt clock (CE) mức tích cực cao, 
// tín hiệu lập không đồng bộ tích cực cao?
module shift_bit(
	input clk,
	input rst_n,
	input ce,
	input set,
	input d_in,
	output reg [7:0] d_out
);

	always @(posedge clk or negedge rst_n or posedge set) begin
		if (!rst_n) d_out <= 8'b00000000;
		else if (set) d_out <= 8'b11111111;
		else begin
			if (ce) d_out <= {d_in, d_out[7:1]};
		end
	end

endmodule
