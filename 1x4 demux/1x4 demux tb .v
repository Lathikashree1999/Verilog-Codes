module demux_1x4_tb;
    wire y0,y1,y2,y3;
    reg [1:0]sel;
    reg i;
    
    demux_1x4 d(sel,i,y0,y1,y2,y3);
    
    initial begin 
        $monitor("sel=%b, i=%b, y0=%b, y1=%b, y2=%b, y3=%b",sel,i,y0,y1,y2,y3);
        sel=2'b00;i=0;#1;
        sel=2'b00;i=1;#1;
        sel=2'b01;i=0;#1;
        sel=2'b01;i=1;#1;
        sel=2'b10;i=0;#1;
        sel=2'b10;i=1;#1;
        sel=2'b11;i=0;#1;
        sel=2'b11;i=1;#1;
    end
endmodule
