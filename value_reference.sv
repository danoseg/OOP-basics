`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 07:46:20 PM
// Design Name: 
// Module Name: value_reference
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

//pass by value: variable from main is changed during execution of task, however variables return to original after task is done executing

//pass by reference: 
    //ref int u[] -> array is permanently updated in main after processing task/function
    //const ref int v[] -> not able to modify original array in task/function: array holds initial value in main after processing in task/function

//pass by value
module value_reference();
  //  task swap(input bit [1:0] a,b); //pass by value
    task automatic swap(ref bit [1:0] a, b); //pass by reference: add "automatic" , for function: function automatic swap(bit [1:0] a,b)
        bit [1:0] temp;
        
        temp = a;
        a = b;
        b = temp;
        
        $display("Value of A: %0d, Value of B: %0d", a, b);        
    endtask 
    
    bit [1:0] a,b;
    
    initial begin
        a = 1;
        b = 2;
        swap(a,b);
        $display("Value of A: %0d, Value of B: %0d", a, b);  
    end 

endmodule
