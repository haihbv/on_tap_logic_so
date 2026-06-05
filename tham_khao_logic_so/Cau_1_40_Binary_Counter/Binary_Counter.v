module Binary_Counter(
	input clk,
	input reset,
	output reg [7:0] Q
);
	always @(posedge clk or negedge reset) begin
		if(!reset) Q <= 7'd0;
		else Q <= Q + 1;
	end
endmodule
