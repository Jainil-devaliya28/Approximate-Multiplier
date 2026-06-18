`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 20:28:05
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Adder(
    input  [31:0] A_shifted, // shifted values of A by Ka 
    input  [31:0] B_shifted, // shifted values of B by Kb
    input  [3:0]  Ka,        // leading 1 position of A
    input  [3:0]  Kb,        // leading 1 position of B
    output [31:0] S,         // sum
    output [4:0]  K          // Ka + Kb (5-bit because of carry-out)
);

    // ----------- Intermediate Carry Wires -----------
    wire [31:0] carry_s;
    wire [4:0]  carry_k;
    wire [3:0]  sum_k;

    // ----------- Initial Carries -----------
    assign carry_s[0] = 1'b0;
    assign carry_k[0] = 1'b0;

    // ----------- 32-bit Ripple Carry Adder for S -----------
    assign S[0]  = A_shifted[0] ^ B_shifted[0] ^ carry_s[0];
    assign carry_s[1]  = (A_shifted[0] & B_shifted[0]) | (A_shifted[0] & carry_s[0]) | (B_shifted[0] & carry_s[0]);

    assign S[1]  = A_shifted[1] ^ B_shifted[1] ^ carry_s[1];
    assign carry_s[2]  = (A_shifted[1] & B_shifted[1]) | (A_shifted[1] & carry_s[1]) | (B_shifted[1] & carry_s[1]);

    assign S[2]  = A_shifted[2] ^ B_shifted[2] ^ carry_s[2];
    assign carry_s[3]  = (A_shifted[2] & B_shifted[2]) | (A_shifted[2] & carry_s[2]) | (B_shifted[2] & carry_s[2]);

    assign S[3]  = A_shifted[3] ^ B_shifted[3] ^ carry_s[3];
    assign carry_s[4]  = (A_shifted[3] & B_shifted[3]) | (A_shifted[3] & carry_s[3]) | (B_shifted[3] & carry_s[3]);

    assign S[4]  = A_shifted[4] ^ B_shifted[4] ^ carry_s[4];
    assign carry_s[5]  = (A_shifted[4] & B_shifted[4]) | (A_shifted[4] & carry_s[4]) | (B_shifted[4] & carry_s[4]);

    assign S[5]  = A_shifted[5] ^ B_shifted[5] ^ carry_s[5];
    assign carry_s[6]  = (A_shifted[5] & B_shifted[5]) | (A_shifted[5] & carry_s[5]) | (B_shifted[5] & carry_s[5]);

    assign S[6]  = A_shifted[6] ^ B_shifted[6] ^ carry_s[6];
    assign carry_s[7]  = (A_shifted[6] & B_shifted[6]) | (A_shifted[6] & carry_s[6]) | (B_shifted[6] & carry_s[6]);

    assign S[7]  = A_shifted[7] ^ B_shifted[7] ^ carry_s[7];
    assign carry_s[8]  = (A_shifted[7] & B_shifted[7]) | (A_shifted[7] & carry_s[7]) | (B_shifted[7] & carry_s[7]);

    assign S[8]  = A_shifted[8] ^ B_shifted[8] ^ carry_s[8];
    assign carry_s[9]  = (A_shifted[8] & B_shifted[8]) | (A_shifted[8] & carry_s[8]) | (B_shifted[8] & carry_s[8]);

    assign S[9]  = A_shifted[9] ^ B_shifted[9] ^ carry_s[9];
    assign carry_s[10] = (A_shifted[9] & B_shifted[9]) | (A_shifted[9] & carry_s[9]) | (B_shifted[9] & carry_s[9]);

    assign S[10] = A_shifted[10] ^ B_shifted[10] ^ carry_s[10];
    assign carry_s[11] = (A_shifted[10] & B_shifted[10]) | (A_shifted[10] & carry_s[10]) | (B_shifted[10] & carry_s[10]);

    assign S[11] = A_shifted[11] ^ B_shifted[11] ^ carry_s[11];
    assign carry_s[12] = (A_shifted[11] & B_shifted[11]) | (A_shifted[11] & carry_s[11]) | (B_shifted[11] & carry_s[11]);

    assign S[12] = A_shifted[12] ^ B_shifted[12] ^ carry_s[12];
    assign carry_s[13] = (A_shifted[12] & B_shifted[12]) | (A_shifted[12] & carry_s[12]) | (B_shifted[12] & carry_s[12]);

    assign S[13] = A_shifted[13] ^ B_shifted[13] ^ carry_s[13];
    assign carry_s[14] = (A_shifted[13] & B_shifted[13]) | (A_shifted[13] & carry_s[13]) | (B_shifted[13] & carry_s[13]);

    assign S[14] = A_shifted[14] ^ B_shifted[14] ^ carry_s[14];
    assign carry_s[15] = (A_shifted[14] & B_shifted[14]) | (A_shifted[14] & carry_s[14]) | (B_shifted[14] & carry_s[14]);

    assign S[15] = A_shifted[15] ^ B_shifted[15] ^ carry_s[15];
    assign carry_s[16] = (A_shifted[15] & B_shifted[15]) | (A_shifted[15] & carry_s[15]) | (B_shifted[15] & carry_s[15]);

    assign S[16] = A_shifted[16] ^ B_shifted[16] ^ carry_s[16];
    assign carry_s[17] = (A_shifted[16] & B_shifted[16]) | (A_shifted[16] & carry_s[16]) | (B_shifted[16] & carry_s[16]);

    assign S[17] = A_shifted[17] ^ B_shifted[17] ^ carry_s[17];
    assign carry_s[18] = (A_shifted[17] & B_shifted[17]) | (A_shifted[17] & carry_s[17]) | (B_shifted[17] & carry_s[17]);

    assign S[18] = A_shifted[18] ^ B_shifted[18] ^ carry_s[18];
    assign carry_s[19] = (A_shifted[18] & B_shifted[18]) | (A_shifted[18] & carry_s[18]) | (B_shifted[18] & carry_s[18]);

    assign S[19] = A_shifted[19] ^ B_shifted[19] ^ carry_s[19];
    assign carry_s[20] = (A_shifted[19] & B_shifted[19]) | (A_shifted[19] & carry_s[19]) | (B_shifted[19] & carry_s[19]);

    assign S[20] = A_shifted[20] ^ B_shifted[20] ^ carry_s[20];
    assign carry_s[21] = (A_shifted[20] & B_shifted[20]) | (A_shifted[20] & carry_s[20]) | (B_shifted[20] & carry_s[20]);

    assign S[21] = A_shifted[21] ^ B_shifted[21] ^ carry_s[21];
    assign carry_s[22] = (A_shifted[21] & B_shifted[21]) | (A_shifted[21] & carry_s[21]) | (B_shifted[21] & carry_s[21]);

    assign S[22] = A_shifted[22] ^ B_shifted[22] ^ carry_s[22];
    assign carry_s[23] = (A_shifted[22] & B_shifted[22]) | (A_shifted[22] & carry_s[22]) | (B_shifted[22] & carry_s[22]);

    assign S[23] = A_shifted[23] ^ B_shifted[23] ^ carry_s[23];
    assign carry_s[24] = (A_shifted[23] & B_shifted[23]) | (A_shifted[23] & carry_s[23]) | (B_shifted[23] & carry_s[23]);

    assign S[24] = A_shifted[24] ^ B_shifted[24] ^ carry_s[24];
    assign carry_s[25] = (A_shifted[24] & B_shifted[24]) | (A_shifted[24] & carry_s[24]) | (B_shifted[24] & carry_s[24]);

    assign S[25] = A_shifted[25] ^ B_shifted[25] ^ carry_s[25];
    assign carry_s[26] = (A_shifted[25] & B_shifted[25]) | (A_shifted[25] & carry_s[25]) | (B_shifted[25] & carry_s[25]);

    assign S[26] = A_shifted[26] ^ B_shifted[26] ^ carry_s[26];
    assign carry_s[27] = (A_shifted[26] & B_shifted[26]) | (A_shifted[26] & carry_s[26]) | (B_shifted[26] & carry_s[26]);

    assign S[27] = A_shifted[27] ^ B_shifted[27] ^ carry_s[27];
    assign carry_s[28] = (A_shifted[27] & B_shifted[27]) | (A_shifted[27] & carry_s[27]) | (B_shifted[27] & carry_s[27]);

    assign S[28] = A_shifted[28] ^ B_shifted[28] ^ carry_s[28];
    assign carry_s[29] = (A_shifted[28] & B_shifted[28]) | (A_shifted[28] & carry_s[28]) | (B_shifted[28] & carry_s[28]);

    assign S[29] = A_shifted[29] ^ B_shifted[29] ^ carry_s[29];
    assign carry_s[30] = (A_shifted[29] & B_shifted[29]) | (A_shifted[29] & carry_s[29]) | (B_shifted[29] & carry_s[29]);

    assign S[30] = A_shifted[30] ^ B_shifted[30] ^ carry_s[30];
    assign carry_s[31] = (A_shifted[30] & B_shifted[30]) | (A_shifted[30] & carry_s[30]) | (B_shifted[30] & carry_s[30]);

    assign S[31] = A_shifted[31] ^ B_shifted[31] ^ carry_s[31];
    // Final carry (optional): carry_s[32]

    // ----------- 4-bit Ripple Carry Adder for K -----------
    assign sum_k[0] = Ka[0] ^ Kb[0] ^ carry_k[0];
    assign carry_k[1] = (Ka[0] & Kb[0]) | (Ka[0] & carry_k[0]) | (Kb[0] & carry_k[0]);

    assign sum_k[1] = Ka[1] ^ Kb[1] ^ carry_k[1];
    assign carry_k[2] = (Ka[1] & Kb[1]) | (Ka[1] & carry_k[1]) | (Kb[1] & carry_k[1]);

    assign sum_k[2] = Ka[2] ^ Kb[2] ^ carry_k[2];
    assign carry_k[3] = (Ka[2] & Kb[2]) | (Ka[2] & carry_k[2]) | (Kb[2] & carry_k[2]);

    assign sum_k[3] = Ka[3] ^ Kb[3] ^ carry_k[3];
    assign carry_k[4] = (Ka[3] & Kb[3]) | (Ka[3] & carry_k[3]) | (Kb[3] & carry_k[3]);

    assign K = {carry_k[4], sum_k};

endmodule
