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
Equivalence operator:  <->
 (x -> y) && (y -> x)  
 if x = 0, y = 0
 if x = 1, y = 1
*/

class equivalence;
  
  randc bit [3:0] a;
  rand bit wr;
  rand bit oe;
  
  constraint control_wr{
    wr dist {0 := 50, 1 := 50}; 
  }  
  
  constraint control_oe{
    oe dist { 1:= 50, 0:= 50}; 
  }

  constraint control_wr__oe{
    ( wr == 1) <-> (oe ==0);
  }  
  
endclass

module equivalence_operator();

equivalence g;

initial begin
    g = new();
    
    for (int i = 0; i < 10; i++) begin
        assert(g.randomize()) else $display("Randomization failed");
        $display("Value of wr : %0b and oe : %0b", g.wr, g.oe);
    end
end


endmodule
