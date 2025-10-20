`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2025 05:40:22 PM
// Design Name: 
// Module Name: tb_multiplier
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


// Transactions class
class transaction;
    randc logic [3:0] a,b;
    logic [7:0] product;
    
    function void display;
        $display("Data: a: %0d \t b: %0d \t product: %0d",a,b,product);
    endfunction 
    
    function transaction copy;
        copy = new();
        copy.a = a;
        copy.b = b;
        copy.product = product;
    endfunction 
endclass

// Generator Class
/*class generator;
    transaction trans;
    mailbox #(transaction) mbx;
    event done;
    event next_data;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
        trans = new();
    endfunction
    
    task run();
        for(int i = 0; i < 15; i++) begin
        assert(trans.randomize()) 
        else $display("Randomize Failed.");
        $display("[GEN] : Data sent to DRV: ");
        mbx.put(trans.copy);        
        trans.display();
        @next_data;
        end
       -> done; 
    endtask 
endclass*/

// Interface Ports
interface mult_if;
    logic [3:0] a,b;
    logic clk;
    logic [7:0] product;
endinterface 

class monitor;
    mailbox #(transaction) mbx;
    transaction trans;
    virtual mult_if mif;
    
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction 
    
    task run();
        trans = new();
        forever begin
            repeat (2)@(posedge mif.clk);
            trans.a = mif.a;
            trans.b = mif.b;
            trans.product = mif.product;
            $display("-------------------------");
            $display("[MON] : DATA SENT TO SCOREBOARD");
            trans.display();
            mbx.put(trans);
        end
    endtask
endclass

class scoreboard;
     mailbox #(transaction) mbx;
    transaction trans;
    
    function new (mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction 
    
    task compare(input transaction trans);
    if((trans.product) == (trans.a * trans.b)) 
      $display("[SCO] : Multiplication Result Matched");
    else
      $error("[SCO] : Result Mismatched");
  endtask
  
  task run();
    forever begin
        mbx.get(trans);
        $display("[SCO] RCVD FROM MONITOR");
        trans.display();
        compare(trans);
        $display("-------------------------");
      #40;
    end
  endtask
endclass

// Driver Class
/*class driver;
    transaction data_drv;    
    mailbox #(transaction) mbx;
    virtual mult_if mif;    
    event next_data;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction 
    
    task run();
        forever begin
        mbx.get(data_drv);
        @(posedge mif.clk);
        mif.a <= data_drv.a;
        mif.b <= data_drv.b;
        $display("[DRV] Data sent to interface.");
        data_drv.display();
        -> next_data;
        end
    endtask 
endclass*/

module tb;
  scoreboard sco;
  monitor mon;
  mailbox #(transaction) mbx;
  mult_if mif();
  
  multiplier dut (.clk(mif.clk), .a(mif.a), .b(mif.b), .product(mif.product));
  
  initial begin
    mif.clk <= 0;
  end
  
  always #10 mif.clk <= ~mif.clk;
  
  initial begin
    for(int i = 0; i<20; i++) begin
      repeat(2)@(posedge mif.clk);
      mif.a <= $urandom_range(1,15);
      mif.b <= $urandom_range(1,15);
    end    
  end
  
  initial begin
    mbx = new();
    sco = new(mbx);
    mon = new(mbx);
    mon.mif = mif;
  end
  
  initial begin
    fork
        mon.run();
        sco.run();
    join
  end
  
  initial begin
    $dumpfile("dump.vcd");
     $dumpvars;    
    #300;
    $finish();
  end
  
endmodule

/*module tb_multiplier();
    mult_if mif();
    driver drv;
    generator gen;
    mailbox #(transaction) mbx;
    event done;
    
    multiplier dut (
        .a(mif.a),
        .b(mif.b),
        .product(mif.product),
        .clk(clk)
    );
    
    initial mif.clk <= 0;
    always #10 mif.clk = ~mif.clk;
    
    initial begin
        mbx = new();
        drv = new(mbx);
        gen = new(mbx);
        drv.mif = mif;
        done = gen.done;
        drv.next_data = gen.next_data;
    end
    
    initial begin
        fork
            gen.run();
            drv.run();
        join_none
        wait(done.triggered);
        $finish();    
    end
endmodule*/
