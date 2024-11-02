module tb;
  reg clk,rst,serial_in;
  wire serial_out;
  
  siso_4bit siso(clk,rst,serial_in,serial_out);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst = 1;
    serial_in = 0;
    
    #10 rst = 0;
    #10 serial_in =1;
    #10 serial_in =0;
    #10 serial_in =1;
    #10 serial_in =1;
    #10 serial_in =0;
    #10 serial_in =1;
    
    #20 $finish;
  end
  
  initial begin
    $monitor("Time %t : clk=%b, rst=%b, serial_in=%b, serial_out=%b",$time,clk,rst,serial_in,serial_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
    
