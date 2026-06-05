module Counter8bit(
	input clk, 
	input reset,
	input load,
	input ce,
	input inc, // dem tien = 1, dem lui = 0
	input [7:0] load_num,
	output reg [7:0] Q
);

	always @(negedge clk or negedge reset) begin
		if(!reset) Q <= 8'd0;
		else begin
			if(!load) Q <= load_num;
			else begin
				if(!ce) begin
					if(inc) Q <= Q + 1;
					else 	  Q <= Q - 1;
				end
			end
		end
	end
endmodule
