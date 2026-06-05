module Decode_3_8_tb;
	reg [2:0] sel;
	reg ce;
	wire [7:0] Q;
	
	Decode_3_8 uut (.sel(sel), .ce(ce), .Q(Q));
	
	integer i;
	
	initial begin
		$monitor("sel: %d, ce: %d, Q: %b", sel, ce, Q);
	
		ce = 1;
		#10;
		
		ce = 0;
		for(i=0; i<8; i=i+1) begin
			sel = i;
			#10;
		end
		
		sel = 3;
		ce = 1;
		#10;
		
		$finish;
		
	end
endmodule
