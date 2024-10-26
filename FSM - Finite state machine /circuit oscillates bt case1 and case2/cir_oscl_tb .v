module cir_oscl_tb;
  reg clk,rst,A;
  wire y;
  
  cir_oscl cir(clk,rst,A,y);
  
  always #2 clk=~clk;
  
  initial begin
    clk=0;
    #1 rst=0;
    #2 rst=1;
    
    #4 A=0;
    #4 A=1;
    #4 A=0;
    #4 A=1;
    #4 A=0;
    #4 A=1;
    #4 A=1;
    #4 A=1;
    #4 A=0;
    #4 A=1;
    #4 A=0;
    #4 A=0;
    #4 A=1;
    #20 $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
