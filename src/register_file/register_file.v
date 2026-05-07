

module register_file(
    input clk,
    input write_enable,          
    input  [4:0] read_address,
    input  [4:0] write_address,
    input  [7:0] write_data,
    output [7:0] data_out
);
integer i;
initial begin 
for(i=0;i<32;i=i+1) begin 
    registers[i]=8'd0;
end 
end 

    reg [7:0] registers[31:0];

   
    always @(posedge clk) begin
        if (write_enable)
            registers[write_address] <= write_data;
    end

    assign data_out = registers[read_address];

endmodule


