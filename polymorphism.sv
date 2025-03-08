`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 12:19:36 AM
// Design Name: 
// Module Name: polymorphism
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

class poly;
    int data = 12;
    
    virtual function void display(); // Virtual allows child class to replace this method
        $display("first: Value of data : %0d", data);
    endfunction 
    
endclass

class poly2 extends poly;
    
    int temp = 15;
    
    function void display();
        $display("second: Value of data : %0d", data);
    endfunction 

endclass

module polymorphism;
    
    poly p1, p2; // Handlers    
    poly2 p3;
    
    initial begin
        p1 = new();
        p2 = new();
        
        // Object for poly2 child class
        p3 = new();
        
        p1.data = 34;
        
        // Copies value of data from p1 to p2
        p2 = p1;
        p2.display();
        
        // If two methods are the same, the parent child takes over if "virtual" is not used
        p1 = p3;
        p1.display();
        p3.display();
    end 

endmodule
