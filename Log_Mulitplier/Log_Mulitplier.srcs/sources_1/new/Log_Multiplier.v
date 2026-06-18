`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 19:41:27
// Design Name: 
// Module Name: Log_Multiplier
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
module Log_Multiplier(
input [15:0]A,
input [15:0]B,
output [31:0]O_product,
output [31:0]O_new,
output [31:0]O_exact
);
wire [2:0]A1_PE_Output;
wire [2:0]A1_PEValid_Output;
wire A1_PEValid_Valid;
wire [2:0]B1_PE_Output;
wire [2:0]B1_PEValid_Output;
wire B1_PEValid_Valid;
wire [3:0]A_mux_output;
wire [3:0]B_mux_output;
wire [31:0]A_shifter_output;
wire [31:0]B_shifter_output;
wire [31:0]adder_output;
wire [4:0]K_add;
wire [4:0]significant_bits;
wire [4:0]significant_bits2;

priority_encoder_1 a(.I(A[7:0]), .O(A1_PE_Output));
priority_encoder_valid a_v(.I(A[15:8]), .O(A1_PEValid_Output),.valid(A1_PEValid_Valid));
Mux_for_priority_encoder a_m(.A(A1_PE_Output),.B(A1_PEValid_Output),.valid(A1_PEValid_Valid),.O(A_mux_output));

priority_encoder_1 b(.I(B[7:0]), .O(B1_PE_Output));
priority_encoder_valid b_v(.I(B[15:8]), .O(B1_PEValid_Output),.valid(B1_PEValid_Valid));
Mux_for_priority_encoder b_m(.A(B1_PE_Output),.B(B1_PEValid_Output),.valid(B1_PEValid_Valid),.O(B_mux_output));

Shifter a_s(.I(A),.k(B_mux_output),.O(A_shifter_output));
Shifter b_s(.I(B),.k(A_mux_output),.O(B_shifter_output));

Adder o(.A_shifted(A_shifter_output),.B_shifted(B_shifter_output),.Ka(A_mux_output),.Kb(B_mux_output),.S(adder_output),.K(K_add));

Mux_result_production m(.K(K_add), .S(adder_output),.O(significant_bits) );
mux_result_production_new m2(.K(K_add), .S(adder_output),.O(significant_bits2) );

Shifter_result_production s(.S(significant_bits),.K(K_add),.O_final(O_product));
Shift_result_production_new s1(.S(significant_bits2),.K(K_add),.O_final(O_new));
assign O_exact = A * B;

endmodule