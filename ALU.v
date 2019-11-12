module ALU (Cond, Op_C, Reg1, Reg2, Ld_Sh, Out, Flag);

input [1:0] Cond;
input [15:0] Reg1, Reg2;
input [6:0] Ld_Sh;
input [3:0] Op_C;

wire cond_check;
wire [3:0] Shift_N;
wire [6:0] Load_N;
 
output [15:0] Out;
output [3:0] Flag;

assign Shift_N = Ld_Sh[0:3]; //value to shift by (0< n <15)
assign Load_N = Ld_Sh; //constant to load (0< n <127)

always @ *
begin

if (CONDITION(Cond,Flag,cond_check))
	Op_C = Op_C;	//op-code does not change
else
	Op_C = 4'b1111;	//op-code becomes skip instruction


case (Op_C)
	4'b0000: ADD(Reg1, Reg2, Out, Flag);
	4'b0001: SUB(Reg1, Reg2, Out, Flag);
	4'b0010: MUL(Reg1, Reg2, Out, Flag);
	4'b0011: BIT_OR(Reg1, Reg2, Out, Flag);
	4'b0100: BIT_AND(Reg1, Reg2, Out, Flag)
	4'b0101: BIT_XOR(Reg1, Reg2, Out, Flag);
	4'b0110: //move constant number into reg
	4'b0111: //copy input reg into output reg
	4'b1000: SHIFT_R(Reg1, Shift_N, Out);
	4'b1001: SHIFT_L(Reg1, Shift_N, Out);
	4'b1010: ROTATE_R (Reg1, Shift_N, Out);
	4'b1011: CMP (Reg1, Reg2, Flag);
	4'b1100: //initalize reg with 7-bit mem address
	4'b1101: //load contents for reg2 at mem address of r1
	4'b1110: //store reg2 at mem address of reg 1
	4'b1111: //skip instruction		
endcase

end

endmodule

