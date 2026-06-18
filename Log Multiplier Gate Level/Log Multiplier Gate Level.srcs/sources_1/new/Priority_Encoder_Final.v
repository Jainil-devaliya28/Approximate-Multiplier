`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 22:21:35
// Design Name: 
// Module Name: Priority_Encoder_Final
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


module Priority_Encoder_Final(
input [15:0]I,
output [3:0]O
);
wire [2:0]A; wire [2:0]B; wire valid;

Priority_Encoder_NV p1( .I(I[7:0]), .O(A));
Priority_Encoder_V p2(.I(I[15:8]), .O(B), .valid(valid));
mux m(.A(A), .B(B), .valid(valid), .O(O));




endmodule
