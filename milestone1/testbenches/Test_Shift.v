module Test_Shift;

reg signed [15:0]in1;
reg [3:0] in2;
wire signed [15:0] S_L,S_R,R_R;


initial
begin
$display($time, "Test My Design");

in1 = 10; in2 = 3;
#10 in1 = 25; in2 = 6;
#10 in1 = 50; in2 = 9;

end

initial
begin
$monitor($time, "In1=%b, Shift_By=%d || Shift_L=%b || Shift_R=%b || Rotate_R=%b" , in1,in2,S_L,S_R,R_R);
end

SHIFT_L MUT1(in1, in2, S_L);
SHIFT_R MUT2(in1, in2, S_R);
ROTATE_R MUT3(in1, in2, R_R);

endmodule
