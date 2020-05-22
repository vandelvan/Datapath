module BUFFER1(
	input clk, 
	input regDstI,
	input jumpI,
	input branchI,
	input memReadI,
	input memToRegI,
	input [3:0]aluOpI,
	input memWriteI,
	input aluSrcI,
	input regWriteI,
	input [31:0]instruccionSiguienteI,
	input [31:0]readData1I,
	input [31:0]readData2I,
	input [31:0]signExtendI,
	input [31:0]jumpDirI,
	input [4:0]rtI,
	input [4:0]rdI,
	output reg regDstO,
	output reg jumpO,
	output reg branchO,
	output reg memReadO,
	output reg memToRegO,
	output reg [3:0]aluOpO,
	output reg memWriteO,
	output reg aluSrcO,
	output reg regWriteO,
	output reg [31:0]instruccionSiguienteO,
	output reg [31:0]readData1O,
	output reg [31:0]readData2O,
	output reg [31:0]jumpDirO,
	output reg [31:0]signExtendO,
	output reg [4:0]rtO,
	output reg [4:0]rdO
);

always @(posedge clk)
begin
	regDstO =regDstI;
	jumpDirO=jumpDirI;
	jumpO = jumpI;
	branchO =branchI;
	memReadO =memReadI;
	memToRegO = memToRegI;
	aluOpO =aluOpI;
	memWriteO =memWriteI;
	aluSrcO =aluSrcI;
	regWriteO =regWriteI;
	instruccionSiguienteO=instruccionSiguienteI;
	readData1O=readData1I;
	readData2O=readData2I;
	signExtendO=signExtendI;
	rtO=rtI;
	rdO=rdI;
end

endmodule
