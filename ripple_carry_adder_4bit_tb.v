module ripple_carry_adder_4bit_tb;
    // Declare inputs as reg and outputs as wire
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    // Instantiate the 4-bit ripple carry adder
    ripple_carry_adder_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .S(S), .Cout(Cout)
    );

    // Initial block to apply test cases
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time=%0t A=%b B=%b Cin=%b S=%b Cout=%b", $time, A, B, Cin, S, Cout);

        // Test case 1: 0 + 0, Cin = 0
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10;

        // Test case 2: 1 + 1, Cin = 0 (should produce carry)
        A = 4'b0001; B = 4'b0001; Cin = 0;
        #10;

        // Test case 3: 5 + 3, Cin = 0 (5 + 3 = 8)
        A = 4'b0101; B = 4'b0011; Cin = 0;
        #10;

        // Test case 4: 15 + 1, Cin = 0 (should overflow, 15 + 1 = 16)
        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;

        // Test case 5: 7 + 8, Cin = 1 (7 + 8 + 1 = 16)
        A = 4'b0111; B = 4'b1000; Cin = 1;
        #10;

        // Test case 6: 10 + 5, Cin = 1 (10 + 5 + 1 = 16)
        A = 4'b1010; B = 4'b0101; Cin = 1;
        #10;

        // End simulation
        $finish;
    end
endmodule
