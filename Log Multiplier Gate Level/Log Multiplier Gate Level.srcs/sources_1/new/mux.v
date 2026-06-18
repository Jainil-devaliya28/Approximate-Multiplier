`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 02:30:03
// Design Name: 
// Module Name: mux
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


module mux(
    input valid,
    input [2:0] A,
    input [2:0] B,
    output [3:0] O
);

//// Output bit assignments
//assign O[3] = valid;  // MSB is direct valid signal

//// 2-to-1 MUX logic for each bit using AND-OR gates
//assign O[2] = (valid & B[2]) | (~valid & A[2]);
//assign O[1] = (valid & B[1]) | (~valid & A[1]);
//assign O[0] = (valid & B[0]) | (~valid & A[0]);

//endmodule
wire [2:0]G1; wire [2:0]G2;
assign G1[0] = A[0] & (~valid);
assign G1[1] = A[1] & (~valid);
assign G1[2] = A[2] & (~valid);
assign G2[0] = B[0] & (valid);
assign G2[1] = B[1] & (valid);
assign G2[2] = B[2] & (valid);
assign O[3] = valid;
assign O[2] =  (G2[2] | G1[2]);
assign O[1] =  (G2[1] | G1[1]);
assign O[0] =  (G2[0] | G1[0]);

//assign O = {valid,(valid ? B:A)};

endmodule



                                    
