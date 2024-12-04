module tb;
  reg clk,rst;
  reg j,k;
  wire q,q_bar;
  
  jkff jk(clk,rst,j,k,q,q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk =0; rst = 0;
    $display("Reset=%b-->q=%b, q_bar=%b",rst,q,q_bar);
    #3 rst=1;
    $display("Reset=%b-->q=%b, q_bar=%b",rst,q,q_bar);
    
    drive(2'b00);
    drive(2'b01);
    drive(2'b10);
    drive(2'b11);
    drive(2'b11);
    
    #5;
    $finish;
  end
  
  task drive(input [1:0]ip);
    @(posedge clk);
    {j,k}=ip;
    #1 $display("j=%b, k=%b, rst=%b, q=%b, q_bar=%b",j,k,rst,q,q_bar);
  endtask
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
