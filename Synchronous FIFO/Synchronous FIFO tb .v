module sfifo_tb;
  reg clk,reset,write_enable,read_enable;
  reg [7:0]data_in;
  reg [2:0]write_ptr,read_ptr;
  reg [7:0]fifo[7:0];
  wire [7:0]data_out;
  wire full,empty;
  
  sfifo fif(clk, reset, write_enable, read_enable, data_in, data_out, full, empty);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    write_enable = 0;
    read_enable = 0;
    #15
    reset = 0;
    
    write_enable = 1;
    read_enable = 0;
    
    data_in = 8'b00000001;
    #10
    data_in = 8'b00001001;
    #10
    data_in = 8'b00000111;
    #10
    data_in = 8'b00000011;
    #10
    data_in = 8'b00000100;
    #10
    data_in = 8'b00000110;
    #10
    data_in = 8'b00001000;
    #10
    data_in = 8'b00001010;
    #10
    //data_in = 8'b00010111;
   // #10
    
    read_enable = 1;
    write_enable = 0;
    #200
    $finish;
  end
  
   initial begin
     $dumpfile("waves.vcd");
     $dumpvars;
     $monitor("time=%d, clk=%d, reset=%d, write_enable=%d, read_enable=%d, data_in=%d, data_out=%d, full=%d, empty=%d", $time, clk, reset, write_enable, read_enable, data_in, data_out, full, empty);
  end

endmodule
