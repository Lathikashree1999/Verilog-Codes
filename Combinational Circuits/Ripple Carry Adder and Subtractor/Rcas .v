module Ripple_carry_adder_subtractor #(parameter size=4)
    (input [size-1:0] a,b,
     input ctrl,
     output[size-1:0]s,Cout);                                       
     wire [size-1:0]Bc;
     genvar i;
     fulladder fa0(a[0],Bc[0],ctrl,s[0],Cout[0]);
     assign Bc[0]=b[0]^ctrl;
     generate
        for(i=1;i<size;i=i+1) begin
            assign Bc[i]=b[i]^ctrl;
            fulladder fa(a[i],b[i],Cout[i-1],s[i],Cout[i]);
        end
     endgenerate
endmodule

module fulladder(input a,b,cin,output s,cout);
    assign{s,cout}={(a^b^cin),((a&b)|(b&cin)|(cin|a))};
endmodule
