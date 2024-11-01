module tb;
  reg enable, reset, j, k;
  wire q,qn;
  
  jk_latch jk(enable, reset, j, k, q,qn);
  
  initial begin
    $monitor("At time %t: enable=%b, reset=%b, j=%b, k=%b, q=%b, qn=%b",$time,enable,reset,j,k,q,qn);
    reset=0; enable=0; j=0; k=0; #2;
    reset=1; enable=0; j=0; k=1; #2;
    reset=0; enable=1; j=0; k=0; #2;
    reset=0; enable=1; j=0; k=1; #2;
    reset=0; enable=1; j=1; k=0; #2;
    reset=1; enable=1; j=1; k=1; #2;
    reset=0; enable=0; j=0; k=1; #2;
  end
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
