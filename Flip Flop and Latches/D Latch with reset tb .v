module tb;
  reg en,rst,d;
  wire q;
  
  d_latch dl(en,rst,d,q);
  
  initial begin
    en = 0;
    rst =0;
    d = 0;
    
    #2 en=0; rst=0; d=1;
    #2 en=0; rst=1; d=0;
    #2 en=0; rst=1; d=1;
    #2 en=1; rst=0; d=0;
    #2 en=1; rst=0; d=1;
    #2 en=1; rst=1; d=0;
    #2 en=1; rst=1; d=1;
    #10 $finish;
  end
  
  initial begin
    $monitor("At time %t : en=%b, rst=%b, d=%b, q=%b",$time,en,rst,d,q);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
