module Ripple_Carry_Adder #(parameter SIZE=4)(
    input [SIZE-1:0]a,b,
    input cin,
    output [SIZE-1:0]S,Cout
    );
    genvar i;
    fulladder fa0(a[0],b[0],cin,S[0],Cout[0]);
    generate 
        for(i=1;i<SIZE;i=i+1) begin
            fulladder fa(a[i],b[i],Cout[i-1],S[i],Cout[i]);
        end
    endgenerate
endmodule

module fulladder(input a,b,cin,
                 output S,Cout);
     assign {S,Cout}={(a^b^cin),((a&b)|(b&cin)|(cin&a))}; 
endmodule
