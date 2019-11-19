module testbench_rom;
    reg enable;
    reg [6:0] address;
    wire [15:0] out;
    memory rom(enable, address, out);
    initial begin
        $display ( "### START ###" );
        $readmemh ( "Data_file.txt" , rom.rom);
        # 0 enable = 1 ; address = 0 ;
        # 5 enable = 1 ; address = 1 ;
        # 5 enable = 1 ; address = 2 ;
    end
    initial
    begin
    $monitor ( "%b" , out);
    end
endmodule