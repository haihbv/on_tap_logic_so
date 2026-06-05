module Gray2Binary_tb;
	reg clk;
	reg rst;
	reg [3:0] gray;
	wire [3:0] binary;
	
	Gray2Binary uut (
		.clk(clk),
		.rst(rst),
		.gray(gray), 
		.binary(binary)
	);
	
	initial  begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	integer i;
	
	initial begin
		rst = 0; #20;
		rst = 1;
		
		$display("gray -> binary");
		
		for (i=0; i<16; i=i+1) begin
			gray = i; #10;
			$display("%b -> %b", gray, binary);
		end
		
		$finish;
	end
endmodule
	
	