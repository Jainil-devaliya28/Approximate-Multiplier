`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 16:37:02
// Design Name: 
// Module Name: Shifter
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


//module Shifter(
//    input [15:0] I,
//    input [3:0] k,
//    output [31:0] O
//);

//    wire [31:0] stage0, stage1, stage2, stage3;

//    // Stage 0: shift by 1 if k[0]
//    genvar i;
//    generate
//        for (i = 0; i < 31; i = i + 1) begin : shift_by_1
//            assign stage0[i] = (k[0]) ? 
//                               ((i >= 1) ? { (i < 17 ? I[i-1] : 1'b0) } : 1'b0) :
//                               ((i < 16) ? I[i] : 1'b0);
//        end
//        assign stage0[31] = (k[0]) ? ((31 < 17) ? I[30] : 1'b0) : 1'b0;
//    endgenerate

//    // Stage 1: shift by 2 if k[1]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : shift_by_2
//            assign stage1[i] = (k[1]) ?
//                               ((i >= 2) ? stage0[i-2] : 1'b0) :
//                               stage0[i];
//        end
//    endgenerate

//    // Stage 2: shift by 4 if k[2]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : shift_by_4
//            assign stage2[i] = (k[2]) ?
//                               ((i >= 4) ? stage1[i-4] : 1'b0) :
//                               stage1[i];
//        end
//    endgenerate

//    // Stage 3: shift by 8 if k[3]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : shift_by_8
//            assign stage3[i] = (k[3]) ?
//                               ((i >= 8) ? stage2[i-8] : 1'b0) :
//                               stage2[i];
//        end
//    endgenerate

//    // Final output
//    assign O = stage3;


//// Stage 0: Shift by 1 (LSB control: k[0])
//wire [31:0] stage0;
//assign stage0[0] = k[0] ? 1'b0 : I[0];
//assign stage0[31:1] = k[0] ? {I[14:0], 17'b0} : {16'b0, I[15:1]};

//// Stage 1: Shift by 2 (k[1])
//wire [31:0] stage1;
//assign stage1[1:0] = k[1] ? 2'b00 : stage0[1:0];
//assign stage1[31:2] = k[1] ? stage0[29:0] : stage0[31:2];

//// Stage 2: Shift by 4 (k[2])
//wire [31:0] stage2;
//assign stage2[3:0] = k[2] ? 4'b0000 : stage1[3:0];
//assign stage2[31:4] = k[2] ? stage1[27:0] : stage1[31:4];

//// Stage 3: Shift by 8 (k[3])
//assign O[7:0] = k[3] ? 8'b00000000 : stage2[7:0];
//assign O[31:8] = k[3] ? stage2[23:0] : stage2[31:8];

//endmodule


//endmodule

module Shifter(
    input [15:0] I,
    input [3:0] k,
    output [31:0] O
);
//    wire [31:0] stage0, stage1, stage2, stage3;
//    wire nk0, nk1, nk2, nk3;

//    // Invert shift amount bits
//    not (nk0, k[0]);
//    not (nk1, k[1]);
//    not (nk2, k[2]);
//    not (nk3, k[3]);

//    genvar i;

//    // Stage 0: Shift by 1 if k[0]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : STAGE0
//            wire d0 = (i < 16) ? I[i] : 1'b0;
//            wire d1 = (i >= 1 && i-1 < 16) ? I[i-1] : 1'b0;

//            wire w0, w1;
//            and (w0, nk0, d0); // ~k[0] & A
//            and (w1, k[0], d1); // k[0] & B
//            or  (stage0[i], w0, w1);
//        end
//    endgenerate

//    // Stage 1: Shift by 2 if k[1]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : STAGE1
//            wire d0 = stage0[i];
//            wire d1 = (i >= 2) ? stage0[i-2] : 1'b0;

//            wire w0, w1;
//            and (w0, nk1, d0);
//            and (w1, k[1], d1);
//            or  (stage1[i], w0, w1);
//        end
//    endgenerate

//    // Stage 2: Shift by 4 if k[2]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : STAGE2
//            wire d0 = stage1[i];
//            wire d1 = (i >= 4) ? stage1[i-4] : 1'b0;

//            wire w0, w1;
//            and (w0, nk2, d0);
//            and (w1, k[2], d1);
//            or  (stage2[i], w0, w1);
//        end
//    endgenerate

//    // Stage 3: Shift by 8 if k[3]
//    generate
//        for (i = 0; i < 32; i = i + 1) begin : STAGE3
//            wire d0 = stage2[i];
//            wire d1 = (i >= 8) ? stage2[i-8] : 1'b0;

//            wire w0, w1;
//            and (w0, nk3, d0);
//            and (w1, k[3], d1);
//            or  (O[i], w0, w1);
//        end
//    endgenerate

//endmodule


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
