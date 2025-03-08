`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 06:53:07 PM
// Design Name: 
// Module Name: shallow_deep_Copy
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

// Deep copy: Used to copy data members and independent handlers for original class
class deep1;
    
    int data = 12;
    
    // Copy Function for deep1 class
    function deep1 copy();
        copy = new();
        copy.data = data; // Copies values of data members
    endfunction 

endclass 


class deep2;
    int ds = 34;
    
    // Create object to use class deep1
    deep1 d1;
    
    // Create constructor for object d1
    function new();
        d1 = new();        
    endfunction 
    
    // Copy function for deep2 class
    function deep2 copy(); 
        copy = new();
        copy.ds = ds; // Copies values of data members of class deep2
        copy.d1 = d1.copy; // Copies the copy of class deep1
    endfunction 
    
endclass 

module deep_copy();

    deep2 obj1, obj2;
    
    initial begin
        // Initialize object
        obj1 = new();
        obj2 = new();  
        
        obj1.ds = 45;
        // Copying original data from class deep2 into object for class deep2
        obj2 = obj1.copy();  
        
        $display("Value of obj1 ds = %0d, Value of obj2 ds = %0d", obj1.ds, obj2.ds);
        
        // Change of ds in obj2 is not reflected in obj1
        obj2.ds = 78;
        $display("Value of obj1 ds = %0d, Value of obj2 ds = %0d", obj1.ds, obj2.ds);
       
        obj2.d1.data =  98;         
        $display("Value of obj1 data (class deep1) = %0d, Value of obj2 data(class deep1) = %0d", obj1.d1.data, obj2.d1.data);
    end


endmodule