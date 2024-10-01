module tb_dff;
  reg clk;
  reg d;
  wire q,q_bar;
  
  dff_gate_level dff1(d,clk,q,q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; //rst_n = 0;
    d = 0;
    
    //#3 rst_n = 1;
    
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    /*rst_n = 0; #3;
    rst_n = 1;
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end */
    $finish;
  end
  
  initial begin
    $monitor("At time %0t : d=%d,clk=%d,q=%d,q_bar=%d",$time,d,clk,q,q_bar);
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
