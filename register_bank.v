module register_bank(
    en, to_dest_reg, q0, q1, q2, q3, q4, q5, q6, q7, clk
);
    input clk;
    input[7:0] en;
    input[15:0] to_dest_reg;
    output reg[15:0] q0, q1, q2, q3, q4, q5, q6, q7;
    always @ (posedge clk) begin
        case(en)
            8'b00000001: q0 <= to_dest_reg;
            8'b00000010: q1 <= to_dest_reg;
            8'b00000100: q2 <= to_dest_reg;
            8'b00001000: q3 <= to_dest_reg;
            8'b00010000: q4 <= to_dest_reg;
            8'b00100000: q5 <= to_dest_reg;
            8'b01000000: q6 <= to_dest_reg;
            8'b10000000: q7 <= to_dest_reg;
        endcase
    end
endmodule