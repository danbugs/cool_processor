module BIT_OR (Reg1, Reg2, Out, Flag);

input [15:0] Reg1, Reg2;
input [3:0] Flag; //N,Z,C,V

output [15:0] Out;

assign Out = Reg1 | Reg2;



assign Flag[0] = (({Flag[1],Out[15]} == 2'b01)|| ({Flag[1],Out[15]} == 2'b10));

assign Flag[1] = 1'b0;

assign Flag[2] = (Out == 0);

assign Flag[3] = (Out[15] == 1'b1);

endmodule
