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
if_else operator:  */

class if_else;
  
  randc bit [3:0] raddr, waddr;
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
  
  constraint write {
    if(wr == 1)
    {
        waddr inside {[11:15]};
        raddr == 0;
    }
    else
    {
        waddr == 0;
        raddr inside {[11:15]};
    }
  }
  
endclass

module if_else_operator();

if_else g;

initial begin
    g = new();
    
    for (int i = 0; i < 10; i++) begin
        assert(g.randomize()) else $display("Randomization failed");
        $display("Value of wr : %0b | oe : %0b |  raddr : %0d | waddr : %0d |", g.wr, g.oe,g.raddr, g.waddr);
    end
end


endmodule
