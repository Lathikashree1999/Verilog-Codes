/*3.1 1.4 Floating-point greater-than circuit 
A floating-point greater-than circuit compares two floating-point numbers and asserts out- 
put, gt, when the first number is larger than the second number. Assume that the two 
numbers are represented in the format discussed in Section 3.9.4. 
1. Design the circuit and derive the code. 
2. Derive a testbench and use simulation to verify operation of the code. 
3. Design a testing circuit and derive the code. 
4. Synthesize the circuit, program the FPGA, and verify its operation.*/

module floatingpoint_grt_cir(input sign1, sign2, input [3:0]exp1, exp2, input[7:0] frac1, frac2, output reg gt);
  always@(*)begin
    //Compare based on sign
    if(sign1==0 && sign2==1) begin
      gt = 1;  //positive > negative
    end
    
    else if(sign1==1 && sign2==0) begin
      gt = 0;
    end
    
    else begin
      //compare based exponent as both num have same sign
      if(exp1 > exp2) begin
        gt = ~sign1;// if positive, 1 means greater; if negative, 1 means lesser
      end
      
      else if(exp1 < exp2) begin
        gt = sign1;// if positive, 0 means lesser; if negative, 0 means greater
      end
      
      else begin
        gt = (frac1 > frac2) ? ~sign1 : sign1;
      end
    end
  end
endmodule

        
