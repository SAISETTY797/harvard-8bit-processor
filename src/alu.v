`include "cla_8_bit.v"
`include "sub_8_bit.v"
`include "wallace_tree_multiplier.v"
`include "non_rst_div.v"
`include "eight_bit_neg.v"
`include "eight_bit_log_left.v"
`include "eight_bit_log_right.v"
`include "eight_bit_or.v"
`include "eight_bit_and.v"
`include "eight_bit_nand.v"
`include "eight_bit_xor.v"
`include "eight_bit_xnor.v"
`include "eight_bit_not.v"
`include "eight_bit_nor.v"

module alu(
    input  [5:0] opcode,
    input  [7:0] A,
    input  [7:0] B,
    output reg [7:0] output1,
    output reg [7:0] output2
);

// Intermediate wires
wire [7:0] add_sum;
wire       add_carry;

wire [7:0] sub_diff;
wire       sub_borrow;

wire [15:0] mul_full;

wire [7:0] div_quot;
wire [7:0] div_rem;

wire [7:0] neg_out;
wire [7:0] lshift_out;
wire [7:0] rshift_out;

wire [7:0] or_out;
wire [7:0] and_out;
wire [7:0] nand_out;
wire [7:0] xor_out;
wire [7:0] xnor_out;
wire [7:0] not_out;
wire [7:0] nor_out;

// Instantiate modules

cla_8_bit sum(
    .A(A),
    .B(B),
    .sum(add_sum),
    .carry_out(add_carry)
);

sub_8_bit sub(
    .A(A),
    .B(B),
    .diff(sub_diff),
    .borrow_out(sub_borrow)
);

wallace_tree_multiplier mul(
    .a(A),
    .b(B),
    .mul_out(mul_full)
);

non_rst_div div(
    .dividend(A),
    .divisor(B[6:0]),
    .quotient(div_quot),
    .remainder(div_rem)
);

eight_bit_neg neg(.A(A), .out(neg_out));
eight_bit_log_left left_shift(.in(A), .sel(B[2:0]), .shift_out(lshift_out));
eight_bit_log_right right_shift(.in(A), .sel(B[2:0]), .shift_out(rshift_out));

eight_bit_or or_gate(.A(A), .B(B), .out(or_out));
eight_bit_and and_gate(.A(A), .B(B), .out(and_out));
eight_bit_nand nand_gate(.A(A), .B(B), .out(nand_out));
eight_bit_xor xor_gate(.A(A), .B(B), .out(xor_out));
eight_bit_xnor xnor_gate(.A(A), .B(B), .out(xnor_out));
eight_bit_not not_gate(.A(A), .out(not_out));
eight_bit_nor nor_gate(.A(A), .B(B), .out(nor_out));

always @(*) begin

    output1 = 8'd0;
    output2 = 8'd0;

    case (opcode)
        6'd1: begin 
            output1=A;
        end 
        6'd3: begin 
            output1=A;
        end 

        


        6'b000100: begin // ADD
            output1 = add_sum;
            output2 = {7'd0, add_carry};
        end

        6'b000101: begin // SUB
            output1 = sub_diff;
            output2 = {7'd0, sub_borrow};
        end

        6'b000110: begin // NEG
            output1 = neg_out;
        end

        6'b000111: begin // MUL
            output1 = mul_full[7:0];
            output2 = mul_full[15:8];
        end

        6'b001000: begin // DIV
            output1 = div_quot;
            output2 = div_rem;
        end

        6'b001001: output1 = or_out;
        6'b001010: output1 = xor_out;
        6'b001011: output1 = nand_out;
        6'b001100: output1 = nor_out;
        6'b001101: output1 = xnor_out;
        6'b001110: output1 = not_out;
        6'b001111: output1 = lshift_out;
        6'b010000: output1 = rshift_out;
        default: begin 
            output1=8'd0;
            output2=8'd0;
        end 

    endcase

end

endmodule