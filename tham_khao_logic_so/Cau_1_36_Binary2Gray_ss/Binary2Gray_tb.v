module Binary2Gray_tb;
	reg [3:0] binary;
	wire [3:0] gray;
	
	Binary2Gray uut (.binary(binary), .gray(gray));
	
	initial begin 
		$display("binary -> gray");
		$monitor("%b -> %b", binary, gray);
	end
	
	integer i;
	
	initial begin 
		for(i=0; i<16; i=i+1) begin
			binary = i; #10;
		end
		
		$finish;
	end
endmodule
