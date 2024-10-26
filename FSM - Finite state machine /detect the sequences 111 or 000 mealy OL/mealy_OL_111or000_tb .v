module mealy_OL_111or000_tb;
  reg clk,rst,x;
  wire y;
  wire [3:0] state,next_state;
  
  mealy_OL_111or000 mealy(clk,rst,x,y);
 
  always #2 clk=~clk;
  
  initial begin
     clk=0;
     x=0;
     rst=0;
    
    #2 rst=1;
    
    #3 x=1;
    #3 x=0;
    #3 x=0;
    #3 x=0;
    #3 x=1;
    #3 x=0;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #3 x=0;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #3 x=1;
    #3 x=0;
    #3 x=0;
    #3 x=0;
    #3 x=0;
    #50 $finish;
  end
  
  initial begin
    $monitor("State:%b, Next state:%b, rst=%b, y=%b x=%0b clk=%0b",state,next_state,rst,y,x,clk);
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
