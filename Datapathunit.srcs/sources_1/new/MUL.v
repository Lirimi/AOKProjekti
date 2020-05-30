`timescale 1ns / 1ps



module MUL(output reg[15:0] hyrja1, output reg[15:0] hyrja2, input wire[15:0]vlera1,  input wire[15:0]vlera2);

reg A;
reg [15:0]B;

integer i;

always@*
begin
hyrja1 = 0;
B[15:0] = vlera2[15:0];
    for(i=0; i<16; i=i+1)
    begin
        A = B[0];
        if(A == 1)
            begin
            hyrja1[15:0] = hyrja1 [15:0] + vlera1[15:0];
            B = B >> 1;
            B[15] = hyrja1[0];
            hyrja1 = hyrja1 >> 1;
            end
        else if(A == 0)
            begin
            B = B >> 1;
            B[15] = hyrja1[0];
            hyrja1[1] = hyrja1 >> 1;
            end
        hyrja2[2] = B[15:0];
    end
    end  

endmodule
