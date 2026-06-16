module counter (
	input clk,
	input rst_n,
	input load,
	input mode,
	input [9:0] load_data,
	output reg [9:0] d_out
);
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) d_out <= 10'd123;
		else begin
			if (load) d_out <= load_data;
			else begin
				if (mode) begin
					if (d_out >= 10'd678) d_out <= 10'd123;
					else d_out <= d_out + 1;
				end
				else
					if (d_out <= 10'd123) d_out <= 10'd678;
					else d_out <= d_out - 1;
			end
		end
	end
endmodule

