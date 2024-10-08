 module eg(input x1,x2,x3,clk,output reg g,f);
   reg d1,d2;
   always@(posedge clk) begin
                   d1 <= x1 & x2;
                      g <= d1;

                   d2 <= f  |  x3;
                       f<=d2;
   end
 endmodule
