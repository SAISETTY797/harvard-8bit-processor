
// //assignment questions --(a+b+c+d)^2 



// `timescale 1ns/1ps
// `include "top.v"

// module top_tb;

// reg clk;
// reg reset;
// reg [31:0] instruction_in;
// reg write_en;

// top dut(
//     .clk(clk),
//     .reset(reset),
//     .instruction_in(instruction_in),
//     .write_en(write_en)
// );




// initial clk = 0;
// always #5 clk = ~clk;



// initial begin
//     $dumpfile("top.vcd");
//     $dumpvars(0,top_tb);
// end


// // ---------------- Monitor ----------------

// initial begin
// $monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%d | OUT2=%d",
// $time,
// dut.instruction_out,
// dut.A,
// dut.B,
// dut.output1,
// dut.output2
// );
// end




// initial begin

// reset = 1;
// write_en = 1;      // enable program loading
// instruction_in = 0;

// #10;
// reset = 0;




// // MOV R1,#1
// instruction_in = 32'b00000000001000000000000000000001; #10;

// // MOV R2,#2
// instruction_in = 32'b00000000010000000000000000000010; #10;

// // MOV R3,#3
// instruction_in = 32'b00000000011000000000000000000011; #10;

// // MOV R4,#4
// instruction_in = 32'b00000000100000000000000000000100; #10;

// // ADD R5,R2,R1
// instruction_in = 32'b00010000000001010000000001000001; #10;

// // ADD R5,R5,R3
// instruction_in = 32'b00010000000001010000000010100011; #10;

// // ADD R5,R5,R4
// instruction_in = 32'b00010000000001010000000010100100; #10;

// // MUL R6,R5,R5
// instruction_in = 32'b00011100111001100000000010100101; #10;



// // MOV R7, R6
// instruction_in = 32'b00000100111000000000000000000110; #10;



// // STORE MEM[8],R6
// instruction_in = 32'b00001100001000000000000000000110; #10;




// write_en = 0;     

// #200;


// // ---------------- Results ----------------

// $display("RESULT REGISTER R7 = %d", dut.rf.registers[7]);
// $display("RESULT REGISTER R6 = %d", dut.rf.registers[6]);
// $display("RESULT MEMORY[8] = %d", dut.wb.dm.memory[8]);


// $monitoroff;  //this is used to stop the monitor



// #200;


// end


// integer i;
// initial begin
//     #1000;  
//     $display("=== Register File Contents ===");
//     for(i = 0; i <8 ; i = i + 1) begin
       
//         $display("registers[%0d] = %d", i, top_tb.dut.rf.registers[i]);
//     end
//     $finish;
// end

// endmodule
//assignment questions --(a+b+c+d)^2
//assignment questions --(a+b+c+d)^2
//assignment questions --(a+b+c+d)^2
`timescale 1ns/1ps 
`include "top.v"

module top_tb;
reg clk;
reg reset;
reg [31:0] instruction_in;
reg write_en;
top dut(
.clk(clk),
.reset(reset),
.instruction_in(instruction_in),
.write_en(write_en)
);
initial clk = 0;
always #5 clk = ~clk;
initial begin
$dumpfile("top.vcd");
$dumpvars(0,top_tb);
end
// ---------------- Monitor ----------------
initial begin
$monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%b| OUT2=%b",
$time,
dut.instruction_out,
dut.A,
dut.B,
dut.output1,
dut.output2
);
end
initial begin
reset = 1;
write_en = 1;      // enable program loading
instruction_in = 0;
#10;
reset = 0;
// MOV R1,#150
instruction_in = 32'b00000000001000000000000010010110; #10;
// MOV R2,#150
instruction_in = 32'b00000000010000000000000010010110; #10;
// MOV R3,#0
instruction_in = 32'b00000000011000000000000000000000; #10;
// MOV R4,#0
instruction_in = 32'b00000000100000000000000000000000; #10;
// ADD R5,R2,R1
instruction_in = 32'b00010000000001010000000001000001; #10;
// ADD R5,R5,R3
instruction_in = 32'b00010000000001010000000010100011; #10;
// ADD R5,R5,R4
instruction_in = 32'b00010000000001010000000010100100; #10;
// MUL R6,R5,R5
instruction_in = 32'b00011100111001100000000010100101; #10;
// MOV R7, R6
instruction_in = 32'b00000100111000000000000000000110; #10;
// STORE MEM[8],R6
instruction_in = 32'b00001100001000000000000000000110; #10;
write_en = 0;
#200;
// ---------------- Results ----------------
$display("RESULT REGISTER R7 = %d", dut.rf.registers[7]);
$display("RESULT REGISTER R6 = %d", dut.rf.registers[6]);
$display("RESULT MEMORY[8] = %d", dut.wb.dm.memory[8]);
$monitoroff;  //this is used to stop the monitor
#200;
end
integer i;
initial begin
#1000;

$display("=== Register File Contents ===");
for(i = 0; i <8 ; i = i + 1) begin
    $display("registers[%0d] = %d", i, top_tb.dut.rf.registers[i]);
end
$finish;
end
endmodule




// `timescale 1ns/1ps
// `include "top.v"

// module top_tb;

// reg clk;
// reg reset;
// reg [31:0] instruction_in;
// reg write_en;

// top dut(
//     .clk(clk),
//     .reset(reset),
//     .instruction_in(instruction_in),
//     .write_en(write_en)
// );


// // CLOCK
// initial clk = 0;
// always #5 clk = ~clk;


// // WAVEFORM
// initial begin
//     $dumpfile("top.vcd");
//     $dumpvars(0,top_tb);
// end


// // MONITOR
// initial begin
// $monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%d | OUT2=%d",
// $time,
// dut.instruction_out,
// dut.A,
// dut.B,
// dut.output1,
// dut.output2
// );
// end



// initial begin

// reset = 1;
// write_en = 1;
// instruction_in = 0;

// #10;
// reset = 0;


// // ---------------- LOAD PROGRAM ----------------

// // MOV R1,#8
// instruction_in = {6'b000000,5'd1,21'd8}; #10;

// // MOV R2,#2
// instruction_in = {6'b000000,5'd2,21'd2}; #10;

// // MOV R3,#9
// instruction_in = {6'b000000,5'd3,21'd9}; #10;

// // MOV R4,#3
// instruction_in = {6'b000000,5'd4,21'd3}; #10;


// // R5 = R1 / R2   (A/B)
// instruction_in = {6'b001000,5'd0,5'd5,6'd0,5'd2,5'd1}; #10;


// // R6 = R5 * R5   (A/B)^2
// instruction_in = {6'b000111,5'd0,5'd6,6'd0,5'd5,5'd5}; #10;


// // R7 = R3 / R4   (C/D)
// instruction_in = {6'b001000,5'd0,5'd7,6'd0,5'd4,5'd3}; #10;


// // R8 = R7 * R7   (C/D)^2
// instruction_in = {6'b000111,5'd0,5'd8,6'd0,5'd7,5'd7}; #10;


// // R10 = R6 + R8
// instruction_in = {6'b000100,5'd0,5'd10,6'd0,5'd8,5'd6}; #10;



// // ---------------- START EXECUTION ----------------

// write_en = 0;

// #300;


// // RESULTS
// $display("RESULT REGISTER R10 = %d", dut.rf.registers[10]);

// $finish;

// end

// endmodule



// // `timescale 1ns/1ps
// // `include "top.v"

// // module top_tb;

// // reg clk;
// // reg reset;
// // reg [31:0] instruction_in;
// // reg write_en;

// // top dut(
// //     .clk(clk),
// //     .reset(reset),
// //     .instruction_in(instruction_in),
// //     .write_en(write_en)
// // );


// // // ---------------- Clock ----------------

// // initial clk = 0;
// // always #5 clk = ~clk;


// // // ---------------- Waveform ----------------

// // initial begin
// //     $dumpfile("top.vcd");
// //     $dumpvars(0,top_tb);
// // end


// // // ---------------- Monitor ----------------

// // initial begin
// // $monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%d | OUT2=%d",
// // $time,
// // dut.instruction_out,
// // dut.A,
// // dut.B,
// // dut.output1,
// // dut.output2
// // );
// // end



// // // ---------------- Test Program ----------------

// // initial begin

// // reset = 1;
// // write_en = 1;
// // instruction_in = 0;

// // #10;
// // reset = 0;


// // // ================= LOAD PROGRAM =================

// // // MOV R1,#3   (A)
// // instruction_in = {6'b000000,5'd1,21'd3}; #10;

// // // MOV R2,#2   (B)
// // instruction_in = {6'b000000,5'd2,21'd2}; #10;


// // // R3 = A << 2
// // instruction_in = {6'b001111,5'd0,5'd3,6'd0,5'd2,5'd1}; #10;


// // // R4 = R3 * R3   -> (A<<2)^2
// // instruction_in = {6'b000111,5'd0,5'd4,6'd0,5'd3,5'd3}; #10;


// // // R5 = B << 3
// // instruction_in = {6'b001111,5'd0,5'd5,6'd0,5'd3,5'd2}; #10;


// // // R6 = R5 * R5   -> (B<<3)^2
// // instruction_in = {6'b000111,5'd0,5'd6,6'd0,5'd5,5'd5}; #10;


// // // R7 = R4 + R6
// // instruction_in = {6'b000100,5'd0,5'd7,6'd0,5'd6,5'd4}; #10;



// // // ================= START EXECUTION =================

// // write_en = 0;

// // #300;


// // // ---------------- Results ----------------

// // $display("RESULT REGISTER R7 = %d", dut.rf.registers[7]);

// // $finish;

// // end

// // endmodule














// `timescale 1ns/1ps
// `include "top.v"

// module top_tb;

// reg clk;
// reg reset;
// reg [31:0] instruction_in;
// reg write_en;

// top dut(
//     .clk(clk),
//     .reset(reset),
//     .instruction_in(instruction_in),
//     .write_en(write_en)
// );

// // Clock
// initial clk = 0;
// always #5 clk = ~clk;

// // Dump
// initial begin
//     $dumpfile("top.vcd");
//     $dumpvars(0, top_tb);
// end

// // Monitor
// initial begin
// $monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%d | OUT2=%d",
// $time,
// dut.instruction_out,
// dut.A,
// dut.B,
// dut.output1,
// dut.output2
// );
// end

// // ================= MAIN =================

// initial begin

// reset = 1;
// write_en = 1;
// instruction_in = 0;

// #10;
// reset = 0;

// // ---------- LOAD VALUES ----------
// // Example: a=10, b=5, c=3, d=4, e=2, f=1

// // MOV R1,#10 (a)
// instruction_in = 32'b00000000001000000000000000001010; #10;

// // MOV R2,#5 (b)
// instruction_in = 32'b00000000010000000000000000000101; #10;

// // MOV R3,#3 (c)
// instruction_in = 32'b00000000011000000000000000000011; #10;

// // MOV R4,#4 (d)
// instruction_in = 32'b00000000100000000000000000000100; #10;

// // MOV R5,#2 (e)
// instruction_in = 32'b00000000101000000000000000000010; #10;

// // MOV R6,#1 (f)
// instruction_in = 32'b00000000110000000000000000000001; #10;


// // ---------- COMPUTATION ----------

// // R7 = a + b
// instruction_in = 32'b00010000000001110000000001000001; #10;

// // R7 = R7 - c
// instruction_in = 32'b00010100000001110000000011100011; #10;

// // R7 = R7 + d
// instruction_in = 32'b00010000000001110000000011100100; #10;

// // R7 = R7 + e
// instruction_in = 32'b00010000000001110000000011100101; #10;

// // R7 = R7 - f
// instruction_in = 32'b00010100000001110000000011100110; #10;


// // ---------- STORE ----------

// // STORE MEM[8], R7
// instruction_in = 32'b00001100001000000000000000000111; #10;


// write_en = 0;

// #200;


// // ---------- RESULTS ----------

// $display("FINAL RESULT (R7) = %d", dut.rf.registers[7]);
// $display("MEMORY[8] = %d", dut.wb.dm.memory[8]);

// $monitoroff;

// #100;

// end


// // ---------- REGISTER DUMP ----------

// integer i;
// initial begin
//     #500;
//     $display("=== REGISTER FILE ===");
//     for(i = 0; i < 8; i = i + 1) begin
//         $display("R[%0d] = %d", i, dut.rf.registers[i]);
//     end
//     $finish;
// end

// endmodule