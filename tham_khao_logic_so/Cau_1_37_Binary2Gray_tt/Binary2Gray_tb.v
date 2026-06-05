module Binary2Gray_tb;

	reg clk;
	reg rst;
	reg [3:0] binary;
	wire [3:0] gray;
	
	
	Binary2Gray uut (
		.clk(clk),
		.reset(rst),
		.binary(binary),
		.gray(gray)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = !clk;
	end
	
	integer i;
	
	initial begin
		$display("binary -> gray");
		
		rst = 0; #20;
		rst = 1;
		
		for(i=0; i<16; i=i+1) begin
			binary = i; #10;
			$display("%b -> %b", binary, gray);
		end
		
		$finish;
		
	end
endmodule
