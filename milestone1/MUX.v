module MULTIPLEXER (In1, In2, In3, In4, In5, In6, In7, In8, Out, sel);

input [15:0] In1, In2, In3, In4, In5, In6, In7, In8;
input [15:0] sel;
output [15:0] Out;
reg [15:0] Out;

always @*
begin

case (sel)
3'b000 : Out = In1;
3'b001 : Out = In2;
3'b010 : Out = In3;
3'b011 : Out = In4;
3'b100 : Out = In5;
3'b101 : Out = In6;
3'b110 : Out = In7;
3'b111 : Out = In8;

default: Out = 16'bx;
endcase
end
endmodule
