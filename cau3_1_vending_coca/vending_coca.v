module vending_coca(
	input clk,
	input rst_n,
	input [1:0] coin,
	output reg Z1,	// nha chai
	output reg Z2,	// tra 1000 xu
	output reg Z3 // tra 500 xu
);
	
	// trang thai
	localparam S0 = 3'd0,
				  S1 = 3'd1,
				  S2 = 3'd2,
				  S3 = 3'd3,
				  S4 = 3'd4,
				  S5 = 3'd5;
	// ma hoa dong xu
	localparam C500 = 2'b01, C1k = 2'b10, C2k = 2'b11;
	
	reg [2:0] state, next_state;
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) state <= S0;
		else state <= next_state;
	end
	
	always @(*) begin
		next_state = state;
		case (state)
			S0: case (coin) // 0 xu
						C500: next_state = S1;
						C1k: next_state = S2;
						C2k: next_state = S4;
				 endcase
				 
			S1: case (coin) // 500 xu
						C500: next_state = S2;
						C1k: next_state = S3;
						C2k: next_state = S5;
				 endcase
				 
			S2: case (coin) // 1000 xu
						C500: next_state = S3;
						C1k: next_state = S4;
						C2k: next_state = S0; // 3000 xu
				 endcase
			
			S3: case (coin) // 1500 xu
						C500: next_state = S4;
						C1k: next_state = S5;
						C2k: next_state = S0; // 3500 xu
				 endcase
				 
			S4: case (coin) // 2000 xu
						C500: next_state = S5;
						C1k: next_state = S0; // 3000 xu
						C2k: next_state = S0; // 4000 xu
				 endcase
				 
			S5: case (coin) // 2500 xu
						C500: next_state = S0; // 3000 xu
						C1k: next_state = S0;	// 3500 xu
						C2k: next_state = S0; // 4500 xu
				 endcase
				 
			default: next_state <= S0;
		endcase
	end
	
	always @(*) begin
		Z1 = 1'b0; Z2 = 1'b0; Z3 = 1'b0;
		case (state)
			S2: if (coin == C2k) Z1 = 1'b1;
			S3: if (coin == C2k) begin
					Z1 = 1'b1; Z3 = 1'b1;
				 end
			S4: begin
				 if (coin == C1k) Z1 = 1'b1;
				 else if (coin == C2k) begin
						Z1 = 1'b1; Z2 = 1'b1;
					end
				 end
			S5: begin
				 if (coin == C500) Z1 = 1'b1;
				 else if (coin == C1k) begin
						Z1 = 1'b1; Z3 = 1'b1;
					end
				 else if (coin == C2k) begin
						Z1 = 1'b1; Z2 = 1'b1; Z3 = 1'b1;
					end
				 end
		endcase
	end
endmodule
