`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2025 01:30:26 PM
// Design Name: 
// Module Name: weighted_distributions
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


// := assigns same weight to all values io range
// :/ divides weight distribution equally between values in range

class ctrl;
rand bit wr; //:=
rand bit rd; //:/

rand bit[1:0] var1;
rand bit[1:0] var2;

constraint data {
  var1 dist {0 :=30 , [1:3] := 90};
  var2 dist {0 :/ 30, [1:3] :/ 90};
}

constraint cntrl {
    wr dist {0 := 30, 1 := 70};
    rd dist {0 :/ 30, 1 :/ 70};
}

endclass 

module weighted_distributions();
    ctrl f;
    
    initial begin
    f = new();
    
      for(int i = 0; i < 15; i++)begin
    f.randomize;
    $display("Value of var1: %0d and var2: %0d", f.var1, f.var2);
    //$display("Value of wr: %0b and rd: %0b", f.wr, f.rd);
    end
    
    end

endmodule
