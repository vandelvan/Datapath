//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]pru;
    reg clk=0;
    reg br;
    reg regdst;
    reg enable;
    reg alusrc;
    reg [31:0]sign;
    reg [3:0]sel;
    DATAPATH DUV(.clk(clk),.br(br),.regdst(regdst),.enable(enable),.alusrc(alusrc),.sign(sign),.sel(sel),.pru(pru));

    always #1 clk=!clk;

    initial begin
		  $readmemb("datos.txt",DUV.p7.mem,16,31);
		  $readmemb("instruction.txt",DUV.p3.MR);
		  br=1'd0;
        regdst=1'd1;
        enable=1'd0;
        alusrc=1'd0;
		  #2;
		  
        br=1'd0;
        regdst=1'd1;
        enable=1'd0;
        alusrc=1'd0;
        sign=32'd6;
        sel=4'b0010;
        #2;
		  br=1'd0;
        regdst=1'd0;
        enable=1'd1;
        alusrc=1'd1;
        sign=32'd6;
        sel=4'b0010;
        #2;
	
 

        $stop;

        end

endmodule