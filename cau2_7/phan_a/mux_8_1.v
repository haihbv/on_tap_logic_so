module mux_8_1(
    input [7:0] D_in,   // 8 loi vao du lieu
    input [2:0] A_in,   // 3 loi vao dia chi
    output reg Y_out    // 1 loi ra
);
    always @(*) begin
        case (A_in)
            3'd0: Y_out = D_in[0];
            3'd1: Y_out = D_in[1];
            3'd2: Y_out = D_in[2];
            3'd3: Y_out = D_in[3];
            3'd4: Y_out = D_in[4];
            3'd5: Y_out = D_in[5];
            3'd6: Y_out = D_in[6];
            3'd7: Y_out = D_in[7];
            default: Y_out = 1'b0;
        endcase
    end


endmodule