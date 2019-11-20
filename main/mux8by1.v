module mux8by1 (R0, R1, R2, R3, R4, R5, R6, R7, Out, sel);
input [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
input [2:0] sel;
output [15:0] Out;
reg [15:0] Out;

always @* begin
    case (sel)
    3'b000 : Out = R0;
    3'b001 : Out = R1;
    3'b010 : Out = R2;
    3'b011 : Out = R3;
    3'b100 : Out = R4;
    3'b101 : Out = R5;
    3'b110 : Out = R6;
    3'b111 : Out = R7;
    default: Out = 16'bx;
    endcase
end

endmodule