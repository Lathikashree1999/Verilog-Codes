module tff_tb;
  reg clk,rst,t;
  wire q,q_bar;
  
  tff_asyn_rst tf(clk,rst,t,q,q_bar);
  
  always #2 clk=~clk;
  
  initial begin
    clk=0;rst=0;
    $display("rst=%d, q=%d, q_bar=%d",rst,q,q_bar);
    #3 rst=1;
    $display("rst=%d, q=%d, q_bar=%d",rst,q,q_bar);
    
    drive(0);
    drive(1);
    drive(1);
    drive(1);
    drive(0);
    
    #5;
    $finish;
  end
  
  task drive(input ip);
    begin
      @(posedge clk);
      t=ip;
      #1 $display("T=%d, q=%d, q_bar=%d",t,q,q_bar);
    end
  endtask
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
