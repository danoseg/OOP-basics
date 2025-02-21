`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 03:37:21 PM
// Design Name: 
// Module Name: arrayOps
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


module arrayOps();
    int arr[5];
    int arr1[5];
    int arr2[5] = '{1,2,3,4,5};
    
    int status;
    //int i = 0;
    
    //copying arrays
    initial begin
    for(int i = 0; i<5; i++) begin
        arr[i] = 5*i; //0,5,10,15,20
    end
    arr1 = arr;
    $display("Arr1: %0p", arr1);    
    end 
    
    //compare arrays
    initial begin
        //compare if arrays are equal: 0 = not equal , 1 = equal
        status = (arr1 == arr2);
        $display("Status: %0d", status);
        #10;
        //compare if arrays are not equal: 1 = not equal, 0 = equal
        status = (arr1 != arr2);
        $display("Status: %0d", status);
    end
    

endmodule
