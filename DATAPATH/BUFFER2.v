module BUFFER2(
	input clk, 
	input jumpI,
	input branchI,
	input memReadI,
	input memToRegI,
	input memWriteI,
	input regWriteI,
	input [31:0]siguienteInstruccionI,
	input zfI,
	input [31:0]aluResultI,
	input [31:0]readData2I,
	input [4:0]writeRegistrerI,
	input [31:0]jumpDirI,
	output reg jumpO,
	output reg branchO,
	output reg selMux5db,
	output reg memReadO,
	output reg memToRegO,
	output reg memWriteO,
	output reg regWriteO,
	output reg [31:0]siguienteInstruccionO,
	output reg [31:0]direccionASaltar,
	output reg [31:0]jumpDirO,
	output reg zfO,
	output reg [31:0]aluResultO,
	output reg [31:0]readData2O,
	output reg [4:0]writeRegistrerO
);

always @(posedge clk)
begin
	jumpO = jumpI;
	branchO = branchI;
	memReadO = memReadI;
	memToRegO = memToRegI;
	jumpDirO=jumpDirI;
	memWriteO =memWriteI;
	regWriteO =regWriteI;
	siguienteInstruccionO=siguienteInstruccionI;
	zfO = zfI;
	aluResultO=aluResultI;
	readData2O=readData2I;
	writeRegistrerO=writeRegistrerI;
	selMux5db = branchI;
	direccionASaltar = siguienteInstruccionI;
end
endmodule