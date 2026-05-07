`ifndef EIGHT_BIT_LOG_RIGHT
`define EIGHT_BIT_LOG_RIGHT



module two_one_mux(
    input a,b,
    input sel,
    output out 
);

assign out = (sel==1)? a:b;
endmodule 


module eight_bit_log_right(
    input [7:0] in,
    output [7:0] shift_out,
    input [2:0] sel
);
 //stage_1

 wire [7:0] w;

two_one_mux m0(.a(in[1]), .b(in[0]), .sel(sel[0]), .out(w[0]));
two_one_mux m1(.a(in[2]), .b(in[1]), .sel(sel[0]), .out(w[1]));
two_one_mux m2(.a(in[3]), .b(in[2]), .sel(sel[0]), .out(w[2]));
two_one_mux m3(.a(in[4]), .b(in[3]), .sel(sel[0]), .out(w[3]));
two_one_mux m4(.a(in[5]), .b(in[4]), .sel(sel[0]), .out(w[4]));
two_one_mux m5(.a(in[6]), .b(in[5]), .sel(sel[0]), .out(w[5]));
two_one_mux m6(.a(in[7]), .b(in[6]), .sel(sel[0]), .out(w[6]));
two_one_mux m7(.a(1'b0), .b(in[7]), .sel(sel[0]), .out(w[7]));


//stage_2

wire [7:0] w1;

two_one_mux m8(.a(w[2]),.b(w[0]),.sel(sel[1]),.out(w1[0]));
two_one_mux m9(.a(w[3]),.b(w[1]),.sel(sel[1]),.out(w1[1]));
two_one_mux m10(.a(w[4]),.b(w[2]),.sel(sel[1]),.out(w1[2]));
two_one_mux m11(.a(w[5]),.b(w[3]),.sel(sel[1]),.out(w1[3]));
two_one_mux m12(.a(w[6]),.b(w[4]),.sel(sel[1]),.out(w1[4]));
two_one_mux m13(.a(w[7]),.b(w[5]),.sel(sel[1]),.out(w1[5]));
two_one_mux m14(.a(1'b0),.b(w[6]),.sel(sel[1]),.out(w1[6]));
two_one_mux m15(.a(1'b0),.b(w[7]),.sel(sel[1]),.out(w1[7]));

//stage_3

two_one_mux m16(.a(w1[4]),.b(w1[0]),.sel(sel[2]),.out(shift_out[0]));
two_one_mux m17(.a(w1[5]),.b(w1[1]),.sel(sel[2]),.out(shift_out[1]));
two_one_mux m18(.a(w1[6]),.b(w1[2]),.sel(sel[2]),.out(shift_out[2]));
two_one_mux m19(.a(w1[7]),.b(w1[3]),.sel(sel[2]),.out(shift_out[3]));
two_one_mux m20(.a(1'b0),.b(w1[4]),.sel(sel[2]),.out(shift_out[4]));
two_one_mux m21(.a(1'b0),.b(w1[5]),.sel(sel[2]),.out(shift_out[5]));
two_one_mux m22(.a(1'b0),.b(w1[6]),.sel(sel[2]),.out(shift_out[6]));
two_one_mux m23(.a(1'b0),.b(w1[7]),.sel(sel[2]),.out(shift_out[7]));

endmodule


`endif 