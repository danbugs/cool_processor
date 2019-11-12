module Test_Bits;

reg signed [15:0]in1,in2;
wire signed [15:0] And,Or,Xor;


initial
begin
$display($time, "Test My Design");

in1 = 10; in2 = 15;
#10 in1 = 25; in2 = -30;
#10 in1 = 25; in2 = 25;

end

initial
begin
$monitor($time, "In1=%b, In2=%b || And=%b || Or=%b || Xor=%b" , in1,in2,And,Or,Xor);
end

BIT_AND MUT1(in1, in2, And);
BIT_OR MUT2(in1, in2, Or);
BIT_XOR MUT3(in1, in2, Xor);

endmodule
