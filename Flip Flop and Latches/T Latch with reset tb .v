module tb;
  reg enable, reset, t;
  wire q;
  
  t_latch tl(enable,reset,t,q);
  
  initial begin
    $monitor("At time %t : enable=%b, reset=%b, t=%b, q=%b",$time,enable,reset,t,q);
    reset=0;enable=0;t=1;#2;
    reset=1;enable=1;t=1;#2;
    reset=0;enable=1;t=0;#2;
    reset=0;enable=1;t=1;#2;
    reset=1;enable=1;t=1;#2;
    reset=0;enable=1;t=0;#2;
    #10 $finish;
  end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
