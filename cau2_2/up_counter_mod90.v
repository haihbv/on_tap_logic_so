module led_7seg(
    input [3:0] num,
    output reg [7:0] pin
);

    always @(*) begin
        case (num)
            4'd0: pin = 8'hC0;
            4'd1: pin = 8'hF9;
            4'd2: pin = 8'hA4;
            4'd3: pin = 8'hB0;
            4'd4: pin = 8'h99;
            4'd5: pin = 8'h92;
            4'd6: pin = 8'h82;
            4'd7: pin = 8'hF8;
            4'd8: pin = 8'h80;
            4'd9: pin = 8'h90;
            default: pin = 8'hFF;
        endcase
    end

endmodule

// clk suon am, reset khong dong bo, load, CE muc tich cuc thap
module up_counter_mod90(
	input clk,
	input rst_n,
	input load,
	input [3:0] load_chuc,
	input [3:0] load_donvi,
	input ce_n,
	output [7:0] chuc_out,
	output [7:0] donvi_out
);
	reg [3:0] chuc, donvi;
	
	led_7seg led_chuc(.num(chuc), .pin(chuc_out));
	led_7seg led_donvi(.num(donvi), .pin(donvi_out));
	
	always @(negedge clk or negedge rst_n) begin
		if (!rst_n) begin
			chuc <= 4'd0;
			donvi <= 4'd0;
		end
		
		else if (load) begin
			chuc <= load_chuc;
			donvi <= load_donvi;
		end
		
		else if (!ce_n) begin
			if (donvi == 4'd9) begin
				donvi <= 4'd0;
				if (chuc == 4'd8) begin
					chuc <= 4'd0;
				end
				else chuc <= chuc + 1;
			end
			else donvi <= donvi + 1;
		end
	end


endmodule
