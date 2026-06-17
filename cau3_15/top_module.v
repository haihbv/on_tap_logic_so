module triggerD(
    input  clk,    
    input  sd_n,   
    input  cd_n,   
    input  d,
    output reg q,
    output q_n
);
    assign q_n = ~q;

    always @(posedge clk or negedge sd_n or negedge cd_n) begin
        if (!cd_n)      q <= 1'b0;
        else if (!sd_n) q <= 1'b1;
        else            q <= d;
    end
endmodule

module top_module(
    input  d1, d2, d3, d4,  
    input  ghi,              
    input  xoa_n,            
    input  dk_ra,            
    output q1, q2, q3, q4,   
    output ra_noi_tiep       
);
    wire q1_ff, q2_ff, q3_ff, q4_ff;

    triggerD ff1(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(d1), .q(q1_ff));
    triggerD ff2(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(d2), .q(q2_ff));
    triggerD ff3(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(d3), .q(q3_ff));
    triggerD ff4(.clk(ghi), .sd_n(1'b1), .cd_n(xoa_n), .d(d4), .q(q4_ff));

    assign q1 = q1_ff & dk_ra;
    assign q2 = q2_ff & dk_ra;
    assign q3 = q3_ff & dk_ra;
    assign q4 = q4_ff & dk_ra;

    assign ra_noi_tiep = q4_ff;
endmodule
