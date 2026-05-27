module tb_demux_1to8();
    reg d;
    reg [2:0] s;
    wire [7:0] y;

    demux_1to8 uut(
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        d = 1;
        s = 3'b000; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b001; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b010; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b011; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b100; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b101; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b110; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
        s = 3'b111; #10; $display("d:%d, s:%d, y:%8b", d, s, y);

        d = 0;
        s = 3'b101; #10; $display("d:%d, s:%d, y:%8b", d, s, y);
    end
endmodule
