 
 module memory (Enable,Address,DataOut);
    input  Enable;
    input [3:0] Address;
    output reg[15:0] DataOut;
    
    reg [15:0] Memory [0:127];         		 //128 x 16 memory
    
always @*
	   if (Enable)
            DataOut = Memory[Address];  		//Read
	   else DataOut = 16'bz;        	//High impedance state
endmodule