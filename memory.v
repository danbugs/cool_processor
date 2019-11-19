 module memory (Enable,Address,DataOut);
    input  Enable;
    input [6:0] Address;
    output reg[15:0] DataOut;
    
    reg [15:0] rom [0:127];         		 //128 x 16 memory
    
always @*
	   if (Enable)
            DataOut = rom[Address];  		//Read
	   else DataOut = 16'bz;        	//High impedance state
endmodule