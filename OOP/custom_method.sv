`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 06:59:08 PM
// Design Name: 
// Module Name: custom_method
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

class copy_method;
    int data = 34;
    bit[7:0] temp = 8'h11;
    
    // Custom copy method
    function copy_method copy(); // copy() is the object constructor
        copy = new();
        copy.data = data;
        copy.temp = temp;
    endfunction
    
endclass 

module copy_method_tb();
    copy_method cm1;
    copy_method cm2;
/*
initial begin
    cm1 = new();
    cm1.data = 45;
     
    cm2 = new cm1;
    
    cm2.data = 56;
    $display("Data Val: %0d, %0d", cm1.data, cm2.data);
 end
    */
    
    initial begin
        cm1 = new();
        cm2 = new();
        
        cm2 = cm1.copy;
        
        $display("Data Val: %0d, Temp Val: %0x", cm1.data, cm2.data);
    end    

endmodule
