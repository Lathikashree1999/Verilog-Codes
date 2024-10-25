module demux_tb;
    reg sel,i;
    wire y0,y1;
    
    demux_1x2 d(sel,i,y0,y1);
    
    initial begin 
        $monitor("sel=%b, i=%b, y0=%b, y1=%b",sel,i,y0,y1);
        sel=0;i=0;#1;
        sel=0;i=1;#1;
        sel=1;i=0;#1;
        sel=1;i=1;#1;
    end
endmodule
