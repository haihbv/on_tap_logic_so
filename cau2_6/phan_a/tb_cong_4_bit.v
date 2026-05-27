module tb_cong_4_bit();

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    cong_4_bit uut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    integer i, j;

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;
                b = j;

                #10;

                $display("a=%d, b=%d, sum=%d, carry=%d", a, b, sum, carry);
            end
        end

        $finish;
    end

endmodule
