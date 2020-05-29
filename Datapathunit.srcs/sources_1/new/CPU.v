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
    wire [1:0] opcode;
 
    cu CPU_CU(opcode, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp);
    //wire contol;
    Datapath CPU_DP(clk, pcFill, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp, opcode);
    

endmodule


/*
module instrMemory_tb(

    );
reg clk;
reg[15:0] Hyrja;
wire[15:0] Dalja;
reg[15:0] instrMemory[127:0];

initial $monitor("Hyrja=%d, Dalja=%d", Hyrja, Dalja);

initial
begin
#0 clk = 1'b1; Hyrja=16'd9; clk = 1'b0;
#5 clk=1'b1;
#10 Hyrja=16'd10; clk=1'b0;
#10 $stop;
end 

InstrMemory instrMem(clk, Hyrja, Dalja);
endmodule
*/



/*


module DataMemory_tb(
    );
reg clk;
reg MemWrite, MemRead;
reg[15:0] WriteData;
reg[15:0] AdresaNeHyrje;
wire[15:0] ReadData;
reg[15:0] DataMemory[127:0];

initial $monitor("ReadData=%d, AdresanNeHyrje=%d", ReadData, AdresaNeHyrje);

initial
begin
//lexojme vleren nga memoria ne adresen 12
#0 clk = 1'b0;
#5 AdresaNeHyrje=16'd12; MemRead=1'b1;
#5 clk=1'b1;
#5 clk = 1'b0;
//shkruajme ne memorie ne adresen 15 vleren decimale 200
#5 AdresaNeHyrje=16'd15; MemWrite=1'b1; WriteData=16'd200;
#5 clk=1'b0;
//lexojme vleren e shkruar
#5 AdresaNeHyrje=16'd15; MemRead=1'b1;
#5 clk=1'b1;
#10 $stop;
end 

DataMemory dataMem(AdresaNeHyrje, WriteData, MemWrite, MemRead, clk, ReadData);
endmodule


*/



/*
module RegisterFile_tb(

    );
reg[2:0] RS;
reg[2:0] RT;
reg[2:0] RD;
reg[15:0] WD;
reg we;
reg clk;
wire[15:0] RD1;
wire[15:0] RD2;    
//wire[31:0] Registers[31:0];
    
initial $monitor("RS=%d, RT=%d, RD=%d", RS, RT, RD);

initial
begin
//clock-u 0; vendosim vlerat per RD, te dhenat ne WD dhe WriteEnable=1; shkruajme ne regjistrin 5
#10 clk=0; 
    RD=3'd5; WD=16'd100; we=1'b1;
//Te dhenat e mesiperme shkruhen ne tehun pozitiv te clockut
#5  clk=1;    
#5  clk=0;
//clock-u 0; vendosim vlerat per RD, te dhenat ne WD dhe WriteEnable=1; shkruajme ne regjistrin 6
#5  RD=3'd6; WD=16'd101; we=1'b1;
//Te dhenat e mesiperme shkruhen ne tehun pozitiv te clockut
#5  clk=1;    
#5  clk=0;
//Duke ofruar adresat per regjistrin e 5 dhe te 6 lexojme vlerat e tyre te deponuara me pare
#10 RS=3'd5; RT=3'd6;
#10 $stop;
end 
    
   
RegisterFile RF (RS, RT, RD, WD,  we, 
clk, RD1, RD2);
endmodule
*/

