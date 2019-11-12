
module Test_MOV_n;
reg  [31:0]in1;
wire  [15:0] Reg1;

initial
begin
$display($time, " Test My Design");
       in1=2; 
#10 in1=1;  
#10 in1=126; 
#10 in1=5;  
#10 in1=210; 
#10 in1=10; 
end

initial
begin
$monitor($time, "n.=%d,  Reg1=%b", in1, Reg1);
end

MOV_n M1(.Reg1(Reg1), .n(in1));
endmodule