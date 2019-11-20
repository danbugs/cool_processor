// Code your testbench here
// or browse Examples
module main;   
    // for memory
    reg en;
  	reg[6:0] address;
    wire[15:0] data_out;
  	integer pc;

    // for interpreter
    wire[1:0] cond;
    wire[3:0] op_code;
    wire[2:0] dest_reg;
    wire[2:0] src_reg1;
    wire[2:0] src_reg2;
    wire[6:0] shift;

    // for decoder
    wire[7:0] decoded_dest_reg;

    // for register bank
    wire[15:0] q0, q1, q2, q3, q4, q5, q6, q7;
    wire[15:0] to_dest_reg;

    // for mux
    wire[15:0] r1, r2;


    memory rom(en, address, data_out);

    initial begin
        $readmemb("Data_file.txt", rom.Memory);
        for (pc = 0; pc < 9 ; pc = pc + 1) begin
            #10 en = 1; address = pc;
        end
      	$finish();
    end

    interpreter int(data_out, 
        cond, 
        op_code, 
        dest_reg, 
        src_reg1,
        src_reg2,
        shift
    );
    
    decoder3by8 dec(dest_reg, decoded_dest_reg);

    register_bank rb(decoded_dest_reg, 
        to_dest_reg,
        q0, q1, q2, q3, q4, q5, q6, q7
    );

    mux8by1 mux1(q0, q1, q2, q3, q4, q5, q6, q7,
        r1, src_reg1
    );

    mux8by1 mux2(q0, q1, q2, q3, q4, q5, q6, q7,
        r2, src_reg2
    );

    ALU alu(cond, op_code, r1, r2, shift, to_dest_reg);

    initial begin
      $monitor($time, " inst = %b \n cond = %b,\n op_code = %b,\n dest_reg = %b,\n src_reg1 = %b,\n src_reg2 = %b,\n shift = %b\n, ALU = %d",data_out,cond,op_code,dest_reg,src_reg1,src_reg2,shift, to_dest_reg);
    end

endmodule 
