module datatype;
  integer a;
  real b;
  time c;
  initial begin
    a=32'hcafe_1234;
    b=0.1234567;
    #20 c=$time;
    $display("int a = %0h",a);
    $display("int b = %0f",b);
    $display("int c = %0t",c);
  end
endmodule

/* output
int a = cafe1234
int b = 0.123457
int c = 20 */
