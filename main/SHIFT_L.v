module SHIFT_L (Reg1, Shift_N, Out);

input [15:0] Reg1;
input [3:0] Shift_N;

output [15:0] Out;

assign Out = Reg1 << Shift_N;



endmodule
