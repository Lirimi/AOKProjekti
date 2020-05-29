`timescale 1ns / 1ps




//mux_8to1 m8 (op[0], op[1], op[2], net3, net4, net6, net5, net7, net8, net9, net10, result);

module mux_8to1 (s0, s1, s2, d0, d1, d2, d3, d4, d6, d7, d8, z1);


/*d0 = 000 (and) ,  d1 = 010 (or) , d2 = 011 (xor), d3 = 100 (add)   
 d4 = 101(addi), d6 = 001(sll), d7 = 110(srl), d8 = 111(mult) */ 



input s0, s1, s2, d0, d1, d2, d3, d4, d7, d8;
input d6;
output z1;




assign z1 = s0 ? (s1 ? (s2 ? d8 : d7) : (s2 ? d4 : d3))  :  (s1 ? (s2 ? d2 : d1) : (s2 ? d6 : d0));

//assign z1 = s1 ? (s0 ? d3 : d2) : (s0 ? d1 : d0);

endmodule