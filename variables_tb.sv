`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 08:59:45 PM
// Design Name: 
// Module Name: variables_tb
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


module variables_tb();

    //syntheziable
    logic net; // will create a reg or wire type
    
    
    //variables
    bit a = 0;  //1-bit variab  le
    
    //signed variables  -2^n-1 to 2^n-1
    byte b = 0; //8-bit signed variable
    shortint c = 0; //16-bit signed variable
    int d = 0; //32-bit signed
    longint e = 0; //64-bit
    
    //unsigned variables  0 to 2^n
    bit [7:0] f = 8'h00000000; //8-bits
    bit [16:0] g = 16'h0; //16-bits
    bit [31:0] h = 32'h00; // 32 bits
    
    //floating point values
    real i = 0.586; 
    
    //simulation variables
    time fix_time = 0; //fixed point
    realtime real_time = 0; //floating point
    
    //$time(); returns current simulation time in fixed point
    //$realtime(); returns current simulation time in floating point
    
    byte my_var = -128; //signed
    bit [7:0] my_var2 = 130; //unsigned
    
    initial begin
    #10.53;
    fix_time = $time();
    real_time = $realtime();
    $display("My variable is: %0d and floating is: %0.3f", my_var2,i);
    $display("Current simulation time is: %0t", fix_time);
    $display("Real simulation time is: %0t", real_time); 
    end
    
endmodule
