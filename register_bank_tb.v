module register_bank_tb;
    reg[7:0] en;
    reg[15:0] to_dest_reg;
    reg clk;
    wire[15:0] q0, q1, q2, q3, q4, q5, q6, q7;

    initial begin
        #0 clk = 0;
        #10 to_dest_reg = 0; en = 8'b00000001;
        #10 to_dest_reg = 1; en = 8'b00000010;
    end

    initial begin
        $monitor($time, "q0 = %d, q1 %d", q0, q1);
    end

    always #5 clk = !clk;

    register_bank MUT(en, to_dest_reg, q0, q1, q2, q3, q4, q5, q6, q7, clk);

endmodule