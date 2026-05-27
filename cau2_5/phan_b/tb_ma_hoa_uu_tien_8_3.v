module tb_ma_hoa_uu_tien_8_3();
    reg en_n;
    reg [7:0] d;
    wire [2:0] y;

    ma_hoa_uu_tien_8_3 uut(
        .en_n(en_n),
        .d(d),
        .y(y)
    );

    initial begin
        $monitor("en_n=%b d=%b y=%b", en_n, d, y);

        en_n = 1;
        d = 8'b11111111;
        #10;

        en_n = 0;
        d = 8'b11111110;
        #10;

        d = 8'b11110111;
        #10;

        d = 8'b01111111;
        #10;

        d = 8'b10111011;
        #10;

        d = 8'b11111111;
        #10;

        $finish;
    end
endmodule