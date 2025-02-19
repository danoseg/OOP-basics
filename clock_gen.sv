`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 05:44:06 PM
// Design Name: 
// Module Name: clock_gen
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

// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module clock_gen();
  
  reg clk=0;
  reg clk100 = 0;

  //reference clock
  always #5 clk = ~clk;  //100 MHz
  
  //variables for calc task
  real phase; 
  real ton;
  real toff;
  
  //initial begin
  //task allows reusable code
  task calc (input real freq_hz, input real duty_cycle, input real phase, output real pout,
             output real ton, output real toff);
    pout = phase;
    ton = (1.0/freq_hz) * duty_cycle * 1_000_000_000;
    toff = (1_000_000_000/ freq_hz) - ton;
  endtask
  
  task clkgen(input real phase, input real ton, input real toff);
  @(posedge clk);
  #phase;
    while(1) begin
      clk100 = 1;
      #ton;
      clk100 = 0;
      #toff;
    end
  endtask
 // end 
  
  initial begin
    calc(100_000_000, 0.5, 2, phase, ton, toff);
    $display("High Time: %0.2f, Low Time: %0.2f", ton, toff); //debugging ton and toff
    clkgen(phase, ton, toff);
  end
  
  initial begin
    #200;
    $finish();
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end 
  
endmodule
