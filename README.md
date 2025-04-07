# 4-bit-Ripple-Carry-Adder

![image](https://github.com/user-attachments/assets/75a0a876-97f4-483d-86c9-77575038da9e)


Here’s what’s happening:

## Inputs:
* A (4 bits: A3, A2, A1, A0) and B (4 bits: B3, B2, B1, B0) are the two 4-bit numbers to be added.
* Cin is the carry-in input for the least significant bit (LSB) full adder (Full Adder A).
## Outputs:
* S (4 bits: S3, S2, S1, S0) is the 4-bit sum.
* C3 is the final carry-out (from Full Adder D).

## Internal Connections:
* Each full adder takes two bits (Ai and Bi), a carry-in (Ci), and produces a sum bit (Si) and a carry-out (Ci+1).
* The carry-out of one full adder becomes the carry-in for the next full adder, creating a "ripple" effect: C0 → C1 → C2 → C3.
