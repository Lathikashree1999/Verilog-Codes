module binary_to_graycode #(parameter width=4)(input [width-1:0]binary,
                                               output [width-1:0]gray);
    genvar i;
    generate
        for(i=0;i<width-1;i=i+1) begin
            assign gray[i] = binary[i]^binary[i+1];
        end    
    endgenerate
    assign gray[width-1] = binary[width-1];
endmodule
