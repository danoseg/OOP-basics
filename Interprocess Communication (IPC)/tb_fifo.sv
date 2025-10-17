`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 12:03:06 AM
// Design Name: 
// Module Name: tb_fifo
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


module tb_fifo();
    
    int data1, data2;
    event done;
    
    int i = 0;
    // Generator
    initial begin
        for(i = 0; i < 10; i++)begin
         data1 = $urandom();
         $display("Data Sent : %0d", data1);
         #10;
        end    
        -> done;
     end
     
     // Driver
     initial begin
        forever begin
        data2 = data1;
        $display("Data Received : %0d", data2);
        #10;
        end     
     end
     
     ////////
     initial begin
        wait(done.triggered);
        $finish();     
     end
     
endmodule
