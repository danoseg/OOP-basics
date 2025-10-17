`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 04:57:14 PM
// Design Name: 
// Module Name: implication_operator
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

/*
Implication operator:
 If (x == 1) -> (y == 1)  
 if x -> 1, y = 1
 if x -> 0, y = 0 or y = 1
 */

class implication;
  
  randc bit [3:0] a;
  rand bit ce;
  rand bit rst;
  
  constraint control_rst{
    rst dist {0 := 80, 1 := 20}; 
  }  
  
  constraint control_ce{
    ce dist { 1:= 80, 0:= 20}; 
  }

  constraint control_rst_ce{
    ( rst ==0) -> (ce ==1);
  }  
  
endclass

module implication_operator();

implication g;

initial begin
    g = new();
    
  g.control_rst_ce.constraint_mode(0);// 1 -> Constraint is ON, 0 -> Constraint is OFF
    for (int i = 0; i < 20; i++) begin
        assert(g.randomize()) else $display("Randomization failed");
        $display("Value of rst : %0b and ce : %0b", g.rst, g.ce);
    end
end


endmodule
