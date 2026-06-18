`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 18:01:34
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(

    );
reg [15:0]A;
reg [15:0]B;
wire [31:0]O;
multiplier uut(.A(A),.B(B),.O(O));
initial begin 
#10 A = 16'b0000000000000011;B=16'b0000000000111111;
end
endmodule
