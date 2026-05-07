`ifndef EIGHT_BIT_XOR
`define EIGHT_BIT_XOR
module eight_bit_xor(
      input [7:0] A,
    input [7:0] B,
    output [7:0] out
);
assign out=(A^B);
endmodule 
`endif 