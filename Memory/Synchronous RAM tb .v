module memory_tb;
  reg clk;
  reg reset;
  reg write;
  reg [2:0]data_in;
  reg [4:0]addr;
  wire [2:0]data_out;
  memory mem(clk, reset, write, data_in, addr, data_out);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    reset=1;
    #5 reset=0;
    #5 write=1;data_in=110;addr=00011;
    #10 write=0;
    #5 write=1;data_in=101;addr=00100;
    #10 write=0;
    #30 $finish;
  end

  initial begin
    $monitor("t=%0d, reset=%b, clk=%b, write=%b, addr=%b, data_in=%b, data_out=%b", $time, reset, clk, write, addr, data_in, data_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
