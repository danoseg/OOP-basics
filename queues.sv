`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 04:16:30 PM
// Design Name: 
// Module Name: queues
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


module queues();
    
    //$ is used to add a queue
    int arr[$];
    int j = 0;
    
    initial begin
        //apostrophe ' not required when using queue
        arr = {1,2,3,4,5};
        $display("Array: %0p", arr); 
          
        //add new data to first indeex of queue (index 0)
        arr.push_front(7);
        $display("Array: %0p", arr);    
        
        //add new data to last indeex of queue
        arr.push_back(9); 
        $display("Array: %0p", arr); 
        
        //adds value in desired index, pushes other values to the right
        arr.insert(2,10);
        $display("Array: %0p", arr); 
    
        //removes element on first index of queue
        j = arr.pop_front();
        $display("Array: %0p, Value of j: %0d", arr, j); 
        
        //removes element on last index of queue
        j = arr.pop_back();
        $display("Array: %0p, Value of j: %0d", arr, j); 
        
        //delete specific element from queue
        arr.delete(1);
        $display("Array: %0p", arr, j);
    
    end
    
endmodule
