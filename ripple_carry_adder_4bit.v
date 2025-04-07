// Define the full adder module first
module full_adder (
    input a, b, cin,      // Inputs: two bits and carry-in
    output sum, cout      // Outputs: sum and carry-out
);
    assign sum = a ^ b ^ cin;                // Sum = a XOR b XOR cin
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out logic
endmodule

// Define the 4-bit ripple carry adder module
module ripple_carry_adder_4bit (
    input [3:0] A, B,    // 4-bit inputs A and B
    input Cin,           // Carry-in
    output [3:0] S,      // 4-bit sum
    output Cout          // Final carry-out
);
    // Internal wires to connect carry signals between full adders
    wire C0, C1, C2;

    // Instantiate four full adders
    full_adder FA0 (
        .a(A[0]), .b(B[0]), .cin(Cin),  // LSB: A0, B0, Cin
        .sum(S[0]), .cout(C0)           // S0, carry to next stage
    );

    full_adder FA1 (
        .a(A[1]), .b(B[1]), .cin(C0),   // A1, B1, carry from previous
        .sum(S[1]), .cout(C1)           // S1, carry to next stage
    );

    full_adder FA2 (
        .a(A[2]), .b(B[2]), .cin(C1),   // A2, B2, carry from previous
        .sum(S[2]), .cout(C2)           // S2, carry to next stage
    );

    full_adder FA3 (
        .a(A[3]), .b(B[3]), .cin(C2),   // MSB: A3, B3, carry from previous
        .sum(S[3]), .cout(Cout)         // S3, final carry-out
    );
endmodule
