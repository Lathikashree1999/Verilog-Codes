module mux_tb;
    reg sel0,sel1;
    reg i0,i1,i2,i3;
    wire y;
    
    mux_4x1_by_2x1 mux(sel0,sel1,i0,i1,i2,i3,y);
    
    initial begin
        $monitor("sel0=%b , sel1=%b, i0=%b, i1=%b, i2=%b, i3=%b, y=%b",sel0,sel1,i0,i1,i2,i3,y);
        {i3,i2,i1,i0} = 4'h5;
        repeat(5) begin 
            {sel0,sel1} = $random;
            #5;
        end
    end                                                                                                                              
    
endmodule
