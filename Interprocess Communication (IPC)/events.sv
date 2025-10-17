`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 11:04:18 AM
// Design Name: 
// Module Name: events
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

// Operators used in events:
// Trigger : ->
// Sense: edge sensitive_blocking - @(event_name); , level_sensitive_non-blocking - wait(event_name.triggered );

// Edge sensitive:
// Level Sensitive:

module events;
    
    event a1,a2;
    
    initial begin
        -> a1;
        -> a2;            
    end

    initial begin
        //@(a1);
        wait(a1.triggered);
        $display("Received event a1 at %0t", $time);
        //@(a2);
        wait(a2.triggered);
        $display("Received event a2 at %0t", $time);    
    end

endmodule
