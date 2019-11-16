module test_mux;
reg [2:0] selectValue;
reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
wire [15:0] outputValue;

initial
begin
R0 = 16'b0;
R1 = 16'b1;
R2 = 16'b10;
R3 = 16'b11;
R4 = 16'b100;
R5 = 16'b101;
R6 = 16'b110;
R7 = 16'b111;
#5 selectValue = 3'b000;
#5 selectValue = 3'b001;
#5 selectValue = 3'b010;
#5 selectValue = 3'b011;
#5 selectValue = 3'b100;
#5 selectValue = 3'b101;
#5 selectValue = 3'b110;
#5 selectValue = 3'b111;
end

initial
begin 
$monitor($time, " output %d", outputValue);
end

mux8by1 muxTest(R0, R1, R2, R3, R4, R5, R6, R7, outputValue, selectValue);

endmodule