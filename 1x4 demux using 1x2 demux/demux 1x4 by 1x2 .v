module demux_1x4_by_1x2(input sel0,sel1,
    input i,
    output wire y0,y1,y2,y3);
    
    wire z0,z1;
    demux_1x2 d1(sel0,i,z0,z1);
    demux_1x2 d2(sel1,z0,y0,y1);
    demux_1x2 d3(sel1,z1,y2,y3);
    
endmodule

module demux_1x2(input sel,i, output y0,y1);
    assign {y0,y1}=sel?{1'b0,i}:{i,1'b0};
endmodule
