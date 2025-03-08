`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 04:51:50 PM
// Design Name: 
// Module Name: classonclass
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

class second;

 int data = 34;
 local int data1 = 35; //data member is restricted to this class only
    
    task set(input int data1);
        this.data1 = data1;
    endtask
    
    function int get();
        return data1;
    endfunction 
    
    task display();
        $display("Value of Public data: %0d", data);
    endtask

endclass

class third;

    second s1;
    
    function new();
        s1 = new();
    endfunction 

endclass


module classonclass;
    
    third t;
    
    initial begin
       t = new();
       t.s1.display();
       // $display("Data: %0d", t.s1.data);
       
       //changes the data members from first class 
     //  t.s1.data = 45;
      // t.s1.display();
      
      //for protected variables : use task/get methods
      t.s1.set(123);
      $display("Value of Protected data: %0d", t.s1.get());
    end
    
endmodule
