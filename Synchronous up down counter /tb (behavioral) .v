module tb_syn_counter;
  reg clk,rst,up;
  wire[3:0]cnt;
  
  syn_counter syn(clk,rst,up,cnt);
  
  always #2 clk=~clk;
  
  initial begin
    clk=0;rst=0;
    up=1;
    #4;
    rst=1;
    #80;
    rst=0;
    #4;
    rst=1;up=0;
    #50;
    $finish;
  end
  
  initial begin
    $dumpfile("syn counter.vcd");
    $dumpvars;
  end
  
endmodule
