`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 04:27:41 AM
// Design Name: 
// Module Name: CPU
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


module CPU(input clk);
    
    wire pcFill = 16'd10;
    wire RegDst;
    wire Alusrc, MemToReg, RegWrite, MemRead, MemWrite, ALUOp;
    wire [1:0]opcode;
    //wire contol;
    Datapath CPU_DP(clk, pcFill, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp, opcode);
    cu CPU_CU(opcode, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp);

endmodule
