
module register_file2(
    input clk,

    input write_enable1,
    input write_enable2,

    input [4:0] write_address1,
    input [4:0] write_address2,

    input [7:0] write_data1,
    input [7:0] write_data2,

    input [4:0] read_address1,
    input [4:0] read_address2,

    output [7:0] data_out1,
    output [7:0] data_out2
);

reg [7:0] registers[31:0];

assign data_out1 = registers[read_address1];
assign data_out2 = registers[read_address2];

always @(posedge clk) begin

    if(write_enable1)
        registers[write_address1] <= write_data1;

    if(write_enable2)
        registers[write_address2] <= write_data2;

end

endmodule