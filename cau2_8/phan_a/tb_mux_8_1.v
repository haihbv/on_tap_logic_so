module tb_mux_8_1();
    reg [7:0] D_in;
    reg [2:0] A_in;
    wire Y_out;

    mux_8_1 uut(
        .D_in(D_in),
        .A_in(A_in),
        .Y_out(Y_out)
    );

    initial begin
        $monitor("D_in:%d, A_in:%d, Y_out:%d", D_in, A_in, Y_out);
    end

    integer i;
    initial begin
        D_in = 8'b10110011;
        for (i = 0; i < 8; i = i + 1) begin
            A_in = i;
            #10;
        end
        $finish;
    end

endmodule