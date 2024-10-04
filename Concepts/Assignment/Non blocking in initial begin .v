module eg;
 reg a,b;
 initial begin
   #10 a <= 1'b0;
   #1 b <= 1'b1;
   a <= 1;
   #5 b <= a;
   $display ($time, "a=%d,b=%d",a,b);
 end
endmodule
// Output 16a=1,b=1
