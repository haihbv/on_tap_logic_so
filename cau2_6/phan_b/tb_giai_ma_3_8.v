module tb_giai_ma_3_8();
    reg [2:0] A_in;
    reg en_n;
    wire [7:0] D_out;

    giai_ma_3_8 uut(
        .A_in(A_in),
        .en_n(en_n),
        .D_out(D_out)
    );

    integer i;

    initial begin
        en_n = 1;
        A_in = 0;
        #10;

        en_n = 0;

        for (i = 0; i < 8; i = i + 1) begin
            A_in = i;
            #10;
        end

        $finish;
    end
	 
    initial begin
        $monitor("A_in=%3b, en_n=%b, D_out=%b", A_in, en_n, D_out);
    end

endmodule