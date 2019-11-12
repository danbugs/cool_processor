module mux8by1(select, inputVal, outputVal);
input[2:0] select;
input[15:0] inputVal;
output outputVal;

assign outputVal = inputVal[select];

endmodule