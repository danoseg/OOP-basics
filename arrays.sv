`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 11:36:09 PM
// Design Name: 
// Module Name: arrays
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


module arrays();
    
    bit arr[4];  // Uninitialized array (all 0 by default)
    bit arr1[] = '{1, 0, 1, 1}; // Dynamic array (size 4)

    // Unique values
    bit arr2[] = '{1, 0, 1, 0}; // Fixed to valid bit values (bit is 1-bit wide)

    // Repetitive values (6 elements of 1)
    bit arr3[] = '{6{1}}; // Expands to '{1, 1, 1, 1, 1, 1}

    // Default values
    bit arr4[4] = '{default: 0}; // Initializes all elements to 0

    // Uninitialized array (will contain unknown 'x' in some simulators)
    bit arr5[4];

    // Display all array contents
    initial begin
        $display("Size of arr: %0d, Contents: %0p", $size(arr), arr);
        $display("Size of arr1: %0d, Contents: %0p", $size(arr1), arr1);
        $display("Size of arr2: %0d, Contents: %0p", $size(arr2), arr2);
        $display("Size of arr3: %0d, Contents: %0p", $size(arr3), arr3);
        $display("Size of arr4: %0d, Contents: %0p", $size(arr4), arr4);
        $display("Size of arr5: %0d, Contents: %0p", $size(arr5), arr5);
    end

endmodule
