module tb;
  reg s,r,enable,reset;
  wire q,qn;
  
  sr_latch sr(s,r,enable,reset,q,qn);
  
  initial begin
    reset=1;enable = 0; s=1; r=0; #2;
    reset=0;enable = 1; s=0; r=0; #2;
    reset=0;enable = 1; s=0; r=1; #2;
    reset=0;enable = 1; s=1; r=0; #2;
    reset=0;enable = 1; s=1; r=1; #2;
    reset=1;enable = 1; s=1; r=0; #2;
    reset=0;enable = 1; s=1; r=0; #2;
    $monitor("At time %t: enable=%b,reset=%b, s=%b, r=%b, q=%b, qn=%b",$time,enable,reset,s,r,q,qn);
    #10 $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
