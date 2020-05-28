`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 04:56:00 PM
// Design Name: 
// Module Name: SUB
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


module SUB(output sub, output cin, input a, input b, input c);
wire d,e,f;

xor(sub,a,b,c);
and(d,~a,b);
and(e,b,c);
and(f,~a,c);

or(cin,d,e,f);

endmodule
