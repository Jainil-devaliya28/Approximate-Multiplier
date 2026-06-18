`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 18:39:00
// Design Name: 
// Module Name: Shift_result_production_new
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


module Shift_result_production_new(
input [4:0]S,
input [4:0]K,
output [31:0]O_final
    );
//assign O_final = {S,27'b101010101010101010101010101}>>(30-K);
assign O_final = {S,27'b111111111100000000000000000}>>(30-K);
endmodule