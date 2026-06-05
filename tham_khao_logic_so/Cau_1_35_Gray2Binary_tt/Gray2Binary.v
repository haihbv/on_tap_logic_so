module Gray2Binary(
	input clk,
	input rst,
	input [3:0] gray,
	output reg [3:0] binary
);
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			binary = 4'b0000;
		end
		
		else begin
			binary[3] <= gray[3];
			binary[2] <= gray[3] ^ gray[2];
			binary[1] <= gray[3] ^ gray[2] ^ gray[1];
			binary[0] <= gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
		end
	end
endmodule
