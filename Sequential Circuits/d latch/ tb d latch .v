module tb;
  reg d,enable;
  wire q;
  
  d_latch dlat(d,enable,q);
  
  always #5 enable = ~enable;
  
  initial begin 
    d=0;enable=0;
    
    #10 d=1;
    #10 enable=1;
    #10 d=0;
    #10 enable=0;
    #10 d=1;
    #10 enable=1;
    #10 d=0;
    
    #10 $finish;
  end
  
  initial begin
    $monitor("At time %0t : d=%b, enable=%b, q=%b",$time,d,enable,q);
  end
endmodule
