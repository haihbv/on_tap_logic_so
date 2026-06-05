module ShiftBit(
	input clk,
	input set,
	input reset,
	input ce,
	input din,
	output reg [7:0] dout
);
	always @(posedge clk or posedge reset or posedge set) begin
		if(reset) 		dout <= 8'b00000000;
		else if(set) 	dout <= 8'b11111111;
		else begin
			if(ce) dout <= {din, dout[7:1]};
		end
	end
endmodule
			