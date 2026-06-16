module bin_dec_gray(
    input  [3:0] bin,        
    input  [3:0] gray_in,    
    output [3:0] chuc,       
    output [3:0] donvi,      
    output [3:0] gray,       
    output [3:0] bin_out     
);

    assign chuc  = bin / 10;     
    assign donvi = bin % 10;     

    assign gray = bin ^ (bin >> 1);

    assign bin_out[3] = gray_in[3];
    assign bin_out[2] = bin_out[3] ^ gray_in[2];
    assign bin_out[1] = bin_out[2] ^ gray_in[1];
    assign bin_out[0] = bin_out[1] ^ gray_in[0];

endmodule