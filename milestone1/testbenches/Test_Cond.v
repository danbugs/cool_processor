module Test_Cond;

reg [1:0] cond;
reg signed [15:0]in1,in2;
wire [3:0] Flag;
wire Out;


initial
begin
$display($time, "Test My Design");

cond =2'b00; in1 = 10; in2 = 15;
#10 cond =2'b10; in1 = 25; in2 = -30;
#10 cond = 2'b11; in1 = 25; in2 = 25;
#10 cond = 2'b01; in1 = 25; in2 = 25;

end

initial
begin
$monitor($time, "In1=%d, In2=%d, Flag=%b ||Cond =%b;  True (1) or False(0) =%b" , in1,in2,Flag,cond,Out);
end

CMP MUT1(in1, in2, Flag);
CONDCHECK MUT2(cond, Flag, Out);

endmodule
