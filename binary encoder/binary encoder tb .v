module bin_enc_tb;
    reg [7:0]d;
    wire[2:0]y;
    integer i;
    
    binary_encoder bin(d,y);
    
    initial begin
        d=8'b1;#1;
        for(i=0;i<8;i=i+1) begin
            $display("d=%h(in decimal=%0d) --> y=%0h",d,i,y);
            d=d<<1;#1;
        end
    end
    
endmodule
