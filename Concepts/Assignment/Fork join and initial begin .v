module test;
  initial begin
    fork
      begin // First begin block
        integer i;
        for (i = 0; i <= 3; i = i + 1) begin
          $display($time, " value of i = %0d", i);
        end
      end
      
      begin // Second begin block;
        #1;
        $display("Executed 2nd begin block");
      end
    join
    
    $display("Fork Join Ended");
  end
endmodule

/* OUTPUT
0 value of i = 0
                   0 value of i = 1
                   0 value of i = 2
                   0 value of i = 3
Executed 2nd begin block
Fork Join Ended*/
