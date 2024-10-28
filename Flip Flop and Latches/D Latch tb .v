module tb;
  reg en,d;
  wire q;
  
  d_latch dl(en,d,q);
  
  initial begin
    d = 0;
    en = 0;
    #2 d=0; en=1;
    #2 d=1; en=0;
    #2 d=0; en=1;
    #2 d=1; en=1;
    #2 d=0; en=0;
    #2 d=1; en=0;
    #10 $finish;
  end
  
  initial begin
    $monitor("en=%b,d=%b,q=%b",en,d,q);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
