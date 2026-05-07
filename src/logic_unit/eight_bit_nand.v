module eight_bit_nand(
      input [7:0] A,
    input [7:0] B,
    output [7:0] out
);
assign out=~(A&B);
endmodule 
