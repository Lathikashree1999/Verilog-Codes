module mealy_OL_111or000_tb;
  reg clk,rst,x;
  wire y;
  wire [3:0] state,next_state;
  
  mealy_OL_111or000 mealy(clk,rst,x,y);
 
  initial begin
    clk=0;
    forever #2 clk=~clk;
  end
  
  initial begin
     x=0;
    #1 rst=0;
    
    #2 rst=1;
    
    #3 x=1;
    #4 x=0;
    #4 x=0;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=1;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=1;
    #4 x=1;
    #4 x=1;
    #4 x=0;
    #4 x=0;
    #4 x=0;
    #4 x=0;
    #10 $finish;
  end
  
  initial begin
    $monitor("State:%b, Next state:%b, rst=%b, y=%b x=%0b clk=%0b",state,next_state,rst,y,x,clk);
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
