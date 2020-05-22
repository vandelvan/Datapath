module SHIFTLEFT1(
	input [25:0]entrada, //Toma los 26 bits del lugar a donde se quiere hacer el jump
	input [3:0] pc,//Le pega los 4 bits mas significativos del PC
	output reg [31:0]salida
);

always @*
begin
	salida = {pc,entrada,2'b00};
end

endmodule
