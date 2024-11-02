module tb;
  reg clk,rst,load;
  reg [3:0]parallel_in;
  wire serial_out;
  
  piso_4bit piso(clk, rst, load, parallel_in, serial_out);
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst = 1;
    load = 0;
    parallel_in = 0;
    
    #10 rst = 0;
    
    #10 load =1;
    parallel_in = 4'b1011;
    #10 load = 0;
    
    #50 $finish;
  end
  
  initial begin
    $monitor("Time %t: clk=%b, rst=%b,load=%b, parallel_in=%b, serial_out=%b",$time,clk,rst,load,parallel_in,serial_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
