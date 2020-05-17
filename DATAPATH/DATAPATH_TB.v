//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]pru;
    wire [31:0]prum;
    reg clk=0;
    DATAPATH DUV(.clk(clk),.pru(pru),.prum(prum));

    always #1 clk=!clk;

    initial begin
		  $readmemb("TestF1_BReg.mem",DUV.p7.mem);
		  $readmemb("TestF1_MemInst.mem",DUV.p3.MR);
        #20;
        $stop;

        end

endmodule