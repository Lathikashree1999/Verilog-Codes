module arithmetic_op;
    reg [3:0] i1,i2;
    initial begin
        i1= 4'h6;
        i2= 4'h2;
        $display("i1 = %0h and i2 = %0h",i1,i2,);
        $display("Add: %0h",i1+i2);
        $display("Sub: %0h",i1-i2);
        $display("Mul: %0h",i1*i2);
        $display("div: %0h",i1/i2);
        $display("pow: %0h",i1**i2);
        $display("Mod: %0h",i1%i2);
    end
endmodule
