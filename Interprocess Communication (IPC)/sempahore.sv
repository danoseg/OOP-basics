`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2025 12:31:04 PM
// Design Name: 
// Module Name: sempahore
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

class first;
    rand int data;
    constraint data_c {data < 10; data > 0;}
endclass


class second;
    rand int data;
    constraint data_c {data > 10; data < 20;}
endclass


class main;
    
    semaphore sem;
    
    first f; 
    second s;
    
    int data;
    int i = 0;
    
        task send_first();
        
                sem.get(1); // Semaphore access
                
            for (i = 0; i<10; i++) begin
                f.randomize();
                data = f.data;
                $display("First access semaphore and data sent: %0d", f.data);
                #10;    
            end
            
            sem.put(1); // Setting semaphore free
            
            $display("Semaphore Unoccupied");
         endtask
 
        task send_second();
        
                sem.get(1); // Semaphore access
                
            for (i = 0; i<10; i++) begin
                s.randomize();
                data = s.data;
                $display("Second access semaphore and data sent: %0d", s.data);
                #10;    
            end
            
            sem.put(1); // Set semaphore free
            $display("Semaphore Unoccupied");
         endtask 
 
        task run();
         sem = new(1); // '1' specifies how many semaphores are used
         f = new();
         s = new();
         
         fork 
            send_first();
            send_second();
         join         
        endtask

endclass 

 
module sempahore();

    main m;

    initial begin
        m = new();
        m.run;
    end
     
     initial begin
        #250;
        $finish();
     end
 
endmodule
