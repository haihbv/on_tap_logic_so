`timescale 1ns/1ps

module Add_Sub_8bit_tb;

    reg  [7:0] a, b;
    reg  [1:0] sel;
    reg  cin;
    wire [7:0] sum;
    wire cout;

    // Gọi DUT
    Add_Sub_8bit uut (
        .a(a),
        .b(b),
        .sel(sel),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        $display("=== Testbench Start ===");
        
        cin = 0;

        // Test 1: add unsigned (sel = 00)
        sel = 2'b00;
        a = 8'd100; b = 8'd50;
        #10;
        $display("ADD_U: a=%d b=%d sum=%d cout=%b", a, b, sum, cout);

        // Test 2: add signed (sel = 01)
        sel = 2'b01;
        a = -50; b = 20;    // dạng signed
        #10;
        $display("ADD_S: a=%d b=%d sum=%d cout=%b", $signed(a), $signed(b), $signed(sum), cout);

        // Test 3: sub unsigned (sel = 10)
        sel = 2'b10;
        a = 8'd10; b = 8'd40;
        #10;
        $display("SUB_U: a=%d b=%d sum=%d cout=%b", a, b, sum, cout);

        // Test 4: sub signed (sel = 11)
        sel = 2'b11;
        a = -30; b = 40;
        #10;
        $display("SUB_S: a=%d b=%d sum=%d cout=%b", $signed(a), $signed(b), $signed(sum), cout);

        // Test thêm vài mẫu khác
        $display("=== Random Test ===");
        repeat (10) begin
            a = $random;
            b = $random;
            sel = $random % 4;
            cin = $random % 2;
            #10;
            $display("sel=%b a=%0d b=%0d cin=%b --> sum=%0d cout=%b",
                      sel, $signed(a), $signed(b), cin, $signed(sum), cout);
        end

        $display("=== Testbench Finished ===");
        $stop;
    end

endmodule
