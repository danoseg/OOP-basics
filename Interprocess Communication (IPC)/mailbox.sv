`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 12:54:15 PM
// Design Name: 
// Module Name: mailbox
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

// .get receives data from another class
// ,.put sends data to another class

class generator;
    
    int data = 12;
    mailbox mbx; // gen2drv
    
    function new(mailbox mbx);
        this.mbx = mbx;
    endfunction 
    
    task run();
        mbx.put(data);
        $display("[GEN] : SENT DATA : %0d", data);
    endtask

endclass

class driver;
    
    int datac = 0;
    mailbox mbx;
    
    function new(mailbox mbx);
        this.mbx = mbx;
    endfunction 
    
    task run();
        mbx.get(datac);
        $display("[DRV] : RECVD DATA : %0d", datac);
    endtask 

endclass


module mailbox();
    generator gen;
    driver drv;
    mailbox mbx;
    
    initial begin
       /* gen = new();
        drv = new();*/
        mbx = new();
        gen = new(mbx);
        drv = new(mbx);
        
        
        /*gen.mbx = mbx;
        drv.mbx = mbx;*/
        
        gen.run();
        drv.run();
        
    end   

endmodule
