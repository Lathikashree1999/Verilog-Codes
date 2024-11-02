module tb;
  reg clk,rst,serial_in;
  wire [3:0] parallel_out;
  
  sipo_4bit sipo(clk, rst, serial_in, parallel_out);
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst = 1;
    serial_in = 0;
    
    #10 rst = 0;
    
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;
    
    #20 $finish;
  end
  
  initial begin
    $monitor("Time %t: clk=%b, rst=%b, serial_in=%b, parallel_out=%b",$time,clk,rst,serial_in,parallel_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
    
  
