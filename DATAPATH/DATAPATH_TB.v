//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]pru;
    reg clk=0;
    reg [31:0]md;
    DATAPATH DUV(.clk(clk),.md(md),.pru(pru));

    always #1 clk=!clk;

    initial begin
		  $readmemb("datos.txt",DUV.p7.mem,16,31);
		  $readmemb("instruction.txt",DUV.p3.MR);
        #6;

        $stop;

        end

endmodule