module test_LDR; // Memory Read
 
 reg [6:0] Address;//Reg1, previously adjusted to 7 bit with ADR module
 wire [15:0] Reg2; //DataOut

LDR L1( Reg2, Address );


initial
begin
 $readmemh("data_r.txt", L1.Memory);
 Address=3'd0;
#5 Address=3'd4;
#5 Address=3'd1;
#5 Address=3'd2;
#5 Address=3'd15;
#5 Address=3'd126;
#5 Address=3'd5;
#5 Address=3'd60;
#5 Address=3'd7;
end
initial
begin
$monitor($time, "  data at address (R1) %d is R2= %h", Address, Reg2);
end
endmodule
