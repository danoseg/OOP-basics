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
    
    //Randomization constraints
    //constraint data { a > 16;}
    //constraint data_a {a > 3; a < 7;}
    //constraint data_b{b == 3;}
    //constraint data{a > 3; a < 7; b > 0;}
    /*constraint data {
                        a inside {[0:8], [10:11], 15}; // 0-8, 10-11, 15
                        b inside {[3:11]}; // 3-11
                      }         */
     //Skip a = 3:7, b = 5:9
     constraint data{
                     !(a inside {[3:7]});
                     !(b inside {[5:9]});
                    }    
                              
endclass

module constraints;

  generator g;
    int i = 0;
  	      
    initial begin      
       g = new();      
      
        for (i = 0; i < 10; i++) begin     
          g.randomize();                         
          $display("Value of a: %0d and b: %0d.", g.a, g.b);
          #10; 
        end               
    end
   
endmodule

