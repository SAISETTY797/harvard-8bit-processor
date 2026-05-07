

module fetch_unit(
    input clk,
    input reset,
    input write_en,
    input  [31:0] instruction_in,
    output [31:0] instruction_out
);

reg [31:0] inst_mem [0:63];
reg [5:0] counter;
reg [5:0] pc;

always @(posedge clk) begin

    if(reset) begin
        counter <= 6'd0;
        pc <= 6'd0;
    end

    else if(write_en) begin
            inst_mem[counter] <= instruction_in;
            counter <= counter + 1;
    end 
    else begin 
            pc <= pc + 1;   // fetch next instruction
        end

    end


assign instruction_out = inst_mem[pc];

endmodule
