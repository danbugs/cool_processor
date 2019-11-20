module decoder3by8(destReg, outReg);
input[2:0] destReg;
output [7:0] outReg;

assign outReg = 1'b1 << (destReg);

endmodule