module interpreter_tb;

reg[15:0] inst;
wire[1:0] cond;
wire[3:0] op_code;
wire[2:0] dest_reg;
wire[2:0] src_reg_1;
wire[2:0] src_reg_2;
wire shift;

initial begin
    #10 inst = 16'haaaa;
    #10 inst = 16'hbbbb;
    #10 inst = 16'hcccc;
end

initial begin
    $monitor($time, "\ncond = %d,\n
    op_code = %d,\n
    dest_reg = %d,\n
    src_reg_1 = %d,\n
    src_reg_2 = %d,\n
    shift = %d", cond, op_code, dest_reg, src_reg_1, src_reg_2, shift);
end

interpreter MUT(inst, cond, op_code, dest_reg, src_reg_1, src_reg_2, shift);

endmodule