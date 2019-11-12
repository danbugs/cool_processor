module ALU (Cond, Op_C, Reg1, Reg2, Ld_Sh, Out);

input [1:0] Cond;
input [15:0] Reg1, Reg2;
input [6:0] Ld_Sh;
input [3:0] Op_C;

wire cond_check;
wire [3:0] Shift_N;
wire [6:0] Load_N;
reg [3:0] Flag;
 
output reg [15:0] Out;


assign Shift_N = Ld_Sh[3:0]; //value to shift by (0< n <15)
assign Load_N = Ld_Sh; //constant to load (0< n <127)



always @ *
begin

CONDCHECK (Cond, Flag, cond_check);

if (~cond_check)
	NOP (Reg1, Reg2, Flag);	//skip instruction
else
  
begin
case (Op_C)
	4'b0000: ADD(Reg1, Reg2, Out, Flag);
	4'b0001: SUB(Reg1, Reg2, Out, Flag);
	4'b0010: MUL(Reg1, Reg2, Out, Flag);
	4'b0011: BIT_OR(Reg1, Reg2, Out);
	4'b0100: BIT_AND(Reg1, Reg2, Out);
	4'b0101: BIT_XOR(Reg1, Reg2, Out);
	4'b0110: MOV_n (Reg1, Load_N);
	4'b0111: MOV (Reg1, Reg2);
	4'b1000: SHIFT_R(Reg1, Shift_N, Out);
	4'b1001: SHIFT_L(Reg1, Shift_N, Out);
	4'b1010: ROTATE_R (Reg1, Shift_N, Out);
	4'b1011: CMP (Reg1, Reg2, Flag);
	4'b1100: ADR (Reg1, Load_N);
	4'b1101: LDR ( Reg2, Reg1 );
	4'b1110: STR (Reg2,Reg1 );
	4'b1111: NOP (Reg1, Reg2, Flag);	
endcase
end

end

endmodule

