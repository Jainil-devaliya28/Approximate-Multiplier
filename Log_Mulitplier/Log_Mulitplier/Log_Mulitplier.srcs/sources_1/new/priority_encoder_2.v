`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 20:01:12
// Design Name: 
// Module Name: priority_encoder_2
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


module priority_encoder_valid(
input [7:0]I,
output reg [2:0]O,
output reg valid
);
always@(I)
begin
casex(I)
    8'b00000001: begin O = 3'b000; valid = 1; end
    8'b0000001x: begin O = 3'b001;valid = 1; end
    8'b000001xx: begin O = 3'b010;valid = 1; end
    8'b00001xxx: begin O = 3'b011;valid = 1; end
    8'b0001xxxx: begin O = 3'b100;valid = 1; end
    8'b001xxxxx: begin O = 3'b101;valid = 1; end
    8'b01xxxxxx: begin O = 3'b110;valid = 1; end
    8'b1xxxxxxx: begin O = 3'b111;valid = 1; end
    default: valid = 0;
endcase
end
endmodule
