module data_memory(
    input clk,
    input data_write_enb,
    input [7:0] data_write,
    input [7:0] read_address,
    input [7:0] write_address,
   
    output   [7:0]data_read
);

reg [7:0] memory [255:0];

always@(posedge clk) begin 
    if(data_write_enb) begin 
   
        memory[write_address]<=data_write;
    end 
end 

assign data_read=memory[read_address];
endmodule 