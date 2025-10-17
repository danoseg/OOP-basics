`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 12:11:31 PM
// Design Name: 
// Module Name: fork_join_any_none
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

// fork-join_any: the tasks outside the fork-join execute as soon as any of the processes inside the fork-join is complete
// fork-join_none: the task outside the fork-join starts at the same time as tasks inside the fork-join, and is executed before the fork-join tasks


module fork_join_any_none();

task first();
    $display("Task 1 started at %0t", $time);
    #20;
    $display("Tasl 1 completed at %0t", $time);
endtask

task second();
    $display("Task 2 started at %0t", $time);
    #30;
    $display("Tasl 2 completed at %0t", $time);
endtask

task third();
    $display("Reached next to join at %0t", $time);
endtask

    initial begin
        fork
            first();
            second();
        join_none
        //joib
        //join_any    
        third();
    end
endmodule
