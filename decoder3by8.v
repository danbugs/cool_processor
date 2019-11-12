module decoder3by8(destReg, outReg);
input[2:0] destReg;
output [7:0] outReg;

assign outReg = 8'b00000001 << (destReg);

endmodule
