`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 10:12:38 PM
// Design Name: 
// Module Name: interface_layer
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

interface add_if;
    logic [3:0] a,b;
    logic [4:0] sum;
    //logic clk;
endinterface 



module interface_layer();

    add_if aif(); // Instantiate interface
    
   // add dut(aif.a, aif.b, aif.sum); // Positional Mapping
    adder dut(.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk)); // Mapping by name
    
    initial begin
        aif.clk = 0;
    end
    
    always #10 aif.clk = ~aif.clk;
    
    initial begin
        //repeat(3) @(posedge aif.clk)
        aif.a <= 1;
        aif.b <= 5;
        repeat(3) @(posedge aif.clk)
        aif.a <= 3;
        #20;        
        aif.a <= 4;
        #8;
        aif.a <= 5;
    end 
    
    initial begin
       #100;
       $finish();
       // $dumpfile("dump.vcd");
       // $dumpvars;
    end
    
endmodule
