module CMP (Reg1, Reg2, Flag);

input [15:0] Reg1, Reg2;
inout [3:0] Flag; //N,Z,C,V

wire [15:0] Out;

SUB MUT(Reg1, Reg2, Out, Flag);

endmodule
