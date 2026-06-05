module Trigger_JK(
	input clk,
	input clear,
	input J,
	input K,
	output reg Q,
	output wire Qn
);
	assign Qn = ~Q;
	
	always @(negedge clk or negedge clear) begin
		if(!clear) Q <= 0;
		else Q <= (J & ~Q) | (~K & Q); 
	end
endmodule


module MultiJK(
	input clk,
	input clear,
	output [3:0] Q
);
	
	wire [3:0] j, k;
	
	Trigger_JK f1 (.clk(clk), .clear(clear), .J(j[0]), .K(k[0]), .Q(Q[0]));
	Trigger_JK f2 (.clk(clk), .clear(clear), .J(j[1]), .K(k[1]), .Q(Q[1]));
	Trigger_JK f3 (.clk(clk), .clear(clear), .J(j[2]), .K(k[2]), .Q(Q[2]));
	Trigger_JK f4 (.clk(clk), .clear(clear), .J(j[3]), .K(k[3]), .Q(Q[3]));
	
	assign j[0] = 1;
	assign k[0] = 1;
	
	assign j[1] = Q[0];
	assign k[1] = Q[0];
	
	assign j[2] = Q[0] & Q[1];
	assign k[2] = j[2];
	
	assign j[3] = j[2] & Q[2];
	assign k[3] = j[3];

endmodule
