module eg;     //Output : At time 16 a=1,b=1
   reg a,b;
 
 initial begin
	#10 a <= 1'b0;
	#1 b <= 1'b1;
	a <= 1;
	#5 b <= a;
    $display("At time %0t a=%d,b=%d",$time,a,b);
 end
 
endmodule
