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
$monitor("TIME=%0t | INSTR=%b | A=%d | B=%d | OUT1=%d | OUT2=%d",
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




// MOV R1,#1
instruction_in = 32'b00000000001000000000000000000001; #10;

// MOV R2,#2
instruction_in = 32'b00000000010000000000000000000010; #10;

// MOV R3,#3
instruction_in = 32'b00000000011000000000000000000011; #10;

// MOV R4,#4
instruction_in = 32'b00000000100000000000000000000100; #10;

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
