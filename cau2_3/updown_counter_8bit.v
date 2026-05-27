// clock suon am, reset khong dong bo, load, CE active low
// dem tien hoac dem lui
// hien thi len led 7 thanh
module updown_counter_8bit(
    input clk,  
    input rst_n,    // active low
    input inc,      // tien hoac lui
    input CE,
    input load,
    input [7:0] load_num,
    output reg [7:0] counter
);

    always @(negedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
        end
        else begin
            if (!load) counter <= load_num;
            else begin
                if (!CE) begin
                    if (inc) counter <= counter + 1;
                    else counter <= counter - 1;
                end
            end
        end
    end

endmodule
