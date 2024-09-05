module mux_4x1_tb;
    reg [1:0]sel;
    reg i0,i1,i2,i3;
    wire y;
    
    mux_4x1 mux(sel,i0,i1,i2,i3,y);
    
    initial begin
        $monitor("Select=%b , i0=%0b , i1=%0b , i2=%0b , i3=%0b , y=%0b",sel,i0,i1,i2,i3,y);
        {i3,i2,i1,i0} = 4'h5;
        repeat(6) begin
            sel= $random;
            #5;
        end
    end
  
endmodule
