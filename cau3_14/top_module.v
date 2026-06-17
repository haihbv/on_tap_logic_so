module triggerD(
    input  clk,    // nối "Ghi"
    input  sd_n,   // Set trực tiếp, tích cực thấp
    input  cd_n,   // Clear trực tiếp, tích cực thấp — nối "Xóa"
    input  d,
    output reg q,
    output q_n
);
    assign q_n = ~q;
    always @(posedge clk or negedge sd_n or negedge cd_n) begin
        if (!cd_n)      q <= 1'b0;   // Xóa ưu tiên hơn Lập
        else if (!sd_n) q <= 1'b1;
        else            q <= d;
    end
endmodule

module top_module(
    input  vao_nt,           // Vào nối tiếp
    input  ghi,              // clock chung
    input  xoa_n,            // Xóa, tích cực thấp
    input  dk_ra,            // Điều khiển ra
    output q1, q2, q3, q4,   // Ra song song (qua AND)
    output ra_noi_tiep       // Ra nối tiếp = Q của F4
);
    wire q1_ff, q2_ff, q3_ff, q4_ff;

    triggerD ff1(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(vao_nt), .q(q1_ff));
    triggerD ff2(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(q1_ff),  .q(q2_ff));
    triggerD ff3(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(q2_ff),  .q(q3_ff));
    triggerD ff4(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(q3_ff),  .q(q4_ff));

    assign q1 = q1_ff & dk_ra;
    assign q2 = q2_ff & dk_ra;
    assign q3 = q3_ff & dk_ra;
    assign q4 = q4_ff & dk_ra;

    assign ra_noi_tiep = q4_ff;
endmodule
