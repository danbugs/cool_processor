module CONDITION (Cond, Flag, Out);

input [1:0] Cond;
input [3:0] Flag; //N,Z,C,V

output reg Out;

always @ *
begin
case(Cond)
	2'b00: Out = 1'b1;
	2'b01: Out = Flag[2]; //out= z_flag
	2'b10: Out = (~Flag[3]); //out= ~n_flag
	2'b11: Out = Flag[3]; //out= n_flag	
endcase
end

endmodule
	