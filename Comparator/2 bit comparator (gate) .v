module comparator_2bit(
    input [1:0] A, B,
    output A_eq_B, A_gt_B, A_lt_B
);
    wire nA1, nA0, nB1, nB0;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

    // Invert A and B bits
    not(nA1, A[1]);
    not(nA0, A[0]);
    not(nB1, B[1]);
    not(nB0, B[0]);

    // A == B logic using AND and OR gates
    and(w1, nA1, nA0, nB1, nB0);
    and(w2, nA1, A[0], nB1, B[0]);
    and(w3, A[1],A[0], B[1], B[0]);
    and(w4,A[1], nA0,B[1], nB0);
    or(A_eq_B, w1, w2, w3, w4);

    // A > B logic
    and(w5, A[1], nB1);
    and(w6, A[1], A[0], nB0);
    and(w7, nA1, A[0], nB0);
    or(A_gt_B, w5, w6, w7);

    // A < B logic
    and(w8, B[1], nA1);
    and(w9, B[1], B[0], nA0);
    and(w10, nB1, B[0], nA0);
    or(A_lt_B, w8, w9, w10);

endmodule
