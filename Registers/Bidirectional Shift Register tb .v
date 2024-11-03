module tb;
  reg clk, rst, load, shift_dir;
  reg [3:0] parallel_in;
  wire [3:0] data_out;
  
  bi_shift_reg bi(clk, rst, load, shift_dir, parallel_in, data_out);
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst = 1;
    load = 0;
    shift_dir = 0;
    parallel_in = 4'b0000;
    
    #10 rst = 0;
    #10 load = 1;
    parallel_in = 4'b1011;
    #10 load = 0;

    #10 shift_dir = 0; 
    #10 shift_dir = 0;

    #10 shift_dir = 1;
    #10 shift_dir = 1;

    #20 $finish;
  end
  
  initial begin
    $monitor("At time %0t : clk=%b, rst=%b, load=%b, shift_dir=%b, parallel in=%b, data out=%b",$time,clk, rst, load, shift_dir, parallel_in, data_out);
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
