`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 02:41:11
// Design Name: 
// Module Name: Priority_Encoder_final_tb
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


module Priority_Encoder_final_tb( );
reg [15:0]I;
wire [3:0]O;

Priority_Encoder_Final uut (.I(I), .O(O));

initial begin
I = 16'b1000101111111000; #10;
I = 16'b0000101111111000; #10;
I = 16'b0010101111111000; #10;
I = 16'b0000000011111000; #10;
I = 16'b0000000001010000; #10;
$finish;

end
endmodule
