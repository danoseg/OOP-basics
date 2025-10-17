`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 11:27:25 AM
// Design Name: 
// Module Name: tb_random_values
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

// Transaction Class goes here

// Generator class

//rand : can repeat random values
//randc : doesn't repeat random values until all possible values are covered

class generator;

    randc bit[3:0] a,b;    //rand or randc
    bit [3:0] y;
endclass

module tb_random_values;
    generator g;
    int i = 0;
    
    initial begin      
        
        for (i = 0; i < 10; i++) begin
        g = new(); //The object is inside the for loop so that a new object is created for every stimuli to avoid timiming conflicts
        
         /*  //Checking if randomization is succesful using if-else
           if(!g.randomize()) begin
            $display("Randomization Failed at %0t", $time);
            //$finish();
           end*/
           
           //CHecking if randomization is succesful using assert
           assert(g.randomize()) 
           else begin
           $display("Randomization Failed at %0t", $time);
           //$finish();
           end                
                         
           $display("Value of a: %0d and b: %0d.", g.a, g.b);
           #2; 
        end               
    end
   
endmodule
