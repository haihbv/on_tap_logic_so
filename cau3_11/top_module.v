module triggerJK(
	input clk,
	input rst_n,
	input j,
	input k,
	output reg q,
	output q_n
);
	assign q_n = ~q;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) q <= 1'b0;
		else begin
			q <= (~k & q) | (j & ~q);
		end
	end
endmodule

module top_module(
	input clk,
	input rst_n,
	output Q1, Q2, Q3,
	output Q1_n, Q2_n, Q3_n
);
   triggerJK ff1(.clk(clk),   .rst_n(rst_n), .j(1'b1), .k(1'b1), .q(Q1), .q_n(Q1_n));
   triggerJK ff2(.clk(Q1_n),  .rst_n(rst_n), .j(Q3),   .k(1'b1), .q(Q2), .q_n(Q2_n));
   triggerJK ff3(.clk(Q1_n),  .rst_n(rst_n), .j(Q2_n), .k(1'b1), .q(Q3), .q_n(Q3_n));

endmodule
