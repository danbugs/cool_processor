
module Test_ADR;
reg  [6:0] n;
wire  [15:0] Reg1;

initial
begin
$display($time, " Test My ADR Module");
       n=34; 
#10 n=1;  
#10 n=126; 
#10 n=0;  
#10 n=3; 
#10 n=10; 
end

initial
begin
$monitor($time, "  n=%d,  Reg1=%b", n, Reg1);
end

ADR A1(.Reg1(Reg1), .n(n));
endmodule
