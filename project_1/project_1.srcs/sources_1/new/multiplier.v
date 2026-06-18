`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 18:00:04
// Design Name: 
// Module Name: multiplier
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


module lut_multiplier (
    input  [15:0] A,
    input  [15:0] B,
    output [31:0] O
);

    wire [31:0] p0  = B[0]  ? (A << 0)  : 32'd0;
    wire [31:0] p1  = B[1]  ? (A << 1)  : 32'd0;
    wire [31:0] p2  = B[2]  ? (A << 2)  : 32'd0;
    wire [31:0] p3  = B[3]  ? (A << 3)  : 32'd0;
    wire [31:0] p4  = B[4]  ? (A << 4)  : 32'd0;
    wire [31:0] p5  = B[5]  ? (A << 5)  : 32'd0;
    wire [31:0] p6  = B[6]  ? (A << 6)  : 32'd0;
    wire [31:0] p7  = B[7]  ? (A << 7)  : 32'd0;
    wire [31:0] p8  = B[8]  ? (A << 8)  : 32'd0;
    wire [31:0] p9  = B[9]  ? (A << 9)  : 32'd0;
    wire [31:0] p10 = B[10] ? (A << 10) : 32'd0;
    wire [31:0] p11 = B[11] ? (A << 11) : 32'd0;
    wire [31:0] p12 = B[12] ? (A << 12) : 32'd0;
    wire [31:0] p13 = B[13] ? (A << 13) : 32'd0;
    wire [31:0] p14 = B[14] ? (A << 14) : 32'd0;
    wire [31:0] p15 = B[15] ? (A << 15) : 32'd0;

    wire [31:0] s0  = p0  + p1;
    wire [31:0] s1  = p2  + p3;
    wire [31:0] s2  = p4  + p5;
    wire [31:0] s3  = p6  + p7;
    wire [31:0] s4  = p8  + p9;
    wire [31:0] s5  = p10 + p11;
    wire [31:0] s6  = p12 + p13;
    wire [31:0] s7  = p14 + p15;

    wire [31:0] s8  = s0 + s1;
    wire [31:0] s9  = s2 + s3;
    wire [31:0] s10 = s4 + s5;
    wire [31:0] s11 = s6 + s7;

    wire [31:0] s12 = s8 + s9;
    wire [31:0] s13 = s10 + s11;

    assign O = s12 + s13;

endmodule

