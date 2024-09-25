module tb;
  reg a,b;
  wire s,carry;
  
  half_adder ha(.a(a),.b(b),.sum(s),.carry(c));
  
  initial begin
    $monitor("At time %t : a=%b, b=%b, sum=%b,carry=%b",$time,a,b,s,c);
    //$display("At time %t : a=%b, b=%b, sum=%b,carry=%b",$time,a,b,s,c); 
    //output At time                    0 : a=x, b=x, sum=x,carry=x
    a=0;b=0;#2;
    a=0;b=1;#2;
    a=1;b=0;#2;
    a=1;b=1;#2;
  end
  
endmodule
