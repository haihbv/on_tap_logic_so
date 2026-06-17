module tb_decade_counter;

    reg clk;
    reg rst_n;

    wire [3:0] count;

    decade_counter uut(
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 1;

        #23 rst_n = 0;
        #10 rst_n = 1;

        #120;

        $finish;
    end

    initial begin
        $monitor("count = %d", count);
    end

endmodule
