module Counter(
	input clk,
	input reset,
	input load,
	input up,
	input [9:0] load_data,
	output reg [9:0] data_out
);
	always @(posedge clk or negedge reset) begin
		if(!reset) data_out <= 10'd123;
		else begin
			if(load) data_out <= load_data;
			else begin
				if(up) begin
					if(data_out >= 10'd678) data_out <= 10'd123;
					else data_out <= data_out + 1;
				end
				else begin
					if(data_out <= 10'd123) data_out <= 10'd678;
					else data_out <= data_out - 1;
				end
			end
		end
	end
endmodule
