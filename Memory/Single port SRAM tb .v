module sync_ram_tb;
  reg clk,reset,write,read;
  reg[4:0] data_in;
  reg[6:0] address;
  wire[4:0] data_out;
  sync_ram ram(clk, reset, write, read, data_in, address, data_out);

  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    reset=1;
    #5reset=0;
    write=1;data_in=5'b00001;address=7'b0010001;read=0;
    #10 read=1;write=0;
    #20write=1;data_in=5'b01000;address=7'b0110011;read=0;
    #10 read=1;write=0;
    #40$finish;
  end
  
  initial begin
    $monitor(" t=%d reset=%b clk=%b data_in=%b write=%b read=%b address=%b data_out=%b",$time,reset,clk,data_in,write,read,address,data_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
