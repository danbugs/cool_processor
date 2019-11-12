module LDR ( Reg2, Reg1);
output reg [15:0] Reg2; // DataOut
input [6:0] Reg1; // address previously adjusted by ADR module to 7 bits
reg [15:0] Memory [0:127];   //128 x 16 memory
    
always @*
              Reg2 = Memory[Reg1];  		//Read
endmodule