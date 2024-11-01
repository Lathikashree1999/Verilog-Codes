module tb;
  reg enable, t;
  wire q;
  
  t_latch tl(enable,t,q);
  
  initial begin
    $monitor("At time %t : enable=%b, t=%b, q=%b",$time,enable,t,q);
    enable=0;t=1;#10;
    enable=1;t=1;#10;
    enable=1;t=0;#10;
    enable=1;t=1;#10;
    enable=1;t=1;#10;
    #10 $finish;
  end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
