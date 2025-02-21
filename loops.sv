`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 02:22:48 PM
// Design Name: 
// Module Name: loops
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


module loops();

    int arr[10];
    int arr1[10];
    int arr2[10];
    int i = 0;
    int h = 0;
    
    //for loop
    initial begin
        for(i=0; i<10; i++) begin
            arr[i] = i;
        end 
        $display("Array: %0p", arr);        
        end
        
    //foreach loop
    initial begin 
    foreach(arr1[j]) begin //initial value of j is 0
        arr1[j] = j;
        $display("Array value j: %0d", arr1[j]); 
        
    end
    $display("Arr1 is: %0p", arr1);
    end
    
    //repeat
    initial begin
        repeat(10) begin
            arr2[h] = h;
            h++;            
        end 
        $display("Array2: %0p", arr2);
    end
    
endmodule
