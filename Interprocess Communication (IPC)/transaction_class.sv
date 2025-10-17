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

class transaction;
    bit clk;
    bit rst;
    
    rand bit wreq, rreq; // Active High
    rand bit [7:0] wdata;
    bit [7:0] rdata;
    bit empty;
    bit full;
    
    constraint ctrl_wr{
        wreq dist {0 := 30, 1 := 70};
    }
    
    constraint ctrl_rd{
        rreq dist {0 := 30, 1 := 70};
    }
    
    constraint wr_rd{
        wreq != rreq;
    }
endclass

module transaction_class(

    );
endmodule
