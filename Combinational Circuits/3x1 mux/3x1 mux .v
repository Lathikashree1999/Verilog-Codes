module mux_3x1(input sel0, sel1,
    input i0,i1,i2,
    output y);
    
    wire y1;
    mux_2x1 m1(sel0,i0,i1,y1);
    mux_2x1 m2(sel1,y1,i2,y);
    
endmodule

module mux_2x1(input sel,i0,i1,output y);

    assign y = sel?i1:i0;
    
endmodule
