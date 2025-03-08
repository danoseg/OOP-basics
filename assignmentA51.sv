`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 02:06:43 PM
// Design Name: 
// Module Name: assignmentA51
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

/*class test;
    unsigned int data1, data2, data3;
    
endclass 

module assignmentA51();
    test data_class;
    
    initial begin
    data_class = new();
    data_class.data1 = 32'd45;
    data_class.data2 = 32'd78;
    data_class.data3 = 32'd90;
    
    $display("Data1: %0d, Data2: %0d, Data3: %0d", data_class.data1, data_class.data2, data_class.data3);
    end 

endmodule*/

/*module assignmentA52();

    function logic [7:0]  mult(input logic [3:0] a,b);
        return a*b;     
    endfunction  
        
    logic [7:0] result = 0, expected = 96;
    logic [3:0] ain = 4'h8, bin=4'hc;
    
    function void compare();
        if(result == expected) 
            $display("Test Passed");
        else
            $display("Test Failed");  
    endfunction 
    
    initial
    begin 
        result = mult(ain, bin);
        $display("Mult result = %0d", result);
        compare();        
    end 

endmodule 
*/

/*module assignmentA53;

    logic [5:0] addr=0;
    bit wr=0, en=0, clk=0;
    
    
    always #20 clk = ~clk; //40ns period : 25 MHz
    
    
    function void display();
        $display("En: %0b, WR: %0b, Addr: %0d", en, wr, addr);
    endfunction 

    task stim_ctrl();
        @(posedge clk);
        en = 1'b1;
        wr = 1'b1;
        addr = 12;
        display();
        @(posedge clk);
        addr = 14;
        display();
        @(posedge clk);
        wr= 1'b0;
        addr= 23;
        display();
        @(posedge clk);
        addr= 48;
        display();
        @(posedge clk);
        en = 1'b0;
        addr=56;
        display();
    endtask 
    
    initial begin
        stim_ctrl();
        #20;
        $finish();
    end 
    
endmodule*/

/*module assignmentA54();

    bit [7:0] arr[32];

    function automatic void arr_gen(ref bit [7:0] a[32]);
        for(int i= 0; i<32; i++) begin
            a[i] = 8*i;
        end
    endfunction
    
    initial begin
    arr_gen(arr);
    for(int i= 0; i<32; i++) begin
           $display("Top Array: %0d", arr[i]);
        end
    
    end

endmodule*/

/*class data1;
    bit [3:0] a, b, c; 
    bit [4:0] result;
    
    function new(input bit[7:0] a, b, c);
        this.a= a;
        this.b = b;
        this.c = c;
    endfunction
    
    task add();
        result = a + b + c;
        $display("Sum result = %0d", result);
    endtask
    
endclass

module assignmentA55;
   
    data1 d1;
    
    initial begin
    d1 = new(1,2,4);
    d1.add();
    //$display("A: %0d, B: %0d, C: %0d", d1.a, d1.b, d1.c);
    end

endmodule*/

class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
  
  function generator copy();
    copy = new();
    copy.a = a;
    copy.wr = wr;
    copy.en = en;
    copy.s = s;
  endfunction 
 
endclass

class copy_class;
    
    generator g1;
    
    function new();
        g1 = new();
    endfunction 
    
    function copy_class copy();
        copy = new();
        copy.g1 = g1.copy;
    endfunction 
    
endclass 

module assignmentA57;

    copy_class obj1;
    copy_class obj2;
    
    initial begin
        obj1 = new();
        obj2 = new();
        
        obj2.g1.a = 9;
        obj2.g1.b = 9;
        obj2.g1.wr = 0;
        obj2.g1.en = 0;
        obj2.g1.s = 18;
        obj2.g1.display();
        obj1.g1.display();  
    
    end

endmodule