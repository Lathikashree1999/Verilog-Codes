module tb;
  reg a,b,c;
  wire sum,carry;
  
  full_adder fa(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  
  initial begin
    $monitor("At time %t : a=%b, b=%b, c=%b, sum=%b, carry=%b",$time,a,b,c,sum,carry);
    a=0;b=0;c=0;#2;
    a=0;b=0;c=1;#2;
    a=0;b=1;c=0;#2;
    a=0;b=1;c=1;#2;
    a=1;b=0;c=0;#2;
    a=1;b=0;c=1;#2;
    a=1;b=1;c=0;#2;
    a=1;b=1;c=1;#2;
  end
  
endmodule
