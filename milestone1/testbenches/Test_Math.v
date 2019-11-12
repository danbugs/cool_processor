module Test_Math;

reg signed [15:0]in1,in2;
wire signed [15:0] Sum,Dif,Mul;
wire [3:0] Flag1,Flag2,Flag3,Flags;

initial
begin
$display($time, "Test My Design");

in1 = 10; in2 = 15;
#10 in1 = 25; in2 = -30;
#10 in1 = 25; in2 = 25;
#10 in1 = -25; in2 = -30;

end

initial
begin
$monitor($time, "In1=%d, In2=%d || ADD=%d, Flags(ADD)=%b || SUB=%d, Flags(SUB)=%b || MUL=%d, Flags(MUL)=%b || CMP Flags =%b" , in1,in2,Sum,Flag1,Dif,Flag2,Mul,Flag3,Flags);
end

ADD MUT1(in1, in2, Sum, Flag1);
SUB MUT2(in1, in2, Dif, Flag2);
MUL MUT3(in1, in2, Mul, Flag3);
CMP MUT4(in1, in2, Flags);

endmodule
