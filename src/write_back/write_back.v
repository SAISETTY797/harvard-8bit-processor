`include "../data_memory/data_memory.v"

module write_back(

    input clk,
    input  [31:0] instruction,
    input  [7:0] output1,
    input  [7:0] output2,

    output reg [7:0] data_out1,
    output reg [7:0] data_out2,

    output reg write_enable1,
    output reg write_enable2,

    output reg [4:0] write_address1,
    output reg [4:0] write_address2,

    output reg [7:0] write_address
);

wire [5:0] opcode;
assign opcode = instruction[31:26];

reg [7:0] mem_read_address;
reg [7:0] data_write;
reg data_write_enb;

wire [7:0] mem_data_out;

always @(*) begin

    data_out1        = 8'd0;
    data_out2        = 8'd0;
    mem_read_address = 8'd0;
    write_address1   = 5'd0;
    write_address2   = 5'd0;
    write_address    = 8'bxxxxxxxx;
    data_write       = 8'd0;
    write_enable1    = 0;
    write_enable2    = 0;
    data_write_enb   = 0;

    if (opcode == 6'b000000) begin
        data_out1      = instruction[7:0];
        write_address1 = instruction[25:21];
        write_enable1  = 1'b1;
    end
    else if (opcode == 6'b000001) begin
        write_address1 = instruction[25:21];
        data_out1      = output1;
        write_enable1  = 1'b1;
    end
    else if (opcode == 6'b000010) begin
        mem_read_address = instruction[7:0];
        write_address1   = instruction[25:21];
        data_out1        = mem_data_out;
        write_enable1    = 1'b1;
    end
    else if (opcode == 6'b000011) begin
        write_address  = instruction[25:18];
        data_write     = output1;
        data_write_enb = 1'b1;
    end
    else if (opcode == 6'b000100) begin
        write_address1 = instruction[20:16];
        write_address2 = instruction[25:21];
        data_out1      = output1;
        data_out2      = output2;
        write_enable1  = 1;
        write_enable2  = 1;
    end
    else if (opcode == 6'b000101) begin
        write_address1 = instruction[20:16];
        write_address2 = instruction[25:21];
        data_out1      = output1;
        data_out2      = output2;
        write_enable1  = 1;
        write_enable2  = 1;
    end
    else if (opcode == 6'b000110) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b000111) begin
        write_address1 = instruction[20:16];
        write_address2 = instruction[25:21];
        data_out1      = output1;
        data_out2      = output2;
        write_enable1  = 1;
        write_enable2  = 1;
    end
    else if (opcode == 6'b001000) begin
        write_address1 = instruction[20:16];
        write_address2 = instruction[25:21];
        data_out1      = output1;
        data_out2      = output2;
        write_enable1  = 1;
        write_enable2  = 1;
    end
    else if (opcode == 6'b001001) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001010) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001011) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001100) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001101) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001110) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b001111) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end
    else if (opcode == 6'b010000) begin
        write_address1 = instruction[20:16];
        data_out1      = output1;
        write_enable1  = 1;
    end

end

data_memory dm(
    .clk(clk),
    .data_write_enb(data_write_enb),
    .data_write(data_write),
    .read_address(mem_read_address),
    .write_address(write_address),
    .data_read(mem_data_out)
);

endmodule
