module tb_triggerD();
	reg clk;
	reg rst_n;
	reg R;
	reg S;
	reg D;
	wire Q;
	wire Q_n;
	
	triggerD uut (
        .clk  (clk),
        .rst_n(rst_n),
        .R    (R),
        .S    (S),
        .D    (D),
        .Q    (Q),
        .Q_n  (Q_n)
    );
	 
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		clk   = 0;
		rst_n = 0;
		S     = 1;
		R     = 1;
		D     = 0;
	
		#20;
		rst_n = 1;
	
		R = 0; #10;
		R = 1;
	
		S = 0; #10;
		S = 1;
	
		D = 1; #10;
		D = 0; #10;
		D = 1; #10;
	
		$finish;
	end
	
	initial begin
		$monitor("clk=%d, rst_n=%d, R=%d, S=%d, D=%d, Q=%d, Q_n=%d", clk, rst_n, R, S, D, Q, Q_n);
	end

endmodule
