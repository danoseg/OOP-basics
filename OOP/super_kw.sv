`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 12:38:14 AM
// Design Name: 
// Module Name: super_kw
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

// Parent Class
class parent;
    int data;
    
    function new(input int data);
        this.data = data;
    endfunction 
    
endclass

// Child Class
class child extends parent;
    int temp;
    
    function new(int data, int temp);
        // refers to the parent class method
       super.new(data);
        this.temp = temp;
    endfunction
    
endclass

module super_kw;
    child s;
    
    initial begin 
    // 67 is Data Member of Parent Class, 45 is Data Member of child class
        s = new(67,45);
        $display("Value of Data: %0d, Temp: %0d", s.data, s.temp);
    end

endmodule
