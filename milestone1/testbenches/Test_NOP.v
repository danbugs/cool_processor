module Test_NOP;
reg [15:0] in1;
reg [3:0] f;

initial
begin
$display($time, " Test My Design");
       in1=2;  f=0010;
#10 in1=1;     f=1000;
#10 in1=126;   f=1001;
#10 in1=5;     f=1001;
#10 in1=210;   f=1001; 
#10 in1=10;    f=0000;
end

initial
begin
$monitor($time, "Reg=%d,  Flags=%b", in1, f);
end

NOP N1();
endmodule
