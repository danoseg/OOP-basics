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

// Shallow copy: Used to copy data members

class shallow1;
    
    int data = 12;
    
endclass 


class shallow2;
    int ds = 34;
    
   // Create object referring to class shallow1 
    shallow1 s1;
    
    // Create constructor for object s1
    function new();
        s1 = new();        
    endfunction 
   
endclass 

module shallow_copy();

    // Create two objects referring to class shallow2
    shallow2 obj1, obj2;
    
    initial begin
        // Initialize first object
        obj1 = new();
        // Modify data member ds in obj1
        obj1.ds = 45;
        // Copy data members of object 1 onto obj2
        obj2 = new obj1;        
        
        $display("Value of object1 ds = %0d, Value of object2 ds = %0d", obj1.ds, obj2.ds);
        
        // Change data members if obj2
        obj2.ds = 78;
        $display("Value of object1 ds = %0d, Value of object2 ds = %0d", obj1.ds, obj2.ds);
       
       //Change data member in obj1 via obj2
        obj2.s1.data =  56; 
        $display("Value of data = %0d", obj2.s1.ds);
    end


endmodule
