
    `include "fetch_unit.v"
    `include "decode_unit.v"
    `include "write_back.v"
    `include "alu.v"
    `include "register_file2.v"



    module top(
        input clk,
        input reset,
        input write_en,
        input [31:0] instruction_in
    );



    wire [31:0] instruction_out;

    wire [7:0] reg_data_in;
    wire [7:0] write_data1;
    wire [7:0] write_data2;

    wire [7:0]  A;
    wire [7:0] B;
    wire [7:0]  output1;
    wire [7:0] output2;


    wire [4:0]  write_address1;
    wire [4:0] write_address2;
    wire [4:0]  read_address1;
    wire [4:0] read_address2;
    // wire  write_en;
    wire write_enable1;
    wire write_enable2;



    // assign reg_data_in=A;

    // ================= Register File =================

    // Read port 1
    register_file2 rf(
        .clk(clk),

        .write_enable1(write_enable1),
        .write_enable2(write_enable2),

        .write_address1(write_address1),
        .write_address2(write_address2),

        .write_data1(write_data1),
        .write_data2(write_data2),

        .read_address1(read_address1),
        .read_address2(read_address2),

        .data_out1(A),
        .data_out2(B)
    );

    // ================= Fetch =================

    fetch_unit fetch(
        .clk(clk),
        .reset(reset),
        .instruction_in(instruction_in),
            
        .instruction_out(instruction_out),
        .write_en(write_en)
        
    );

    // ================= Decode =================

    decode_unit decode(
        .instruction(instruction_out),
        .read_address1(read_address1),
        .read_address2(read_address2)
    );

    // ================= ALU =================

    alu alu_unit(
        .opcode(instruction_out[31:26]),
        .A(A),
        .B(B),
        .output1(output1),
        .output2(output2)
    );

    // ================= Write Back =================

    write_back wb(
        .clk(clk),
        .instruction(instruction_out),
        .output1(output1),
        .output2(output2),

        .write_enable1(write_enable1),
        .write_enable2(write_enable2),

        .write_address1(write_address1),
        .write_address2(write_address2),
        //.reg_data_in(A),
        .data_out1(write_data1),
        .data_out2(write_data2)
    );
    
    endmodule

