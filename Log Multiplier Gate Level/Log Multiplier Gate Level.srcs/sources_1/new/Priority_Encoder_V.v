`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 22:21:07
// Design Name: 
// Module Name: Priority_Encoder_V
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


module Priority_Encoder_V(
input [7:0]I,
output [2:0]O,
output valid
    );
    
wire I7, I6, I4, I1, G1, G2, G3, G4, G5, G6, G7;


assign I7 = ~I[7];
assign I6 = ~I[6];
assign I4 = ~I[4];
assign I1 = ~I[1];

assign G1 = ~(I6 & I[5]);
assign G2 = ~(I7 & G1 & I6 & I4);
assign G3 = (I[4] | I[5] | I[6]);
assign G4 = ~(~G3 & I[2]);
assign G5 = ~(~G3 & I[3]);
assign G6 = (G3 | I[2] | I1);
assign G7 = ~(G2 | I[0]);

 
assign O[2] = G2;
assign O[1] = ~(I7 & I6 & G4 & G5);
assign O[0] = ~( I7 & G1 & G5 & G6);

assign valid = ~(G4 & G5 & G6 &G7);

endmodule
