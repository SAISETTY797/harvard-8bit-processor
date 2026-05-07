

`timescale 1ns/1ps
`include "decode_unit.v"

module decode_unit_tb;

reg clk;
reg [31:0] instruction;
wire [7:0] A;
wire [7:0] B;

decode_unit dut(
.instruction(instruction),
.A(A),
.B(B),
.clk(clk)
);

// Clock generation
initial begin
clk = 0;
end

always #5 clk = ~clk;

// Waveform and monitor
initial begin
$dumpfile("decode_unit.vcd");
$dumpvars(0, decode_unit_tb);
$monitor("TIME=%0t | INSTRUCTION=%b | A=%0d | B=%0d",
$time, instruction, A, B);
end

initial begin

// Initialize instruction
instruction = 32'd0;

//  preload register values to check whether we get correct values of A and B 


dut.rf.registers[1] = 8'd143;
dut.rf.registers[2] = 8'd12;
dut.rf.registers[3] = 8'd201;
dut.rf.registers[4] = 8'd54;
dut.rf.registers[5] = 8'd88;
dut.rf.registers[6] = 8'd7;
dut.rf.registers[7] = 8'd166;
dut.rf.registers[8] = 8'd92;
dut.rf.registers[9] = 8'd233;




// ADD  (R3 = R2 + R1)
instruction = {6'b000100,5'd0,5'd3,6'd0,5'd2,5'd1};
#10;

// SUB  (R4 = R3 - R2)
instruction = {6'b000101,5'd0,5'd4,6'd0,5'd3,5'd2};
#10;

// NEG  (R6 = -R6)
instruction = {6'b000110,5'd0,5'd6,6'd0,5'd0,5'd6};
#10;

// MUL  (R5 = R3 * R2)
instruction = {6'b000111,5'd0,5'd5,6'd0,5'd3,5'd2};
#10;

// DIV  (R8 = R9 / R2)
instruction = {6'b001000,5'd0,5'd8,6'd0,5'd9,5'd2};
#10;

// OR   (R3 = R7 | R1)
instruction = {6'b001001,5'd0,5'd3,6'd0,5'd7,5'd1};
#10;

// XOR  (R4 = R8 ^ R2)
instruction = {6'b001010,5'd0,5'd4,6'd0,5'd8,5'd2};
#10;

#20;
$finish;

end

endmodule
