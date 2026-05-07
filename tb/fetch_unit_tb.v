`timescale 1ns/1ps
`include "fetch_unit.v"

module fetch_unit_tb;

    reg clk;
    reg reset;
    reg write_en;
    reg [5:0]  read_address;
    reg [31:0] instruction_in;

    wire [31:0] instruction_out;

    fetch_unit dut(
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_address(read_address),
        .instruction_in(instruction_in),
        .instruction_out(instruction_out)
    );

    initial begin
        $dumpfile("fetch_unit.vcd");
        $dumpvars(0, fetch_unit_tb);
        $monitor("TIME=%0t | write_en=%b | instruction_in=%d | read_address=%b | instruction_out=%d",
                  $time, write_en, instruction_in, read_address, instruction_out);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset          = 1;
        write_en       = 0;
        read_address   = 6'd0;
        instruction_in = 32'd0;

        #10 reset          = 0;
            write_en       = 1;
        #10 instruction_in = 32'd1;
        #10 instruction_in = 32'd2;
        #10 instruction_in = 32'd4;
        #10 instruction_in = 32'd10;
        #10 instruction_in = 32'd12;

        #10 write_en     = 0;
        #10 read_address = 6'd0;
        #10 read_address = 6'd1;
        #10 read_address = 6'd2;
        #10 read_address = 6'd3;
        #10 read_address = 6'd4;
        #10 read_address = 6'd5;

        #10;
        $finish;
    end

endmodule