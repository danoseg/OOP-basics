`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 12:53:06 PM
// Design Name: 
// Module Name: classes
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


class first;
//data members
    bit [2:0] data;
    bit [1:0] data2;

endclass 


module initialize_class;
    //initialize class 
    first f;
    
    //calling data members from class
    //f.data;
    //f.data2;

    //creating an object
    initial begin
       f = new(); //Constructor : allocating memory
       f.data = 3'b010;
       f.data2 = 2'b10;
       f = null; //de-allocating memory
       #1;
       $display("Data1: %0d and Data2: %0d", f.data, f.data2);
    end

endmodule 