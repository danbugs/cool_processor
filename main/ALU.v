module ALU (Cond, Op_C, Reg1, Reg2, Ld_Sh, dest_reg);

input [1:0] Cond;
input [15:0] Reg1, Reg2;
input [6:0] Ld_Sh;
input [3:0] Op_C;

wire cond_check;
wire [3:0] Shift_N;
wire [6:0] Load_N;
reg [3:0] Flag;
 
output reg [15:0] dest_reg;
wire[15:0] add_out, 
	sub_out, 
	mul_out, 
	bor_out, 
	band_out,
	bxor_out,
	movn_out,
	mov_out,
	sr_out,
	sl_out,
	rr_out;
wire[3:0] add_flag,
	sub_flag,
	mul_flag,
	cmp_flag;


assign Shift_N = Ld_Sh[3:0]; //value to shift by (0< n <15)
assign Load_N = Ld_Sh; //constant to load (0< n <127)

CONDCHECK cc(Cond, Flag, cond_check);
ADD add(Reg1, Reg2, add_out, add_flag);
SUB sub(Reg1, Reg2, sub_out, sub_flag);
MUL mul(Reg1, Reg2, mul_out, mul_flag);
BIT_OR  bor(Reg1, Reg2, bor_out);
BIT_AND band(Reg1, Reg2, band_out);
BIT_XOR bxor(Reg1, Reg2, bxor_out);
MOV_n movn(Load_N, movn_out);
MOV mov(Reg1, mov_out);
SHIFT_R sr(Reg1, Shift_N, sr_out);
SHIFT_L sl(Reg1, Shift_N, sl_out);
ROTATE_R rr(Reg1, Shift_N, rr_out);
CMP cmp(Reg1, Reg2, cmp_flag);

always @ * begin
  if(cond_check)
		case(Op_C)
			4'b0000: begin 
				dest_reg = add_out;
				Flag = add_flag;
				end
			4'b0001: begin
				dest_reg = sub_out;
				Flag = sub_flag;
				end
			4'b0010: begin
				dest_reg = mul_out;
				Flag = mul_flag;
				end
			4'b0011: dest_reg = bor_out;
			4'b0100: dest_reg = band_out;
			4'b0101: dest_reg = bxor_out;
			4'b0110: dest_reg = movn_out;
	        4'b0111: dest_reg = mov_out;
			4'b1000: dest_reg = sr_out;
			4'b1001: dest_reg = sl_out;
			4'b1010: dest_reg = rr_out;
			4'b1011: begin 
              dest_reg = 16'bx;
              Flag = cmp_flag;
            end
			default: begin // NOP
              	dest_reg = dest_reg;
              	Flag = Flag;
				end	
		endcase
    else begin // cond not met
		dest_reg = dest_reg;
		Flag = Flag;		
	end
end
  
always #10 begin
	$strobe($time, "FLAGS (N, Z, C, V) = %b", Flag);
end  

endmodule