module ROTATE_R (Reg1, Shift_N, Out);

input [15:0] Reg1;
input [3:0] Shift_N;
wire [31:0] hold;
output [15:0] Out;

assign hold = {Reg1,Reg1} >> Shift_N;
assign Out = hold[15:0];
    
endmodule