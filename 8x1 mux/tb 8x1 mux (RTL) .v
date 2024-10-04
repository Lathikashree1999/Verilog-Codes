module tb;
  reg [7:0]in;
  reg [2:0]sel;
  wire y;
  
  mux_8x1 mux(in,sel,y);
  
  initial begin 
    in = $random;
    sel = 3'b000;
    
    #10 sel = 3'b000;
    #10 sel = 3'b001;
    #10 sel = 3'b010;
    #10 sel = 3'b011;
    #10 sel = 3'b100;
    #10 sel = 3'b101;
    #10 sel = 3'b110;
    #10 sel = 3'b111;
    
    #10 $finish;
    
  end
  
  initial begin
    $monitor("At time %0t : sel=%b,in=%b, y=%b",$time,sel,in,y);
  end
  
endmodule
