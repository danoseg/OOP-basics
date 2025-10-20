`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2025 07:49:51 PM
// Design Name: 
// Module Name: driver_interface
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
    logic clk;
    
    // Specifies direction of specific signal
    modport DRV(output a,b, input sum, clk);
        
endinterface 

class driver;
    
    // Include modport constraint
    virtual add_if.DRV aif;
    
    task run();
        forever begin
            @(posedge aif.clk);
            aif.a <= 3;
            aif.b <= 3;
            $display("[DRV] : Interface trigger");
        end
    endtask 
    
endclass

module driver_interface();
    add_if aif();
    
    adder dut(.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk));
    
    initial begin
        aif.clk <= 0;
    end
    
    always #10 aif.clk = ~aif.clk;
    
    driver drv;
    
    initial begin
        drv = new();
        drv.aif = aif;
        drv.run();
    end
    
    initial begin
    #100;
    $finish();
    end

endmodule
