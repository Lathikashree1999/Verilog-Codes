module test;  // output value=  hel
  reg[13*8:1]s;
  initial begin 
    s="hello world";
    $display("value=%s",s[104:65]);
  end
endmodule
