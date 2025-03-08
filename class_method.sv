`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 02:17:27 PM
// Design Name: 
// Module Name: class_method
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


//methods can be:
//Task: Supports timing (clk edge, delay), can handle multiple input and output ports
// Function: Do not support timing,multiple input ports, single return value


//Function
/*
module class_method_function();

    function bit [4:0] add (input bit [3:0] a, b);    
    return a+b;            
    endfunction   
    
    //hold return value of function
    bit [4:0] result = 0;
    
    //give values to function input
    bit [3:0] a_in = 4'b0100, b_in = 4'b0010;    
    
    function void display_ain_bin();
        $display("Value of Ain: %0d and Bin: %0d", a_in, b_in);
    endfunction 
    
    initial begin 
        result = add(a_in, b_in);
        display_ain_bin();
        
        //$display("Addition result: %0d", result);
    end

endmodule*/

//Task
module class_method_task;
    /*
    task add (input bit [3:0] a, b, output bit[4:0] y); //defualt direction is input
        y = a + b;
        $display("Y is: %0d", y);
    endtask */
    
    bit [3:0] a,b;
    bit [4:0] y;
    
    bit clk = 0;
    
    always #5 clk = ~clk; //20ns : 50 MHz
    
    task add (); //defualt direction is input
        y = a + b;
        $display("a = %0d, b = %0d, y = %0d",a,b, y);
    endtask
    
    task stim_a_b();
        a = 1;
        b = 3;
        add();
        #10;
        a = 5;
        b = 6;
        add();
        #10;
        a = 7;
        b = 8;
        add();
        #10;
     endtask 
    
    task stim_clk();
        @(posedge clk);
        a = $urandom();
        b = $urandom();
        add();
    endtask 
    
    initial begin
        #110;
        $finish();
    end
    
     always
    stim_clk();
    
   /*initial begin
     /*   a = 7;
        b = 7;
       add();
      
       stim_a_b();
       
    for(int i = 0; i<10; i++) begin 
    stim_clk;
        end
    end */
           
endmodule   
