`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 22:31:51
// Design Name: 
// Module Name: Priority_Encoder_NV_tb
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


module Priority_Encoder_NV_tb();
reg [7:0]I;
wire [2:0]O;

Priority_Encoder_NV uut(.I(I), .O(O));

initial begin
I = 8'b10101111; #10;
I = 8'b00101111; #10;
I = 8'b01101111; #10;
I = 8'b00011111; #10;
I = 8'b00001111; #10;
I = 8'b00000111; #10;
I = 8'b00000011; #10;
I = 8'b00000001; #10;

$finish;
end


endmodule
