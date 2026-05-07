`ifndef SUB_8_BIT
`define SUB_8_BIT


// module four_one_mux(
//     input  [1:0] i3, i2, i1, i0,
//     input  [1:0] sel,
//     output [1:0] out
// );
// assign out = (sel == 2'b00) ? i0 :
//              (sel == 2'b01) ? i1 :
//              (sel == 2'b10) ? i2 :
//                               i3;
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


module sub_8_bit(
    input  [7:0] A, B,
    output [7:0] diff,
    output       borrow_out
);

    wire [7:0] B_sub;
    wire [17:0] kgp;
    wire [15:0] kgp1, kgp2, kgp3;
    wire [7:0] c;

    // Two's complement inversion
    assign B_sub = ~B;

    // Initial carry-in = 1
    assign kgp[1:0] = 2'b11;

    // KGP generation using A and ~B
    assign kgp[3:2]   = {A[0], B_sub[0]};
    assign kgp[5:4]   = {A[1], B_sub[1]};
    assign kgp[7:6]   = {A[2], B_sub[2]};
    assign kgp[9:8]   = {A[3], B_sub[3]};
    assign kgp[11:10] = {A[4], B_sub[4]};
    assign kgp[13:12] = {A[5], B_sub[5]};
    assign kgp[15:14] = {A[6], B_sub[6]};
    assign kgp[17:16] = {A[7], B_sub[7]};

    // -------- Stage 1 --------
    assign kgp1[1:0] = kgp[1:0];

    four_one_mux m1 (.i0(2'b00), .i1(kgp[1:0]),  .i2(kgp[1:0]),  .i3(2'b11), .sel(kgp[3:2]),   .out(kgp1[3:2]));
    four_one_mux m2 (.i0(2'b00), .i1(kgp[3:2]),  .i2(kgp[3:2]),  .i3(2'b11), .sel(kgp[5:4]),   .out(kgp1[5:4]));
    four_one_mux m3 (.i0(2'b00), .i1(kgp[5:4]),  .i2(kgp[5:4]),  .i3(2'b11), .sel(kgp[7:6]),   .out(kgp1[7:6]));
    four_one_mux m4 (.i0(2'b00), .i1(kgp[7:6]),  .i2(kgp[7:6]),  .i3(2'b11), .sel(kgp[9:8]),   .out(kgp1[9:8]));
    four_one_mux m5 (.i0(2'b00), .i1(kgp[9:8]),  .i2(kgp[9:8]),  .i3(2'b11), .sel(kgp[11:10]), .out(kgp1[11:10]));
    four_one_mux m6 (.i0(2'b00), .i1(kgp[11:10]),.i2(kgp[11:10]),.i3(2'b11), .sel(kgp[13:12]), .out(kgp1[13:12]));
    four_one_mux m7 (.i0(2'b00), .i1(kgp[13:12]),.i2(kgp[13:12]),.i3(2'b11), .sel(kgp[15:14]), .out(kgp1[15:14]));

    // -------- Stage 2 --------
    assign kgp2[1:0] = kgp1[1:0];
    assign kgp2[3:2] = kgp1[3:2];

    four_one_mux m8  (.i0(2'b00), .i1(kgp1[1:0]),  .i2(kgp1[1:0]),  .i3(2'b11), .sel(kgp1[5:4]),   .out(kgp2[5:4]));
    four_one_mux m9  (.i0(2'b00), .i1(kgp1[3:2]),  .i2(kgp1[3:2]),  .i3(2'b11), .sel(kgp1[7:6]),   .out(kgp2[7:6]));
    four_one_mux m10 (.i0(2'b00), .i1(kgp1[5:4]),  .i2(kgp1[5:4]),  .i3(2'b11), .sel(kgp1[9:8]),   .out(kgp2[9:8]));
    four_one_mux m11 (.i0(2'b00), .i1(kgp1[7:6]),  .i2(kgp1[7:6]),  .i3(2'b11), .sel(kgp1[11:10]), .out(kgp2[11:10]));
    four_one_mux m12 (.i0(2'b00), .i1(kgp1[9:8]),  .i2(kgp1[9:8]),  .i3(2'b11), .sel(kgp1[13:12]), .out(kgp2[13:12]));
    four_one_mux m13 (.i0(2'b00), .i1(kgp1[11:10]),.i2(kgp1[11:10]),.i3(2'b11), .sel(kgp1[15:14]), .out(kgp2[15:14]));

    // -------- Stage 3 --------
    assign kgp3[1:0] = kgp2[1:0];
    assign kgp3[3:2] = kgp2[3:2];
    assign kgp3[5:4] = kgp2[5:4];
    assign kgp3[7:6] = kgp2[7:6];

    four_one_mux m14 (.i0(2'b00), .i1(kgp2[1:0]),  .i2(kgp2[1:0]),  .i3(2'b11), .sel(kgp2[9:8]),   .out(kgp3[9:8]));
    four_one_mux m15 (.i0(2'b00), .i1(kgp2[3:2]),  .i2(kgp2[3:2]),  .i3(2'b11), .sel(kgp2[11:10]), .out(kgp3[11:10]));
    four_one_mux m16 (.i0(2'b00), .i1(kgp2[5:4]),  .i2(kgp2[5:4]),  .i3(2'b11), .sel(kgp2[13:12]), .out(kgp3[13:12]));
    four_one_mux m17 (.i0(2'b00), .i1(kgp2[7:6]),  .i2(kgp2[7:6]),  .i3(2'b11), .sel(kgp2[15:14]), .out(kgp3[15:14]));

    // Carry extraction
    assign c[0] = kgp3[1];
    assign c[1] = kgp3[3];
    assign c[2] = kgp3[5];
    assign c[3] = kgp3[7];
    assign c[4] = kgp3[9];
    assign c[5] = kgp3[11];
    assign c[6] = kgp3[13];
    assign c[7] = kgp3[15];

    // Final borrow logic
    four_one_mux_two m111 (
        .a(1'b0), .b(c[7]), .c(c[7]), .d(1'b1),
        .sel(kgp[17:16]),
        .out(borrow_out)
    );

    // Difference calculation
    assign diff[0] = A[0] ^ B_sub[0] ^ c[0];
    assign diff[1] = A[1] ^ B_sub[1] ^ c[1];
    assign diff[2] = A[2] ^ B_sub[2] ^ c[2];
    assign diff[3] = A[3] ^ B_sub[3] ^ c[3];
    assign diff[4] = A[4] ^ B_sub[4] ^ c[4];
    assign diff[5] = A[5] ^ B_sub[5] ^ c[5];
    assign diff[6] = A[6] ^ B_sub[6] ^ c[6];
    assign diff[7] = A[7] ^ B_sub[7] ^ c[7];

endmodule
`endif 