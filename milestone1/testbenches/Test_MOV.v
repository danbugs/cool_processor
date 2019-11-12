module Test_MOV;
reg  [15:0] Reg2;
wire  [15:0] Reg1;

initial
begin
$display($time, " Test My MOV Module");
       Reg2=34; 
#10 Reg2=1;  
#10 Reg2=126; 
#10 Reg2=22345;  
#10 Reg2=210; 
#10 Reg2=10; 
end

initial
begin
$monitor($time, "Reg2.=%b,  Reg1=%b", Reg2, Reg1);
end

MOV M1(.Reg1(Reg1), .Reg2(Reg2));
endmodule