module triggerJK(
	input clk,
	input rst_n,
	input S,
	input R,
	input J,
	input K,
	output reg Q,
	output Q_n
);

	assign Q_n = ~Q;
	always @(posedge clk or negedge rst_n or posedge S or posedge R) begin
		if (!rst_n || R) Q <= 0;
		else if (S) Q <= 1;
		else begin
			Q <= (J & ~Q) | (~K & Q);
		end
	end

endmodule
