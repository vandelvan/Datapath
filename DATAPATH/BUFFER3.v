module BUFFER3(
	input clk,
	input memToRegI,
	input regWriteI,
	input [31:0]readDataI,
	input [31:0]aluResultI,
	input [4:0]writeRegistrerI,
	output reg memToRegO,
	output reg regWriteO,
	output reg [31:0]readDataO,
	output reg [31:0]aluResultO,
	output reg [4:0]writeRegistrerO
);

always @(posedge clk)
begin
	memToRegO=memToRegI;
	regWriteO=regWriteI;
	readDataO=readDataI;
	aluResultO=aluResultI;
	writeRegistrerO=writeRegistrerI;
end
endmodule
