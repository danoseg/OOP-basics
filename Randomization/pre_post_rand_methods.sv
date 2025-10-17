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

//pre-randomize
//post-randomize

class generator;

    randc bit[3:0] a,b;    //rand or randc
    bit [3:0] y;
    int min;
    int max;
    
    function void pre_randomize(input int min, input int max);
        this.min = min;
        this.max = max;
    endfunction 
    
    constraint data {
                     a inside {[min:max]};
                     b inside {[min:max]};
                    }
                    
    function void post_randomize();
        $display("Value of a: %0d and b: %0d",a,b);
    endfunction 
                                      
endclass

module pre_post_rand_methods;
  generator g;
    int i = 0;
  	      
    initial begin      
       g = new();    
       
       //Space 1
       $display("Space 1");
       g.pre_randomize(3,8);
        for (i = 0; i < 6; i++) begin
          //g.pre_randomize(3,8);     
          g.randomize();
          #10; 
        end      
       //Space 2
       $display("Space 2");
       g.pre_randomize(3,8);
       for (i = 0; i < 6; i++) begin
          //g.pre_randomize(3,8);     
          g.randomize();
          #10; 
        end            
    end
   
endmodule

