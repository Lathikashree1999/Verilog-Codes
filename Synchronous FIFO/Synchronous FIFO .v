module sfifo(
  input clk, reset, write_enable, read_enable,
  input [7:0]data_in,
  output reg [7:0]data_out,
  output wire full,empty,
  output reg [3:0]write_ptr, read_ptr
   );
  reg [7:0]fifomem[15:0];
  always @(posedge clk)
    begin
      if(reset)
        begin
          write_ptr <= 0;
          read_ptr <= 0;
          data_out = 0;
        end
    end
 
  always @(posedge clk)
    begin
      if(write_enable && !full)
        begin
          fifomem[write_ptr] <= data_in;
          write_ptr <= write_ptr+1;
        end
    end
  
  always @(posedge clk)
    begin
      if(read_enable && !empty)
        begin
          data_out <= fifomem[read_ptr];
          read_ptr <= read_ptr+1;
        end
    end
  
     assign full = ((write_ptr+1'b1)==read_ptr);
     assign empty = (write_ptr==read_ptr);
endmodule
