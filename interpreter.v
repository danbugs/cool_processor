module interpreter(
    inst,
    cond,
    op_code,
    dest_reg,
    src_reg_1,
    src_reg_2,
    shift
);

input[15:0] inst;
output[1:0] cond;
output[3:0] op_code;
output[2:0] dest_reg;
output[2:0] src_reg_1;
output[2:0] src_reg_2;
output shift;

assign cond = inst[15:14];
assign op_code = inst[13:10];
assign dest_reg = inst[9:7];
assign src_reg_1 = inst[6:4];
assign src_reg_2 = inst[3:1];
assign shift = inst[6:0];

endmodule