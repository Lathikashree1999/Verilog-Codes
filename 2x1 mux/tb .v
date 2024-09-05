module mux_2x1_tb;
    reg sel,i0,i1;
    wire y;
    
    mux_2x1 mux(sel,i0,i1,y);
    
    initial begin 
        $monitor("Select=%b , i0=%b , i1=%b , y=%b",sel,i0,i1,y);
        i0=0;i1=1;
        #1;
        sel=0;
        #1;
        sel=1;
    end
  
endmodule
