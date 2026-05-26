module binaryCounter(
	input clk,
	input rst_n,
	output reg [7:0] counter
);

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) counter <= 0;
		else counter <= counter + 1;
	end

endmodule
