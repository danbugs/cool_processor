
module test_STR; // Memory Write
 
 reg [15:0] Address;// Reg1 
 reg [15:0] Reg2; //DataIn

STR S1( Reg2, Address );

initial
begin
 
 Address=3'd0; Reg2=16'hAAAA;
#2 Address=3'd1; Reg2=16'h00AA;
#2 Address=3'd2; Reg2=16'h00EE;
#2 Address=3'd3; Reg2=16'h00CC;
#2 Address=3'd4; Reg2=16'h00BB;
#2 Address=3'd5; Reg2=16'h00FF;


$writememh("data_h.txt", S1.Memory);

end
endmodule