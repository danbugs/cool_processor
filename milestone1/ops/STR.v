
module STR (Reg2,Reg1 );
input [15:0] Reg2; // DataIn
input [15:0] Reg1; // address

reg [15:0] Memory [0:127];         		 //128 x 16 memory
    
always @*
	   
           Memory[Reg1] = Reg2;   		//Write

endmodule
