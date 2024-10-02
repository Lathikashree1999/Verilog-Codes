module demux_tb;
    reg sel0,sel1;
    reg i;
    wire y0,y1,y2,y3;
    
    demux_1x4_by_1x2 d(sel0,sel1,i,y0,y1,y2,y3);
    
    initial begin 
        $monitor("sel0=%b, sel1=%b, i=%b, y0=%b, y1=%b, y2=%b, y3=%b",sel0,sel1,i,y0,y1,y2,y3);
        sel0=0;sel1=0;i=0;#1;
        sel0=0;sel1=0;i=1;#1;
        sel0=0;sel1=1;i=0;#1;
        sel0=0;sel1=1;i=1;#1;
        sel0=1;sel1=0;i=0;#1;
        sel0=1;sel1=0;i=1;#1;
        sel0=1;sel1=1;i=0;#1;
        sel0=1;sel1=1;i=1;#1;
    end
    
endmodule
