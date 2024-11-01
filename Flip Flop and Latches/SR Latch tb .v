module tb;
  reg s,r,enable;
  wire q,qn;
  
  sr_latch sr(s,r,enable,q,qn);
  
  initial begin
    enable = 0; s=1; r=0; #1;
    enable = 1; s=0; r=0; #1;
    enable = 1; s=0; r=1; #1;
    enable = 1; s=1; r=0; #1;
    enable = 1; s=1; r=1; #1;
    $monitor("At time %t: enable=%b, s=%b, r=%b, q=%b, qn=%b",$time,enable,s,r,q,qn);
    #10 $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
    
