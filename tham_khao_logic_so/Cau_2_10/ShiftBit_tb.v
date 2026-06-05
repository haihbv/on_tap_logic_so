module ShiftBit_tb;
	reg clk, set, reset, ce, din;
	wire [7:0] dout;
	
	ShiftBit uut (
		.clk(clk),
		.set(set),
		.reset(reset),
		.ce(ce),
		.din(din),
		.dout(dout)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	reg [7:0] IN;
	integer i;
	initial begin
		IN = 8'b10110101;
		
		set = 0; reset = 1; #20;
		set = 1; reset = 0; #20;
		
		set = 0; reset = 0;
		ce = 1;
		
		for(i=0; i<8; i=i+1) begin
			din = IN[i];
			#10;
			$display("din: %b, dout: %b", din, dout);
		end
	end
endmodule
		