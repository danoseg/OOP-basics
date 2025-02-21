`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 03:49:55 PM
// Design Name: 
// Module Name: dynamicArrays
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


module dynamicArrays();
    //dynamice array: size of array is not specified
    int arr[];
    
    //fixed array
    int fix_arr[30];
    
    initial begin
        //new[] is used to specify new size of array 
        arr = new[5];
        for(int i = 0; i<5; i++) begin
            arr[i] = 5*i;
        end 
        $display("Array: %0p", arr);
        
        //used to delete arrays
       // arr.delete();
       
       //will delete previous data
     //  arr = new[30];
       
       //will copy elements of previous array
       arr = new[30](arr);
       
        $display("Array: %0p", arr);
         for(int i = 0; i<30; i++) begin
            arr[i] = 5*i;
        end 
        $display("Array: %0p", arr);
        
        fix_arr = arr;
        $display("Fixed Size Array: %0p", fix_arr);
    end

endmodule
