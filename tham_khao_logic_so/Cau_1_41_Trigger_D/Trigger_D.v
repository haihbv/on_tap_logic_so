module Trigger_D(
	input clk,
	input reset,
	input D,
	input S,
	input R,
	output reg Q,
	output Q_n
);

	assign Q_n = ~Q;
	
	always @(posedge clk or negedge reset or posedge R or posedge S) begin
		if(!reset) Q <= 0;
		else begin
			if(R) 			Q <= 0;
			else if(S) 		Q <= 1;
			else 				Q <= D;
		end 
	end
endmodule
