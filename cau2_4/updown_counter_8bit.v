
// clk suon duong, reset dong bo, load, ce muc cao, input 
module updown_counter_8bit(
	input clk,
	input rst_n,
	input ce,
	input inc, // 1: dem tien - 0: dem lui
	input load,
	input [7:0] load_num,
	output reg [7:0] counter
);

	always @(posedge clk) begin
		if (!rst_n) begin
			counter <= 0;
		end
		else if (load) counter <= load_num;
		else if (ce) begin
			if (inc) counter <= counter + 1;
			else counter <= counter - 1;
		end
		
	end

endmodule
