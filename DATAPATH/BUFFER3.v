module BUFFER3(
	input clk,
	input jumpI,
	input memtoRegI,
	input regWriteI,
	input [31:0]readDataI,
	input [31:0]aluResultI,
	input [4:0]writeRegistrerI,
	output reg jumpO,
	output reg memtoRegO,
	output reg regWriteO,
	output reg [31:0]readDataO,
	output reg [31:0]aluResultO,
	output reg [4:0]writeRegistrerO
);

always @(posedge clk)
begin
	jumpO=jumpI;
	memtoRegO=memtoRegI;
	regWriteO=regWriteI;
	readDataO=readDataI;
	aluResultO=aluResultI;
	writeRegistrerO=writeRegistrerI;
end
endmodule
