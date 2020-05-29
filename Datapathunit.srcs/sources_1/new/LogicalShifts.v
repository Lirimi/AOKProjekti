`timescale 1ns / 1ps


module SLL(output reg[15:0] s, input[15:0] l);

always@(*)
begin

s[15] = 1'b0;               // shift s  left by 1 bit
s[14] = l[15];               // shift s  left by 1 bit
s[13]= l[14];              // shift s  left by 1 bit
s[12]= l[13];              // shift s  left by 1 bit
s[11]= l[12];              // shift s  left by 1 bit
s[10]= l[11];              // shift s  left by 1 bit
s[9]= l[10];              // shift s  left by 1 bit
s[8]= l[9];              // shift s  left by 1 bit
s[7]= l[8];              // shift s  left by 1 bit
s[6]= l[7];              // shift s  left by 1 bit
s[5]= l[6];              // shift s  left by 1 bit
s[4]= l[5];              // shift s  left by 1 bit
s[3]= l[4];              // shift s  left by 1 bit
s[2]= l[3];              // shift s  left by 1 bit
s[1]= l[2];              // shift s  left by 1 bit
s[0]= l[1];              // shift s  left by 1 bit

end
endmodule



module SRL( output reg[15:0] s, input[15:0] l);


always@(s or l)
begin

s[15] = l[14];               // shift s  right by 1 bit
s[14] = l[13];               // shift s  right by 1 bit
s[13] = l[12];               // shift s  right by 1 bit
s[12] = l[11];               // shift s  right by 1 bit
s[11] = l[10];               // shift s  right by 1 bit
s[10] = l[9];               // shift s  right by 1 bit
s[9] = l[8];               // shift s  right by 1 bit
s[8] = l[7];               // shift s  right by 1 bit
s[7] = l[6];               // shift s  right by 1 bit
s[6] = l[5];               // shift s  right by 1 bit
s[5] = l[4];               // shift s  right by 1 bit
s[4] = l[3];               // shift s  right by 1 bit
s[3] = l[2];               // shift s  right by 1 bit
s[2] = l[1];               // shift s  right by 1 bit
s[1] = l[0];               // shift s  right by 1 bit
s[0] = 1'b0;                
end
endmodule



/*
module SLL(output reg[15:0] s, input[15:0] l);

always@(s or l)
begin

s[15] = 1'b0;               // shift s  left by 1 bit
s[14], l[15];              // shift s  left by 1 bit
assign sll = {s[13], l[14];              // shift s  left by 1 bit
assign sll = {s[12], l[13]};              // shift s  left by 1 bit
assign sll = {s[11], l[12]};              // shift s  left by 1 bit
assign sll = {s[10], l[11]};              // shift s  left by 1 bit
assign sll = {s[9], l[10]};               // shift s  left by 1 bit
assign sll = {s[8], l[9]};                // shift s  left by 1 bit
assign sll = {s[7], l[8]};                // shift s  left by 1 bit
assign sll = {s[6], l[7]};                // shift s  left by 1 bit
assign sll = {s[5], l[6]};                // shift s  left by 1 bit
assign sll = {s[4], l[5]};                // shift s  left by 1 bit
assign sll = {s[3], l[4]};                // shift s  left by 1 bit
assign sll = {s[2], l[3]};                // shift s  left by 1 bit
assign sll = {s[1], l[2]};                // shift s  left by 1 bit
assign sll = {s[0], l[1]};                // shift s  left by 1 bit
end
endmodule*/


/*



module SRL( output reg[15:0] s, input[15:0] l);


always@(s or l)
begin
s[15] = l[14]};               // shift s  right by 1 bit
assign srl = {s[14], l[13]};             
assign srl = {s[13], l[12]};              
assign srl = {s[12], l[11]};              
assign srl = {s[11], l[10]};              
assign srl = {s[10], l[9]};              
assign srl = {s[9], l[8]};               
assign srl = {s[8], l[7]};               
assign srl = {s[7], l[6]};                
assign srl = {s[6], l[5]};                
assign srl = {s[5], l[4]};                
assign srl = {s[4], l[3]};                
assign srl = {s[3], l[2]};                
assign srl = {s[2], l[1]};                
assign srl = {s[1], l[0]};                
s[0] = 1'b0;                
end
endmodule*/
