`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 15:49:48
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();

    // Inputs
    reg [31:0] A_shifted;
    reg [31:0] B_shifted;
    reg [3:0] Ka;
    reg [3:0] Kb;

    // Outputs
    wire [31:0] S;
    wire [4:0] K;

    // Instantiate the Unit Under Test (UUT)
    adder uut (
        .A_shifted(A_shifted),
        .B_shifted(B_shifted),
        .Ka(Ka),
        .Kb(Kb),
        .S(S),
        .K(K)
    );

    // Task to apply a test vector
    task apply_test;
        input [31:0] a_val, b_val;
        input [3:0] ka_val, kb_val;
        begin
            A_shifted = a_val;
            B_shifted = b_val;
            Ka = ka_val;
            Kb = kb_val;
            #10;
            $display("A = %h, B = %h, Ka = %d, Kb = %d -> S = %h, K = %d", A_shifted, B_shifted, Ka, Kb, S, K);
        end
    endtask

    initial begin
        $display("Starting testbench for Adder_gate...\n");

        // Test Case 1
        apply_test(32'h00000001, 32'h00000002, 4'd1, 4'd2); // S = 3, K = 3

        // Test Case 2
        apply_test(32'hFFFFFFFF, 32'h00000001, 4'd15, 4'd0); // S = 0, K = 15

        // Test Case 3
        apply_test(32'h0000F0F0, 32'h00000F0F, 4'd4, 4'd4); // S = FFFF, K = 8

        // Test Case 4
        apply_test(32'h12345678, 32'h87654321, 4'd3, 4'd3); // Random large numbers

        // Test Case 5
        apply_test(32'h0000AAAA, 32'h00005555, 4'd6, 4'd9); // S = FFFF, K = 15

        $display("\nTestbench completed.");
        $stop;
    end

endmodule
