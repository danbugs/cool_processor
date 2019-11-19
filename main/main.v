module main;   
    // for memory
    reg en;
    reg[3:0] address;
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
    reg clk;
    wire[15:0] q0, q1, q2, q3, q4, q5, q6, q7;
    wire[15:0] to_dest_reg;

    // for mux
    wire[15:0] r1, r2;


    memory rom(en, address, data_out);

    initial begin
        $readmemh("Data_file.txt", rom.Memory);
        #0 en = 0; 

        for (pc = 0; pc < 9 ; pc = pc + 1) begin
            #10 en = 1; address = pc;
        end
    end

    initial begin
        $monitor($time, "@ address = %d, fetched inst = %d", address, data_out);
    end

    interpreter int(data_out, 
        cond, 
        op_code, 
        dest_reg, 
        src_reg1,
        src_reg2,
        shift
    );

    initial begin
        $monitor($time, "@ inst = %d translates to: 
            \n cond = %d,
            \n op_code = %d,
            \n dest_reg = %d,
            \n src_reg1 = %d,
            \n src_reg2 = %d,
            \n shift = %d",
            data_out,
            cond,
            op_code,
            dest_reg,
            src_reg1,
            src_reg2,
            shift
        );
    end
    
    decoder3by8 dec(dest_reg, decoded_dest_reg);

    initial begin
        $monitor($time, "with dest_reg = %d,
            \n decoded_dest_reg = %d",
            dest_reg,
            decoded_dest_reg
        );
    end

    register_bank rb(decoded_dest_reg, 
        to_dest_reg,
        q0, q1, q2, q3, q4, q5, q6, q7, clk
    );

    initial begin
        $monitor($time, "currently in register bank:
            \n q0 = %d
            \n q1 = %d
            \n q2 = %d
            \n q3 = %d
            \n q4 = %d
            \n q5 = %d
            \n q6 = %d
            \n q7 = %d",
            q0, q1, q2, q3, q4, q5, q6, q7
        );
    end

    mux8by1 mux1(q0, q1, q2, q3, q4, q5, q6, q7,
        r1, src_reg1
    );

    mux8by1 mux2(q0, q1, q2, q3, q4, q5, q6, q7,
        r2, src_reg2
    );

    initial begin
        $monitor($time, "going into ALU:
            \n r1 = %d,
            \n r2 = %d,
            \n cond = %d,
            \n op_code = %d,
            \n shift = %d",
            r1, r2, cond, op_code, shift
        );
    end

    ALU alu(cond, op_code, r1, r2, shift, to_dest_reg);

    initial begin
        $monitor($time, "coming out of ALU:
            \n to_dest_reg: %d",
            to_dest_reg
        );
    end

    always #10 clk = ~clk;


endmodule 
