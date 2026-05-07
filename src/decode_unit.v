
module decode_unit(
    input  [31:0] instruction,
    output reg [4:0] read_address1,
    output reg [4:0] read_address2
);



wire [5:0] opcode;

assign opcode = instruction[31:26];


always @(*) begin

    read_address1 = 5'd0;
    read_address2 = 5'd0;
// 000011 STORE
  if (opcode == 6'b000011) begin
    read_address1 = instruction[4:0];  // must read R6
    read_address2 = 5'd0;
   end

//000001 REGISTER_MOVEE
else if(opcode==6'd1) begin 
    read_address1=instruction[4:0];
end 


    // 000100 ADD
   else  if (opcode == 6'b000100) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 000101 SUB
    else if (opcode == 6'b000101) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 000110 NEG
    else if (opcode == 6'b000110) begin
        read_address1 = instruction[4:0];
    end

    // 000111 MUL
    else if (opcode == 6'b000111) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001000 DIV
    else if (opcode == 6'b001000) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001001 OR
    else if (opcode == 6'b001001) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001010 XOR
    else if (opcode == 6'b001010) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001011 NAND
    else if (opcode == 6'b001011) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001100 NOR
    else if (opcode == 6'b001100) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001101 XNOR
    else if (opcode == 6'b001101) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 001110 NOT
    else if (opcode == 6'b001110) begin
        read_address1 = instruction[4:0];
    end

    // 001111 LSHL
    else if (opcode == 6'b001111) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

    // 010000 LRSH
    else if (opcode == 6'b010000) begin
        read_address1 = instruction[4:0];
        read_address2 = instruction[9:5];
    end

end

endmodule

