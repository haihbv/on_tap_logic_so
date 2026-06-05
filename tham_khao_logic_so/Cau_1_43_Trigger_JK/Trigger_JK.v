module Trigger_JK(
	input clk,
	input reset,
	input J,
	input K,
	input S,
	input R,
	output reg Q,
	output Q_n
);

	assign Q_n = ~Q;
	
	always @(posedge clk or negedge reset or posedge S or posedge R) begin
		if(!reset || R) Q <= 0;
		else if(S) Q <= 1;
		else Q <= (J & ~Q) | (~K & Q);
	end
endmodule
