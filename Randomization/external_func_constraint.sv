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
    
    extern constraint data;
    extern function void display();
                                  
endclass

constraint generator::data {
        a inside {[0:3]};
        b inside {[12:15]};
};

function void generator::display();
    $display("Value of a : %0d and b: %0d", a,b);
endfunction 

module external_func_constraint;
  generator g;
    int i = 0;
  	      
    initial begin      
       g = new();      
      
        for (i = 0; i < 10; i++) begin     
          assert(g.randomize()) else $display("Randomization failed");                          
          g.display();
          #10; 
        end               
    end
   
endmodule

