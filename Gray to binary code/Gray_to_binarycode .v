module gray_to_binarycode #(parameter width=4) (input [width-1:0] gray,
                                                output [width-1:0] binary);
    genvar i;
    generate 
        for(i=0;i<width;i=i+1) begin
            assign binary[i] = ^(gray>>i);
        end
    endgenerate
endmodule
