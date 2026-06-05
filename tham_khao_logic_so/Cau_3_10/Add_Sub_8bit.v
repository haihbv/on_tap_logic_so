module Add_Sub_8bit(
	input [7:0] a,
	input [7:0] b,
	input [1:0] sel,
	input cin,
	output cout,
	output [7:0] sum
);
	wire signed [7:0] a_s = a;
	wire signed [7:0] b_s = b;
	
	wire [8:0] add_us = ({1'b0, a} + {1'b0, b} + cin);
	wire [8:0] sub_us = ({1'b0, a} - {1'b0, b} - cin);
	
	wire signed [8:0] add_s = (a_s + b_s + cin);
	wire signed [8:0] sub_s = (a_s - b_s - cin);
	
	assign sum = (sel == 2'b00) ? add_us :
					 (sel == 2'b01) ? add_s  :
					 (sel == 2'b10) ? sub_us :
										   sub_s;
											
	assign cout = (sel == 2'b00) ? add_us[8] : 
					  (sel == 2'b10) ? sub_us[8] : 
											 1'b0; // Signed không dùng carry
endmodule
