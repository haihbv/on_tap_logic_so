module Binary2Gray(
	input clk,
	input reset,
	input [3:0] binary,
	output reg [3:0] gray
);

	always @(posedge clk or negedge reset) begin
		if(!reset) begin
			gray <= 4'b0000;
		end
		
		else begin
			gray[3] <= binary[3];
			gray[2] <= binary[3] ^ binary[2];
			gray[1] <= binary[2] ^ binary[1];
			gray[0] <= binary[1] ^ binary[0];
		end
	end
endmodule
