module full_adder(
    input a,b,c,
    output sum,carry
);
assign sum = a^b^c;
assign carry = (a&b) | (b&c) | (c&a);
endmodule 

module half_adder(
    input x,y,
    output sum,carry
);
assign sum= x^y;
assign carry= x&y;
endmodule



module cla_16bit (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);

    wire [15:0] p, g;
    wire [16:0] c;

    assign p = a ^ b;   
    assign g = a & b;   

    assign c[0] = cin;

    assign c[1]  = g[0]  | (p[0]  & c[0]);
    assign c[2]  = g[1]  | (p[1]  & g[0]) |
                   (p[1]  & p[0]  & c[0]);

    assign c[3]  = g[2]  | (p[2]  & g[1]) |
                   (p[2]  & p[1]  & g[0]) |
                   (p[2]  & p[1]  & p[0]  & c[0]);

    assign c[4]  = g[3]  | (p[3]  & g[2]) |
                   (p[3]  & p[2]  & g[1]) |
                   (p[3]  & p[2]  & p[1]  & g[0]) |
                   (p[3]  & p[2]  & p[1]  & p[0]  & c[0]);

    assign c[5]  = g[4]  | (p[4]  & c[4]);
    assign c[6]  = g[5]  | (p[5]  & g[4]) |
                   (p[5]  & p[4]  & c[4]);

    assign c[7]  = g[6]  | (p[6]  & g[5]) |
                   (p[6]  & p[5]  & g[4]) |
                   (p[6]  & p[5]  & p[4]  & c[4]);

    assign c[8]  = g[7]  | (p[7]  & g[6]) |
                   (p[7]  & p[6]  & g[5]) |
                   (p[7]  & p[6]  & p[5]  & g[4]) |
                   (p[7]  & p[6]  & p[5]  & p[4]  & c[4]);

    assign c[9]  = g[8]  | (p[8]  & c[8]);
    assign c[10] = g[9]  | (p[9]  & g[8]) |
                   (p[9]  & p[8]  & c[8]);

    assign c[11] = g[10] | (p[10] & g[9]) |
                   (p[10] & p[9]  & g[8]) |
                   (p[10] & p[9]  & p[8]  & c[8]);

    assign c[12] = g[11] | (p[11] & g[10]) |
                   (p[11] & p[10] & g[9]) |
                   (p[11] & p[10] & p[9]  & g[8]) |
                   (p[11] & p[10] & p[9]  & p[8]  & c[8]);

    assign c[13] = g[12] | (p[12] & c[12]);
    assign c[14] = g[13] | (p[13] & g[12]) |
                   (p[13] & p[12] & c[12]);

    assign c[15] = g[14] | (p[14] & g[13]) |
                   (p[14] & p[13] & g[12]) |
                   (p[14] & p[13] & p[12] & c[12]);

    assign c[16] = g[15] | (p[15] & g[14]) |
                   (p[15] & p[14] & g[13]) |
                   (p[15] & p[14] & p[13] & g[12]) |
                   (p[15] & p[14] & p[13] & p[12] & c[12]);

    assign sum  = p ^ c[15:0];
    assign cout = c[16];

endmodule

module wallace_tree_multiplier(
     input  [7:0]  a,
    input  [7:0]  b,
    output [15:0] mul_out
);


wire [7:0] p_p1, p_p2, p_p3, p_p4;
    wire [7:0] p_p5, p_p6, p_p7, p_p8;

assign p_p1[0] = a[0] & b[0];
assign p_p1[1] = a[1] & b[0];
assign p_p1[2] = a[2] & b[0];
assign p_p1[3] = a[3] & b[0];
assign p_p1[4] = a[4] & b[0];
assign p_p1[5] = a[5] & b[0];
assign p_p1[6] = a[6] & b[0];
assign p_p1[7] = a[7] & b[0];


assign p_p2[0] = a[0] & b[1];
assign p_p2[1] = a[1] & b[1];
assign p_p2[2] = a[2] & b[1];
assign p_p2[3] = a[3] & b[1];
assign p_p2[4] = a[4] & b[1];
assign p_p2[5] = a[5] & b[1];
assign p_p2[6] = a[6] & b[1];
assign p_p2[7] = a[7] & b[1];


assign p_p3[0] = a[0] & b[2];
assign p_p3[1] = a[1] & b[2];
assign p_p3[2] = a[2] & b[2];
assign p_p3[3] = a[3] & b[2];
assign p_p3[4] = a[4] & b[2];
assign p_p3[5] = a[5] & b[2];
assign p_p3[6] = a[6] & b[2];
assign p_p3[7] = a[7] & b[2];


assign p_p4[0] = a[0] & b[3];
assign p_p4[1] = a[1] & b[3];
assign p_p4[2] = a[2] & b[3];
assign p_p4[3] = a[3] & b[3];
assign p_p4[4] = a[4] & b[3];
assign p_p4[5] = a[5] & b[3];
assign p_p4[6] = a[6] & b[3];
assign p_p4[7] = a[7] & b[3];


assign p_p5[0] = a[0] & b[4];
assign p_p5[1] = a[1] & b[4];
assign p_p5[2] = a[2] & b[4];
assign p_p5[3] = a[3] & b[4];
assign p_p5[4] = a[4] & b[4];
assign p_p5[5] = a[5] & b[4];
assign p_p5[6] = a[6] & b[4];
assign p_p5[7] = a[7] & b[4];


assign p_p6[0] = a[0] & b[5];
assign p_p6[1] = a[1] & b[5];
assign p_p6[2] = a[2] & b[5];
assign p_p6[3] = a[3] & b[5];
assign p_p6[4] = a[4] & b[5];
assign p_p6[5] = a[5] & b[5];
assign p_p6[6] = a[6] & b[5];
assign p_p6[7] = a[7] & b[5];


assign p_p7[0] = a[0] & b[6];
assign p_p7[1] = a[1] & b[6];
assign p_p7[2] = a[2] & b[6];
assign p_p7[3] = a[3] & b[6];
assign p_p7[4] = a[4] & b[6];
assign p_p7[5] = a[5] & b[6];
assign p_p7[6] = a[6] & b[6];
assign p_p7[7] = a[7] & b[6];


assign p_p8[0] = a[0] & b[7];
assign p_p8[1] = a[1] & b[7];
assign p_p8[2] = a[2] & b[7];
assign p_p8[3] = a[3] & b[7];
assign p_p8[4] = a[4] & b[7];
assign p_p8[5] = a[5] & b[7];
assign p_p8[6] = a[6] & b[7];
assign p_p8[7] = a[7] & b[7];

//csa-1

wire [9:0] sum_1;
wire [7:0] carry_1;
assign sum_1[0]=p_p1[0];
half_adder ha0(.x(p_p1[1]),.y(p_p2[0]),.sum(sum_1[1]),.carry(carry_1[0]));

full_adder fa0(.a(p_p1[2]), .b(p_p2[1]), .c(p_p3[0]), .sum(sum_1[2]), .carry(carry_1[1]));
full_adder fa1(.a(p_p1[3]), .b(p_p2[2]), .c(p_p3[1]), .sum(sum_1[3]), .carry(carry_1[2]));
full_adder fa2(.a(p_p1[4]), .b(p_p2[3]), .c(p_p3[2]), .sum(sum_1[4]), .carry(carry_1[3]));
full_adder fa3(.a(p_p1[5]), .b(p_p2[4]), .c(p_p3[3]), .sum(sum_1[5]), .carry(carry_1[4]));
full_adder fa4(.a(p_p1[6]), .b(p_p2[5]), .c(p_p3[4]), .sum(sum_1[6]), .carry(carry_1[5]));
full_adder fa5(.a(p_p1[7]), .b(p_p2[6]), .c(p_p3[5]), .sum(sum_1[7]), .carry(carry_1[6]));

half_adder ha1(.x(p_p2[7]),.y(p_p3[6]),.sum(sum_1[8]),.carry(carry_1[7]));
assign sum_1[9]= p_p3[7];

//csa_2
wire [9:0] sum_2;
wire [7:0] carry_2;

assign sum_2[0]=p_p4[0];
half_adder ha2(.x(p_p4[1]),.y(p_p5[0]),.sum(sum_2[1]),.carry(carry_2[0]));

full_adder fa6(.a(p_p4[2]), .b(p_p5[1]), .c(p_p6[0]), .sum(sum_2[2]), .carry(carry_2[1]));
full_adder fa7(.a(p_p4[3]), .b(p_p5[2]), .c(p_p6[1]), .sum(sum_2[3]), .carry(carry_2[2]));
full_adder fa8(.a(p_p4[4]), .b(p_p5[3]), .c(p_p6[2]), .sum(sum_2[4]), .carry(carry_2[3]));
full_adder fa9(.a(p_p4[5]), .b(p_p5[4]), .c(p_p6[3]), .sum(sum_2[5]), .carry(carry_2[4]));
full_adder fa10(.a(p_p4[6]), .b(p_p5[5]), .c(p_p6[4]), .sum(sum_2[6]), .carry(carry_2[5]));
full_adder fa11(.a(p_p4[7]), .b(p_p5[6]), .c(p_p6[5]), .sum(sum_2[7]), .carry(carry_2[6]));

half_adder ha3(.x(p_p5[7]),.y(p_p6[6]),.sum(sum_2[8]),.carry(carry_2[7]));
assign sum_2[9]= p_p6[7];
//csa_3
wire [12:0] sum_3;
wire [7:0] carry_3;

assign sum_3[0]=sum_1[0];
assign sum_3[1] = sum_1[1];

half_adder ha4(.x(sum_1[2]),.y(carry_1[0]),.sum(sum_3[2]),.carry(carry_3[0]));

full_adder fa12(.a(sum_1[3]), .b(carry_1[1]), .c(sum_2[0]), .sum(sum_3[3]), .carry(carry_3[1]));
full_adder fa13(.a(sum_1[4]), .b(carry_1[2]), .c(sum_2[1]), .sum(sum_3[4]), .carry(carry_3[2]));
full_adder fa14(.a(sum_1[5]), .b(carry_1[3]), .c(sum_2[2]), .sum(sum_3[5]), .carry(carry_3[3]));
full_adder fa15(.a(sum_1[6]), .b(carry_1[4]), .c(sum_2[3]), .sum(sum_3[6]), .carry(carry_3[4]));
full_adder fa16(.a(sum_1[7]), .b(carry_1[5]), .c(sum_2[4]), .sum(sum_3[7]), .carry(carry_3[5]));
full_adder fa17(.a(sum_1[8]), .b(carry_1[6]), .c(sum_2[5]), .sum(sum_3[8]), .carry(carry_3[6]));
full_adder fa18(.a(sum_1[9]), .b(carry_1[7]), .c(sum_2[6]), .sum(sum_3[9]), .carry(carry_3[7]));

assign sum_3[10]= sum_2[7];
assign sum_3[11]= sum_2[8];
assign sum_3[12]= sum_2[9];

//csa_4

wire [9:0] sum_4;
wire [7:0] carry_4;

assign sum_4[0] = carry_2[0];

half_adder ha5(.x(p_p7[0]),.y(carry_2[1]),.sum(sum_4[1]),.carry(carry_4[0]));

full_adder fa19(.a(p_p7[1]), .b(p_p8[0]), .c(carry_2[2]), .sum(sum_4[2]), .carry(carry_4[1]));
full_adder fa20(.a(p_p7[2]), .b(p_p8[1]), .c(carry_2[3]), .sum(sum_4[3]), .carry(carry_4[2]));
full_adder fa21(.a(p_p7[3]), .b(p_p8[2]), .c(carry_2[4]), .sum(sum_4[4]), .carry(carry_4[3]));
full_adder fa22(.a(p_p7[4]), .b(p_p8[3]), .c(carry_2[5]), .sum(sum_4[5]), .carry(carry_4[4]));
full_adder fa23(.a(p_p7[5]), .b(p_p8[4]), .c(carry_2[6]), .sum(sum_4[6]), .carry(carry_4[5]));
full_adder fa24(.a(p_p7[6]), .b(p_p8[5]), .c(carry_2[7]), .sum(sum_4[7]), .carry(carry_4[6]));

half_adder ha6(.x(p_p7[7]),.y(p_p8[6]),.sum(sum_4[8]),.carry(carry_4[7]));
assign sum_4[9] =p_p8[7];

//csa_5
wire [14:0] sum_5;
wire [9:0] carry_5;

assign sum_5[0]= sum_3[0];
assign sum_5[1]= sum_3[1];
assign sum_5[2]= sum_3[2];

half_adder ha7(.x(sum_3[3]),.y(carry_3[0]),.sum(sum_5[3]),.carry(carry_5[0]));
half_adder ha8(.x(sum_3[4]),.y(carry_3[1]),.sum(sum_5[4]),.carry(carry_5[1]));

full_adder fa25(.a(sum_3[5]),  .b(carry_3[2]), .c(sum_4[0]), .sum(sum_5[5]),  .carry(carry_5[2]));
full_adder fa26(.a(sum_3[6]),  .b(carry_3[3]), .c(sum_4[1]), .sum(sum_5[6]),  .carry(carry_5[3]));
full_adder fa27(.a(sum_3[7]),  .b(carry_3[4]), .c(sum_4[2]), .sum(sum_5[7]),  .carry(carry_5[4]));
full_adder fa28(.a(sum_3[8]),  .b(carry_3[5]), .c(sum_4[3]), .sum(sum_5[8]),  .carry(carry_5[5]));
full_adder fa29(.a(sum_3[9]),  .b(carry_3[6]), .c(sum_4[4]), .sum(sum_5[9]),  .carry(carry_5[6]));
full_adder fa30(.a(sum_3[10]), .b(carry_3[7]), .c(sum_4[5]), .sum(sum_5[10]), .carry(carry_5[7]));


half_adder ha9(.x(sum_3[11]),.y(sum_4[6]),.sum(sum_5[11]),.carry(carry_5[8]));
half_adder ha10(.x(sum_3[12]),.y(sum_4[7]),.sum(sum_5[12]),.carry(carry_5[9]));

assign sum_5[13]=sum_4[8];
assign sum_5[14]=sum_4[9];

//csa_6

wire [14:0] sum_6;
wire [10:0] carry_6;
assign sum_6[0]=sum_5[0];
assign sum_6[1]=sum_5[1];
assign sum_6[2]=sum_5[2];
assign sum_6[3]=sum_5[3];

half_adder ha11(.x(sum_5[4]), .y(carry_5[0]), .sum(sum_6[4]), .carry(carry_6[0]));
half_adder ha12(.x(sum_5[5]), .y(carry_5[1]), .sum(sum_6[5]), .carry(carry_6[1]));
half_adder ha13(.x(sum_5[6]), .y(carry_5[2]), .sum(sum_6[6]), .carry(carry_6[2]));

full_adder fa31(.a(sum_5[7]),  .b(carry_5[3]), .c(carry_4[0]), .sum(sum_6[7]),  .carry(carry_6[3]));
full_adder fa32(.a(sum_5[8]),  .b(carry_5[4]), .c(carry_4[1]), .sum(sum_6[8]),  .carry(carry_6[4]));
full_adder fa33(.a(sum_5[9]),  .b(carry_5[5]), .c(carry_4[2]), .sum(sum_6[9]),  .carry(carry_6[5]));
full_adder fa34(.a(sum_5[10]), .b(carry_5[6]), .c(carry_4[3]), .sum(sum_6[10]), .carry(carry_6[6]));
full_adder fa35(.a(sum_5[11]), .b(carry_5[7]), .c(carry_4[4]), .sum(sum_6[11]), .carry(carry_6[7]));
full_adder fa36(.a(sum_5[12]), .b(carry_5[8]), .c(carry_4[5]), .sum(sum_6[12]), .carry(carry_6[8]));
full_adder fa37(.a(sum_5[13]), .b(carry_5[9]), .c(carry_4[6]), .sum(sum_6[13]), .carry(carry_6[9]));

half_adder ha14(.x(sum_5[14]), .y(carry_4[7]), .sum(sum_6[14]), .carry(carry_6[10]));

wire [15:0] final_sum;
wire [15:0] final_carry;

assign final_sum   = {1'b0, sum_6};
assign final_carry = {carry_6, 5'b00000};

cla_16bit c1(
    .a(final_sum),
    .b(final_carry),
    .cin(1'b0),
    .sum(mul_out),
    .cout()
);

endmodule
