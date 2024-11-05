module tb_barrel;
  reg [7:0] a;
  reg [2:0] amt;
  reg lr;
  wire [7:0] y;
  
  multifn_barrel_shifter barrel(a,amt,lr,y);
  
  initial begin
    a = 8'b1010_1010; amt = 3'b001; lr = 0; #10; //rotate left by 1
    a = 8'b1010_1010; amt = 3'b010; lr = 0; #10; //rotate right by 2
    a = 8'b1010_1010; amt = 3'b001; lr = 1; #10; //rotate left by 1
    a = 8'b1010_1010; amt = 3'b010; lr = 1; #10; //rotate right by 2
    $monitor("At time %t : a=%b, amt=%b, lr=%b, y=%b",$time,a,amt,lr,y);
    $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
endmodule
