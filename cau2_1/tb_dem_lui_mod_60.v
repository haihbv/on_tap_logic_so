module tb_dem_lui_mod_60();
    reg clk;
    reg rst_n;
    reg load;
    reg ce;
    reg [3:0] load_chuc;
    reg [3:0] load_donvi;
    wire [7:0] chuc_out;
    wire [7:0] donvi_out;

    dem_lui_mod_60 uut(
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .ce(ce),
        .load_chuc(load_chuc),
        .load_donvi(load_donvi),
        .chuc_out(chuc_out),
        .donvi_out(donvi_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("clk:%d, rst_n:%d, load:%d, ce:%d, load_chuc: %d, load_donvi: %d, chuc_out: %d, donvi_out: %d", clk, rst_n, load, ce, load_chuc, load_donvi, uut.chuc, uut.donvi);
    end

    initial begin
		rst_n = 0;
		load = 0;
		ce = 0;
		load_chuc = 0;
		load_donvi = 0;
	
		#20;
		rst_n = 1;  
	
		load_chuc = 4'd2;
		load_donvi = 4'd5;
	
		load = 1; #10;
		load = 0;
	
		ce = 1;
	
		#1000;
		$finish;
	end

endmodule