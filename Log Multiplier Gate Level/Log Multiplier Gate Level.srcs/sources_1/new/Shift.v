`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 15:15:24
// Design Name: 
// Module Name: Shift
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


module Shift(    input [15:0] I,
    input [3:0] k,
    output [31:0] O
);


    // NOT wires for shift control bits
    wire nk0, nk1, nk2, nk3;
    not g_not0(nk0, k[0]);
    not g_not1(nk1, k[1]);
    not g_not2(nk2, k[2]);
    not g_not3(nk3, k[3]);

    // Intermediate stages
    wire [31:0] stage0;
    wire [31:0] stage1;
    wire [31:0] stage2;

    // === Stage 0: shift by 1 if k[0] ===
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : shift1
            wire d0, d1, w0, w1;

            if (i < 16) assign d0 = I[i];
            else        assign d0 = 1'b0;

            if (i >= 1 && (i - 1) < 16) assign d1 = I[i-1];
            else                        assign d1 = 1'b0;

            and g1(w0, nk0, d0);
            and g2(w1, k[0], d1);
            or  g3(stage0[i], w0, w1);
        end
    endgenerate

    // === Stage 1: shift by 2 if k[1] ===
    generate
        for (i = 0; i < 32; i = i + 1) begin : shift2
            wire d0, d1, w0, w1;

            assign d0 = stage0[i];
            if (i >= 2) assign d1 = stage0[i-2];
            else        assign d1 = 1'b0;

            and g4(w0, nk1, d0);
            and g5(w1, k[1], d1);
            or  g6(stage1[i], w0, w1);
        end
    endgenerate

    // === Stage 2: shift by 4 if k[2] ===
    generate
        for (i = 0; i < 32; i = i + 1) begin : shift4
            wire d0, d1, w0, w1;

            assign d0 = stage1[i];
            if (i >= 4) assign d1 = stage1[i-4];
            else        assign d1 = 1'b0;

            and g7(w0, nk2, d0);
            and g8(w1, k[2], d1);
            or  g9(stage2[i], w0, w1);
        end
    endgenerate

    // === Stage 3: shift by 8 if k[3] ===
    generate
        for (i = 0; i < 32; i = i + 1) begin : shift8
            wire d0, d1, w0, w1;

            assign d0 = stage2[i];
            if (i >= 8) assign d1 = stage2[i-8];
            else        assign d1 = 1'b0;

            and g10(w0, nk3, d0);
            and g11(w1, k[3], d1);
            or  g12(O[i], w0, w1);
        end
    endgenerate

endmodule

