`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2020 04:19:34 AM
// Design Name: 
// Module Name: MUL
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


module MUL(output reg[15:0] buffer1, output reg[15:0] buffer2, input wire[15:0]A,  input wire[15:0]B);

reg B0;
reg [15:0]C;

integer i;

always@*
begin
buffer1 = 0;
C[15:0] = B[15:0];
    for(i=0; i<16; i=i+1)
    begin
        B0 = C[0];
        if(B0 == 1)
            begin
            buffer1[15:0] = buffer1 [15:0] + A[15:0];
            C = C >> 1;
            C[15] = buffer1[0];
            buffer1 = buffer1 >> 1;
            end
        else if(B0 == 0)
            begin
            C = C >> 1;
            C[15] = buffer1[0];
            buffer1[1] = buffer1 >> 1;
            end
        buffer2[2] = C[15:0];
    end
    end  

endmodule
