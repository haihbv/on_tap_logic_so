module tb_shift_register;

    reg clk;
    reg load;
    reg serial_in;
    reg [7:0] data_in;

    wire [7:0] q;

    shift_register #(8) uut(
        .clk(clk),
        .load(load),
        .serial_in(serial_in),
        .data_in(data_in),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        load = 1;
        data_in = 8'b10101010;
        serial_in = 0;

        #10;

        load = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        $finish;
    end

    initial begin
        $monitor("q = %b", q);
    end

endmodule
