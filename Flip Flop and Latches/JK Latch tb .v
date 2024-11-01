module tb;
  reg enable, j, k;
  wire q,qn;
  
  jk_latch jk(enable, j, k, q,qn);
  
  initial begin
    $monitor("At time %t: enable=%b, j=%b, k=%b, q=%b, qn=%b",$time,enable,j,k,q,qn);
    enable=0; j=0; k=0; #2;
    enable=0; j=0; k=1; #2;
    enable=1; j=0; k=0; #2;
    enable=1; j=0; k=1; #2;
    enable=1; j=1; k=0; #2;
    enable=1; j=1; k=1; #2;
    enable=0; j=0; k=1; #2;
  end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
