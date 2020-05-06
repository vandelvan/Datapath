//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]pru;
    reg clk=0;
    reg br;
    reg regdst;
    reg enable;
    reg alusrc;
    reg [2:0]aluop;
    DATAPATH DUV(.clk(clk),.br(br),.regdst(regdst),.enable(enable),.alusrc(alusrc),.aluop(aluop),.pru(pru));

    always #1 clk=!clk;

    initial begin
		  $readmemb("datos.txt",DUV.p7.mem,16,31);
		  $readmemb("instruction.txt",DUV.p3.MR);
        br=1'd1;
        regdst=1'd1;
        enable=1'd1;
        alusrc=1'd0;
        aluop=3'd0;
        #6;




        $stop;

        end

endmodule