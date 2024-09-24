module numbers();
  reg [7:0] sized_num;
  reg [31:0] unsized_num;
  
  initial begin
    sized_num = 8'd7;
    unsized_num = 'd56;
    $display("Sized number= %0d, Unsized number=%0d",sized_num,unsized_num);
  end
  
endmodule

// Output : Sized number= 7, Unsized number=56
