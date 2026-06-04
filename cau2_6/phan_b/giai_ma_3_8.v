// tich cuc thap
module giai_ma_3_8(
    input [2:0] A_in,
    input en_n,
    output reg [7:0] D_out
);

    always @(*) begin
        D_out = 8'b11111111;
        if (!en_n) begin
            case (A_in)
                3'b000: D_out = 8'b11111110;
                3'b001: D_out = 8'b11111101;
                3'b010: D_out = 8'b11111011;
                3'b011: D_out = 8'b11110111;
                3'b100: D_out = 8'b11101111;
                3'b101: D_out = 8'b11011111;
                3'b110: D_out = 8'b10111111;
                3'b111: D_out = 8'b01111111;
 		    endcase
        end
    end
endmodule
