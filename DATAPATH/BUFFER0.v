module BUFFER0(
	input clk, 
	input [31:0]insSiguienteI,insActualI,
	output reg [31:0]insSiguienteO,insActualO
);

always @(posedge clk)
begin
	insSiguienteO = insSiguienteI;
	insActualO = insActualI;
end

endmodule
