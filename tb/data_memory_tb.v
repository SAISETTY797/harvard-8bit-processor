`timescale 1ns/1ps
`include "data_memory.v"

module data_memory_tb;

reg  clk;
    reg data_write_enb;
    reg  [7:0] data_write;
    reg  [7:0] read_address;
    reg  [7:0] write_address;
   
    wire   [7:0]data_read;


data_memory dut(.data_write_enb(data_write_enb),.clk(clk),.data_write(data_write),.read_address(read_address),.data_read(data_read),.write_address(write_address));


initial begin 
    clk=0;
end 
always #5 clk=~clk;

initial begin 
    $dumpfile("data_memory.vcd");
    $dumpvars(0,data_memory_tb);
    $monitor($time," WRITE_ADDRESS=%b || DATA_WRITE=%b || DATA_WRITE_ENB=%b || READ_ADDRESS=%b || DATA_READ=%b  ",write_address,data_write,data_write_enb,read_address,data_read);
end 



initial begin

// initialize
data_write = 0;
read_address = 0;
write_address = 0;
data_write_enb=0;

#10;


// TEST 1 : Write 25 to address 10
data_write_enb=1'b1;
write_address = 8'd10;
data_write = 8'd25;
#10;

// read address 10
data_write_enb=1'b0;
read_address = 8'd10;
#10;


// TEST 2 : Write 50 to address 20
data_write_enb=1'b1;
write_address = 8'd20;
data_write = 8'd50;
#10;

// read address 20
data_write_enb=1'b0;
read_address = 8'd20;
#10;


// TEST 3 : Write 100 to address 30
data_write_enb=1'b1;
write_address = 8'd30;
data_write = 8'd100;
#10;

// read address 30
data_write_enb=1'b0;
read_address = 8'd30;
#10;


// TEST 4 : Overwrite address 10
data_write_enb=1'b1;
write_address = 8'd10;
data_write = 8'd77;
#10;

// read address 10
data_write_enb=1'b0;
read_address = 8'd10;
#10;


// TEST 5 : Random access read
data_write_enb=1'b1;
read_address = 8'd20;
#10;


data_write_enb=1'b0;
read_address = 8'd30;
#10;

#20;
$finish;

end
endmodule 

