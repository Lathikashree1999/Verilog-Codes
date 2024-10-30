module Ripple_Carry_Adder_tb #(parameter SIZE=4);
    wire [SIZE-1:0]S,Cout;
    reg [SIZE-1:0]a,b;
    reg cin;
    wire add;
    
    Ripple_Carry_Adder rca(a,b,cin,S,Cout);
    assign add={Cout[0],S};
    
    initial begin
        $monitor("A=%b,B=%b,cin=%b,Sum=%b,Cout[3]=%b,addition=%0d",a,b,cin,S,Cout[3],add);
        a=1;b=0;cin=0;#3; 
        a=2;b=4;cin=1;#3;
        a=4'hb;b=4'h6;cin=0;#3;
        a=5;b=3;cin=1;#3;
        $finish;
    end
endmodule
