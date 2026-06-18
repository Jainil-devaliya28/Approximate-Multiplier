`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 22:20:33
// Design Name: 
// Module Name: Priority_Encoder_NV
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


module Priority_Encoder_NV(
    input  [7:0] I,
    output [2:0] O
);
//assign G1 = I[0] | I[3];
//assign G2 = I[5] | I[7];
//assign G3 = I[2] | I[3];
//assign G4 = I[6] | I[7];
//assign G5 = I[4] | I[5];
//assign G6 = I[6] | I[7];

//assign O[0] = G1 | G2;
//assign O[1] = G3 | G4;
//assign O[2] = G5 | G6;


// O[0] Logic: 1 for outputs 001, 011, 101, 111
assign O[0] = 
    (~I[7] & ~I[6] & ~I[5] & ~I[4] & ~I[3] & ~I[2] & I[1]) | 
    (~I[7] & ~I[6] & ~I[5] & ~I[4] & I[3]) | 
    (~I[7] & ~I[6] & I[5]) | 
    (I[7]);

// O[1] Logic: 1 for outputs 010, 011, 110, 111
assign O[1] = 
    (~I[7] & ~I[6] & ~I[5] & ~I[4] & ~I[3] & I[2]) | 
    (~I[7] & ~I[6] & ~I[5] & ~I[4] & I[3]) | 
    (~I[7] & I[6]) | 
    (I[7]);

// O[2] Logic: 1 for outputs 100, 101, 110, 111
assign O[2] = 
    (~I[7] & ~I[6] & ~I[5] & I[4]) | 
    (~I[7] & ~I[6] & I[5]) | 
    (~I[7] & I[6]) | 
    (I[7]);



endmodule
