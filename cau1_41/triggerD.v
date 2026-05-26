module triggerD(
    input clk,
    input rst_n,
    input S,
    input R,
    input D,
    output reg Q,
    output Q_n
);

    assign Q_n = ~Q;

    always @(posedge clk or negedge rst_n or posedge S or posedge R) begin
        if (!rst_n)
            Q <= 0;
        else if (S)
            Q <= 1;
        else if (R)
            Q <= 0;
        else
            Q <= D;
    end

endmodule
