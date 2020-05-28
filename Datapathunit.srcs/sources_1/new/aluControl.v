`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 04:51:26 AM
// Design Name: 
// Module Name: aluControl
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


module aluControl(ALUOp, Function, bnegate, s0, s1, s2);  

 
 reg[3:0] ALU_Control;  
 input ALUOp;  
 input [4:0] Function;  
 wire [5:0] ALUControlIn;
 output reg bnegate, s0, s1, s2;
 
 assign ALUControlIn = {ALUOp,Function};
 
 always @(ALUControlIn)  
 casex (ALUControlIn)  
  6'b100010: ALU_Control=4'b0000;   // AND
  6'b100010: ALU_Control=4'b0010;   // OR
  6'b100011: ALU_Control=4'b0011;   // XOR
  6'b100100: ALU_Control=4'b0100;   // ADD 
  6'b100111: ALU_Control=4'b1100;   // SUB
  6'b101000: ALU_Control=4'b0001;   // SLL
  6'b101001: ALU_Control=4'b0110;   // SRL
  6'b110000: ALU_Control=4'b0111;   // MULT
  6'b000100: ALU_Control=4'b0101;   // ADDI
  6'b000100: ALU_Control=4'b0100;   // LW/SW
  endcase  
  
   
always @(ALU_Control)  {bnegate, s0, s1, s2} = ALU_Control;
 endmodule  
