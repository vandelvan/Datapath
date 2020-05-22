//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module DATAPATH_TB();
reg clk;
wire [31:0]pruebaInstruccion;
wire [31:0]pruebaDatoSalida;
wire [31:0]direccionASaltar;
wire selMux5db;
wire jumpSalida;
    
DATAPATH DUV(.selMux5db(selMux5db),.direccionASaltar(direccionASaltar),.clk(clk),.pruebaInstruccion(pruebaInstruccion),.pruebaDatoSalida(pruebaDatoSalida),.jumpSalida(jumpSalida));



initial 
begin
	clk = 1'b1;
	$readmemb("TestF1_BReg.mem",DUV.p7.mem);
	$readmemb("badmemory.mem",DUV.p3.MR);
	$readmemb("datamemoryTest.mem",DUV.p16.mem2);
   #60;
   $stop;
end


always #1 clk =! clk;

endmodule
