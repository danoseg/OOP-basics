`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 12:06:04 AM
// Design Name: 
// Module Name: inheritance
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

// Inheritance: Provides access to all data members and properties present in the generator class.
//              May add more data and certain properties into new class
//              Computes intermediate data.
//              Helps to inject errors and to calculate temporary values for certain fields to determine if signal is going to DUT correctly


class gen; // Parent Class
    int data = 12;
    
    function void display();
        $display("Value of data: %0d", data);
    endfunction 

endclass

// Extended class: Utilize and extend capabilities of gen class:
// Provides access to all data members and all methods
// May modify data members
class gen2 extends gen;  // Child Class
    int temp = 34;
    
    function void add();
        $display("Value after processing: %0d", temp+4);
    endfunction

endclass
             
module inheritance();
    
    gen2 g;
    
    initial begin
        g = new();
        $display("Value of data: %0d", g.data);
        g.display();
        $display("Value of data: %0d", g.temp);
        g.add();
    end

endmodule
