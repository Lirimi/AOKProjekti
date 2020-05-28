`timescale 1ns / 1ps



module alu_1bit(
    input a,
    input b,
    input cin,
    input ainvert,
    input bnegate,
    input [2:0] op,                
    output result,
    output cout
    );
    
wire a, b, cin, ainvert, bnegate;
wire[2:0] op;

wire result;
wire cout;

wire coutSub;                        ///////////////////////
wire net1, net2, net3, net4, net5, net6, net7, net8, net9, net10, ajo, bjo;

not a1 (ajo, a);
not b1 (bjo, b);

mux_2to1 m2_A(ainvert, a, ajo, net1);
mux_2to1 m2_B(bnegate, b, bjo, net2);

and n3 (net3, net1, net2);        // net 3 == and 
or n4 (net4, net1, net2);         // net 4 == or
xor n5(net6, net1, net2);         // net6 == xor
full_adder FA (net1, net2, cin, net5, cout);   // net 5 = riple carry addd
//SLL sll(net8, net1, net2);        // net8 = sll
//SRL srl(net9, net1, net2);        // net9 = srl
SUB sub(net5, cout, net1, net2, cin);  // net5= sub (add with bnegate)



mux_8to1 m8 (op[0], op[1], op[2], net3, net4, net6, net5, net7, net8, net9, net10, result);

endmodule
