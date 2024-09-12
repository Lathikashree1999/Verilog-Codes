module mux_3x1_tb;
    reg sel0,sel1;
    reg i0,i1,i2;
    wire y;
    
    mux_3x1 m(sel0,sel1,i0,i1,i2,y);
    
    initial begin
        $monitor("sel0=%b, sel1=%b, i0=%b, i1=%b, i2=%b, y=%b",sel0,sel1,i0,i1,i2,y);
        {i2,i1,i0} = 3'o5;
        repeat(8) begin
            {sel0,sel1} = $random;
            #5;
        end
    end
    
endmodule
