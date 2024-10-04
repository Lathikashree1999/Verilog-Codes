module eg;
   reg a,b;
 
	initial begin
		a=1;
		b=a;
        $display($time," a=%d,b=%d",a,b);
	end
	initial begin
		#1 a<=1;
		b<=a;
        $display($time," a=%d,b=%d",a,b);
	end
 
endmodule 
/* Output
0 a=1,b=1 
1 a=1,b=1 */
