module bcd_to_7seg(
    input [3:0] in,
    output [7:0] Y_out
);

    assign Y_out =  (in == 4'd0) ? 8'hC0 :
                    (in == 4'd1) ? 8'hF9 :
                    (in == 4'd2) ? 8'hA4 :
                    (in == 4'd3) ? 8'hB0 :
                    (in == 4'd4) ? 8'h99 :
                    (in == 4'd5) ? 8'h92 :
                    (in == 4'd6) ? 8'h82 :
                    (in == 4'd7) ? 8'hF8 :
                    (in == 4'd8) ? 8'h80 :
                    (in == 4'd9) ? 8'h90 : 8'hFF;
endmodule
