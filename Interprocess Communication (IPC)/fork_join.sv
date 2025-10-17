`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 11:40:50 AM
// Design Name: 
// Module Name: fork_join
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


module fork_join();

int i = 0;
bit [7:0] data1, data2;
event done;
event next;

task generator();
    for(i = 0; i < 10; i++) begin
        data1 = $urandom();
        $display("Data Sent : %0d at %0t", data1, $time);
        #10;
        wait(next.triggered);    
    end
    -> done;
endtask


task receiver();
    forever begin
        #10;
        data2 = data1;
        $display("Data Received : %0d at %0t", data2, $time);
        -> next;
        end 
endtask        

task wait_event();
    wait(done.triggered);
    $display("Completed Sending all stimulus.");
    $finish();
endtask

initial begin
    fork
        generator();
        receiver();
        wait_event();
    join
    end

endmodule
