`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 22:55:16
// Design Name: 
// Module Name: Log_multiplier_tb
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


module Log_multiplier_tb();
reg [15:0]A;
reg [15:0]B;
wire [31:0]O_product;
wire [31:0]O_new;
wire [31:0]O_exact;

Log_Multiplier uut(
.A(A),
.B(B),
.O_product(O_product),
.O_new(O_new),
.O_exact(O_exact)
);

initial begin
A = 16'b1111111111111111; B = 16'b1111111111111111 ;
#100 A = 16'b0000000000000000;B = 16'b0000000000000000;
#100 A= 16'b0001000101010001;B= 16'b0100001001011111;//example given in paper
#100 A= 16'b00011111;B= 16'b0101001011010111;//example given in paper
#100 A = 16'b1010101010100000;B=16'b1010100000110101;
#100 A = 16'b1111111101010101;B=16'b0000011111010010;
end

endmodule
