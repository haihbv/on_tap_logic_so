module triggerRS(
	input clk,
	input rst_n,
	input pre,
	input clr,
	input r,
	input s,
	output reg q,
	output q_n
);

	assign q_n = ~q;
	
	always @(posedge clk or negedge rst_n or posedge pre or posedge clr) begin
		if (!rst_n) q <= 0;
		else if (pre) q <= 1;
		else if (clr) q <= 0;
		else q <= (s | (~r & q));
	end
	
endmodule
