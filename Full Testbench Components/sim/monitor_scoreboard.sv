`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 12:22:09 PM
// Design Name: 
// Module Name: monitor_scoreboard
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
    randc bit [3:0] a,b;
    bit [4:0] sum;
    
    function void display();
        $display("a: %0d \t b: %0d \t sum: %0d",a,b,sum);
    endfunction     
    
endclass

interface add_if;
    logic [3:0] a,b;
    logic [4:0] sum;
    logic clk;
endinterface

class monitor;
    mailbox #(transaction) mbx;
    transaction trans;
    virtual add_if aif;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction 
    
    task run();
        trans = new();
        forever begin 
            @(posedge aif.clk);
            trans.a = aif.a;
            trans.b = aif.b;
            trans.sum = aif.sum;
            $display("----------------------------------------");
            $display("[MON] : Data sent to SCOREBOARD");
            trans.display();
            mbx.put(trans);
        end        
    endtask;    
endclass

class scoreboard;
    mailbox #(transaction) mbx;
    transaction trans;

    function new(mailbox #(transaction) mbx);
            this.mbx = mbx;
        endfunction 
        
     task compare(input transaction trans);
        if((trans.sum) == (trans.a + trans.b))
            $display("[SCO] : SUM RESULT MATCHED");
        else
            $error("[SCO] : SUM RESULT MISMATCHED"); // $warning , $fatal - will stop simulation        
        endtask
       
     task run(); 
        forever begin
            mbx.get(trans);
            $display("[SCO] : Data RCVD from MON.");
            trans.display();
            compare(trans);
            $display("----------------------------------------");
           #10;
        end
     endtask         
endclass 

module monitor_scoreboard( );
    add_if aif();
    monitor mon;
    scoreboard sco;
    mailbox #(transaction) mbx;
    
    adder dut(.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk));
     
    initial aif.clk <= 0;
    always #5 aif.clk = ~aif.clk;
    
    initial begin
        for(int i=0; i < 20; i++) begin
            repeat(2)@(posedge aif.clk);
            aif.a = $urandom_range(0,15);
            aif.b = $urandom_range(0,15);
        end
    end
    
    initial begin
        mbx = new();
        mon = new(mbx);
        sco = new(mbx);
        mon.aif = aif;
    end
    
    initial begin
        fork
        mon.run();
        sco.run();
        join 
    end
    
    initial begin
        #450;
        $finish();
    end
  
endmodule
