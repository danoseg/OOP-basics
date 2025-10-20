`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 12:15:05 AM
// Design Name: 
// Module Name: generator_class
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

// Sending Deep Copy over MBX
// 1. Add transaction constructor in generator custom constructor
// 2. Send deep copy of transaction between generator and driver 

class transaction;
    randc bit [3:0] a,b;
    bit [4:0] sum;
    
    function void display();
        $display("a: %0d \t b: %0d \t sum: %0d",a,b,sum);
    endfunction     
    
    virtual function transaction copy();
        copy = new();
        copy.a = this.a;
        copy.b = this.b;
        copy.sum = this.sum;
    endfunction 
    
endclass

//Injecting Errors

class error extends transaction;
    // Inject error by generating data
   // constraint data_C {a == 0; b == 0;}
   
   // Inject error for specific data
    function transaction copy();
        copy = new();
        copy.a = 0;
        copy.b = 0;
        copy.sum = this.sum;
    endfunction 

endclass

class generator;
    transaction trans;
    mailbox #(transaction) mbx;
    event done;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
        trans = new(); //make new transaction during mailbox generation
        endfunction
    
    task run();
        for(int i = 0; i < 10; i++)begin            
            assert(trans.randomize()) else $display("Randomization failed");
            $display("[GEN] : Data sent to DRV: ");
            mbx.put(trans.copy);
            trans.display();
            #20;
        end
        -> done;
    endtask 
    
endclass 

interface add_if;
    logic [3:0] a,b;
    logic [4:0] sum;
    logic clk;
endinterface

class driver;
    virtual add_if aif;
    mailbox #(transaction) mbx;
    transaction data;
    event next;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction
    
    task run();
        forever begin
            mbx.get(data);
            @(posedge aif.clk);
            aif.a <= data.a;
            aif.b <= data.b;
            $display("DRV] Interface Trigger");
            data.display();
        end
    endtask
    
endclass 

module generator_class();
    
    add_if aif();
    driver drv;
    generator gen;
    mailbox #(transaction) mbx;
    event done;
    // Error class
    error err;
    
    adder dut(.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk));
     
    initial aif.clk <= 0;
    always #10 aif.clk = ~aif.clk;
    
    initial begin
        mbx = new();
        err = new();
        drv = new(mbx);
        gen = new(mbx);
        // Using error class as the generator transaction class
        gen.trans = err;
        
        drv.aif = aif;
        done = gen.done;
    end
    
    initial begin
        fork
            gen.run();
            drv.run();
        join_none 
        wait(done.triggered);
        $finish();    
    end

endmodule
