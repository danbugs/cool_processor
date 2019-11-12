module ROTATE_R (Reg1, Shift_N, Out);

input [15:0] Reg1;
input [3:0] Shift_N;
//integer i;

wire [31:0] hold;

output [15:0] Out;

assign hold = {Reg1,Reg1} >> Shift_N;

assign Out = hold[15:0];





//assign Out = {Reg1[Shift_N-1:0], Reg1[15:Shift_N]};



endmodule
