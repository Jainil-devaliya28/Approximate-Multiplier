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
input [4:0]K,
input [31:0]S,
output reg [4:0]O
    );
always @(S or K)
begin
if (S[K]==0)
begin
O = {S[K],~S[K],S[K-1],S[K-2],S[K-3]};
end
else if (S[K]==1)
begin
O = {S[K],S[K-1],S[K-2],S[K-3],S[K-4]};
end
end
endmodule