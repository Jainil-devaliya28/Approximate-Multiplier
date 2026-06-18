`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2025 12:48:37
// Design Name: 
// Module Name: Mux_for_priority_encoder
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


module Mux_for_priority_encoder(
input valid,
input [2:0]A,
input [2:0]B,
output [3:0]O
    );
assign O = {valid,(valid ? B:A)};
endmodule
