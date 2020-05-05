//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
    wire [31:0]s1;
    wire [31:0]s2;
    reg clk=0;
    reg br;
    reg zf;
    reg regdst;
    reg enable;
    reg [31:0]datos_esc;
    DATAPATH DUV(.clk(clk),.br(br),.zf(zf),.regdst(regdst),.enable(enable),.datos_esc(datos_esc),.s1(s1),.s2(s2));

    always #1 clk=!clk;

    initial begin
		
		  $readmemb("datos.txt",DUV.p7.mem,16,31);
		  $readmemb("instruction.txt",DUV.p3.MR);
		  #2;
        br=1'd1;
        zf=1'd1;
        regdst=1'd1;
        enable=1'd1;
        datos_esc=32'd4;
        #2;
		  datos_esc=32'dx;
		  br=1'd1;
        zf=1'd1;
        regdst=1'd1;
        enable=1'd1;
        datos_esc=32'd8;
        #1;


		  
		
 

        $stop;

        end

endmodule