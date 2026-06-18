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
input [31:0]A_shifted, // shifted values of A by Ka 
input [31:0]B_shifted, // shifted values of B by Kb
input [3:0]Ka, // Ka is 4 bit representing the leading 1 bit of A
input [3:0]Kb, // Kb is 4 bit representing the leading 1 bit of B
output [31:0]S,
output [4:0]K
    );
assign K = Ka + Kb; 
assign S = A_shifted+B_shifted;
endmodule
