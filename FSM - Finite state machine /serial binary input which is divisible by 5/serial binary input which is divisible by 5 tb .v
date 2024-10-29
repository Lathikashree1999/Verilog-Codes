module tb;
  reg clk,rst,serial_ip;
  wire z;
  
  serial_bin_ip ip(clk,rst,serial_ip,z);
  
  initial clk=0;
  always #5 clk=~clk;
  
  task apply_serial_ip(input bin_ip);
    begin
      serial_ip = bin_ip;
      #10;
    end
  endtask
  
  initial begin
    rst = 1;
    serial_ip = 0;
    #15;
    rst = 0;
    
    $display("Testing 101 (output z should be 1 as rem is 0)");
    apply_serial_ip(1);
    apply_serial_ip(0);
    apply_serial_ip(1);
    #10;
    $display("Output 101(5) divided by 5 : %b",z);
    
    $display("Testing 1001 (output z should be 0 as rem is 4)");
    apply_serial_ip(1);
    apply_serial_ip(0);
    apply_serial_ip(0);
    apply_serial_ip(1);
    #10;
    $display("Output 1001(9) divided by 5 : %b",z);
    
    $display("Testing 1010 (output z should be 1 as rem is 0)");
    apply_serial_ip(1);
    apply_serial_ip(0);
    apply_serial_ip(1);
    apply_serial_ip(1);
    #10;
    $display("Output 1010(10) divided by 5 : %b",z);
    
    $display("Testing 010 (output z should be 0 as rem is 3)");
    rst = 1;
    #10;
    rst = 0; 
    apply_serial_ip(0);
    apply_serial_ip(1);
    apply_serial_ip(0);
    #10;
    $display("Output 010(2) divided by 5 : %b",z);
    
    $finish;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
endmodule
