`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 20:56:40
// Design Name: 
// Module Name: Mux_result_production
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

module Mux_result_production(
    input [4:0] K,
    input [31:0] S,
    output [4:0] O
);

    wire sel;
    assign sel = S[K];  // 1-bit selector: 0 or 1

    wire not_sel = ~sel;

    assign O[4] = S[K]; // always S[K] in both cases

    assign O[3] = (not_sel & ~S[K])    | (sel & S[K-1]);
    assign O[2] = (not_sel & S[K-1])   | (sel & S[K-2]);
    assign O[1] = (not_sel & S[K-2])   | (sel & S[K-3]);
    assign O[0] = (not_sel & S[K-3])   | (sel & S[K-4]);

endmodule
