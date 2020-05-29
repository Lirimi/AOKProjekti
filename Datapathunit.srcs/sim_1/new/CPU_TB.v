`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 04:36:54 AM
// Design Name: 
// Module Name: CPU_TB
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
module CPU_TestBench;

   reg clk;
  
    //reg a, b, cin,ainvert, bnegate;

//wire result;
//wire cout;
    initial
    begin
    #0 clk = 1;
    #5 clk = 1; 
    #5 clk = 1;
    #5 clk = 0;
    #5 clk = 1;
    #5 clk = 0;
    #5 clk = 1;
    #5 clk = 0;
   
    end
    CPU cpu_testbench(clk);
    
 
    
endmodule



