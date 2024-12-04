module tb;
  reg [11:0]r;
  wire [3:0]prio1, prio2;
  
  dual_priority_encoder dual(r,prio1,prio2);
  
  initial begin
    $monitor("At time %t :input=%b, priority1=%b, priority2=%b",$time, r, prio1, prio2);
    r = 12'b1000_0000_0000; #10;
    r = 12'b0000_1000_0000; #10;
    r = 12'b0000_1100_0000; #10;
    r = 12'b0000_1010_0000; #10;
    r = 12'b1000_1000_1000; #10;
    r = 12'b1000_1010_1000; #10;
    r = 12'b1000_0000_0001; #10;
    r = 12'b0000_0000_0000; #10;
    #100 $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
