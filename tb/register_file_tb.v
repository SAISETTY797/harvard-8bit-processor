`timescale 1ns/1ps
`include "register_file.v"

module register_file_tb;

 reg  clk;
 reg  write_enable;          
 reg   [4:0] read_address;
 reg   [4:0] write_address;
 reg   [7:0] write_data;
 wire  [7:0] data_out;


 register_file dut(.clk(clk),.write_enable(write_enable),.read_address(read_address),.write_address(write_address),.write_data(write_data),.data_out(data_out));


 initial begin 
    clk=0;
 end 
 always #5 clk=~clk;

initial begin 
    $dumpfile("register_file.vcd");
    $dumpvars(0,register_file_tb);
    $monitor($time,"WRITE_ADDRESS=%b || WRITE_ENABLE=%b || WRITE_DATA=%b || READ_ADDRESS=%b || DATA_OUT=%b  ",write_address,write_enable,write_data,read_address,data_out);
end 




initial begin


write_enable = 0;
read_address = 0;
write_address = 0;
write_data = 0;

#10;


// TEST 1 : Write to register 5

write_enable = 1'b1;
write_address = 5'd5;
write_data = 8'hAA;
#10;

read_address = 5'd5;
#10;


// TEST 2 : Write to register 10

write_address = 5'd10;
write_data = 8'h55;
#10;

read_address = 5'd10;
#10;



// TEST 3 : Overwrite register 5

write_address = 5'd5;
write_data = 8'hFF;
#10;

read_address = 5'd5;
#10;



// TEST 4 : Write to register 0

write_address = 5'd0;
write_data = 8'h12;
#10;

read_address = 5'd0;
#10;


// TEST 5 : Write disabled

write_enable = 1'b0;
write_address = 5'd7;
write_data = 8'h99;
#10;

read_address = 5'd7;
#10;



// TEST 6 : Maximum register

write_enable = 1;
write_address = 5'd31;
write_data = 8'hAB;
#10;

read_address = 5'd31;
#10;

#20;
$finish;

end
endmodule 