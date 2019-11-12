module mux8by1(sourceReg, inputVal, outputVal);
input[15:0] sourceReg;
input[7:0] inputVal;
output outputVal;

assign outputVal = inputVal[sourceReg];

endmodule