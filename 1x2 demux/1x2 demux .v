module demux_1x2(input sel,i,
    output y0,y1);
    assign {y0,y1} = sel?{1'b0,i}:{i,1'b0};
endmodule
