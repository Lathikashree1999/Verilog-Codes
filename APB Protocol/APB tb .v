module tb;
  reg Pclk, Prst, Pselx, Penable, Pwrite;
  reg [31:0] Paddr, Pwdata;
  wire Pready, Pslverr;
  wire [31:0] Prdata;
  
  apb dut(Pclk, Prst, Pselx, Penable, Pwrite, Paddr, Pwdata, Pready, Pslverr, Prdata);
  
  always #5 Pclk = ~Pclk;
  
  task initialization;
    begin
      Pclk = 0;
      Prst = 0;
      Pselx = 0;
      Penable = 0;
      Pwrite = 0;
      Paddr = 0;
      Pwdata = 0;
    end
  endtask
  
  task reset;
    begin
      Prst = 1;
      #10 Prst = 0;
    end
  endtask
  
  task write_stimulus;
    begin
      @(posedge Pclk);
      Pselx = 1;
      Pwrite = 1;
      Pwdata = {$random} % 10;
      Paddr = Paddr+1;
      
      @(posedge Pclk);
      Penable = 1;
      Pselx = 1;
      
      @(posedge Pclk);
      Penable = 0;
      Pselx = 0;
      
      @(posedge Pclk); 
      $strobe("writing data into memory: data_in = %0d, address_in = %0d", Pwdata, Paddr); 
    end
  endtask
  
  task read_stimulus;
    begin 
      @(posedge Pclk);
      Pwrite = 0;
      Pselx = 1;
      Penable = 0;
      
      @(posedge Pclk);
      Penable = 1;
      Pselx = 1;
      Paddr <= Paddr + 1;
      
      @(posedge Pclk);
      Penable = 0;
      Pselx = 0;
      
      @(posedge Pclk); 
      $strobe("reading data from memory: data_out = %0d, address_out = %0d", Prdata, Paddr); 
    end
  endtask
  
  task read_write;
    begin
      repeat(2) begin 
        write_stimulus;
      end 
      #1 Paddr = 0;
      repeat(3) begin
        read_stimulus;
      end
    end
  endtask
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    initialization; 
    reset;
    read_write; 
    #80 $finish;
  end
endmodule
  
      
  
