`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 14:50:11
// Design Name: 
// Module Name: mux_tb
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


module mux_tb( );
    reg valid;
    reg [2:0] A;
    reg [2:0] B;
    wire [3:0] O;

mux uut(.A(A), .B(B), .valid(valid), .O(O));

initial begin
A = 3'b011; B = 3'b100; valid = 0; #10;
A = 3'b001; B = 3'b100; valid = 0; #10;
A = 3'b011; B = 3'b100; valid = 1; #10; 
A = 3'b001; B = 3'b100; valid = 1; #10;
$finish;

end 


endmodule
