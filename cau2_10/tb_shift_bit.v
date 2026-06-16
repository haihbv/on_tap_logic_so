module tb_shift_bit();

    reg clk, rst_n, ce, set, d_in;
    wire [7:0] d_out;

    shift_bit uut(
        .clk(clk),
        .rst_n(rst_n),
        .ce(ce),
        .set(set),
        .d_in(d_in),
        .d_out(d_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("t=%0t rst_n=%b set=%b ce=%b d_in=%b d_out=%b", $time, rst_n, set, ce, d_in, d_out);
    end

    integer i;

    initial begin
        rst_n = 0;
        set   = 0;
        ce    = 0;
        d_in  = 0;

        #10 rst_n = 1;

        #10 set = 1;
        #10 set = 0;

        ce = 1;
	
		  // d_in = 0;
        for (i = 0; i < 8; i = i + 1) begin
            d_in = i[0];   
            #10;
        end

        #20;
        $finish;
    end

endmodule
