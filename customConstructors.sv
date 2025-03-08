`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 01:20:30 PM
// Design Name: 
// Module Name: customConstructors
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


class first1;
    
    int data1;
    bit[7:0] data2;
    shortint data3;
    
    function new(input int data1 = 0, input bit[7:0] data2 = 8'h00, input shortint data3 = 0); //cannot use void, new() is a special function in SV
        this.data1 = data1;
        this.data2 = data2;
        this.data3 = data3;  //this.data3: data member  , data3: argument   
    endfunction 
    
    //add a task in class
    task display();
        $display("Data1: %0d, Data2: %0d, Data3: %0d", data1, data2, data3);
    endtask
    

endclass

module customConstructors();
    
    first1 f1;
    
    initial begin
        //f1 = new(23,,35); //positional constructor
        f1 = new(.data2(5), .data3(5), .data1(23)); //name constructor
        f1.display(); //call task from class
       // $display("Data1: %0d, Data2: %0d, Data3: %0d", f1.data1, f1.data2, f1.data3);
    end

endmodule
