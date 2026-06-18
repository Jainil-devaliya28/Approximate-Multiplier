`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 21:24:24
// Design Name: 
// Module Name: Shifter_result_production
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


module Shifter_result_production(
input [4:0]S,
input [4:0]K,
output [31:0]O_final
    );
assign O_final = {S,27'b111111111111111111111111111}>>(30-K);
endmodule