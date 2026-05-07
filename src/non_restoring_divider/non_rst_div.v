`ifndef NON_RST_DIV
`define NON_RST_DIV

// module four_one_mux(
//     input [1:0]i3,i2,i1,i0,
//     input [1:0] sel,
//     output [1:0] out
// );
// assign out = (sel== 2'b00)? i0 : (sel == 2'b01)? i1: (sel == 2'b10)? i2 :i3;
// endmodule

// module four_one_mux_two (
//     input  a,
//     input  b,
//     input  c,
//     input  d,
//     input  [1:0] sel,
//     output out
// );

// assign out = (sel == 2'b00) ? a :
//              (sel == 2'b01) ? b :
//              (sel == 2'b10) ? c :
//                               d;

// endmodule

// module cla_8_bit(
//     input [7:0]A,B,
//     output [7:0] sum,
//     output carry_out
// );
// wire [17:0]kgp;
// wire [15:0] kgp1,kgp2,kgp3;
// wire [7:0]c;

// assign kgp[1:0]=2'b00;
// assign kgp[3:2]   = {A[0], B[0]};
// assign kgp[5:4]   = {A[1], B[1]};
// assign kgp[7:6]   = {A[2], B[2]};
// assign kgp[9:8]   = {A[3], B[3]};
// assign kgp[11:10] = {A[4], B[4]};
// assign kgp[13:12] = {A[5], B[5]};
// assign kgp[15:14] = {A[6], B[6]};
// assign kgp[17:16] = {A[7], B[7]};

// assign kgp1[1:0]= kgp[1:0];

// four_one_mux m1 (
//     .i0(2'b00),
//     .i1(kgp[1:0]),
//     .i2(kgp[1:0]),
//     .i3(2'b11),
//     .sel(kgp[3:2]),
//     .out(kgp1[3:2])
// );

// four_one_mux m2 (
//     .i0(2'b00),
//     .i1(kgp[3:2]),
//     .i2(kgp[3:2]),
//     .i3(2'b11),
//     .sel(kgp[5:4]),
//     .out(kgp1[5:4])
// );

// four_one_mux m3 (
//     .i0(2'b00),
//     .i1(kgp[5:4]),
//     .i2(kgp[5:4]),
//     .i3(2'b11),
//     .sel(kgp[7:6]),
//     .out(kgp1[7:6])
// );

// four_one_mux m4 (.i0(2'b00),.i1(kgp[7:6]),.i2(kgp[7:6]),.i3(2'b11),.sel(kgp[9:8]),.out(kgp1[9:8]));
// four_one_mux m5 (.i0(2'b00),.i1(kgp[9:8]),.i2(kgp[9:8]),.i3(2'b11),.sel(kgp[11:10]),.out(kgp1[11:10]));
// four_one_mux m6 (.i0(2'b00),.i1(kgp[11:10]),.i2(kgp[11:10]),.i3(2'b11),.sel(kgp[13:12]),.out(kgp1[13:12]));
// four_one_mux m7 (.i0(2'b00),.i1(kgp[13:12]),.i2(kgp[13:12]),.i3(2'b11),.sel(kgp[15:14]),.out(kgp1[15:14]));


// assign kgp2[1:0]= kgp1[1:0];
// assign kgp2[3:2]=kgp1[3:2];

// four_one_mux m8 (.i0(2'b00),.i1(kgp1[1:0]),.i2(kgp1[1:0]),.i3(2'b11),.sel(kgp1[5:4]),.out(kgp2[5:4]));
// four_one_mux m9 (.i0(2'b00),.i1(kgp1[3:2]),.i2(kgp1[3:2]),.i3(2'b11),.sel(kgp1[7:6]),.out(kgp2[7:6]));
// four_one_mux m10 (.i0(2'b00),.i1(kgp1[5:4]),.i2(kgp1[5:4]),.i3(2'b11),.sel(kgp1[9:8]),.out(kgp2[9:8]));
// four_one_mux m11 (.i0(2'b00),.i1(kgp1[7:6]),.i2(kgp1[7:6]),.i3(2'b11),.sel(kgp1[11:10]),.out(kgp2[11:10]));
// four_one_mux m12 (.i0(2'b00),.i1(kgp1[9:8]),.i2(kgp1[9:8]),.i3(2'b11),.sel(kgp1[13:12]),.out(kgp2[13:12]));
// four_one_mux m13 (.i0(2'b00),.i1(kgp1[11:10]),.i2(kgp1[11:10]),.i3(2'b11),.sel(kgp1[15:14]),.out(kgp2[15:14]));



// assign kgp3[1:0] = kgp2[1:0];
// assign kgp3[3:2] = kgp2[3:2];
// assign kgp3[5:4] = kgp2[5:4];
// assign kgp3[7:6] = kgp2[7:6];


// four_one_mux m14 (.i0(2'b00),.i1(kgp2[1:0]),.i2(kgp2[1:0]),.i3(2'b11),.sel(kgp2[9:8]),.out(kgp3[9:8]));
// four_one_mux m15 (.i0(2'b00),.i1(kgp2[3:2]),.i2(kgp2[3:2]),.i3(2'b11),.sel(kgp2[11:10]),.out(kgp3[11:10]));
// four_one_mux m16 (.i0(2'b00),.i1(kgp2[5:4]),.i2(kgp2[5:4]),.i3(2'b11),.sel(kgp2[13:12]),.out(kgp3[13:12]));
// four_one_mux m17 (.i0(2'b00),.i1(kgp2[7:6]),.i2(kgp2[7:6]),.i3(2'b11),.sel(kgp2[15:14]),.out(kgp3[15:14]));

// assign c[0]= kgp3[1];
// assign c[1]= kgp3[3];
// assign c[2]= kgp3[5];
// assign c[3]= kgp3[7];
// assign c[4]= kgp3[9];
// assign c[5]= kgp3[11];
// assign c[6]= kgp3[13];
// assign c[7]= kgp3[15];

// four_one_mux_two m111(.a(1'b0),.b(c[7]),.c(c[7]),.d(1'b1),.sel(kgp[17:16]),.out(carry_out));

// assign sum[0] = A[0] ^ B[0] ^ c[0];
// assign sum[1] = A[1] ^ B[1] ^ c[1];
// assign sum[2] = A[2] ^ B[2] ^ c[2];
// assign sum[3] = A[3] ^ B[3] ^ c[3];
// assign sum[4] = A[4] ^ B[4] ^ c[4];
// assign sum[5] = A[5] ^ B[5] ^ c[5];
// assign sum[6] = A[6] ^ B[6] ^ c[6];
// assign sum[7] = A[7] ^ B[7] ^ c[7];

// endmodule


//mux_module 


module mux_2_1(
    input [7:0] x,y,
    input  sel,
    output [7:0] out_mux
);

assign out_mux= (sel==1) ? y : x;
endmodule


module stage(
    input [7:0] x,//accumulator
    input [7:0] Q,// dividend 
    input [7:0] M,//divsor
    output   [7:0] Z,
    output  reg [7:0] Q2
);
reg [7:0] M1;
wire [7:0] Q1;

wire  [7:0] x1;



wire [7:0] MR;
assign MR = (~M) + 8'd1;

assign x1 = {x[6:0], Q[7]}; 
assign Q1 = {Q[6:0], 1'b0};

always@(*) begin 
    if(x[7]) begin 
     
        M1[7:0]=M[7:0];
    end 
    else begin 
      
        M1[7:0]=MR[7:0];
    end 
end 

cla_8_bit c1(.A(x1),.B(M1),.sum(Z));

always@(*) begin 
    if(Z[7]) begin 
        Q2[7:0]={Q1[7:1],1'b0};
    end 
    else begin 
        Q2[7:0] ={Q1[7:1],1'b1};
    end 
end 
endmodule 


module non_rst_div(
    input [6:0] divisor,
    input [7:0] dividend,
    output [7:0] quotient,
    output [7:0] remainder
);

wire  [7:0] AA;
assign AA=8'd0;




wire [7:0] M = {1'b0, divisor};


//stage_0
wire [7:0] AA0,QQ0;


stage stage_0(.Q(dividend),.M(M),.x(AA),.Z(AA0),.Q2(QQ0));


//satge_1
wire [7:0] AA1,QQ1;

stage stage_1(.Q(QQ0),.M(M),.x(AA0),.Z(AA1),.Q2(QQ1));

//stage_2
wire [7:0] AA2,QQ2;

stage stage_2(.Q(QQ1),.M(M),.x(AA1),.Z(AA2),.Q2(QQ2));

//stage_3
wire [7:0] AA3,QQ3;

stage stage_3(.Q(QQ2),.M(M),.x(AA2),.Z(AA3),.Q2(QQ3));

//stage_4

wire [7:0] AA4,QQ4;

stage stage_4(.Q(QQ3),.M(M),.x(AA3),.Z(AA4),.Q2(QQ4));

//satge_5

wire [7:0] AA5,QQ5;

stage stage_5(.Q(QQ4),.M(M),.x(AA4),.Z(AA5),.Q2(QQ5));


//stage_6

wire [7:0] AA6,QQ6;

stage stage_6(.Q(QQ5),.M(M),.x(AA5),.Z(AA6),.Q2(QQ6));


//stage_7
wire [7:0] AA7,QQ7;

stage stage_7(.Q(QQ6),.M(M),.x(AA6),.Z(AA7),.Q2(QQ7));

wire [7:0] remainder1;
wire [7:0] sum_out;
cla_8_bit c2(.A(AA7),.B(M),.sum(sum_out),.carry_out());


mux_2_1 m1(.x(AA7),.y(sum_out),.out_mux(remainder1),.sel(AA7[7]));

assign quotient  = (divisor == 0) ? 8'd0 : QQ7;
assign remainder = (divisor == 0) ? dividend : remainder1;

endmodule 
`endif


















