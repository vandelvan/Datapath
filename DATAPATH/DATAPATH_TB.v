//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]pru;
    reg clk=0;
    reg [31:0]md;
    DATAPATH DUV(.clk(clk),.md(md),.pru(pru));

    always #1 clk=!clk;

    initial begin
		  $readmemb("TestF1_BReg.mem",DUV.p7.mem);
		  $readmemb("TestF2_MemInst.mem",DUV.p3.MR);
        #20;

        $stop;

        end

endmodule