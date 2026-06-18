`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 16:37:38
// Design Name: 
// Module Name: shifter_tb
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


module shifter_tb();

    // Inputs
    reg [15:0] I;
    reg [3:0] k;

    // Output
    wire [31:0] O;

    // Instantiate the Unit Under Test (UUT)
    Shifter uut (
        .I(I),
        .k(k),
        .O(O)
    );

    // Task for applying test case
    task apply_shift;
        input [15:0] i_val;
        input [3:0] k_val;
        begin
            I = i_val;
            k = k_val;
            #10;
            $display("I = %h, k = %d -> O = %h", I, k, O);
        end
    endtask

    initial begin
        $display("Starting testbench for Shifter_gate...");
        
        // Test Case 1: No shift
        apply_shift(16'h0001, 4'd0);  // Expected: O = 00000001

        // Test Case 2: Shift by 1
        apply_shift(16'h0001, 4'd1);  // Expected: O = 00000002

        // Test Case 3: Shift by 4
        apply_shift(16'h000F, 4'd4);  // Expected: O = 00000F0

        // Test Case 4: Shift by 8
        apply_shift(16'h00FF, 4'd8);  // Expected: O = 00FF00

        // Test Case 5: Shift by 15
        apply_shift(16'h0001, 4'd15);  // Expected: O = 0x8000

        // Test Case 6: Random values
        apply_shift(16'hA5A5, 4'd3);  // Shift A5A5 by 3

        // Test Case 7: All ones
        apply_shift(16'hFFFF, 4'd5);  // Shift all 1s by 5

        $display("Testbench completed.");
        $stop;
    end

endmodule

