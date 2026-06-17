module shift_register #(
    parameter N = 8
)(
    input clk,
    input load,
    input serial_in,
    input [N-1:0] data_in,
    output reg [N-1:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data_in;
        else
            q <= {q[N-2:0], serial_in};
    end

endmodule
