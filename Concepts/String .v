module test;  // output value=  hel, the values in the range must be according to the size of the string. 
  reg[13*8:1]s;
  initial begin 
    s="hello world";
    $display("value=%s",s[104:65]);
  end
endmodule
