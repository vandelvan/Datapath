`timescale 1ns/1ns
module SHIFTLEFT2_TB();
reg [31:0]entrada;
wire [31:0]salida;

SHIFTLEFT2 DUV(.entrada(entrada),.salida(salida));

initial
begin
	entrada = 32'd1;
	#10;
	$stop;
end
endmodule
