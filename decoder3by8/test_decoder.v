module test_dec;
reg [2:0] ain;
wire [7:0] bout;

initial
begin
ain = 3'b000;
#5 ain = 3'b001;
#5 ain = 3'b010;
#5 ain = 3'b011;
#5 ain = 3'b100;
#5 ain = 3'b101;
#5 ain = 3'b110;
#5 ain = 3'b111;
end

initial
begin 
$monitor($time, " output %d", bout);
end

decoder3by8 decoderTest(ain, bout);

endmodule