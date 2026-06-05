module Combinational_Circuit_tb;

	reg D;
	reg [2:0] sellect;
	wire [7:0] Q;
	
	Demux_1_8 uut (.D(D), .sellect(sellect), .Q(Q));
	
	integer i;
	initial begin
		$monitor("D = %d, sel = %d, Q = %b", D, sellect, Q);
		
		D = 1;
		
		for(i = 0; i < 8; i = i + 1) begin
			sellect = i; #10;
		end
		
		D = 0;
		
		for(i = 0; i < 8; i = i + 1) begin
			sellect = i; #10;
		end
		
		$finish;
	end
	
endmodule

//module Combinational_Circuit_tb;
//	reg [7:0] D;
//	reg ce;
//	wire [2:0] Q;
//	
//	Priority_8_3 uut (
//		.D(D),
//		.ce(ce),
//		.Q(Q)
//	);
//	
//	integer i;
//	
//	initial begin
//		$monitor("D: %b, ce: %b, Q: %b", D, ce, Q);
//		
//		ce = 0;
//		
//		for(i=0; i<256; i=i+1) begin
//			D = i;
//			#5;
//		end
//		
//		D = 123; #5;
//		ce = 1; #5;
//		
//		$finish;
//	end
//endmodule
