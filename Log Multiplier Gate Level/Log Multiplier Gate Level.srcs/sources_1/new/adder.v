`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 15:12:41
// Design Name: 
// Module Name: adder
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

module full_adder (
    input a, b, cin,
    output sum, cout
);
    wire axb, ab, bc, ac;

    xor (axb, a, b);
    xor (sum, axb, cin);

    and (ab, a, b);
    and (bc, b, cin);
    and (ac, a, cin);
    or  (cout, ab, bc, ac);
endmodule

module adder(
    input [31:0] A_shifted,
    input [31:0] B_shifted,
    input [3:0] Ka,
    input [3:0] Kb,
    output [31:0] S,
    output [4:0] K
);

    wire [4:0] carry_k;
    wire [4:0] k_sum;

    // Ripple-carry adder for K = Ka + Kb (4-bit + 4-bit = 5-bit)
    full_adder fa_k0 (.a(Ka[0]), .b(Kb[0]), .cin(1'b0),      .sum(K[0]), .cout(carry_k[0]));
    full_adder fa_k1 (.a(Ka[1]), .b(Kb[1]), .cin(carry_k[0]), .sum(K[1]), .cout(carry_k[1]));
    full_adder fa_k2 (.a(Ka[2]), .b(Kb[2]), .cin(carry_k[1]), .sum(K[2]), .cout(carry_k[2]));
    full_adder fa_k3 (.a(Ka[3]), .b(Kb[3]), .cin(carry_k[2]), .sum(K[3]), .cout(carry_k[3]));
    assign K[4] = carry_k[3];

    // Ripple-carry adder for S = A_shifted + B_shifted (32-bit)
    wire [31:0] carry_s;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : add_32
            if (i == 0)
                full_adder fa (.a(A_shifted[i]), .b(B_shifted[i]), .cin(1'b0),        .sum(S[i]), .cout(carry_s[i]));
            else
                full_adder fa (.a(A_shifted[i]), .b(B_shifted[i]), .cin(carry_s[i-1]), .sum(S[i]), .cout(carry_s[i]));
        end
    endgenerate

endmodule
