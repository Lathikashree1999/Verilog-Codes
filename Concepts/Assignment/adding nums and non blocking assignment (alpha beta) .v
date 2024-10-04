module eg;
	int alpha, beta;
	initial begin
		alpha = 4; beta = 3;
		 beta <= beta + alpha;
		 alpha <= alpha + beta;
		//alpha alpha 2;
       $display ($time," Alpha=%0d Beta=%0d", alpha, beta);
	end
endmodule
// Output :  0 Alpha=4 Beta=3
