`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 05:35:27 PM
// Design Name: 
// Module Name: copyingObjects
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

class objects;
    int data;
endclass  

module copyingObjects;
    objects o1;
    objects o2;
    
    initial begin
        o1 = new(); /////1. constructor
        o1.data = 24;   //// 2. processing        
        o2 = new o1;//////3. copy data from o1 to o2
        
        $display("Data1: %0d", o1.data);    
        $display("Data2: %0d", o2.data);
        
        o2.data = 12;
        $display("Data1: %0d", o1.data);    
        $display("Data2: %0d", o2.data);
    end
    
endmodule
