`timescale 1ns/1ps

module tb_up_counter_mod90();
    reg  clk;
    reg  rst_n;
    reg  load;
    reg  [3:0] load_chuc;
    reg  [3:0] load_donvi;
    reg  ce_n;
    wire [7:0] chuc_out;
    wire [7:0] donvi_out;

    up_counter_mod90 uut(
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .load_chuc(load_chuc),
        .load_donvi(load_donvi),
        .ce_n(ce_n),
        .chuc_out(chuc_out),
        .donvi_out(donvi_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("rst_n=%d load=%d ce_n=%d | nap=%d%d | dem=%d%d",
                  rst_n, load, ce_n, load_chuc, load_donvi, uut.chuc, uut.donvi);
    end

    initial begin
        rst_n = 0;        // reset (tich cuc thap) ngay tu dau
        load  = 0;
        ce_n  = 1;        // ce_n=1 -> chua cho dem
        load_chuc  = 0;
        load_donvi = 0;

        #20;
        rst_n = 1;        // tha reset

        // nap hang so 66
        load_chuc  = 4'd6;
        load_donvi = 4'd6;
        load = 1; #10; load = 0;

        // cho phep dem tien
        ce_n = 0;

        #1000;
        $finish;
    end
endmodule
