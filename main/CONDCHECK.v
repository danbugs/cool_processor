module CONDCHECK (Cond, Flag, Out);

input [1:0] Cond;
output reg Out;
input [3:0] Flag;

always @ * begin
	casex(Cond)
		2'b00: Out = 1'b1;		//No condition	
		2'b01: Out = Flag[2]; 		//Equal: out= z_flag
		2'b10: Out = (~Flag[3]); 	//Greater or Equal: out= ~n_flag
		2'b11: Out = Flag[3]; 		//Less than: out= n_flag	
		default: Out = 1'b0;		//Conditions not true
	endcase 
end

endmodule