module test;    // output q=1
  reg q,d;
  initial begin 
     #1 q=d;  //without #1 output displayed is q=x
  end
  initial begin
    d=1;
  end
  initial begin
    #1 $display("q=%b",q);
  end
endmodule
