`timescale 1ns/1ps
`include "alu.v"

module alu_tb ;

reg  [5:0] opcode;
reg  [7:0] A;
reg  [7:0] B;

wire [7:0] output1;
wire [7:0] output2;


// DUT
alu dut(
    .opcode(opcode),
    .A(A),
    .B(B),
    .output1(output1),
    .output2(output2)
);


initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);

    $monitor("TIME=%0t || OPCODE=%b || A=%b || B=%b || OUTPUT1=%b || OUTPUT2=%b",
             $time,opcode,A,B,output1,output2);
end


initial begin

// initialize
opcode = 0;
A = 0;
B = 0;

#10;


// ----------------
// ADD
// ----------------

opcode = 6'b000100;
A = 8'd25;
B = 8'd10;

#10;


// ----------------
// SUB
// ----------------

opcode = 6'b000101;
A = 8'd25;
B = 8'd7;

#10;


// ----------------
// NEG
// ----------------

opcode = 6'b000110;
A = 8'd5;

#10;


// ----------------
// MUL
// ----------------

opcode = 6'b000111;
A = 8'd12;
B = 8'd5;

#10;


// ----------------
// DIV
// ----------------

opcode = 6'b001000;
A = 8'd25;
B = 8'd4;

#10;


// ----------------
// OR
// ----------------

opcode = 6'b001001;
A = 8'b10101010;
B = 8'b11001100;

#10;


// ----------------
// XOR
// ----------------

opcode = 6'b001010;
A = 8'b10101010;
B = 8'b11001100;

#10;


// ----------------
// NAND
// ----------------

opcode = 6'b001011;
A = 8'b10101010;
B = 8'b11001100;

#10;


// ----------------
// NOR
// ----------------

opcode = 6'b001100;
A = 8'b10101010;
B = 8'b11001100;

#10;


// ----------------
// XNOR
// ----------------

opcode = 6'b001101;
A = 8'b10101010;
B = 8'b11001100;

#10;


// ----------------
// NOT
// ----------------

opcode = 6'b001110;
A = 8'b10101010;

#10;


// ----------------
// LEFT SHIFT
// ----------------

opcode = 6'b001111;
A = 8'b00001111;
B = 8'd2;

#10;


// ----------------
// RIGHT SHIFT
// ----------------

opcode = 6'b010000;
A = 8'b11110000;
B = 8'd2;

#10;


#20;
$finish;

end

endmodule