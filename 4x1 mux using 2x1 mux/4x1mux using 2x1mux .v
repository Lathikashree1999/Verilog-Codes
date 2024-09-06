module mux_2x1 (input sel,i0,i1,output y);
    assign y = sel?i1:i0;
endmodule

module mux_4x1_by_2x1(input sel0, sel1,
                      input i0,i1,i2,i3,
                      output  y);
    wire y0,y1;
    
    mux_2x1 mux1(sel1,i2,i3,y1);
    mux_2x1 mux0(sel1,i0,i1,y0);
    mux_2x1 mux3(sel0,y0,y1,y);
    
endmodule
