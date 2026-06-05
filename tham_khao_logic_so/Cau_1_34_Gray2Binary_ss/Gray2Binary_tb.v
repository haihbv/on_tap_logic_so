module Gray2Binary_tb;
	reg [3:0] gray;
	wire [3:0] binary;
	
	Gray2Binary uut (.gray(gray), .binary(binary));
	
	initial begin
		$display("Gray -> Binary");
		$monitor("%b -> %b", gray, binary);
	end
	
	
	integer i;
	
	initial begin
		for (i=0; i<16; i = i+1) begin
			gray = i; #10;
		end
	end
endmodule
