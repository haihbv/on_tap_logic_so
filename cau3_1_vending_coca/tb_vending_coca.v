module tb_vending_coca();
	reg clk;
	reg rst_n;
	reg [1:0] coin;
	wire Z1;	// nha chai
	wire Z2;	// tra 1000 xu
	wire Z3; // tra 500 xu

	vending_coca uut(
		.clk(clk),
		.rst_n(rst_n),
		.coin(coin),
		.Z1(Z1),
		.Z2(Z2),
		.Z3(Z3)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$monitor("t=%d | rst_n=%d | coin=%d-state=%d | coca=%d-xu1k=%d-xu500=%d", $time, rst_n, coin, uut.state, Z1, Z2, Z3);
	end
	
	initial begin
		rst_n = 0; coin = 2'd0;
		#10; rst_n = 1;
		
		// 1000 + 2000 = 3000 -> coca
		coin = 2'b10; #10;
		coin = 2'b11; #10;
		coin = 2'b00; #10;
		
		// 2000 + 2000 = 4000 -> coca + xu1000
		coin = 2'b11; #10;
		coin = 2'b11; #10;
		coin = 2'b00; #10;
		
		// 500 + 2000 + 2000 = 4500 -> coca + xu1000 + xu500
		coin = 2'b01; #10;
		coin = 2'b11; #10;
		coin = 2'b11; #10;
		coin = 2'b00; #10;
		
		$finish;
	end
	
endmodule

